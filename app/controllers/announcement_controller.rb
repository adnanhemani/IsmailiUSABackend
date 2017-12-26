class AnnouncementController < ApplicationController
    before_filter :authenticate_announcement_user!

    def index
        @jamatkhana = current_announcement_user.jamatkhana
        @announcements = Announcement.where(jamatkhana: @jamatkhana)
    end

    def edit
        @announcement = Announcement.find(params[:id])
        if @announcement.event_id
            @event_inst = Event.find(@announcement.event_id)
        else
            @event_inst = Event.new
        end
        # Check if user checking the announcement is from the same jamatkhana as the announcement
        if @announcement.jamatkhana != current_announcement_user.jamatkhana
            render "error_access"
        end
    end

    def destroy
        announcement = Announcement.find(params[:id])
        announcement.destroy
        redirect_to announcement_index_path
    end

    def new
        @announcement = Announcement.new
        @event_inst = Event.new
    end

    def create
        @announcement = Announcement.new(user_params)
        if params[:announcement][:is_event] == '1'
            #Create assoc event
            @event_inst = Event.new(event_params)

            if @event_inst.save
                @announcement.event_id = @event_inst.id
            else
                return render "new", :notice => "Some error occurred in trying to save your event"
            end
        else
            @event_inst = Event.new
        end

        jk = current_announcement_user.jamatkhana
        @announcement.jamatkhana = jk

        #puts params


        if @announcement.save
            render "fast_insert"
        else
            return render "new", :notice => "Some error occurred in trying to save your announcement"
        end
    end

    def update
        @announcement = Announcement.find(params[:id])
        if @announcement.event_id
            @event_inst = Event.find(@announcement.event_id)
        else
            @event_inst = Event.new
        end
        
        if params[:announcement][:is_event] == '1'
            
            if @event_inst.update_attributes(event_params)
                @announcement.event_id = @event_inst.id
            else
                return render "new", :notice => "Some error occurred in trying to save your event"
            end
        else
            if @event_inst
                @event_inst.destroy!
            end
        end
        if @announcement.update_attributes(user_params)
            redirect_to announcement_index_path
        else
            render "edit", :notice => "Some error occurred in trying to save your announcement"
        end
    end

    private
    def user_params
        params.require(:announcement).permit(:title, :body, :is_event)
    end

    def event_params
        params.require(:event).permit(:title, :location, :start, :end)
    end
end
