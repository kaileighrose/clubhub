class List {

var idCounter = 0;

constructor(meeting_id, team_id, title, item) {
  this.id = idCounter++;
  this.meeting_id = meeting_id;
  this.team_id = team_id;
  this.title = title;
  this.items = [];
  this.items.push(item);
}

markComplete() { return "Complete";}
  
}

