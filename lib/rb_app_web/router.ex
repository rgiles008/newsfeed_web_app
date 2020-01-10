defmodule RbAppWeb.Router do
  use RbAppWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]

  end

  scope "/", RbAppWeb do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
    resources "/about", AboutController
    resources "/feed", FeedController, only: [:index, :show]
  end

  # Other scopes may use custom stacks.
  scope "/api", RbAppWeb do
    pipe_through :api

  end
end
