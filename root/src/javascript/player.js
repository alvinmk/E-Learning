var player;
var currentTime;
var videoID;

function playerReady(obj) {
	player = document.getElementById("player");
	player.addModelListener('TIME','jwTimeListener');
	player.addModelListener('STATE', 'stateMonitor');
}

function jwTimeListener(obj)
{
	currentTime = obj.position;
}


function stateMonitor(obj)
{
  if(obj.newstate == "COMPLETED")
  {
		$.post('http://localhost:3000/e_learning/watch/watched/'+videoID);
  }
}

function startTimestamp(){
	document.getElementById("timestamps").value +=currentTime +"->"
}

function stopTimestamp(){
	var tag = document.videoInfo.ts.value;
	document.videoInfo.ts.value="";
	document.getElementById("timestamps").value +=currentTime +":" +tag +", ";	
}

function setVideo(path, video, extension){
	videoID = video;
	var params = { 'allowScriptAccess': 'always'};
	var flashvars = {'file': path+video+"."+extension, 'allowfullscreen': 'true'};
	// The element id of the Flash embed
	var atts = { 'id': "player", 'name': 'player'};
	// All of the magic handled by SWFObject (http://code.google.com/p/swfobject/)
	swfobject.embedSWF("/player.swf","videoDiv", "600", "360", "8", 'false', flashvars, params, atts);
}
