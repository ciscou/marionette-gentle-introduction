ContactManager.module 'ContactsApp', (Contacts, ContactManager, Backbone, Marionette, $, _) ->
  Contacts.Router = Marionette.AppRouter.extend
    appRoutes:
      'contacts': 'index'
      'contacts/:id': 'show'
      'contacts/:id/edit': 'edit'

    routes:
      '': 'navigateToIndex'

    navigateToIndex: ->
      ContactManager.trigger 'contacts:list'

  ContactManager.on 'contacts:list', ->
    Backbone.history.navigate 'contacts'
    Contacts.Controller.index()

  ContactManager.on 'contacts:show', (id) ->
    Backbone.history.navigate "contacts/#{id}"
    Contacts.Controller.show(id)

  ContactManager.addInitializer ->
    new Contacts.Router(controller: Contacts.Controller)
