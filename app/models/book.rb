class Book < ApplicationRecord
	belongs_to :user

	validates :title, presence: true
	validates :opinion, length: { maximum: 200 }, presence: true

end
