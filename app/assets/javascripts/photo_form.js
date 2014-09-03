var PhotoForm = {
  init: function() {
    PhotoForm.form   = document.getElementById('new_photo');
    PhotoForm.submit = document.getElementById('form-submit');
    PhotoForm.bindUI();
  },
  bindUI: function() {
    $(PhotoForm.submit).click(PhotoForm.submitForm);
  },
  submitForm: function(e) {
    e.preventDefault();
    if($(PhotoForm.form).valid() === true) {
      PhotoForm.form.submit();
    }
  },
};