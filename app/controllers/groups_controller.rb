class GroupsController < ApplicationController
    def index
        flash[:notice] = "早安！ 你好！ "
        flash[:alert] = "晚安！ 該睡了！ "
    end
end
