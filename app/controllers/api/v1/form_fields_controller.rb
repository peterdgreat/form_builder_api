class Api::V1::FormFieldsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_form, only: [:index]
  before_action :set_form_field, only: [:update, :destroy]

  def index
    form_fields = @form.form_fields
    render json: { status: 'success', data: form_fields }, status: :ok
  end

  def create
    # Create a new form for each set of form fields submitted
    form = current_user.forms.create(title: "New Form")

    form_fields = params[:form_fields] || [params[:form_field]]
    saved_fields = []

    form_fields.each do |field_params|
      form_field = form.form_fields.new(field_params.permit(:field_type, :label, :required, options: []))
      if form_field.save
        saved_fields << form_field
      else
        render json: { status: 'error', message: form_field.errors.full_messages }, status: :unprocessable_entity
        return
      end
    end

    render json: { status: 'success', data: { form: form, form_fields: saved_fields } }, status: :created
  end

  # def create
  #   # Create a new form for each set of form fields submitted
  #   form = current_user.forms.create(title: "New Form")

  #   form_fields_params = params.require(:form_fields).map do |field_params|
  #     field_params.permit(:field_type, :label, :required, options: [])
  #   end

  #   saved_fields = []
  #   form_fields_params.each do |field_params|
  #     form_field = form.form_fields.new(field_params)
  #     if form_field.save
  #       saved_fields << form_field
  #     else
  #       render json: { status: 'error', message: form_field.errors.full_messages }, status: :unprocessable_entity
  #       return
  #     end
  #   end

  #   render json: { status: 'success', data: { form: form, form_fields: saved_fields } }, status: :created
  # end




  def update
    if @form_field.update(form_field_params)
      render json: { status: 'success', data: @form_field }, status: :ok
    else
      render json: { status: 'error', message: @form_field.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    if @form_field.destroy
      head :no_content
    else
      render json: { status: 'error', message: 'Unable to delete form field' }, status: :unprocessable_entity
    end
  rescue ActiveRecord::RecordNotFound
    render json: { status: 'error', message: 'Form field not found' }, status: :not_found
  rescue StandardError => e
    render json: { status: 'error', message: 'Internal server error' }, status: :internal_server_error
  end


  private

  def set_form
    @form = current_user.forms.find_by(id: params[:form_id])
    unless @form
      render json: { status: 'error', message: 'Form not found or form ID missing' }, status: :not_found
    end
  end


  def set_form_field
    @form_field = @form.form_fields.find_by(id: params[:id])
    unless @form_field
      render json: { status: 'error', message: 'FormField not found' }, status: :not_found
    end
  end



  def form_fields_params
    params.require(:form_fields).permit(form_fields: [:field_type, :label, :required, options: []])
  end


  def form_field_params
    params.require(:form_field).permit(:field_type, :label, :required, options: [])
  end
end
