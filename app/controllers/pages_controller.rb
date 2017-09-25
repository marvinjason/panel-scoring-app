class PagesController < ApplicationController
	before_action :authenticate_user!
  before_action :authorize, only: [:dashboard]

  def root
    redirect_to standby_path(user_id: current_user.id)
  end

  def standby
  end

  def thesis
  	@project = Project.find(params[:id])
    @score = Score.new
  end

  def dashboard
  	@projects = Project.all
    @users = User.order(:username)
  end

  def create
    score = Score.new(score_params)
    score.project_id = params[:project_id]
    score.user = current_user
    score.save
    redirect_to standby_path(user_id: current_user.id, a: 'update', q: score.id)
  end

  def export
    workbook = WriteExcel.new('scores.xls')
    worksheet = workbook.add_worksheet
    worksheet.set_column('A:G', 25)

    worksheet_bold = workbook.add_format
    worksheet_bold.set_bold
    worksheet_bold.set_align('center')
    worksheet_bold.set_font('Calibri')
    worksheet_bold.set_size(9)

    worksheet_regular = workbook.add_format
    worksheet_regular.set_font('Calibri')
    worksheet_regular.set_size(9)

    worksheet_highlight = workbook.add_format
    worksheet_highlight.set_bg_color(11)
    worksheet_highlight.set_font('Calibri')
    worksheet_highlight.set_size(9)

    merge_format = workbook.add_format(valign: 'vcenter', align: 'center')
    merge_format.set_bold
    merge_format.set_font('Calibri')
    merge_format.set_size(9)

    merge_format_total = workbook.add_format(valign: 'vcenter', align: 'left')
    merge_format_total.set_bold
    merge_format_total.set_font('Calibri')
    merge_format_total.set_size(9)

    worksheet.write('A1', 'Name', worksheet_bold)
    worksheet.write('B1', 'Flow Balance (35%)', worksheet_bold)
    worksheet.write('C1', 'Impact Factor (15%)', worksheet_bold)
    worksheet.write('D1', 'Conclusion (20%)', worksheet_bold)
    worksheet.write('E1', 'Question & Answer (30%)', worksheet_bold)
    worksheet.write('F1', 'Presenter (—)', worksheet_bold)
    worksheet.write('G1', 'Average', worksheet_bold)

    row_counter = 2

    Project.all.each do |project|
      range = "A#{row_counter}:G#{row_counter}"
      worksheet.merge_range(range, project.name, merge_format)
      row_counter += 1

      project.scores.each do |score|
        worksheet.write(row_counter, 0, score.user.username, worksheet_regular)
        worksheet.write(row_counter, 1, score.flow_balance, worksheet_regular)
        worksheet.write(row_counter, 2, score.impact_factor, worksheet_regular)
        worksheet.write(row_counter, 3, score.conclusion, worksheet_regular)
        worksheet.write(row_counter, 4, score.question_and_answer, worksheet_regular)
        worksheet.write(row_counter, 5, score.presenter, worksheet_regular)
        worksheet.write(row_counter, 6, score.average, worksheet_regular)
        row_counter += 1
      end

      range = "A#{row_counter}:E#{row_counter}"
      worksheet.merge_range(range, 'Total', merge_format_total)
      worksheet.write(row_counter, 5, project.presenter_average, worksheet_highlight)
      worksheet.write(row_counter, 6, project.average, worksheet_highlight)
      row_counter += 2
    end

    workbook.close

    redirect_to dashboard_path
  end

  private

  def authorize
    unless current_user.is_admin?
      redirect_to standby_path(user_id: current_user.id)
    end
  end

  def score_params
    params.require(:score).permit(:id, :flow_balance,
      :impact_factor, :conclusion, :question_and_answer, :presenter)
  end
end
