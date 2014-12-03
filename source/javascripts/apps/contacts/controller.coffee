ContactManager.module 'ContactsApp.Controller', (Controller, ContactManager, Backbone, Marionette, $, _) ->
  Controller.index = ->
    loading()

    fetchingContacts = ContactManager.request('contacts:all')
    $.when(fetchingContacts).done (contacts) ->
      contactsView = new ContactManager.ContactsApp.List.Contacts
        collection: contacts

      contactsView.on 'childview:contact:delete', (childView, contact) ->
        contact.destroy()

      ContactManager.mainRegion.show(contactsView)

  Controller.show = (id) ->
    loading()

    fetchingContact = ContactManager.request('contact:get', id)
    $.when(fetchingContact).done (contact) ->
      if contact?
        contactView = new ContactManager.ContactsApp.Show.Contact(model: contact)
      else
        contactView = new ContactManager.ContactsApp.Show.MissingContact()
      ContactManager.mainRegion.show(contactView)

  Controller.edit = (id) ->
    loading()

    fetchingContact = ContactManager.request('contact:get', id)
    $.when(fetchingContact).done (contact) ->
      if contact?
        view = new ContactManager.ContactsApp.Edit.Contact(model: contact)
      else
        view = new ContactManager.ContactsApp.Show.MissingContact()
      ContactManager.mainRegion.show(view)

  loading = ->
    loadingView = new ContactManager.Common.Views.Loading()
    ContactManager.mainRegion.show(loadingView)
