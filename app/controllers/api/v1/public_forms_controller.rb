class Api::V1::PublicFormsController < ApplicationController

  include ActionView::Layouts
       include ActionController::MimeResponds


      # after_action :allow_iframe


      def show
        @form = Form.friendly.find(params[:slug])
        respond_to do |format|
          format.html { render :show } # This renders the HTML template
          format.json { render json: @form, include: :form_fields }
        end
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

      def allow_iframe
        response.headers.delete('X-Frame-Options')
      end

end
