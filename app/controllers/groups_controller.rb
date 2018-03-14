class GroupsController < ApplicationController


  def index
  end

  def new
    @group = Group.new
  end

  def create
    @group = Group.new(name: group_params[:name])
    if @group.save
      save_groups_associated_in_user_id(group: @group)
      redirect_to root_path, notice: 'グループ作成成功'
    else
      flash.now[:alert] = 'グループ作成失敗'
      render :new
    end
  end

  private

  def save_groups_associated_in_user_id(group:)
    group_params[:user_ids].each do |user_id|
      group.users << User.find(user_id)
    end
  end

  def group_params
    params.require(:group).permit(:name, user_ids: [])
  end
end
