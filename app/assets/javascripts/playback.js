var context;
var bufferLoader;

// buffer Loader Class 
function BufferLoader(context, urlList, callback) {
    this.context = context;
    this.urlList = urlList;
    this.onload = callback;
    this.bufferList = new Array();
    this.loadCount = 0;
}

function setPlayGlow(duration) {
    var durationMilliseconds = Number(duration) * 1000;

    $(".play-button").animate({"border-left-color": "#5C246E"}, 500, function(){
        $(".add-button").attr("class", "pause-add-button");

        setTimeout(function(){
            $(".pause-add-button").attr("class", "add-button");
            $(".play-button").animate({"border-left-color": "#260E34"}, 500);
        }, durationMilliseconds);
    });
}

BufferLoader.prototype.loadBuffer = function(url, index) {
    // Load buffer asynchronously
    var request = new XMLHttpRequest();
    request.open("GET", url, true);
    request.responseType = "arraybuffer";

    var loader = this;

    request.onload = function() {
        // Asynchronously decode the audio file data in request.response
        loader.context.decodeAudioData(
            request.response,
            function(buffer) {
                if (!buffer) {
                    alert('error decoding file data: ' + url);
                    return;
                }
                loader.bufferList[index] = buffer;
                if (++loader.loadCount == loader.urlList.length)
                loader.onload(loader.bufferList);
            },
            function(error) {
              console.error('decodeAudioData error', error);
            }
      );
  }

    request.onerror = function() {
        alert('BufferLoader: XHR error');
    }

    request.send();
}

BufferLoader.prototype.load = function() {
    for (var i = 0; i < this.urlList.length; ++i)
        this.loadBuffer(this.urlList[i], i);
}

makeBufferBars = function(){
    $(".progress").attr('class', 'ui-progressbar');
    $(".bar").attr('class', 'progress-label');
    window.bar = $(".ui-progressbar");
          lbl = $(".progress-label");
    bar.progressbar({
        value: 0,
        change: function(event, ui) {
        lbl.text( bar.progressbar("value") + "seconds" );
    },
    complete: function(event, ui) {
    }
  });
    window.showBuffering();
}

turnBackToProgressBars = function(){
    $(".ui-progressbar").attr('class', 'progress');
    $(".progress-label").attr('class', 'bar');
    removeBuffer();
}

function initLoader() {
    makeBufferBars();
    // Fix up prefixing
    window.selectTracks = [];
    window.AudioContext = window.AudioContext || window.webkitAudioContext;
    context = new AudioContext();
    checkWhichTracksToPlay();
    bufferLoader = new BufferLoader(
        context,
        selectTracks,
        finishedLoading
    );
    bufferLoader.load();
}

function finishedLoading(bufferList) {
    var bufferDurations = _.map(bufferList, function(buffer){
        return buffer.duration;
    });
    var longest = Math.max.apply(Math, bufferDurations);
    var longestIndex = bufferDurations.indexOf(longest);
    var longestBuffer = bufferList[longestIndex];
    var songLength = Math.round(longestBuffer.duration);
    setPlayGlow(songLength);

    // Create two sources and play them both together.
    var source = [];
    for (var i = 0; i < bufferList.length; i ++) {
        source[i] = context.createBufferSource();
        source[i].buffer = bufferList[i];
        
        console.log("The duration of " + source[i].buffer + " is " + source[i].buffer.duration); // does this work?
        turnBackToProgressBars();
        
        source[i].connect(context.destination);
        source[i].start(i);
    };
}

// Goes through DOM and sees if checkbox input is checked or not. If checked, it adds track url to bufferList. 
// If track is unchecked, it isn't added to bufferList. If track is unchecked, but is in bufferList from previous play,
// it is taken out of the bufferList.
function checkWhichTracksToPlay() {
    $.each($('input'),function(index, value) {
        var checked = $(value).attr('data-checked');
        var url = $(value).attr('data-url');
        var index = selectTracks.indexOf(url);
        if( checked === "true" ) {
            selectTracks.push(url);
        } else if( checked === "false" && index != -1 ) {
            selectTracks.splice(index, 1);
        }; 
    });
}

$(function() {
    // Event listener on Play Button
    $('#play-button').on('click', function() {
        initLoader();
    });

    // Event listener on checkboxes to determine if user wants to add song to bufferList. Adds data. 
    $('input').on('click', function(){
        if ($(this).attr('data-checked') === "true"){
            $(this).attr('data-checked','false');
        } else {
            $(this).attr('data-checked','true');
        }
    });
})
