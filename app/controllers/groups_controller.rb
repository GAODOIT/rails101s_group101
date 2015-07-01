class GroupsController < ApplicationController
    def index
        flash[:notice] = "早安！ 你好！ "
        #flash[:alert] = "晚安！ 該睡了！ "
    end

    def home
        render :text=>"this is the home page!", :layout => true
        #render :text=>"this is the home page!", :layout => true
        #render :text => "This is an error", :status => 500
    end
end
