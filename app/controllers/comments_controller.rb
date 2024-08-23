class CommentsController < ApplicationController
  def new
  end

  def create
    @task = Task.find(params[:task_id])
    @comment = @task.comments.new(comments_params)
    @comment.user = current_user
    if @comment.save
      redirect_to task_path(@task)
    end
  end

  def destroy
    @task= Task.find(params[:task_id])
    @comment = @task.comments.find(params[:id])
    @comment.destroy
    redirect_to task_path(@task)
  end

  private
  def comments_params
    params.require(:comment).permit(:content)
  end
end
