ContactManager.module 'ContactsApp.Views', (Views, ContactManager, Backbone, Marionette, $, _) ->
  Views.Missing = Marionette.ItemView.extend
    template: '#missing-contact-view'

  Views.Show = Marionette.ItemView.extend
    template: '#contact-view'
