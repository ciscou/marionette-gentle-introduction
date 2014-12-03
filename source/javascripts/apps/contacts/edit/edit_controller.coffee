ContactManager.module 'ContactsApp.Edit', (Edit, ContactManager, Backbone, Marionette, $, _) ->
  Edit.Controller =
    editContact: (id) ->
      loadingView = new ContactManager.Common.Views.Loading()
      ContactManager.mainRegion.show(loadingView)

      fetchingContact = ContactManager.request('contact:get', id)
      $.when(fetchingContact).done (contact) ->
        if contact?
          view = new Edit.Contact(model: contact)
        else
          view = new ContactManager.ContactsApp.Show.MissingContact()
        ContactManager.mainRegion.show(view)
