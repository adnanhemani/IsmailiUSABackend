class AnnouncementController < ApplicationController
    before_filter :authenticate_announcement_user!

    def index
        @jamatkhana = current_announcement_user.jamatkhana
        @announcements = Announcement.where(jamatkhana: @jamatkhana)
    end

    def edit
        @announcement = Announcement.find(params[:id])
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
    end

    def create
        @announcement = Announcement.new(user_params)
        jk = current_announcement_user.jamatkhana
        @announcement.jamatkhana = jk
        if @announcement.save
            #TODO: Fast announcement insertions
            render "fast_insert"
        else
            render "new", :notice => "Some error occurred in trying to save your announcement"
        end
    end

    def update
        @announcement = Announcement.find(params[:id])
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
end
