ContactManager.module 'ContactsApp.Views', (Views, ContactManager, Backbone, Marionette, $, _) ->
  Views.Edit = Marionette.ItemView.extend
    template: '#contact-form'

    events:
      "click button.js-submit": "submitClicked"

    onShow: ->
      if @options.asModal
        @$el.closest('.modal').modal()

    submitClicked: (e) ->
      e.preventDefault()
      data = Backbone.Syphon.serialize(this)
      this.trigger('form:submit', data)

    onFormDataInvalid: (errors) ->
      @$('.form-group.has-error').removeClass('has-error').find('span.help-block').remove()

      _.each errors, (value, key) ->
        $formGroup = @$("#contact-#{key}").parent()
        $errorEl = $('<span>', class: 'help-block', text: value)
        $formGroup.addClass('has-error').append($errorEl)
