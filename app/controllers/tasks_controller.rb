class TasksController < ApplicationController
    def index
      @schedules = Schedule.all
    end
    
    def new
      @schedules = Schedule.new
      @schedules = Schedule.all
    end
    
    def create
      @schedules = Schedule.new(params.require(:schedule).permit(:title, :start_at, :end_at, :is_all_day, :post_memo))
      if @schedule.save
        flash[:success]= "スケジュールを登録しました"
        redirect_to :schedules
      else
        flash[:delete]= "スケジュールを登録できませんでした"
        render "new"
      end
      @schedules = Schedule.all
    end
    
    def show
      @schedule = Schedule.find(params[:id])
      @schedules = Schedule.all
    end
    
    def edit
      @schedule = Schedule.find(params[:id])
      @schedules = schedule.all
    end
    
    def update
      @schedule = Schedule.find(params[:id])
      if @schedule.update(params.require(:schedule).permit(:title, :start_day, :end_day, :all_day, :memo))
        flash[:success] = "スケジュールを更新しました"
        redirect_to :schedules
      else
        flash[:delete]= "スケジュールを更新できませんでした"
        render "edit"
      end
      @schedules = Schedule.all
    end
    
    def destroy
      @schedule = Schedule.find(params[:id])
      @schedule.destroy
      flash[:delete]= "スケジュールを削除しました"
      redirect_to :schedules
    end
end