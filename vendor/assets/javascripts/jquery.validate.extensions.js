$(document).ready(function() {
  jQuery.validator.addMethod("phoneUS", function(phone_number, element) {
    phone_number = phone_number.replace(/\s+/g, "");
    return this.optional(element) || phone_number.length > 9 && phone_number.match(/^(1-?)?(\([2-9]\d{2}\)|[2-9]\d{2})-?[2-9]\d{2}-?\d{4}$/);
  }, "Please enter a 10 digit mobile phone number.");

  jQuery.validator.addMethod("zipcodeUS", function(value, element) {
    value = value.replace(/\s+/g, "");
    return this.optional(element) || /\d{5}-\d{4}$|^\d{5}$/.test(value);
  }, "Please enter a valid 5 digit zip code.");

  jQuery.validator.addMethod("dateUS", function(value, element) {
    value = value.replace(/\s+/g, "");
    return this.optional(element) || /(0[1-9]|1[012]|[1-9])[- \/.](0[1-9]|[12][0-9]|3[01]|[1-9])[- \/.](19|20)\d\d/.test(value);
  }, "Please enter a valid date (MM/DD/YYYY)");
});