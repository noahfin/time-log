module DayLogsHelper

	def  get_sunday 
		Date.today.beginning_of_week(:sunday)
	end

def week_exist? 
  if  @week = Week.search(get_sunday());
      @week;
  end
end 
end
