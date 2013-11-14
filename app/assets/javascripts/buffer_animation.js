window.onload = function() {
};

  window.showBuffering = function() {
    bar.progressbar({value: false});
    lbl.text("Buffering!");
  }

  function removeBuffer(){
    lbl.text("");
  }

  function songProgress(){
    var val = bar.progressbar("value");
    bar.progressbar("value", val + 1);

    // $("#third-example button").text(Math.round(9-(val/100)*9) + " seconds");

    if (val < 99){
      setTimeout( songProgress, (1000/9) );
    }
  }
