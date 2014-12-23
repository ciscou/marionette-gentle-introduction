ContactManager.module 'ContactsApp.Views', (Views, ContactManager, Backbone, Marionette, $, _) ->
  Views.ContactRow = Marionette.ItemView.extend
    tagName: 'tr'

    template: HandlebarsTemplates['contacts/row']

    events:
      'click': 'highlight'

    triggers:
      'click a.js-show': 'contact:show'
      'click a.js-edit': 'contact:edit'
      'click button.js-delete': 'contact:delete'

    highlight: ->
      @$el.toggleClass('warning')

    flash: (className) ->
      $el = @$el
      $el.hide().toggleClass(className).fadeIn 300, ->
        setTimeout (-> $el.toggleClass(className)), 300

    showClicked: (e) ->
      e.preventDefault()
      e.stopPropagation()
      @trigger 'contact:show', @model

    editClicked: (e) ->
      e.preventDefault()
      e.stopPropagation()
      @trigger 'contact:edit', @model

    deleteClicked: (e) ->
      e.stopPropagation()
      @trigger 'contact:delete', @model

    remove: ->
      @$el.fadeOut => Marionette.ItemView.prototype.remove.call(this)

  Views.Index = Marionette.CompositeView.extend
    tagName: 'table'

    className: 'table table-hover'

    template: HandlebarsTemplates['contacts/index']

    childView: Views.ContactRow

    childViewContainer: 'tbody'
