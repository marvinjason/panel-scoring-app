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

  def update(data)
    score = Score.find(data['id'])
    
    ActionCable.server.broadcast 'notifications_channel', action: 'update', id: score.project.id,
      username: score.user.username, flow_balance: score.flow_balance, impact_factor: score.impact_factor,
      conclusion: score.conclusion, question_and_answer: score.question_and_answer, presenter: score.presenter,
      average: score.average
  end
end
