var CaptureForm = {
  init: function() {
    CaptureForm.form   = document.getElementsByClassName('edit_photo')[0];
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