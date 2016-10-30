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
    if (meeting["notes"].length > 0) {
      $("#shownotes").html(showNotes(meeting["notes"]));
    } else {
      $("#shownotes").html();
    };
    $(".js-next").attr("data-id", meeting["id"]);
  });
}

//<% @meeting.notes.each do |n| %>
//  <h4><%=n.author.name%>: <%=n.content%> | <% if n.author == current_user %> <%=link_to "Edit this Note",  edit_team_meeting_note_path(@meeting.team, @meeting, n)%> | <%=link_to "Delete this Note", note_path(n), method: :delete%> <%end%></h4>
//<%end%>

function showNotes(notes) {
  var noteshtml = "<h3>Meeting Notes:</h3>";
  for (var i = 0; i < notes.length; i++) {
    if (notes[i]["author_name"] == null) {
      $.get("/teams/" + teamId + "/meetings/" + nextId + "/notes/" + notes[i]["id"] + ".json", function(data) {
          notes[i]["author_name"] = data["author_name"]; 
      });
    }
    noteshtml += "<h4>" + notes[i]["author_name"] + ": " + notes[i]["content"] + "</h4>";
  }
  return noteshtml;
}