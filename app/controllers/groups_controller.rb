class GroupsController < ApplicationController
  def index
  end

  def new
    @group = Group.new
    @group.users << current_user
  end

def create
    @group = Group.new(name: group_params[:name])
    if @group.save
      group_params[:user_ids].each do |user_id|
        @group.users << User.find(user_id)
      end
      flash.now[:notice] = 'グループ作成成功'
      redirect_to root_path
    else
      flash.now[:alert] = 'グループ作成失敗'
      redirect_to new_group_path
    end
  end

  private
  def group_params
    params.require(:group).permit(:name, user_ids: [])
  end
end
