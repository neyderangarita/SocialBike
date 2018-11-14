class PagesController < ApplicationController

  skip_before_action :authorize_request, only: [:main, :index]
  def main
    rutas = [
      {
        "Prefix": "root",
        "Verb": "GET",
        "URL": "/",
        "Controller": "pages",
        "Action": "main"
      },
      {
        "Prefix": "profiels",
        "Verb": "GET",
        "URL": "/profiels",
        "Controller": "profiels",
        "Action": "index"
      },
      {
        "Prefix": "profiels",
        "Verb": "POST",
        "URL": "/profiels",
        "Controller": "profiels",
        "Action": "create"
      },
      {
        "Prefix": "routes",
        "Verb": "GET",
        "URL": "/routes",
        "Controller": "routes",
        "Action": "index"
      },
      {
        "Prefix": "routes",
        "Verb": "POST",
        "URL": "/routes",
        "Controller": "routes",
        "Action": "create"
      },
      {
        "Prefix": "event_comments",
        "Verb": "GET",
        "URL": "/events/:event_id/comments",
        "Controller": "comments",
        "Action": "index"
      },
      {
        "Prefix": "event_comments",
        "Verb": "POST",
        "URL": "/events/:event_id/comments",
        "Controller": "comments",
        "Action": "create"
      },
      {
        "Prefix": "event",
        "Verb": "GET",
        "URL": "/events/:id",
        "Controller": "events",
        "Action": "show"
      },
      {
        "Prefix": "event",
        "Verb": "GET",
        "URL": "/events/:id",
        "Controller": "events",
        "Action": "show"
      },
      {
        "Prefix": "event",
        "Verb": "POST",
        "URL": "/events/:idEvent/assists/:id",
        "Controller": "users",
        "Action": "assist"
      },
      {
        "Prefix": "event",
        "Verb": "DELETE",
        "URL": "/events/:idEvent/assists/:id",
        "Controller": "users",
        "Action": "cancel_assist"
      },
      {
        "Prefix": "event",
        "Verb": "GET",
        "URL": "/events/assists/:id",
        "Controller": "users",
        "Action": "show_assist"
      },
      {
        "Prefix": "auth_login",
        "Verb": "POST",
        "URL": "/auth/login",
        "Controller": "authentication",
        "Action": "authenticate"
      },
      {
        "Prefix": "signup",
        "Verb": "POST",
        "URL": "/signup",
        "Controller": "users",
        "Action": "create"
      }
    ]
    render json: rutas, status: :ok
  end
end
