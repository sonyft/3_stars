defmodule ThreestarsWeb.PageController do
  use ThreestarsWeb, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
