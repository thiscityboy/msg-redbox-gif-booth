var Analytics = {
  init: function() {
    (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
    (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
    m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
    })(window,document,'script','//www.google-analytics.com/analytics.js','ga');

    ga('create', 'UA-52759511-11', 'auto');
    ga('send', 'pageview');

    Analytics.bindUI();
  },

  bindUI: function() {
    $("#btn-send-to-phone").click(function() {
      ga('send', 'event', 'Send to Phone', 'Send to phone Button', 'Click');
    });
  },
};