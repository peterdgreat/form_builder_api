class Api::V1::FormsController < ApplicationController
  before_action :authenticate_user!

  def index
    forms = current_user.forms.includes(:form_fields)
    render json: forms.as_json(include: :form_fields), status: :ok
  end

  def show
    @form = current_user.forms.find(params[:id])
    render json: @form, include: :form_fields
  end

  def create
    @form = current_user.forms.new(form_params)
    if @form.save
      render json: @form, status: :created
    else
      render json: @form.errors, status: :unprocessable_entity
    end
  end

  def update
    @form = current_user.forms.find(params[:id])
    if @form.update(form_params)
      render json: @form
    else
      render json: @form.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @form = current_user.forms.find(params[:id])
    @form.destroy
    head :no_content
  end

  private

  def form_params
    params.require(:form).permit(:title)
  end

end