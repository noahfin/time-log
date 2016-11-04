class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

   def week_exist? 
     week = Week.where("week_strat = ?", get_sunday()).first
     
    end 

  def search(search)

     Week.where(['week_strat LIKE ?', "#{search}"])
  end

  def  get_sunday 
    date =  Date.today.beginning_of_week(:sunday)
    new_dat = date.to_s 
  end
end
