class Puzzles::SubmissionsController < ApplicationController
  before_filter :find_puzzle
  before_filter :user_required

  def new
    @submission = @puzzle.submissions.new
  end
  
  def create
    @submission = @puzzle.submissions.new(params[:submission])
    
    @submission.user = current_user
    
    if @submission.save
      flash[:notice] = "You got it #{@submission.correct ? 'correct' : 'wrong'}!"
      redirect_to puzzle_path(@submission.puzzle)
    else      
      render :action => :new
    end
  end
  
  private
  
  def find_puzzle
    @puzzle = Puzzle.find(params[:puzzle_id])
  end
end
