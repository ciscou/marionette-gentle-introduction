ContactManager.module 'ContactsApp', (Contacts, ContactManager, Backbone, Marionette, $, _) ->
  Contacts.Router = Marionette.AppRouter.extend
    appRoutes:
      '': 'index'
      'contacts': 'index'
      'contacts/:id': 'show'
      'contacts/:id/edit': 'edit'

  ContactManager.addInitializer ->
    new Contacts.Router(controller: Contacts.Controller)
