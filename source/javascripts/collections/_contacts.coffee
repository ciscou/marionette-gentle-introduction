ContactManager.module "Collections", (Collections, ContactManager, Backbone, Marionette, $, _) ->
  Collections.ContactCollection = Backbone.Collection.extend
    localStorage: new Backbone.LocalStorage('contacts')
    model: ContactManager.Models.Contact
    comparator: 'firstName'

  initializeContacts = ->
    contacts = new Collections.ContactCollection [
        id: 1
        firstName: "Bob",
        lastName: "Brigham",
        phoneNumber: "555-0163"
      ,
        id: 2
        firstName: "Alice",
        lastName: "Arten",
        phoneNumber: "555-0184"
      ,
        id: 3
        firstName: "Charlie",
        lastName: "Cambell",
        phoneNumber: "555-0129"
    ]
    contacts.forEach (contact) -> contact.save()
    contacts.models

  API =
    getContacts: ->
      contacts = new Collections.ContactCollection()
      defer = $.Deferred()
      contacts.fetch
        success: (data) ->
          defer.resolve(data)
      promise = defer.promise()
      $.when(promise).done ->
        if contacts.length == 0
          models = initializeContacts()
          contacts.reset(models)
      promise

  ContactManager.reqres.setHandler 'contacts:all', ->
    API.getContacts()
