# README

#### purpose
****
beatcove is a collaborative music recording web-app. Unlike many others on the web, it utilizes the experimental HTML5 Web Audio API, and as such is completely flash free. Users can create song projects, invite collaborators, and record tracks to a song which can be played synchronously or discretely.

#### overview
****
This is the second project for [General Assembly's Web Development Immersive](https://generalassemb.ly/education/web-development-immersive), week 8 of a 12 week programming intensive that takes people with no programming experience and turns them into full-stack web developers. This is the first group project.

#### technology
****
* ruby 2.0.0 & rails 4.0.0
* HTML5 Web Audio API
* WebRTC
* AWS:S3
* AWS Javascript SDK
* [Matt Diamond's Recorder](https://github.com/mattdiamond/Recorderjs)
* Underscore.js
* jQuery UI

Note: WebRTC is not supported in Safari. Web Audio API is not supported by IE. 

#### working with S3
****
originally we were going to abstract our interactions with aws through a gem carrierwave_direct; unfortunately, due to the restrictions with programmatically passing files to a form in html, we had to implement another solution. the aws javascript sdk suited our need perfectly, and, rather than abstract those uploads, allowed us to interact directly with s3. figuring out how to format our post with a wav audio blob and deciding upon a stable naming convention were some important learns from this aspect of the program. setting up the controller actions to persist our tracks entries upon successful upload to s3 with the file paths of our tracks was another challenging task. the last challenge we faced with s3 was setting permissions of the track in the post parameters.

#### WebRTC
****
We use WebRTC during our recording —- this is what calls "navigator.getUserMedia" which captures (in our case) a LIVE audio stream within html5 and encodes it to wav.

navigator.getUserMedia is an method of WebRTC that gives us access to a user's microphone. Our recording feature takes the data, encapsulates it as a blob, encodes it to wav, and then we send the file to aws.

#### web audio api
****
this API facillitates buffering audio sources, playback of those buffers, and a number of other audio manipulations as well.  

#### the team
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