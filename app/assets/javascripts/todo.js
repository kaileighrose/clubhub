class List {

constructor(id, meeting_id, team_id, items) {
  this.id = id;
  this.meeting_id = meeting_id;
  this.team_id = team_id;
  this.items = items;
}

markComplete() { return "Complete";}
}