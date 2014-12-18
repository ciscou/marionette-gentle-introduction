ContactManager.module 'ContactsApp.Views', (Views, ContactManager, Backbone, Marionette, $, _) ->
  Views.Missing = Marionette.ItemView.extend
    template: HandlebarsTemplates['contacts/missing']

  Views.Show = Marionette.ItemView.extend
    template: HandlebarsTemplates['contacts/show']
