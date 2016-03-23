class AuthorizationsController < ActionController::API
	def create
		auth_client = Google::APIClient::ClientSecrets.new('web'=>{
			client_id:'71354611982-e0tbmt9j3eh3mo0pld3p21bd7n0a7qog.apps.googleusercontent.com',
			client_secret:'KxlR-0lssO6nhShSOsj1YkCg',
			redirect_url:'http://localhost:4200/oauth2callback'
			}).to_authoration
		client.grant_type = 'authorization_code'
		client_code = params['authorization_code']
		token = client.fetch_access_token!
		client = Google::Apis::Oauth2V2::Oauth2Service.new
		client.authorization = auth_client
		user_info = client.get_userinfo

		auth_token = AuthToken.where(email: user_info.email).first_or_create
		auth_token.update(token:token)

		render json:{
			email: user_info.email,
			token: token
		}
	end
end