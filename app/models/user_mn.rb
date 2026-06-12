class UserMn < User
  def send_devise_notification(notification, *args)
    MosaicoNatura::DeviseMailer.send(notification, self, *args).deliver_now
  end
end
