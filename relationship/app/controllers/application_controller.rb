class ApplicationController < ActionController::API

	before_action :authorize_request




	def relationship_params
		associations ={}
		params[:data][:relationships].each do |k,v|
			associations[k.to_sym] = if v[:data].is_a? Array
				value[:data].map {|data| find_related_object(data)}
			else
				find_related_object(value[:data])
			end

		end


	end

	private

	def authorize_request
		/^Bearer  (?<bearer>.*)$/ =~ request.headers['Authorization']
		if AuthToken.where(token:bearer).count ==0
			render json:{errors:[{title:"error..."}]},status: :unauthorized
		end
	end

	def find_related_object(data)
		klass = data[:type].underscore.classify.safe_constantize
		klass.find(data[:id]) if klass
	end
end
