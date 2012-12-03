define(['text'], function(text) {

  return {

    buildMap: {},

    load: function(name, req, load, config) {
      if (config.isBuild) {
        var _this = this,
            helpersParams = config.helpers,
            helpers = [];

        // Resolve helper names from configuration helpersParams
        for (var i in helpersParams) {
          var helperParams = helpersParams[i];
          helpers.push({
            label: helperParams.label,
            name: resolveHelperName(name, helperParams)
          });
        }

        _this.buildMap[name] = {
          helpers: helpers
        }
      }

      // Target dependency is needed
      req([name], function(obj) {
        // Iterate through config.helpers recursively
        if (config.isBuild) {
          reqHelpers(req, helpers, 0, load);
        } else {
          loadHelpers(req, obj, name, config.helpers || [], 0, load);
        }
      });

    },

    write: function(plugin, name, write) {
      var helpers = this.buildMap[name].helpers,
          helperNames = [],
          helperObjs = [],
          objHelperDefs = [],
          count,
          deps = '"' + name + '"', objs = 'obj', defs;

      for (var i in helpers) {
        count = parseInt(i) + 1;
        helperNames.push(helpers[i].name);
        helperObjs.push('helper' + count);
        objHelperDefs.push('obj.helpers["' + helpers[i].label + '"] = helper' + count + ';');
      }

      if (helperNames.length) {
        deps += ', "' + helperNames.join('", "') + '"';
        objs += ', ' + helperObjs.join(', ');
      }

      write('define("' + plugin + '!' + name + '", ' +
        '[' + deps + '], ' + 'function(' + objs + ') {' +
          'obj.helpers = {};' +
          objHelperDefs.join() +
          'return obj;' +
        '});');
    }

  };

  function resolveHelperName(name, params) {
    var pattern = new RegExp(params.pattern);
    return name.replace(pattern, params.replace);
  }

  function reqHelpers(req, helpers, index, next) {
    if (index >= helpers.length) return next(null);

    req([helpers[index].name], function() {
      reqHelpers(req, helpers, index+1, next);
    });
  }

  function loadHelpers(req, obj, name, helpersParams, index, next) {
    if (index >= helpersParams.length) return next(obj);

    var helperName = resolveHelperName(name, helpersParams[index])

    obj.helpers || (obj.helpers = {});

    req([helperName], function(helper) {
      if (helper) {
        obj.helpers[prefix] = helper;
      }

      loadHelpers(req, obj, name, helpersParams, index+1, next);
    }, function(err) {
      if (err.requireModules) require.undef(err.requireModules[0]);

      loadHelpers(req, obj, name, helpersParams, index+1, next);
    });
  }

});
