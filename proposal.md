PROPOSAL
====

##description
====
The project is a browser based song collaboration tool. Users can sign up and record tracks within the browser and add them to a song project. 

##roles
====
*	**Project Manager:** Britt
*	**Quality Assurance:** Mihran 
*	**Front End Lead:** Tea
*	**Mascot:** Remy the Dog

##user stories
====
As a user....I want to sign up to beatcove so I have my own personal account.

As a user....I want to log in with a password so that I alone can build on my work and use the app under my own account.

As a user....I want to log out so that I can access my music on a public machine and others can't upload lame tracks under my name.

As a user....I want to create a song project so that I can build a song with collaborators.

As a user....I want to be able to add collaborators to my project. 

As a user....I want to be able to see all of the projects I'm working on if I got to my userpage so I don't neglect any projects.

As a user....I want to be able to see all collaborators so I can keep track of who I'm working with.

As a user....I want to record tracks within a song project using the app so that I can contribute to a project.

As a user....I want unique responsibilities and capabilities if I created a song project so that I can delete tracks and invite collaborators. 

As a user....I want to playback a specific track so I can listen to its quality.

As a user....I want to playback all tracks simultaneously so I can listen to how they sound together.

As a user....I want to select specific tracks for playback simultaneously so I can hear multiple parts (but not necessarily all parts) together.

As a user....I want to be able to record along with a track I'm currently listening to.

As a user....I want to be able to share a link to our song project (with limitations) via a social media site.

As a user....I want to see how many times a project has been viewed.

##technology
====

###audio

* **html5 web audio api** (basic playback)
  * [Web Audio API spec](https://dvcs.w3.org/hg/audio/raw-file/tip/webaudio/specification.html)
  * [html5rocks webaudio intro tutorial](http://www.html5rocks.com/en/tutorials/webaudio/intro/)

* **sound manager 2** (js lib -- advanced playback)
  * [SoundManager 2](http://www.schillmania.com/projects/soundmanager2/)

* soundcloud api (sharing final product / tracks)
  * [SoundCloud API](http://developers.soundcloud.com/docs/api/guide)

* sound.js (js lib -- abstracts web audio api, may be useful if the default interface proves to be unweildy)
  * [SoundJS](http://www.createjs.com/#!/SoundJS)

* recorder.js (js lib -- returns raw wav file with customization options for file specs)
  * [Recorderjs](https://github.com/mattdiamond/Recorderjs)

###administrative

* omniauth (ruby gem -- facebook login)
  * [omniauth on github](https://github.com/intridea/omniauth)

* figaro (ruby gem -- api key management)
  * [figaro on github](https://github.com/laserlemon/figaro)

###dev env

* **pry-rails / better_errors** (ruby gems -- debugging)

###infrastructure

* **heroku** (server hosting)
  * [heroku dev center](https://devcenter.heroku.com/)

* aws s3 (storing static assets, ie tracks & songs)
  * [s3 documentation](http://docs.aws.amazon.com/AmazonS3/latest/dev/Welcome.html)
  * [integrating heroku & s3](https://devcenter.heroku.com/articles/s3)
