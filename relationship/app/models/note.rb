class Note < ApplicationRecord
  belongs_to :contact
  belongs_to :topic
end
