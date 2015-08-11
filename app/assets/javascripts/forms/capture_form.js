var CaptureForm = {
  init: function(form_class) {
    CaptureForm.form   = document.getElementsByClassName(form_class)[0];
    CaptureForm.submit = document.getElementById('form-submit');
    CaptureForm.bindUI();
  },
  bindUI: function() {
    $(CaptureForm.submit).click(CaptureForm.submitForm);
  },
  submitForm: function(e) {
    e.preventDefault();
    CaptureForm.form.submit();
  },
};