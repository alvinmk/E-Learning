package Elearn::Controller::E_learning::questions;
use Moose;
use namespace::autoclean;
use List::Util qw(first max maxstr min minstr reduce shuffle sum);
use JSON;

BEGIN {extends 'Catalyst::Controller'; }

=head1 NAME

Elearn::Controller::E_learningquestions - Catalyst Controller

=head1 DESCRIPTION

Catalyst Controller.

=head1 METHODS

=cut


=head2 addQuestions
		Let the user add a question to a lecture for other students to answer. 
=cut

sub addQuestion :Local :Args(0){
	my ($self, $c) = @_;
	my $lecture = $c->request->params->{lecture};
	my $question = $c->request->params->{question};
	my $answer = $c->request->params->{answer};
	my $alt1 = $c->request->params->{alt1};
	my $alt2 = $c->request->params->{alt2};

	$c->model('E_Learning::ElearnDB::lectureQuestions')->update_or_create({
		lecture => $lecture,
		answer => $answer,
		question => $question,
		alternative1 => $alt1,
		alternative2 => $alt2,
		user => $c->forward('/getUserName'),
	});
	$c->res->output("200 OK");
}

sub getNewQuestion :Local :Args(2){
	my ($self, $c, $id,$questionNumber) = @_;
	my $answer = $c->request->params->{answer};
	my $previousQuestion = $c->model('E_Learning::ElearnDB::lectureQuestions')->find({question_id => $questionNumber});
	my $questionFeedback;
	if($previousQuestion->answer() eq $answer){
		$questionFeedback="Correct!";
		$c->model('E_Learning::ElearnDB::userQuestionAnswers')->update_or_create({
			user_answered => $c->forward('/getUserName'),
			correct_answer => "1",
			question => $questionNumber		
		});
	}
	else{
		$questionFeedback="That is not the right answer";
		$c->model('E_Learning::ElearnDB::userQuestionAnswers')->update_or_create({
			user_answered => $c->forward('/getUserName'),
			correct_answer => "0",
			question => $questionNumber		
		});
	}	
	#Get a new question from the getLectureQuestion sub
	$c->forward("getLectureQuestions",$id);
	$c->res->header('application/json');
	#Extract the question from the stash and put it into json
	my $question = $c->stash()->{question};
	my $alternatives = $c->stash()->{alternatives};
	$questionNumber = $c->stash()->{questionNumber};
	my $user = $c->stash()->{questionUser};
	$c->res->body(to_json({question => $question, alternatives => $alternatives, questionNumber => $questionNumber, questionUser => $user, previousQuestion => $questionFeedback}));
}

=head2 getLectureQuestion
	Gets a random question from the DB and puts it on the stash
=cut

sub getLectureQuestions :Local :Args(1){
	my ($self, $c, $id) = @_;
	my @questions = $c->model('E_Learning::ElearnDB::lectureQuestions')->search({lecture => $id});
	if(defined $questions[0]){
		#Shuffle the result list and take the first question in the list and put it on the stash
		@questions = shuffle(@questions);
		my @alternatives;
	
		push(@alternatives, $questions[0]->alternative1());
		push(@alternatives, $questions[0]->alternative2());
		push(@alternatives, $questions[0]->answer());
		#Shuffle the alternatives
		@alternatives = shuffle(@alternatives);
		$c->stash(question => $questions[0]->question());
		$c->stash(questionNumber => $questions[0]->question_id());
		$c->stash(questionUser => $questions[0]->user());	
		$c->stash(alternatives => \@alternatives);
	}
	else{
		$c->stash(question => "There are no questions for this lecture, maybe you should add one?");
	}

}

=head1 AUTHOR
Alvin,,,

=head1 LICENSE

This library is free software. You can redistribute it and/or modify
it under the same terms as Perl itself.

=cut

__PACKAGE__->meta->make_immutable;

