$(function(){
  attachListeners();
  
});

function attachListeners() {
  
}
//<% @meeting.notes.each do |n| %>
//  <h4><%=n.author.name%>: <%=n.content%> | <% if n.author == current_user %> <%=link_to "Edit this Note",  edit_team_meeting_note_path(@meeting.team, @meeting, n)%> | <%=link_to "Delete this Note", note_path(n), method: :delete%> <%end%></h4>
//<%end%>
function nextMeeting() {
  $(".js-next").on("click", function() {
    var nextId = parseInt($(".js-next").attr("data-id")) + 1;
    $.get("/meetings/" + nextId + ".json", function(data) {
      var meeting = data;
      $(".meetingTeam").text("Team: " + meeting["name"]);
      $(".meetingDate").text("Date: " + meeting["datetime"]);
      $(".meetingTime").text("Time: " + meeting["datetime"]);
      $(".meetingLocation").text("Location: " + meeting["location"]);
      $(".js-next").attr("data-id", meeting["id"]);
    });
  });
}
// id="meetingTeam">Team: <%= @meeting.team.name %></h2>
// <h3 id="meetingDate">Date: <%= format_date(@meeting.time) %></h3>
// <h3 id="meetingTime">Time: <%= format_time(@meeting.time) %></h3>

function showNotes() {
  var getting = $.get('/games');
     
  getting.done(function(data) {
    var games = data["games"];
    var array = "";
    for (var i = 0; i < games.length; i++) {
      array += `<p data-gameid="${games[i]["id"]}">` + "ID: " + `${games[i]["id"]}` + "  " + "State: " + `${games[i]["state"]}` + "</p>";
    }
    $("#games").html(array);
  });
}