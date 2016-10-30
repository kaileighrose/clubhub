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
    var meeting = data;
    var date = new Date(meeting["time"]);
    $("#meetingTeam").html("Team: " + meeting["team_name"] );
    $("#meetingDate").html("Date: " + formatDate(date));
    $("#meetingTime").html("Time: " + formatTime(date));
    $("#meetingLocation").html("Location: " + meeting["location"]);
    showNotes(meeting["id"], meeting["team_id"]);
    $(".js-next").attr("data-id", meeting["id"]);
  });
}

//<% @meeting.notes.each do |n| %>
//  <h4><%=n.author.name%>: <%=n.content%> | <% if n.author == current_user %> <%=link_to "Edit this Note",  edit_team_meeting_note_path(@meeting.team, @meeting, n)%> | <%=link_to "Delete this Note", note_path(n), method: :delete%> <%end%></h4>
//<%end%>

function showNotes(meeting, team) {
  var noteshtml = "<h3>Meeting Notes:</h3>";
  var getting = $.get("/teams/" + team + "/meetings/" + meeting + "/notes")
  getting.done(function(notes) {
    for (var i = 0; i <  notes.length; i++) {
        noteshtml += "<h4>" + notes[i]["author"]["name"] + ": " + notes[i]["content"] + "</h4>";
      }  
     $("#shownotes").html(noteshtml);
  }); 
}