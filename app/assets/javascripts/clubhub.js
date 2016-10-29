$(function(){
  attachListeners();
  
});

function attachListeners() {
  
}
//<% @meeting.notes.each do |n| %>
//  <h4><%=n.author.name%>: <%=n.content%> | <% if n.author == current_user %> <%=link_to "Edit this Note",  edit_team_meeting_note_path(@meeting.team, @meeting, n)%> | <%=link_to "Delete this Note", note_path(n), method: :delete%> <%end%></h4>
//<%end%>
function indexMeetings() {
  var getMeet = $.get('/teams/' + );
}

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