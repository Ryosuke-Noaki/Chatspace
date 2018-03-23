class GroupDecorator < Draper::Decorator
  delegate_all


  def error_messages
    object.errors.full_messages
  end

  def error_message_num
    self.error_messages.count
  end

end
