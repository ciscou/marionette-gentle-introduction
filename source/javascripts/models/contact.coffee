ContactManager.module "Models", (Models, ContactManager, Backbone, Marionette, $, _) ->
  Models.Contact = Backbone.Model.extend
    localStorage: new Backbone.LocalStorage('contacts')

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
