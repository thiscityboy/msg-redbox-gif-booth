var PhotoForm = {
  init: function() {
    PhotoForm.form   = document.getElementById('new_photo');
    PhotoForm.name   = document.getElementById('photo_family_name');
    PhotoForm.mdn    = document.getElementById('photo_mdn');
    PhotoForm.submit = document.getElementById('form-submit');
    PhotoForm.setupValidation();
    PhotoForm.bindUI();
  },

  bindUI: function() {
    $(PhotoForm.submit).click(PhotoForm.submitForm);
  },

  setupValidation: function() {
    $(PhotoForm.form).validate({
      onkeyup: false,
      errorPlacement: PhotoForm.showError
    });
    PhotoForm.addRules();
  },

  addRules: function() {
    $(PhotoForm.mdn).rules("add", { required: true, phoneUS: true });
    $(PhotoForm.name).rules("add", { required: true });
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

  submitForm: function(e) {
    e.preventDefault();
    if($(PhotoForm.form).valid() === true) {
      PhotoForm.form.submit();
    }
  },
  
};