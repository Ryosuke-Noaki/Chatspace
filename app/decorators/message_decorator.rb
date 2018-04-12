class MessageDecorator < Draper::Decorator
  delegate_all

  def user_name
    object.user.name
  end

  def image_url
    object.image.url
  end

end
