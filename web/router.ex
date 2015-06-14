defmodule FranAppBackend.Router do
  use FranAppBackend.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
  end

  pipeline :api do
    plug :accepts, ["json"]
    plug PlugCors, [origins: ["*"]]
  end

  scope "/", FranAppBackend do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
  end

  # API scope
  scope "/api", FranAppBackend do
    pipe_through :api

    resources "/attendances", AttendanceController
    options "/attendances*anything", AttendanceController, :options

    resources "/moments", MomentController
    options "/moments*anything", MomentController, :options
  end
end
