class GroupsController < ApplicationController


  def index
  end

  def new
    @group = Group.new
  end

  def create
    @group = Group.new(name: group_params[:name])
    if @group.save
      @group.associate_users(user_ids: group_params[:user_ids])
      redirect_to root_path, notice: 'グループ作成成功'
    else
      flash.now[:alert] = 'グループ作成失敗'
      render :new
    end
  end

  private

  def group_params
    params.require(:group).permit(:name, user_ids: [])
  end
end
