angular.module('jquery.timeago', []).
  filter 'timeago', () ->
    (time) ->
      jQuery.timeago(time) if time?     
