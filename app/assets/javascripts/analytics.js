var Analytics = {
  init: function(stopName) {
    (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
    (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
    m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
    })(window,document,'script','//www.google-analytics.com/analytics.js','ga');

    Analytics.stopName = stopName;

    ga('create', 'UA-52759511-11', 'auto');
    ga('set', 'dimension1', Analytics.stopName);
    ga('send', 'pageview');

    Analytics.bindUI();
  },

  bindUI: function() {
    $("#btn-send-to-phone").click(function() {
      ga('send', 'event', 'Send to Phone', 'Send to phone Button', Analytics.stopName);
    });
  },
};