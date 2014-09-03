var FormValidation = {
  init: function() {
    FormValidation.form        = document.getElementById('new_photo');
    FormValidation.name        = document.getElementById('photo_family_name');
    FormValidation.mdn         = document.getElementById('photo_mdn');
    FormValidation.setupValidation();
    FormValidation.addRules();
  },

  setupValidation: function() {
    $(FormValidation.form).validate({
      onkeyup: false,
      errorPlacement: FormValidation.showError
    });
  },

  addRules: function() {
    $(FormValidation.mdn).rules("add", { required: true, phoneUS: true });
    $(FormValidation.name).rules("add", { required: true });
  },

  showError: function(error, element) {
    var errored = document.getElementById(element[0].id);
    var message = error[0].innerText;
    $(errored).popover({
      placement: 'top',
      trigger: 'manual',
      html: true,
      content: message
    });
    $(errored).popover('show');
    setTimeout(function() {
      $(errored).popover('destroy');
    }, 1500);
  },
};