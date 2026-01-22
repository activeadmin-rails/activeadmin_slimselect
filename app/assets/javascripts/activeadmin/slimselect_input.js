(function () {
  'use strict'

  // --- functions ------------------------------------------------------------
  function initSlimSelectInputs() {
    document.querySelectorAll('[data-slimselect-input]').forEach(function (el) {
      // Skip if already initialized
      if (el.slim) return

      var remote = el.getAttribute('data-opt-remote') || ''
      var fieldText = el.getAttribute('data-opt-text') || 'text'
      var fieldValue = el.getAttribute('data-opt-value') || 'value'

      // Build settings object
      var settings = {
        closeOnSelect: true,
        allowDeselect: true,
        placeholderText: el.getAttribute('placeholder') || 'Select...'
      }

      // Parse data-opts JSON if present (overrides individual data-opt-* attributes)
      var optsJson = el.getAttribute('data-opts')
      if (optsJson) {
        try {
          var customOpts = JSON.parse(optsJson)
          Object.assign(settings, customOpts)
        } catch (e) {
          console.error('SlimSelect: Invalid JSON in data-opts', e)
        }
      } else {
        // Parse individual data-opt-* attributes
        Array.from(el.attributes).forEach(function (attr) {
          if (attr.name.startsWith('data-opt-') && attr.name !== 'data-opt-remote' && attr.name !== 'data-opt-text' && attr.name !== 'data-opt-value') {
            var name = attr.name.substring(9) // Remove 'data-opt-' prefix
            // Convert kebab-case to camelCase
            name = name.replace(/-([a-z])/g, function (g) { return g[1].toUpperCase() })
            // Convert string booleans
            var value = attr.value
            if (value === 'true') value = true
            else if (value === 'false') value = false
            settings[name] = value
          }
        })
      }

      // Build config object
      var config = {
        select: el,
        settings: settings
      }

      // Add remote search if configured
      if (remote) {
        config.events = {
          search: function (search, currentData) {
            return new Promise(function (resolve, reject) {
              if (search.length === 0) {
                return resolve(currentData)
              }

              var url = remote + '?q[' + fieldText + '_contains]=' + encodeURIComponent(search)

              fetch(url)
                .then(function (response) {
                  return response.json()
                })
                .then(function (data) {
                  var options = data.slice(0, 10).map(function (item) {
                    return {
                      text: item[fieldText],
                      value: String(item[fieldValue])
                    }
                  })
                  resolve(options)
                })
                .catch(function (error) {
                  console.error('SlimSelect fetch error:', error)
                  reject(error)
                })
            })
          }
        }
      }

      // Initialize SlimSelect
      new SlimSelect(config)
    })
  }

  // --- events ---------------------------------------------------------------
  document.addEventListener('DOMContentLoaded', initSlimSelectInputs)

  // ActiveAdmin has_many support
  document.addEventListener('has_many_add:after', initSlimSelectInputs)

  // Turbolinks support
  document.addEventListener('turbolinks:load', initSlimSelectInputs)

  // Turbo support
  document.addEventListener('turbo:load', initSlimSelectInputs)
})()
