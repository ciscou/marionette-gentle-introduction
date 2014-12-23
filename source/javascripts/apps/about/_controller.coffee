ContactManager.module 'AboutApp.Controller', (Controller, ContactManager, Backbone, Marionette, $, _) ->
  Controller.index = ->
    view = new ContactManager.AboutApp.Views.Index
    ContactManager.mainRegion.show(view)
