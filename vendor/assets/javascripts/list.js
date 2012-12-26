(function() {

  // # List
  // Render a list of models with the specified template.
  this.List = Quilt.View.extend({

    // The constructor to use for child views.
    view: Quilt.View,

    initialize: function(options) {
      this._views = {};

      if (options && options.view) {
        this.view = options.view;
      }
      if (options && options.eventName) {
        this.eventName = options.eventName;
      }

      this.collection
        .on('add', this.add, this)
        .on('remove', this.remove, this)
        .on('reset', this.reset, this)
        .on('change:id', this.changeId, this);
    },

    // Find a view by (c)id.
    findView: function(id) {
      return this._views && this._views[id && id.cid || id];
    },

    // Add models, rendering a list item for each.
    render: function() {
      this.collection.each(this.add, this);
      return this;
    },

    // Update the cache when a model's id changes.
    changeId: function(model, id) {
      var view = this._views[model.cid];
      if (view && id != null) this._views[id] = view;
      var previous = model.previous('id');
      if (previous != null) delete this._views[previous];
    },

    // Render a list item for the added model, updating the cache and inserting
    // the item in the DOM in order.
    add: function(model) {
      if (this.findView(model)) return;

      var view = new this.view({model: model});

      // Add the view to the cache.
      this._views[model.cid] = this._views[view.cid] = view;
      if (model.id != null) this._views[model.id] = view;

      var index = this.collection.indexOf(model);
      this.views.splice(index, 0, view);

      view.render();

      // Insert the view into the DOM.
      var previous = this.findView(this.collection.at(index - 1));
      if (previous) previous.$el.after(view.el);
      else this.$el.prepend(view.el);

      this.$el.trigger('added', [view.$el]);
      if (this.eventName) this.$el.trigger('added:' + this.eventName, [view.$el]);
    },

    // Destroy the removed model's view and remove it from the DOM.
    remove: function(model) {
      var view = this.findView(model);
      if (!view) return;

      // Remove from the DOM and dispose.
      view.$el.remove();
      view.dispose();

      // Clean up.
      delete this._views[model.cid];
      delete this._views[view.cid];
      if (model.id != null) delete this._views[model.id];
      this.views.splice(_.indexOf(this.views, view), 1);
    },

    // Soft reset the list to avoid re-rendering models that haven't changed.
    reset: function() {
      this.collection.each(this.add, this);
      var models = _.pluck(this.views, 'model');
      _.each(_.difference(models, this.collection.models), this.remove, this);
      this.views = this.collection.map(this.findView, this);
      this.$el.append(_.pluck(this.views, 'el'));
    }

  });

})();
