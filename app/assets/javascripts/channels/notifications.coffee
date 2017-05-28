App.notifications = App.cable.subscriptions.create "NotificationsChannel",
  connected: ->
    # Called when the subscription is ready for use on the server

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
    # Called when there's incoming data on the websocket for this channel
    if (window.location.href.indexOf('dashboard') < 0)
      if (data['message'] == 'standby')
        window.location.replace('/standby')
      else if (data['message'] == 'show')
        $('.form, .blur').show();
      else if (data['message'] == 'hide')
        $('.form, .blur').hide();
      else
        window.location.replace('/thesis/' + data['message'])

  move: (message) ->
    @perform 'move', message: message

  show: ->
    @perform 'show'

  hide: ->
    @perform 'hide'