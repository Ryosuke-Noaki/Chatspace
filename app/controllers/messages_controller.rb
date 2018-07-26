class MessagesController < ApplicationController
  before_action :set_group

  def index
    @message = Message.new
    @messages = @group.messages.includes(:user).decorate
    current_user_groups = current_user.groups
    @current_user_groups = GroupDecorator.decorate_collection(current_user_groups)
    respond_to do |format|
      format.html
      format.json
    end
  end


  def create
    @message = @group.messages.new(message_params)
    @message.user = current_user
    if @message.save
      respond_to do |format|
        format.html {redirect_to group_messages_path(@group)}
        format.json
      end
      flash[:notice] = 'メッセージが送信されました'
    else
      @messages = @group.messages.includes(:user)
      flash.now[:alert] = 'メッセージを入力してください。'
      render :index
    end
  end

  private

  def message_params
    params.require(:message).permit(:body, :image)
  end

  def set_group
    @group = Group.find(params[:group_id])
  end
end
