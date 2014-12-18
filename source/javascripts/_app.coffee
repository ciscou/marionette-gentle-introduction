Backbone.Marionette.TemplateCache.prototype.compileTemplate = (rawTemplate) ->
  Handlebars.compile(rawTemplate)

ContactManager = new Marionette.Application()

ContactManager.addRegions
  mainRegion: '#main-region'
  dialogRegion: '#dialog-region'

ContactManager.on 'start', ->
  Backbone.history.start()

@ContactManager = ContactManager
