App.notifications = App.cable.subscriptions.create "NotificationsChannel",
  connected: ->
    # Called when the subscription is ready for use on the server

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
    # Called when there's incoming data on the websocket for this channel

    if (window.location.href.indexOf('dashboard') < 0)
      user_id = window.location.href.match(/^(?:(.*\/users\/))([0-9]+)(?:(.*))$/)[2]

      if (data['action'] == 'move')
        if (data['id'] == 'standby')
          window.location.replace("/users/#{user_id}/standby")
        else
          window.location.replace("/users/#{user_id}/thesis/#{data['id']}")
      else if (data['action'] == 'show')
        users = data['users'].split(",")
        if user_id in users
          $('.standby').hide();
          $('.form, .blur').show();
        else
          $('.form').hide();
          $('.standby, .blur').show();
      else if (data['action'] == 'hide')
        $('.form, .standby, .blur').hide();

  move: (message) ->
    @perform 'move', message: message

  show: (users) ->
    @perform 'show', users: users

  hide: ->
    @perform 'hide'