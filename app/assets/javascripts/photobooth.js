var Photobooth = {
  settings: {
    getReadyDelay: 3,
    countdownDelay: 1,
    numberOfPhotos: 4,
    contentType: "image/png",
    defaultFileName: "snapshot.png",
  },

  init: function() {
    Photobooth.form                = $("form");
    Photobooth.frame               = document.getElementById("video-frame");
    Photobooth.video               = document.getElementById("live");
    Photobooth.canvas              = document.getElementById("scratch");
    Photobooth.button              = document.getElementById('btn-camera');
    Photobooth.label               = document.getElementById('count-label');
    Photobooth.contentType         = "image/png"; //document.getElementById('photo_content_type');
    Photobooth.next                = document.getElementById("next-frame");
    Photobooth.bindUI();
    Photobooth.checkWebRTC();
  },

  bindUI: function() {
    Photobooth.button.addEventListener("click", Photobooth.getReadyCountdown);
  },

  checkWebRTC: function() {
    navigator.getUserMedia = ( navigator.getUserMedia || navigator.webkitGetUserMedia || navigator.mozGetUserMedia || navigator.msGetUserMedia);
    if (navigator.getUserMedia) {
      navigator.getUserMedia({video: true, audio: false}, Photobooth.initCamera, Photobooth.logError);
    } else {
      $(Photobooth.video).hide();
      $(Photobooth.button).hide();
      $(Photobooth.frame).append("<h1><i class='fa fa-frown-o'></i><br/>Camera Access Not Supported</h1>");
    }
  },

  logError: function(err) {
    console.log("The following error occured:");
    console.log(err);
  },

  initCamera: function(mediaStream) {
    Photobooth.video.src = window.URL.createObjectURL(mediaStream);
    Photobooth.video.addEventListener("playing", Photobooth.enableControls);
  },

  enableControls: function() {
    $(Photobooth.video).fadeIn('fast', function() {
      $("#controls").fadeIn('fast');
    });
  },

  getReadyCountdown: function(e) {
    $(Photobooth.button).fadeOut('fast', function() {
      $(Photobooth.label).text("Ready?");
      $(Photobooth.label).fadeIn();
      Photobooth.getReadyCount = Photobooth.settings.getReadyDelay;
      Photobooth.getReadyInterval = setInterval(Photobooth.processGetReady, 1000);
    });
  },

  processGetReady: function(e) {
    if(Photobooth.getReadyCount === 0) {
      clearInterval(Photobooth.getReadyInterval);
      Photobooth.startCountdown(e);
    } else {
      $(Photobooth.label).text(Photobooth.getReadyCount);
      Photobooth.getReadyCount -= 1;
    }
  },

  startCountdown: function(e) {
    // e.preventDefault();
    Photobooth.clearPreviousPhoto();
    // $(Photobooth.button).fadeOut('fast', function() {
      $(Photobooth.label).text("Pose!");
      $(Photobooth.label).fadeIn();
      Photobooth.currentPhoto = 1;
      Photobooth.currentCount = Photobooth.settings.countdownDelay;
      Photobooth.countdownInterval = setInterval(Photobooth.processCountdown, 100);
    // });
  },

  clearPreviousPhoto: function() {
    if($(Photobooth.video).hasClass("hidden")) {
      $(Photobooth.frame).children("img").fadeOut('fast', function() {
        $(Photobooth.video).removeClass("hidden");
        $(Photobooth.frame).children("img").remove();
        $(Photobooth.frame).fadeIn('fast');
      });
    }
  },

  processCountdown: function() {
    if(Photobooth.currentCount === 0) {
      console.log("Taking photo #%s", Photobooth.currentPhoto);
      Photobooth.takePhoto(Photobooth.currentPhoto);
      Photobooth.stopCountdown();
      // Reset and take another one
      Photobooth.currentPhoto += 1;
      $(Photobooth.label).html("&nbsp;");
      if(Photobooth.currentPhoto <= Photobooth.settings.numberOfPhotos) {
        console.log("Taking another...");
        Photobooth.currentCount = Photobooth.settings.countdownDelay;
        Photobooth.countdownInterval = setInterval(Photobooth.processCountdown, 1000);
      } else {
        Photobooth.currentPhoto = 1;
        console.log("Done!");

        $(Photobooth.video).fadeOut('fast', function() {
          Photobooth.form.submit();
          $(".processing").fadeIn('fast');
        });
      }
    } else {
      $(Photobooth.label).text("Pose!");
      Photobooth.currentCount -= 1;
    }
  },

  stopCountdown: function() {
    clearInterval(Photobooth.countdownInterval);
  },

  takePhoto: function(number) {
    Photobooth.canvas.width  = 640;
    Photobooth.canvas.height = 480;

    var c = Photobooth.canvas.getContext("2d");
    c.drawImage(Photobooth.video, 0, 0, Photobooth.canvas.width, Photobooth.canvas.height);

    $(Photobooth.video).fadeOut('fast');
    $(Photobooth.video).fadeIn('fast');

    Photobooth.processPhoto(number);
  },

  processPhoto: function(number) {
    var img = document.createElement("img");
    img.src    = Photobooth.canvas.toDataURL(Photobooth.settings.contentType);
    img.width  = Photobooth.canvas.width;
    img.height = Photobooth.canvas.height;

    Photobooth.saveToForm(number);
  },

  saveToForm: function(number) {
    document.getElementById('photo_set_photo' + number + '_base64').value   = Photobooth.canvas.toDataURL(Photobooth.settings.contentType);
  },
};