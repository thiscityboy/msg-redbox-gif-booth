var Alerts = {
  init: function() {
    setTimeout(Alerts.fadeInAlert, 100);
    setTimeout(Alerts.fadeOutAlert, 4500);
  },

  fadeInAlert: function() {
    $(".alert").slideDown();
  },

  fadeOutAlert: function() {
    $(".alert").slideUp();
  },
};