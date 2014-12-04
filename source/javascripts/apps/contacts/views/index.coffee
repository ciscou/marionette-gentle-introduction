ContactManager.module 'ContactsApp.Views', (Views, ContactManager, Backbone, Marionette, $, _) ->
  Views.ContactRow = Marionette.ItemView.extend
    tagName: 'tr'

    template: '#contact-list-item'

    events:
      'click': 'highlight'
      'click a.js-show': 'showClicked'
      'click a.js-edit': 'editClicked'
      'click button.js-delete': 'deleteClicked'

    highlight: ->
      @$el.toggleClass('warning')

    showClicked: (e) ->
      e.stopPropagation()

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

    template: '#contact-list'

    childView: Views.ContactRow

    childViewContainer: 'tbody'
