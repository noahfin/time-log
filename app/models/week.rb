class Week < ActiveRecord::Base
	has_many :day_logs,  dependent: :destroy
	belongs_to :user
end
