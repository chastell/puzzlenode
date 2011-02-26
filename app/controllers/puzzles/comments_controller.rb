class Puzzles::CommentsController < ApplicationController

  before_filter :find_puzzle
  before_filter :user_required

  def new
    @comment = @puzzle.comments.new
  end

  def create
    @comment = @puzzle.comments.new(params[:comment])

    @comment.user = current_user

    if @comment.save
      redirect_to puzzle_path(@comment.puzzle)
    else
      render :action => :new
    end
  end

  private

  def find_puzzle
    @puzzle = Puzzle.find(params[:puzzle_id])
  end

end
