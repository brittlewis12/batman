Mihran Abrahamian
Beatcove Documentation
=========

The first obstacle in working on this team project was to learn how to use GitHub properly. Before the project, I had little idea of how GitHub functions. Britt and Tea, on the other hand, already had a firm grasp on this tool, and did a great job of showing me the correct use of forks and branches. There was consistently good communication regarding pulling, pushing and pull-requesting.

I was in charge of the data architecture for the application. To this end, I first tried to determine the relationships between the entities: users, songs, and tracks. 
These relationships appeared to be rather straightforward at the outset, but gained complexity during the course of development. I learned a couple of new concepts in developing the Rails controllers, ActiveRecord models and database:

* **Nested resources:** *tracks* is a nested resource in *songs*, since any track corresponds to a song. 

* **Controllers** do not necessarily need to correspond directly to a model. In our rails app, there is a *collaborators* controller, which responds to html requests from *songs* and *tracks* views, and serves to persist or remove from the *songs_users* join table, but there is no *Collaborator* class or ActiveRecord model. 

After creating the controllers and models I spent some time making bare-bones views to ensure the controllers would respond to requests as I expected. Though these were files we didn't intend to use, it was a good exercise in that I better understood the data types passed in HTTP methods.

* One new thing I was particularly pleased to learn about, and am excited to implement more extensively in future projects, is the **flash hash**. This useful little datum exists temporarily, much in the way a session exists (but does not exactly *persist*) in Rails. I created a flash hash before a redirect in my Users controller, to pass an temporary error message into a view in case a user tried to delete their account. The little message gave the application a more interactive feel, despite appearing because of an error.

I also got a little practice with JQuery, manipulating DOM objects. I would have liked to spend more time with this, as well as with working on CSS or styling frameworks, and with AJAX. Given more time to work on the project, I think it would take shape as a more AJAX-heavy application with the bulk of actions happening on the song view page, and a minimum of page reloads.