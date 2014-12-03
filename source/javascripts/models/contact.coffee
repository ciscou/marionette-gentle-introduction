ContactManager.module "Models", (Models, ContactManager, Backbone, Marionette, $, _) ->
  Models.Contact = Backbone.Model.extend
    localStorage: new Backbone.LocalStorage('contacts')

    validate: (attrs, opts) ->
      errors = {}

      unless attrs.firstName
        errors.firstName = "can't be blank"
      if !attrs.lastName
        errors.lastName = "can't be blank"
      else if attrs.lastName.length < 2
        errors.lastName = "is too short"

      unless _.isEmpty(errors)
        return errors

  API =
    getContact: (id) ->
      contact = new Models.Contact(id: id)
      defer = $.Deferred()
      fetch = ->
        contact.fetch
          success: (data) ->
            defer.resolve(data)
          error: ->
            defer.resolve(undefined)
      setTimeout fetch, 300
      defer.promise()

  ContactManager.reqres.setHandler 'contact:get', (id) ->
    API.getContact(id)
