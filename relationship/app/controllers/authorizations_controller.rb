class AuthorizationsController < ActiveController::API
	def create
		auth_client = Google::APIClient::ClientSecrets.new('web'=>{
			client_id:ENV[''],
			client_secret:ENV[''],
			redirect_url:'http://localhost:4200/oauth2callback'
			}).to_authoration
		client.grant_type = 'authorization_code'
		client_code = params['authorization_code']
		token = client.fetch_access_token!
		client = Google::Apis::Oauth2V2::Oauth2Service.new
		client.authorization = auth_client
		user_info = client.get_userinfo
	end
end