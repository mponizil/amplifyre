define(function() {

  function loadHelpers(req, obj, name, helpers, index, next) {
    if (index >= helpers.length) return next(obj);

    var prefix = helpers[index];
    obj.helpers || (obj.helpers = {});

    req([prefix + '/' + name], function(helper) {
      if (helper) {
        obj.helpers[prefix] = helper;
      }

      loadHelpers(req, obj, name, helpers, index+1, next);
    }, function(err) {
      require.undef(err.requireModules[0]);

      loadHelpers(req, obj, name, helpers, index+1, next);
    });
  }

  return {

    load: function(name, req, load, config) {

      req([name], function(obj) {
        loadHelpers(req, obj, name, config.helpers, 0, load);
      });

    }

  };

});
