class PagesController < ApplicationController
	before_action :authenticate_user!
  before_action :authorize, only: [:dashboard]

  def standby
  end

  def thesis
  	@project = Project.find(params[:id])
    @score = Score.new
  end

  def dashboard
  	@projects = Project.all
  end

  def create
    score = Score.new(score_params)
    score.project_id = params[:project_id]
    score.user = current_user
    score.save
    redirect_to standby_path
  end

  private

  def authorize
    unless current_user.is_admin?
      redirect_to standby_path
    end
  end

  def score_params
    params.require(:score).permit(:id, :flow_balance,
      :impact_factor, :conclusion, :question_and_answer)
  end
end