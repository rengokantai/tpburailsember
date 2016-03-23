class ApplicationController < ActionController::API
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

	def find_related_object(data)
		data[:type].singularize.titlecase.constantize.find(data[:id])
	end
end
