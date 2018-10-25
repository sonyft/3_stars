defmodule ThreestarsWeb.Router do
  use ThreestarsWeb, :router

  pipeline :browser do
    plug(:accepts, ["html"])
    plug(:fetch_session)
    plug(:fetch_flash)
    plug(:protect_from_forgery)
    plug(:put_secure_browser_headers)
  end

  pipeline :api do
    plug(:accepts, ["json"])
  end

  pipeline :login_required do
    plug(
      Guardian.Plug.EnsureAuthenticated,
      handler: Threestars.GuardianErrorHandler
    )
  end

  pipeline :admin_required do
    plug(Threestars.CheckAdmin)
  end

  pipeline :with_session do
    plug(Guardian.Plug.VerifySession)
    plug(Guardian.Plug.LoadResource)
    plug(Threestars.CurrentUser)
  end

  scope "/", ThreestarsWeb do
    pipe_through([:browser, :with_session])

    get("/", PageController, :index)
    resources("/currencies", CurrenciesController)
    resources("/rate", RateController)
    resources("/users", UserController)
    resources "/employees", EmployeesController

    scope "/" do
      pipe_through([:login_required])
    end
  end

  # Plug function
  defp ensure_authenticated(conn, _opts) do
    current_user_id = get_session(conn, :current_user_id)

    if current_user_id do
      conn
    else
      conn
      |> put_flash(:info, "Моля впишете се!")
      |> redirect(to: "/")
    end
  end

  # Other scopes may use custom stacks.
  # scope "/api", ThreestarsWeb do
  #   pipe_through :api
  # end
end
