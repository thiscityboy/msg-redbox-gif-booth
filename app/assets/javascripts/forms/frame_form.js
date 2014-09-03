var FrameForm = {
  init: function() {
    FrameForm.form   = document.getElementsByClassName('edit_photo')[0];
    FrameForm.submit = document.getElementById('form-submit');
    FrameForm.bindUI();
  },
  bindUI: function() {
    $(FrameForm.submit).click(FrameForm.submitForm);
  },
  submitForm: function(e) {
    e.preventDefault();
    FrameForm.form.submit();
  },
};