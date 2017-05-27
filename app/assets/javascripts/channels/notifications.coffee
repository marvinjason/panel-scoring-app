App.notifications = App.cable.subscriptions.create "NotificationsChannel",
  connected: ->
    # Called when the subscription is ready for use on the server

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
    # Called when there's incoming data on the websocket for this channel
    if (window.location.href != 'http://localhost:3000/dashboard')
      if (data['message'] == 'standby')
        window.location.replace('http://localhost:3000/standby')
      else if (data['message'] == 'show')
        $('.form').show();
      else if (data['message'] == 'hide')
        $('.form').hide();
      else
        window.location.replace('http://localhost:3000/thesis/' + data['message'])

  move: (message) ->
    @perform 'move', message: message

  show: ->
    @perform 'show'

  hide: ->
    @perform 'hide'