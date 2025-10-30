class Api::V1::AuthenticationController < ApplicationController
  skip_before_action :verify_authenticity_token

  def login
    user = User.find_by(email: params[:email])

    if user
      token = encode_token({ user_id: user.id })
      render json: {
        token: token,
        user: { id: user.id, name: user.name, email: user.email }
      }, status: :ok
    else
      render json: { error: "User not found" }, status: :not_found
    end
  end

  private

  def encode_token(payload)
    JWT.encode(payload, Rails.application.secret_key_base)
  end
end
