class GroupDecorator < Draper::Decorator
  delegate_all

  def error_message_num
    self.error_messages
  end

  def error_messages
    self.errors.full_messages
  end

  # Define presentation-specific methods here. Helpers are accessed through
  # `helpers` (aka `h`). You can override attributes, for example:
  #
  #   def created_at
  #     helpers.content_tag :span, class: 'time' do
  #       object.created_at.strftime("%a %m/%d/%y")
  #     end
  #   end

end
