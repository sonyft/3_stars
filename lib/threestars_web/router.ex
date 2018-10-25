defmodule ThreestarsWeb.Router do
  use ThreestarsWeb, :router

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

  scope "/", ThreestarsWeb do
    pipe_through :browser # Use the default browser stack

    resources "/users", UserController
    get "/", PageController, :index
    resources "/currencies", CurrenciesController
    resources "/rate", RateController

  end

  # Other scopes may use custom stacks.
  # scope "/api", ThreestarsWeb do
  #   pipe_through :api
  # end
end
