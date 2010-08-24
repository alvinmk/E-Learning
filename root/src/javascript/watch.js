function buttonClick(value){

	if(value=="Thumbs up!"){
		$.post('http://localhost:3000/watch/rateLecture/'+videoID+"/1");
	}
	if(value=="Thumbs down!"){
		$.post('http://localhost:3000/watch/rateLecture/'+videoID+"/-1");
	}
	if(value=="Remember this"){
		$.post('http://localhost:3000/watch/rememberLecture/'+videoID);
	}
	if(value=="Add question"){
		document.getElementById('questions').className="hideDiv";
		document.getElementById('addQuestions').className="showDiv";
	}
	if(value=="Back to question"){
		backToQuestion();	
	}
}

function recomend()
{
	$.get('http://localhost:3000/admin/recomendLecture/'+videoID);	
}

function addQuestion(){
	var answer = document.getElementById('answer').value;
	var question = document.getElementById('question').value;
	var alt1 = document.getElementById('alt1').value;
	var alt2 = document.getElementById('alt2').value;
	document.getElementById('answer').value="";
	document.getElementById('question').value="";
	document.getElementById('alt1').value="";
	document.getElementById('alt2').value="";
	$.ajax({
		url: "http://localhost:3000/questions/addQuestion",
		data: ({lecture: videoID, question: question, answer: answer, alt1: alt1, alt2: alt2}),
		datatype: 'json',
		success: function(result){
			backToQuestion();
		}
	});
	newQuestion("");
}


function backToQuestion(){
	document.getElementById('questions').className="showDiv";
	document.getElementById('addQuestions').className="hideDiv";
}

function answer(){
	var answer = getCheckedValue(document.getElementsByName("group1"));
	newQuestion(answer);

}

function newQuestion(answer){
	$.ajax({
		type: "POST",
		url: "http://127.0.1.1:3000/questions/getNewQuestion/"+videoID+"/"+questionNumber,
		datatype: 'JSON',
		data: {'answer':answer},
		success: function(result){renderQuestion(result);}
	});	
}


function renderQuestion(result){
	var test = eval("("+result+")");
	document.getElementById('questionAsked').innerHTML=test.question;
	document.getElementById('questionAskedBy').innerHTML="asked by <a href='/search/creator/"+test.questionUser+"'>"+test.questionUser+"</a>";
	document.getElementById('previousQuestion').innerHTML=test.previousQuestion;	
	questionNumber=test.questionNumber;
	var alternatives = document.getElementsByName('group1');
	for(var i=0; i<3; i++){
		alternatives[i].value=test.alternatives[i];
		alternatives[i].checked=false;
		document.getElementById("alt_text"+(i+1)).innerHTML=test.alternatives[i];
	} 

}

// return the value of the radio button that is checked
// return an empty string if none are checked, or
// there are no radio buttons
function getCheckedValue(radioObj) {
	if(!radioObj)
		return "";
	var radioLength = radioObj.length;
	if(radioLength == undefined)
		if(radioObj.checked)
			return radioObj.value;
		else
			return "";
	for(var i = 0; i < radioLength; i++) {
		if(radioObj[i].checked) {
			return radioObj[i].value;
		}
	}
	return "";
}

// set the radio button with the given value as being checked
// do nothing if there are no radio buttons
// if the given value does not exist, all the radio buttons
// are reset to unchecked
function setCheckedValue(radioObj, newValue) {
	if(!radioObj)
		return;
	var radioLength = radioObj.length;
	if(radioLength == undefined) {
		radioObj.checked = (radioObj.value == newValue.toString());
		return;
	}
	for(var i = 0; i < radioLength; i++) {
		radioObj[i].checked = false;
		if(radioObj[i].value == newValue.toString()) {
			radioObj[i].checked = true;
		}
	}
}

