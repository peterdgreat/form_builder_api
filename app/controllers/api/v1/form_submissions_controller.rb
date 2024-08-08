class Api::V1::FormSubmissionsController < ApplicationController
  before_action :set_form, only: [:create, :index]

  def index
    @form_submissions = @form.form_submissions
    render json: @form_submissions
  end


  def create
    @form_submission = @form.form_submissions.new(form_submission_params)
    if @form_submission.save
      render json: @form_submission, status: :created
    else
      render json: @form_submission.errors, status: :unprocessable_entity
    end
  end

  private

  def set_form
    @form = Form.friendly.find(params[:form_id])
  end

  def form_submission_params
    params.require(:form_submission).permit(data: {})
  end
end
