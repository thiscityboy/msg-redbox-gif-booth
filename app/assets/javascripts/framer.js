var Framer = {

  settings: {
    height: 680,
    width:  740,
    contentType: "image/png",
    defaultFilename: "framed.png",
    canvas: {
      font: '33px VerizonApexMediumItalic, sans-serif',
      fontColor: 'white',
      textAlign: 'left',
      lineWidth: 6
    }      
  },

  init: function(photoUrl, familyName) {
    Framer.photoUrl     = photoUrl;
    Framer.familyName   = familyName.toUpperCase();
    Framer.main         = document.getElementById('snapshot-frame');
    Framer.row          = document.getElementById('frames-row'); 
    Framer.select       = document.getElementById('frames-frame');
    Framer.framedBase64 = document.getElementById('photo_framed_base64');
    Framer.framedName   = document.getElementById('photo_framed_filename');
    Framer.framedType   = document.getElementById('photo_framed_type');
    Framer.loading      = document.getElementById('loading');
    Framer.frames       = $(Framer.row).data('frames');
    Framer.framePhoto();
  },

  framePhoto: function() {
    Framer.photo             = document.createElement("img");      
    Framer.photo.height      = 480;
    Framer.photo.width       = 640;
    Framer.photo.crossOrigin = "anonymous";
    Framer.photo.src         = Framer.photoUrl;
    Framer.photo.addEventListener("load", Framer.createFrames);        
  },

  createFrames: function() {      
    $(Framer.frames).each(function(i, frameUrl) { 
      var canvas    = document.createElement("canvas");
      canvas.width  = Framer.settings.width;
      canvas.height = Framer.settings.height;

      var context = canvas.getContext('2d');
      context.drawImage(Framer.photo, 55, 155, 640, 480);

      var currentFrame         = document.createElement("img");        
      currentFrame.width       = Framer.settings.width;
      currentFrame.height      = Framer.settings.height;
      currentFrame.crossOrigin = "anonymous";
      currentFrame.src         = frameUrl;
      currentFrame.context     = context;
      currentFrame.addEventListener("load", Framer.applyFrame);        
    });
  },

  applyFrame: function() {
    this.context.drawImage(this, 0, 0, 740, 680);

    this.context.font        = Framer.settings.canvas.font;
    this.context.fillStyle   = Framer.settings.canvas.fontColor;
    this.context.textAlign   = Framer.settings.canvas.textAlign;
    this.context.lineWidth   = Framer.settings.canvas.lineWidth;
    
    this.context.fillText(Framer.familyName, 48, this.context.canvas.height - 28);

    var thumbnail         = document.createElement("img");
    thumbnail.crossOrigin = "anonymous";
    thumbnail.height      = this.context.canvas.height;
    thumbnail.width       = this.context.canvas.width;
    thumbnail.src         = this.context.canvas.toDataURL(Framer.settings.contentType);

    $(Framer.select).append(thumbnail);

    $(thumbnail).click(Framer.selectThumbnail);            

    if($(Framer.select).children("img").length >= 3) {
      $(Framer.select).children("img").fadeIn('fast');
      $(Framer.loading).fadeOut('fast', function() {
        Framer.selectThumbnail({}, $(Framer.select).children("img")[0]);
      });        
    }      
  },  

  saveToForm: function(img) {
    Framer.framedBase64.value = img.src;
    Framer.framedType.value   = Framer.settings.contentType;
    Framer.framedType.value   = Framer.settings.defaultFilename;
  },

  selectThumbnail: function(event, target) {
    var selected = target;
    if(typeof selected === "undefined") {
      selected = this;
    }
    var hero         = document.createElement("img");
    hero.height      = 680;
    hero.width       = 740;
    hero.src         = selected.src;
    $(Framer.main).fadeOut('fast', function() {
      $(Framer.main).html(hero);
      $(Framer.main).fadeIn('fast');
    });
    $(Framer.select).find("img").each(function() {
      $(this).removeClass('selected');
    });
    $(selected).addClass("selected");
    Framer.saveToForm(selected);
  },

};