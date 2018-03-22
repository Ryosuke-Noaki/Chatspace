class GroupsController < ApplicationController
  before_action :set_group, only: %i(edit update)

  def index
  end

  def new
    @group = Group.new
  end

  def create
    @group = Group.new(name: group_params[:name])
    if @group.save
      @group.associate_users(user_ids: group_params[:user_ids])
      redirect_to root_path, notice: 'グループ作成に成功しました'
    else
      flash.now[:alert] = 'グループ作成に失敗しました'
      render :new
    end
  end

  def edit
  end

   def update
    if @group.update(group_params)
      redirect_to group_messages_path(@group), notice: 'グループを編集しました'
    else
      flash.now[:alert] = 'グループの編集に失敗しました'
      render :edit
    end
  end

  private

  def group_params
    params.require(:group).permit(:name, user_ids: [])
  end

  def set_group
    @group = Group.find(params[:id])
  end
end
