class GroupsController < ApplicationController
    #http_basic_authenticate_with name: "gdd", password: "gdd2015",
    #except: [:index, :show]

    before_action :authenticate_user!, :only => [:new, :edit, :create, :update, :destroy]

    def home
        $group_log.debug "hello every one, this is home page!"
        render :text=>"this is the home page!", :layout => true
        #render :text=>"this is the home page!", :layout => true
        #render :text => "This is an error", :status => 500
    end

    def index
        #flash[:notice] = "早安！ 你好！ "
        #flash[:alert] = "晚安！ 該睡了！ "
        @groups = Group.all
    end

    def show
        @group = Group.find(params[:id])
        @posts = @group.posts
    end

    def new
        @group = Group.new
    end

    def edit
        @group = Group.find(params[:id])
    end

    def create
        @group = Group.new(group_params)
        if @group.save
            redirect_to groups_path, :notice => '新增討論版成功'
        else
            render :new
        end
    end

    def update
        @group = Group.find(params[:id])
        if @group.update(group_params)
            redirect_to groups_path, :notice => '修改討論版成功'
        else
            render :edit
        end
    end

    def destroy
        @group = Group.find(params[:id])
        @group.destroy
        redirect_to groups_path, :alert => '討論版已刪除'
    end

    private

    def group_params
        params.require(:group).permit(:title, :description)
    end
end
