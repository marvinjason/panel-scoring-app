class NotificationsChannel < ApplicationCable::Channel
  def subscribed
    stream_from "notifications_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def move(data)
  	ActionCable.server.broadcast 'notifications_channel', action: 'move', id: data['message']
  end

  def show(data)
  	ActionCable.server.broadcast 'notifications_channel', action: 'show', users: data['users']
  end

  def hide
  	ActionCable.server.broadcast 'notifications_channel', action: 'hide'
  end
end
