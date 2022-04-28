class ApplicationController < ActionController::API
  # error handling for non-existent records and failed validations
  rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response
  rescue_from ActiveRecord::RecordInvalid, with: :render_invalid_response

  private

  # response when requested record not in database
  def render_not_found_response
    render json: { error: 'Not found' }, status: :not_found
  end

  # response when record failed validations to be created/updated
  def render_invalid_response(error_obj)
    render json: {
             errors: error_obj.record.errors.full_messages
           },
           status: :unprocessable_entity
  end
end
