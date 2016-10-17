
class DayLogsController < ApplicationController
  require 'active_support/core_ext/string'
  require 'date'
  before_action :set_day_log, only: [:show, :edit, :update, :destroy]

  # GET /day_logs
  # GET /day_logs.json
  def index
    @day_logs = DayLog.all
  end

  # GET /day_logs/1
  # GET /day_logs/1.json
  def show
  end

  # GET /day_logs/new
  def new
    @day_log = DayLog.new
  end

  # GET /day_logs/1/edit
  def edit
  end

def create
   puts params
     if current_user 

      @day_log = set_params(params[:day], params[:time_in], params[:time_out])
      
       week = week_exist? 
     
          params = ActionController::Parameters.new({
            week: {
            week_strat: get_sunday,
            day_id:  @day_log.id,
            user_id: current_user.id
          }
        }) 
         permitted = params.require(:week).permit(:week_strat,  :day_id, :user_id)
         if  @week = Week.create!(permitted) 
          
             render :show
          else
            format.html { render :new }
            format.json { render json: @week.errors, status: :unprocessable_entity }
          end

      else 
       redirect_to root_url, :notice => "You need to login befor loging your hours worked"
     end
  end

  def set_params(day, time_in, time_out)
    params = ActionController::Parameters.new({
       day_log: {
        day: day,
        time_in:  time_in,
        time_out: time_out,
        user_id: current_user.id
      }
    })
    permitted = params.require(:day_log).permit(:day, :time_in, :time_out, :user_id)
  

      if @day_log = DayLog.create!(permitted) 
        @day_log
      else
        format.html { render :new }
        format.json { render json: @day_log.errors, status: :unprocessable_entity }

    end
  end

  # POST /day_logs
  # POST /day_logs.json
  # def create
  #   binding.pry
  #   @day_log = DayLog.new(day_log_params)

  #   respond_to do |format|
  #     if @day_log.save
  #       format.html { redirect_to @day_log, notice: 'Day log was successfully created.' }
  #       format.json { render :show, status: :created, location: @day_log }
  #     else
  #       format.html { render :new }
  #       format.json { render json: @day_log.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end

  # PATCH/PUT /day_logs/1
  # PATCH/PUT /day_logs/1.json
  def update
    respond_to do |format|
      if @day_log.update(day_log_params)
        format.html { redirect_to @day_log, notice: 'Day log was successfully updated.' }
        format.json { render :show, status: :ok, location: @day_log }
      else
        format.html { render :edit }
        format.json { render json: @day_log.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /day_logs/1
  # DELETE /day_logs/1.json
  def destroy
    @day_log.destroy
    respond_to do |format|
      format.html { redirect_to day_logs_url, notice: 'Day log was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_day_log
      @day_log = DayLog.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def day_log_params
      params.require(:day_log).permit(:day, :time_in, :time_out)
    end

    def week_params
      params.require(:week).permit(:start_day, :day_id, :user_id)
    end

    def week_exist? 
   @week = search(get_sunday());


      
  
end 

  def search(search)
 
     Week.where(['name LIKE ?', "%#{search}%"])



end

def  get_sunday 

  date =  Date.today.beginning_of_week(:sunday)
   # week = DateTime.parse(date).strftime("%A, %b %d")
   new_dat = date.to_s
 
end

end
