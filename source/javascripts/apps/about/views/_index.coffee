ContactManager.module 'AboutApp.Views', (Views, ContactManager, Backbone, Marionette, $, _) ->
  Views.Index = Marionette.ItemView.extend
    template: HandlebarsTemplates['about/message']
