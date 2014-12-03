ContactManager.module 'ContactsApp', (ContactsApp, ContactManager, Backbone, Marionette, $, _) ->
  ContactsApp.Router = Marionette.AppRouter.extend
    appRoutes:
      '': 'listContacts'
      'contacts': 'listContacts'
      'contacts/:id': 'showContact'
      'contacts/:id/edit': 'editContact'

  API =
    listContacts: ->
      ContactsApp.List.Controller.listContacts()
    showContact: (id) ->
      ContactsApp.Show.Controller.showContact(id)
    editContact: (id) ->
      ContactsApp.Edit.Controller.editContact(id)

  ContactManager.addInitializer ->
    new ContactsApp.Router(controller: API)
