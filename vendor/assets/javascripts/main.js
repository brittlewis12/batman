window.AudioContext = window.AudioContext || window.webkitAudioContext;

var audioContext = new AudioContext();
var audioInput = null,
    realAudioInput = null,
    inputPoint = null,
    audioRecorder = null;
var rafID = null;

function saveAudio() {
    audioRecorder.exportWAV( doneEncoding );
}

// function playAudio() {
//     audioRecorder.exportWAV( doneRecording );
// }

// function doneRecording ( blob ) {
//     Recorder.createBlobObject( blob );
//     var track = $("audio");
//     //track.src.start(); //some stuff that plays the unsaved audio blob in an audio tag
// }

function doneEncoding( blob ) {
    var songName = $(".song-name").html();
    var numTracks = $(".song-name").attr("data-tracks");
    if ((numTracks + 1) < 10) {
        var trackNum = "0" + (Number(numTracks) + 1);
    } else {
        trackNum = (Number(numTracks) + 1);
    };
    var username = $(".song-name").attr("data-user");
    var songId = $(".song-name").attr("data-song-id");
    Recorder.passToUploader(blob, (songName + "/" + trackNum + username + ".wav"), songId);
}

function toggleRecording( e ) {
    if (e.classList.contains("recording")) {
        // stop recording
        audioRecorder.stop();
        saveAudio();
        console.log("SAVE WORKS");
        e.classList.remove("recording");
    } else {
        // start recording
        if (!audioRecorder)
            return;
        e.classList.add("recording");
        audioRecorder.clear();
        audioRecorder.record();
        $('')
    }
}

function gotStream( stream ) {
    inputPoint = audioContext.createGain();

    // Create an AudioNode from the stream.
    realAudioInput = audioContext.createMediaStreamSource(stream);
    audioInput = realAudioInput;
    audioInput.connect(inputPoint);

    audioRecorder = new Recorder( inputPoint );

    zeroGain = audioContext.createGain();
    zeroGain.gain.value = 0.0;
    inputPoint.connect( zeroGain );
    zeroGain.connect( audioContext.destination );
}

function initAudio() {
        if (!navigator.getUserMedia)
            navigator.getUserMedia = navigator.webkitGetUserMedia || navigator.mozGetUserMedia;
        if (!navigator.cancelAnimationFrame)
            navigator.cancelAnimationFrame = navigator.webkitCancelAnimationFrame || navigator.mozCancelAnimationFrame;
        if (!navigator.requestAnimationFrame)
            navigator.requestAnimationFrame = navigator.webkitRequestAnimationFrame || navigator.mozRequestAnimationFrame;

    navigator.getUserMedia({audio:true}, gotStream, function(e) {
            alert('Error getting audio');
        });
}

window.addEventListener( 'load', initAudio );
