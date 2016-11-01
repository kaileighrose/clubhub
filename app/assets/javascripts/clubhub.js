function formatDate(date) {
  var options = {}
  options.timeZone = 'UTC';
  return date.toLocaleDateString("en-US", options);
}

function formatTime(date) {
  var options = {}
  options.timeZone = 'UTC';
  return date.toLocaleTimeString('en-US', options);
}

function nextMeeting(event) {
  event.preventDefault();
  var nextId = parseInt($(".js-next").attr("data-id")) + 1;
  var teamId = parseInt($(".js-next").attr("data-teamid"));
  $.get("/teams/" + teamId + "/meetings/" + nextId + ".json", function(data) {
    var date = new Date(data["time"]);
    var meeting = new Meeting(data["id"], data["team_id"], data["team_name"], data["location"]);
    console.log(meeting);
    $("#meetingTeam").html("Team: " + meeting.team_name );
    $("#meetingDate").html("Date: " + meeting.formatDate(date));
    $("#meetingTime").html("Time: " + meeting.formatTime(date));
    $("#meetingLocation").html("Location: " + meeting.location);
    $("input#note_meeting_id").val(meeting.id);
    showNotes(meeting.id, meeting.team_id);
    $(".js-next").attr("data-id", meeting.id);
  });
}

function showNotes(meeting, team) {
  var noteshtml = "<h3>Meeting Notes:</h3>";
  var getting = $.get("/teams/" + team + "/meetings/" + meeting + "/notes")
  getting.done(function(notes) {
    for (var i = 0; i <  notes.length; i++) {
      var id = notes[i]["id"]
        noteshtml += "<h4>" + notes[i]["author"]["name"] + ": " + notes[i]["content"] + `<a href="/teams/${team}/meetings/${meeting}/notes/${id}/edit"> | Edit this Note </a>` + `<a href="/notes/${id}" data-method="delete"> | Delete this Note</a>` + "</h4>";
      }  
     $("#shownotes").html(noteshtml);
  }); 
}