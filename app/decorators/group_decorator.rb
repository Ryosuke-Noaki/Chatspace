class GroupDecorator < Draper::Decorator
  delegate_all

  NO_MESSAGE_STATEMENT = 'まだメッセージが投稿されていません'

  def error_messages
    object.errors.full_messages
  end

  def error_message_num
    self.error_messages.count
  end

  def last_message
    msgs = object.messages
    if msgs.blank?
      NO_MESSAGE_STATEMENT
    else
      msgs.last.body.presence ||  '画像が投稿されています'
    end
  end

end
