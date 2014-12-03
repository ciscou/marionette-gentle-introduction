ContactManager.module 'ContactsApp.Controller', (Controller, ContactManager, Backbone, Marionette, $, _) ->
  Controller.index = ->
    loadContacts (contacts) ->
      contactsView = new ContactManager.ContactsApp.Views.Index
        collection: contacts

      contactsView.on 'childview:contact:delete', (childView, contact) ->
        contact.destroy()

      ContactManager.mainRegion.show(contactsView)

  Controller.show = (id) ->
    loadContact id, (contact) ->
      view = new ContactManager.ContactsApp.Views.Show(model: contact)
      ContactManager.mainRegion.show(view)

  Controller.edit = (id) ->
    loadContact id, (contact) ->
      view = new ContactManager.ContactsApp.Views.Edit(model: contact)

      view.on 'form:submit', (data) ->
        if contact.save(data)
          Backbone.history.navigate "contacts/#{contact.get('id')}", trigger: true
        else
          view.triggerMethod('form:data:invalid', contact.validationError)

      ContactManager.mainRegion.show(view)

  loading = ->
    loadingView = new ContactManager.Common.Views.Loading()
    ContactManager.mainRegion.show(loadingView)

  loadContacts = (callback) ->
    loading()

    fetchingContacts = ContactManager.request('contacts:all')
    $.when(fetchingContacts).done(callback)

  loadContact = (id, callback) ->
    loading()

    fetchingContact = ContactManager.request('contact:get', id)
    $.when(fetchingContact).done (contact) ->
      if contact?
        callback(contact)
      else
        view = new ContactManager.ContactsApp.Views.Missing()
        ContactManager.mainRegion.show(view)
