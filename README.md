## Bloccit: a Reddit clone to teach the fundamentals of web development and Rails 4.

Made with my mentor at [Bloc](http://bloc.io).

My app name is called bloccit, used for posting and sharing new and comments with all visitors
My app address is https://raybloccit.herokuapp.com/

Bloccit is based on SQlite DB, right now I'm on the development stage.
Using the rails generator we created two models Post and Comment, Post has_many comments, and Comment belongs_to post.Both models are inheriting from ActiveRecord class
Our two models are linke by the post_id in the Comment model.
Faker Gem was added to test our database with some fake data.
