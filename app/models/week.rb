class Week < ActiveRecord::Base
	has_many :day_logs
	belongs_to :user
end
