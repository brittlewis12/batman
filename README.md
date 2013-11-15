# README

#### purpose
****
beatcove is a collaborative music recording web-app. Unlike others, it utilizes experimental HTML5 web audio and is completely flash free. Users can create song projects, invite collaborators, and record tracks to a song which can be played synchronously or discretely.

#### overview
****
This is our second project for General Assembly's Web Development Immersive. It is the first group project. 

#### technology
****
* ruby 2.0.0
* HTML5 Web Audio API
* WebRTC
* AWS:S3
* AWS Javascript SDK
* [Matt Diamond's Recorder](https://github.com/mattdiamond/Recorderjs)
* jQuery UI

Note, WebRTC is not supported in Safari. Web Audio API is not supported by IE. 

#### working with S3
****
s3 sdk suggests use of form, but we wanted to send without a form. sending audio blobs and how naming conventions work. setting up automatic routes and creation of file paths with our tracks.

getting public access to tracks from s3

#### WebRTC
****
We use WebRTC during our recording—this is what calls "getUserMedia" which captures (in our case) audio LIVE within html5.

navigator.getUserMedia is an api that gives us access to a user's microphone. Our recording feature takes the data as a blob and that's what we will send, encoded as a wav file, to AWS.

#### web audio api
****

this API helps facillitate buffering, playback, and a variety of other audio manipulations.  

#### contact
****

**britt lewis**

* brittlewis12@gmail.com
* <http://github.com/brittlewis12>

**mihran abrahamian**

* abrahamian.mihran@gmail.com
* <http://github.com/abrahamian>

**tea ho**

* hello.teaho@gmail.com
* <http://github.com/teabait>