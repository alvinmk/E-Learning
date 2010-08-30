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
	var flashvars = {'file': path+video+extension, 'allowfullscreen': 'true'};
	// The element id of the Flash embed
	var atts = { 'id': "player", 'name': 'player'};
	// All of the magic handled by SWFObject (http://code.google.com/p/swfobject/)
	swfobject.embedSWF("/player.swf","videoDiv", "600", "360", "8", 'false', flashvars, params, atts);

}

function set(){
	if(document.videoInfo.local.value != ""){//Check if a local file is given
		var localFile=document.videoInfo.local.files[0];
		setVideo(localFile.getAsDataURL());
	}
	else{
		getLinkInfo();
	}
}

function getLinkInfo(){
	var ajaxRequest;  // The variable that makes Ajax possible!
	var params = "link="+document.videoInfo.link.value;
	
	try{
		// Opera 8.0+, Firefox, Safari
		ajaxRequest = new XMLHttpRequest();
	} catch (e){
		alert("Failed to get an ajax object");
	}
	// Create a function that will receive data sent from the server
	ajaxRequest.onreadystatechange = function(){
		if(ajaxRequest.readyState == 4 && ajaxRequest.status==200){
			//Unsafe eval
			var jsonT = eval('('+ ajaxRequest.responseText +')');
			if(jsonT.youtubeID != null)
			{
				setVideo("http://www.youtube.com/watch?v="+jsonT.youtubeID);
				document.videoInfo.title.value=jsonT.title;
				document.videoInfo.description.value=jsonT.description;
				document.videoInfo.tags.value=jsonT.tags;
			}
		}
	}
	ajaxRequest.open("POST", "/e_learning/upload/link", "true");
	ajaxRequest.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
	ajaxRequest.setRequestHeader("Content-length", params.lenght);
	ajaxRequest.setRequestHeader("Connection", "close");
	ajaxRequest.send(params);
}

function startUpload(){
	//This is a ugly hack that uses that the file is only moved localy. 
	//It will probably not work on a remote upload since the file wont be there(yet)
	document.getElementById("inputLink").style.visibility="hidden";
	document.getElementById("uploadMessage").innerHTML="Uploading and encoding video, this might take some time<img src='/static/images/load.gif'></img>";

}

function stopUpload(video)
{
		setVideo("/LectureData/temp/",video, ".flv");
		document.videoInfo.link.value=video;
		document.getElementById("uploadMessage").innerHTML="";
}

