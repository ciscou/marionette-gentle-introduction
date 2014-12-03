ContactManager.module 'ContactsApp.List', (List, ContactManager, Backbone, Marionette, $, _) ->
  List.Contact = Marionette.ItemView.extend
    tagName: 'tr'
    template: '#contact-list-item'
    events:
      'click': 'highlight'
      'click button.js-delete': 'deleteClicked'
    highlight: ->
      @$el.toggleClass('warning')
    deleteClicked: (e) ->
      e.stopPropagation()
      @trigger 'contact:delete', @model
    remove: ->
      @$el.fadeOut => Marionette.ItemView.prototype.remove.call(this)

  List.Contacts = Marionette.CompositeView.extend
    tagName: 'table'
    className: 'table table-hover'
    template: '#contact-list'
    childView: List.Contact
    childViewContainer: 'tbody'
