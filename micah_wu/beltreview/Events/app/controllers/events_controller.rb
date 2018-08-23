class EventsController < ApplicationController
    def index
        @user = User.find(session[:user_id])
        puts "hello"
        puts "#{@user.state}"
        @events = Event.where(state: @user.state)
        @otherevents = Event.where.not(state: @user.state)
        @attend = Join.all
      end
    
      def show
        @event = Event.find(id = params[:id])
        @attend = Join.where("event_id = '#{params[:id]}'").count
        @attendees = Join.where("event_id = '#{params[:id]}'")
        @comments = Comment.joins(:event).where(event_id: @event.id)
      end
    
      def new
      end
    
      def create
        if Event.create(event_params).valid?
          redirect_to "/events"
        else
          flash[:errors] = Event.create(event_params).errors.full_messages
          redirect_to "/events"
        end
      end
    
      def edit
        @event = Event.find(id = params[:id])
      end
    
      def update
        event = Event.find(params[:id])
        event.update(event_params)
        if event.valid?
          redirect_to "/events"
        else
          flash[:errors] = event.errors.full_messages
          redirect_to "/events/#{params[:id]}/edit"
        end
      end
    
      def destroy
        event = Event.find(params[:id])
        event.destroy
        redirect_to "/events"
      end
    
      private
      def event_params
        params.require(:event).permit(:name, :date, :city, :state, :user_id)
      end
end
