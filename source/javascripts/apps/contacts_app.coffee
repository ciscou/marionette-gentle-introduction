ContactManager.module 'ContactsApp', (ContactsApp, ContactManager, Backbone, Marionette, $, _) ->
  ContactsApp.Router = Marionette.AppRouter.extend
    appRoutes:
      '': 'listContacts'
      'contacts': 'listContacts'
      'contacts/:id': 'showContact'

  API =
    listContacts: ->
      ContactsApp.List.Controller.listContacts()
    showContact: (id) ->
      ContactsApp.Show.Controller.showContact(id)

  ContactManager.addInitializer ->
    new ContactsApp.Router(controller: API)
