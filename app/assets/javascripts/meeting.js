class Meeting {

constructor(id, team_id, team_name, location) {
  this.id = id;
  this.team_id = team_id;
  this.team_name = team_name;
  this.location = location;
}

formatDate(date) {
  var options = {};
  options.timeZone = 'UTC';
  return date.toLocaleDateString("en-US", options);
}

formatTime(date) {
  var options = {};
  options.timeZone = 'UTC';
  return date.toLocaleTimeString('en-US', options);
}

}