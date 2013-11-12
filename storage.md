Handling AWS S3
====

##Upload Strategies

* Background uploading to S3 using the [carrierwave_direct gem](https://github.com/dwilkie/carrierwave_direct) (an add-on to the [carrierwave gem](https://github.com/carrierwaveuploader/carrierwave), a more general file upload solution)
  This is the easiest implementation by far. However, there are limitations (that will be exacerbated by our app, as it is music based) -- namely, as a server-side implementation, this can quickly lead to timeout & bandwidth issues, as noted by Heroku in their documentation on [using S3 with Heroku](https://devcenter.heroku.com/articles/s3): 
  > "Large files uploads in single-threaded, non-evented environments (such as Rails) block your application's web dynos and can cause request timeouts and H11, H12 errors. EventMachine, Node.js and JVM-based languages are less susceptible to such issues. Please be aware of this constraint and choose the right approach for your language or framework."

* Amazon's [JavaScript in the browser API](http://aws.amazon.com/sdkforbrowser/)
  This is great because it uses Amazon's own API, so it is very likely to work as described and be relatively up to date. A big downside of this option, though, is that for verification purposes, Amazon requires each user to be authenticated completely separately from our authentication, using what they call their IAM service, allowing for interaction with their servers. They only accept Facebook, Google, or their own Amazon account authentication.

* generate pre-signed POSTs on the fly with Amazon's [Ruby SDK](http://docs.aws.amazon.com/AWSRubySDK/latest/AWS/S3/PresignedPost.html)
  This strategy benefits us in that it is seemingly the easiest for the user. No Amazon or Facebook or Google account required. However, it puts the onus on the server again. Perhaps through ajax we can pass a presigned post to the client during the upload process?

##Bucket Management Strategies

* **1 Bucket for all of beatcove. Folders for each user, with folders for each song project.**
  The biggest downside I can forsee to this strategy is having deeping nested folders will be confusing to manage, and having little separation between different users and their projects leaves large error possibilities.

* **1 Bucket for each user. Folder for each song project.**
  A downside to this strategy is that each bucket MUST have a unique name by AWS standards. This could be problematic in that if a particular username conflicted with an existing bucket on ANY S3 account, it would fail. Unless we create an incredibly unique and semantic naming convention for the buckets, like beatcove_username_datejoined or something.

* **1 Bucket for all of beatcove. Folders just for song projects.**
  This strategy has the benefit of allowing for easy transfer of ownership of projects (ie, if a project creator wants to make someone else the admin without deleting the existing work). This isn't currently a user story we're targeting for our deadline, but might be a useful feature that isn't too difficult to implement. The downside to this strategy is that we would have to make all song project names unique or create a semantic naming convention for each project folder on S3; similar to the issues with the above strategy.

##Misc thoughts that occurred to me while drafting this file

* User experience while we upload these potentially very large files is key. Should we display a "processing.." animation, perhaps a music instrument/analog recording tool like Mihran's idea for an analog theme for the site?
