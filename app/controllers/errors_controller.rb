class ErrorsController < ApplicationController
  ERRORS = [
    :internal_server_error,
    :not_found
  ].freeze
 
  ERRORS.each do |e|
    define_method e do
      message = e == :not_found ? "The request resource was not found" : "We're sorry, but something went wrong. We've been notified about this issue and we'll take a look at it shortly."
 
      respond_to do |format|
        format.any {render :json => {:error_message => message}, :status => e}
      end
    end
  end
end