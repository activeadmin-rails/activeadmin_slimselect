// Bridge ActiveAdmin's jQuery-triggered has_many events to native DOM events
// so that activeadmin_slimselect's native event listener can pick them up.
//
// ActiveAdmin fires `has_many_add:after` via jQuery `.trigger()`, but
// slimselect_input.js listens with native `document.addEventListener`.
$(document).on('has_many_add:after', function (e) {
  if (e.originalEvent) return  // native event, don't re-dispatch
  document.dispatchEvent(new Event('has_many_add:after'))
})
