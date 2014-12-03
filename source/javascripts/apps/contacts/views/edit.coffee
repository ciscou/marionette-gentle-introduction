ContactManager.module 'ContactsApp.Views', (Views, ContactManager, Backbone, Marionette, $, _) ->
  Views.Edit = Marionette.ItemView.extend
    template: '#contact-form'

    events:
      "click button.js-submit": "submitClicked"

    submitClicked: (e) ->
      e.preventDefault()
      console.log "edit contact"
