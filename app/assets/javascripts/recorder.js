/*
Copyright © 2013 Matt Diamond

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
*/

(function(window){
  // this path is specific to beatcove
  var WORKER_PATH = '/assets/recorderWorker.js';

  var Recorder = function(source, cfg) {
    var config = cfg || {};
    var bufferLen = config.bufferLen || 4096;
    this.context = source.context;
    this.node = this.context.createJavaScriptNode(bufferLen, 2, 2);
    
    var worker = new Worker(config.workerPath || WORKER_PATH);
    worker.postMessage({
      command: 'init',
      config: {
        sampleRate: this.context.sampleRate
      }
    });
    var recording = false,
      currCallback;

    this.node.onaudioprocess = function(e) {
      if (!recording) return;
      worker.postMessage({
        command: 'record',
        buffer: [
          e.inputBuffer.getChannelData(0),
          e.inputBuffer.getChannelData(1)
        ]
      });
    }

    this.configure = function(cfg) {
      for (var prop in cfg){
        if (cfg.hasOwnProperty(prop)){
          config[prop] = cfg[prop];
        }
      }
    }

    this.record = function() {
      recording = true;
    }

    this.stop = function() {
      recording = false;
    }

    this.clear = function() {
      worker.postMessage({ command: 'clear' });
    }

    this.getBuffer = function(cb) {
      currCallback = cb || config.callback;
      worker.postMessage({ command: 'getBuffer' })
    }

    this.exportWAV = function(cb, type) {
      currCallback = cb || config.callback;
      type = type || config.type || 'audio/wav';
      if (!currCallback) throw new Error('Callback not set');
      worker.postMessage({
        command: 'exportWAV',
        type: type
      });
    }

    worker.onmessage = function(e) {
      var blob = e.data;
      currCallback(blob);
    }

    source.connect(this.node);
    this.node.connect(this.context.destination);    //this should not be necessary
  };

  // beatcove created function. This takes place of force download. It takes a blob, sets it to our AWS key, and sends to S3.
  Recorder.passToUploader = function(blob, filepath, songId) {
    var blob = blob;
    AWS.config.update({accessKeyId: "AKIAIWQL5BA6V37OGUQQ", secretAccessKey: "***REMOVED***"});
    AWS.config.region = "us-west-2";

    // constructor function creates S3 connection object
    var beatcove = new AWS.S3({ params: {Bucket: 'beatcove'}});
    
    // public-read unauthenticated viewers access to read/download content. 
    // This allows anyone to listen to our wav files without making changes.
    var params = {ACL: "public-read", Key: filepath, ContentType: blob.type, Body: blob};

    // putObject is a method from AWS javascript SDK that puts our object (beatcove) into the S3 bucket.
    beatcove.putObject(params, function(error, data) {
      // response from AMAZON
      if (error) {
        alert("Something went wrong, and we weren't able to save your track. Please try again.");
      } else {
        console.log("about to try to do some ajax trickery!!");
        // persist in DATABASE (not on S3)
        $.ajax({
          url: "/songs/" + songId + "/tracks/",
          type: "POST",
          data: {track: {name: filepath, url:"https://beatcove.s3-us-west-2.amazonaws.com/" + filepath}},
          dataType: "json",
          // response from DATABASE
          error: function() {
            alert("record was so bad, it could not persist in our DB");
          },
          success: function(data){
            console.log(data);
            window.location.replace("/songs/"+ songId);
          }
        });
      } 
    });
  }

  // Matt Diamond Code that is called on save. Forces user to download file. We replaced this with the passToUploader function.
  // Recorder.forceDownload = function(blob, filename){
  //   var url = (window.URL || window.webkitURL).createObjectURL(blob);
  //   var link = window.document.createElement('a');
  //   link.href = url;
  //   link.download = filename || 'output.wav';
  //   var click = document.createEvent("Event");
  //   click.initEvent("click", true, true);
  //   link.dispatchEvent(click);
  // }

  window.Recorder = Recorder;

} )(window);
