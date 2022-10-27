class Api::ApplicationController < ActionController::API
  include ActionController::MimeResponds

  # Custom method to generate a JWT token
  def generate_token
    # Payload is request body (JSON)
    payload = request.body.read

    # Convert payload to JSON
    payload = JSON.parse(payload)

    # Set the expiration time to 30 seconds
    exp = Time.now.to_i + 30
    payload[:exp] = exp

    # Generate a token with the team's id and name
    token = JWT.encode payload, Rails.application.credentials.secret_key_base, 'HS256'

    # Return the token
    respond_to do |format|
      format.json { render :json => { message: "Token generated", token: token } }
      format.xml { render :xml => { message: "Token generated", token: token } }
    end
  end

  # Custom method to validate a JWT token
  def validate_token
    # Get toekn from authorization type bearer token and remove the bearer part
    token = request.headers["Authorization"].split(" ")[1]

    # Decode the token
    begin
      decoded_token = JWT.decode token, Rails.application.credentials.secret_key_base, true, { algorithm: 'HS256' }

      # respond_to do |format|
      #   format.json { render :json => { message: "Token is valid" }, status: 200 }
      #   format.xml { render :xml => { message: "Token is valid" }, status: 200 }
      # end
      rescue JWT::ExpiredSignature => e
        respond_to do |format|
          format.json { render :json => { message: e.message }, status: 401 }
          format.xml { render :xml => { message: e.message }, status: 401 }
        end
      rescue JWT::DecodeError => e
        respond_to do |format|
          format.json { render :json => { message: e.message }, status: 401 }
          format.xml { render :xml => { message: e.message }, status: 401 }
        end
    end
  end
end
