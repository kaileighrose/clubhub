class Meeting {

constructor(id, team_id, team_name, date, location) {
  this.id = id;
  this.team_id = team_id;
  this.team_name = team_name;
  this.date = date;
  this.location = location;
}

formatDate() {
  date = this.date
  var options = {};
  options.timeZone = 'UTC';
  return date.toLocaleDateString("en-US", options);
}

formatTime() {
  date = this.date
  var options = {};
  options.timeZone = 'UTC';
  return date.toLocaleTimeString('en-US', options);
}

}