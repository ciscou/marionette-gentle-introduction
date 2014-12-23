ContactManager.module 'AboutApp', (About, ContactManager, Backbone, Marionette, $, _) ->
  About.Router = Marionette.AppRouter.extend
    appRoutes:
      'about': 'index'

  ContactManager.addInitializer ->
    new About.Router(controller: About.Controller)
