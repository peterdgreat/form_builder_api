module Api
  module V1
    class PublicFormsController < ApplicationController
      def show
        @form = Form.friendly.find(params[:slug])
        render json: @form, include: :form_fields
      end

      def submit
        @form = Form.friendly.find(params[:slug])
        if @form.form_fields.empty?
          render json: { error: "Form must have fields to accept submissions" }, status: :unprocessable_entity
          return
        end

        @form_submission = @form.form_submissions.new(form_submission_params)
        if @form_submission.save
          render json: @form_submission, status: :created
        else
          render json: @form_submission.errors, status: :unprocessable_entity
        end
      end

      private

      def form_submission_params
        params.require(:form_submission).permit(data: {})
      end
    end
  end
end
