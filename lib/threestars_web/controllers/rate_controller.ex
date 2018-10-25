defmodule ThreestarsWeb.RateController do
  use ThreestarsWeb, :controller

  alias Threestars.Currency
  alias Threestars.Currency.Rate

  def index(conn, _params) do
    rate = Currency.list_rate()
    render(conn, "index.html", rate: rate)
  end

  def new(conn, _params) do
    changeset = Currency.change_rate(%Rate{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"rate" => rate_params}) do
    case Currency.create_rate(rate_params) do
      {:ok, rate} ->
        conn
        |> put_flash(:info, "Rate created successfully.")
        |> redirect(to: rate_path(conn, :show, rate))
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    rate = Currency.get_rate!(id)
    render(conn, "show.html", rate: rate)
  end

  def edit(conn, %{"id" => id}) do
    rate = Currency.get_rate!(id)
    changeset = Currency.change_rate(rate)
    render(conn, "edit.html", rate: rate, changeset: changeset)
  end

  def update(conn, %{"id" => id, "rate" => rate_params}) do
    rate = Currency.get_rate!(id)

    case Currency.update_rate(rate, rate_params) do
      {:ok, rate} ->
        conn
        |> put_flash(:info, "Rate updated successfully.")
        |> redirect(to: rate_path(conn, :show, rate))
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", rate: rate, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    rate = Currency.get_rate!(id)
    {:ok, _rate} = Currency.delete_rate(rate)

    conn
    |> put_flash(:info, "Rate deleted successfully.")
    |> redirect(to: rate_path(conn, :index))
  end
end
