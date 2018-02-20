# Tasktracker

To start your Phoenix server:

  * Install dependencies with `mix deps.get`
  * Create and migrate your database with `mix ecto.create && mix ecto.migrate`
  * Install Node.js dependencies with `cd assets && npm install`
  * Start Phoenix endpoint with `mix phx.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

Ready to run in production? Please [check our deployment guides](http://www.phoenixframework.org/docs/deployment).

## Learn more

  * Official website: http://www.phoenixframework.org/
  * Guides: http://phoenixframework.org/docs/overview
  * Docs: https://hexdocs.pm/phoenix
  * Mailing list: http://groups.google.com/group/phoenix-talk
  * Source: https://github.com/phoenixframework/phoenix


Application Design.

The application has the following functionalities
1. User Login/Register (Log in with email id)
2. The user can assign tasks to itself or other users by entering the USER_ID of the user.
3. The user can change the status, i.e, time taken, completion status, etc.
4. By default, when a new task is created, the time is initialized to 0 assuming that that task is incomplete.
5. When the time is 0, it is not displayed. But as soon as the user increments the time, it is displayed.
6. The status is displayed as either completed or incomplete.
7. Each task has an associated button to change the status. The user can change it either ways, that is, complete to incomplete and vice-versa.
8. The time is incremented in intervals of 15.
9. When a user logs in, his task feed is displayed with an option to enter a new task. To support user friendliness, a new task form is displeyed instead of a button.
10. Once a user logs in, his login status is displayed on the top right corner of the page with the user name.
 
