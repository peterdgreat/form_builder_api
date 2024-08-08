class Api::V1::FormFieldsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_form
  before_action :set_form_field, only: [:update, :destroy]

  def create
    form_fields_params[:form_fields].each do |field_params|
      @form.form_fields.create!(field_params)
    end
    render json: @form.form_fields, status: :created
  rescue ActiveRecord::RecordInvalid => e
    render json: { errors: e.record.errors }, status: :unprocessable_entity
  end

  def update
    if @form_field.update(form_field_params)
      render json: @form_field
    else
      render json: { errors: @form_field.errors }, status: :unprocessable_entity
    end
  end

  def destroy
    @form_field.destroy
    head :no_content
  end

  private

  def set_form
    @form = current_user.forms.find(params[:form_id])
  end

  def set_form_field
    @form_field = @form.form_fields.find(params[:id])
  end

  def form_fields_params
    params.permit(form_fields: [:field_type, :label, :required, options: []])
  end

  def form_field_params
    params.require(:form_field).permit(:field_type, :label, :required, options: [])
  end
end
