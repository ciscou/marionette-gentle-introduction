ContactManager.module 'ContactsApp.List', (List, ContactManager, Backbone, Marionette, $, _) ->
  List.Controller =
    listContacts: ->
      loadingView = new ContactManager.Common.Views.Loading()
      ContactManager.mainRegion.show(loadingView)

      fetchingContacts = ContactManager.request('contacts:all')
      $.when(fetchingContacts).done (contacts) ->
        contactsView = new List.Contacts
          collection: contacts

        contactsView.on 'childview:contact:delete', (childView, contact) ->
          contact.destroy()

        ContactManager.mainRegion.show(contactsView)
