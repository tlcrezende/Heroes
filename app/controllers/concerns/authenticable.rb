module Authenticable
    private

    def authenticate_with_token 
        @token ||= request.headers['Authorization']

        unless valid_token?
            render json: {errors: "Sem TOKEN!!!"}, status: :unauthorized
        end
    end

    def valid_token?
        @token.present? and @token == Rails.application.credentials.token
    end
end