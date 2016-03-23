class Project < ApplicationRecord
	enum status: [:active, :archived]
	validates :name,presence: true

	has_and_belongs_to_many :contacts
end
