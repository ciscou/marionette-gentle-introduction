ContactManager.module 'ContactsApp.Controller', (Controller, ContactManager, Backbone, Marionette, $, _) ->
  Controller.index = ->
    loadContacts (contacts) ->
      contactsView = new ContactManager.ContactsApp.Views.Index
        collection: contacts

      contactsView.on 'childview:contact:edit', (childView, contact) ->
        view = new ContactManager.ContactsApp.Views.Edit(model: contact, asModal: true)
        setupEditView view, contact, ->
          view.closeModal()
          childView.render().flash('success')
        ContactManager.dialogRegion.show(view)

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
      setupEditView view, contact, ->
        Backbone.history.navigate "contacts/#{contact.get('id')}", trigger: true
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

  setupEditView = (view, contact, callback) ->
    view.on 'form:submit', (data) ->
      if contact.save(data)
        callback()
      else
        view.triggerMethod('form:data:invalid', contact.validationError)