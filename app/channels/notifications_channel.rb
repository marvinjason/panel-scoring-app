class NotificationsChannel < ApplicationCable::Channel
  def subscribed
    stream_from "notifications_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def move(data)
  	ActionCable.server.broadcast 'notifications_channel', message: data['message']
  end

  def show
  	ActionCable.server.broadcast 'notifications_channel', message: 'show'
  end

  def hide
  	ActionCable.server.broadcast 'notifications_channel', message: 'hide'
  end
end
