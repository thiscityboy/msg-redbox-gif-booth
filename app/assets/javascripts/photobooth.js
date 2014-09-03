var Photobooth = {
  settings: {
    countdownDelay: 3,
    contentType: "image/png",
    defaultFileName: "snapshot.png",    
  },

  init: function() {
    Photobooth.frame         = document.getElementById("video-frame");
    Photobooth.video         = document.getElementById("live");
    Photobooth.canvas        = document.getElementById("scratch");
    Photobooth.button        = document.getElementById('btn-camera');
    Photobooth.label         = document.getElementById('count-label');
    Photobooth.contentBase64 = document.getElementById('photo_content_base64');
    Photobooth.contentType   = document.getElementById('photo_content_type');
    Photobooth.contentName   = document.getElementById('photo_content_filename');  
    Photobooth.next          = document.getElementById("next-frame");  
    Photobooth.bindUI();
    Photobooth.checkWebRTC();
  },

  bindUI: function() {
    Photobooth.button.addEventListener("click", Photobooth.startCountdown);
  },

  checkWebRTC: function() {
    navigator.getUserMedia = ( navigator.getUserMedia || navigator.webkitGetUserMedia || navigator.mozGetUserMedia || navigator.msGetUserMedia);
    if (navigator.getUserMedia) {
      navigator.getUserMedia({video: true, audio: false}, Photobooth.initCamera, Photobooth.logError);
    } else {
      $(Photobooth.frame).append("<h1><i class='fa fa-frown-o'></i><br/>getUserMedia not supported</h1>");
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

  startCountdown: function(e) {
    e.preventDefault();
    Photobooth.clearPreviousPhoto();
    $(Photobooth.button).fadeOut('fast', function() {
      $(Photobooth.label).show();
      $(Photobooth.label).text("Ready?");
      console.log("Ready!");
    });
    Photobooth.currentCount = Photobooth.settings.countdownDelay;
    Photobooth.countdownInterval = setInterval(Photobooth.processCountdown, 1000);
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
      Photobooth.takePhoto();
      Photobooth.stopCountdown();
    } else {
      $(Photobooth.label).text(Photobooth.currentCount);
      Photobooth.currentCount -= 1;
    }
  },

  stopCountdown: function() {
    clearInterval(Photobooth.countdownInterval);
    $(Photobooth.label).hide();
    $(Photobooth.label).text('');
    $(Photobooth.button).fadeIn('fast');
  },

  flash: function() {
    $(Photobooth.video).fadeOut();
    console.log("FLASH?");
  },

  takePhoto: function() {
    Photobooth.canvas.width  = 640;
    Photobooth.canvas.height = 480;

    var c = Photobooth.canvas.getContext("2d");
    c.drawImage(Photobooth.video, 0, 0, Photobooth.canvas.width, Photobooth.canvas.height);

    Photobooth.processPhoto();
  },

  processPhoto: function() {
    var img = document.createElement("img");
    img.src    = Photobooth.canvas.toDataURL(Photobooth.settings.contentType);
    img.width  = Photobooth.canvas.width;
    img.height = Photobooth.canvas.height;

    Photobooth.saveToForm();

    $(Photobooth.video).fadeOut('fast', function() {
      $(Photobooth.video).addClass("hidden");  
      $(Photobooth.frame).append(img);
      $(Photobooth.frame).fadeIn('fast');
      $(Photobooth.next).fadeIn('fast');
      $(Photobooth.video).fadeIn();
    });
  },

  saveToForm: function() {
    Photobooth.contentBase64.value = Photobooth.canvas.toDataURL(Photobooth.settings.contentType);
    Photobooth.contentType.value   = Photobooth.settings.contentType;
    Photobooth.contentName.value   = Photobooth.settings.defaultFileName;
  },  
};