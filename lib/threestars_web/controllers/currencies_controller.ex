defmodule ThreestarsWeb.CurrenciesController do
  use ThreestarsWeb, :controller

  alias Threestars.Currency
  alias Threestars.Currency.Currencies

  def index(conn, _params) do
    currencies = Currency.list_currencies()
    render(conn, "index.html", currencies: currencies)
  end

  def new(conn, _params) do
    changeset = Currency.change_currencies(%Currencies{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"currencies" => currencies_params}) do
    case Currency.create_currencies(currencies_params) do
      {:ok, currencies} ->
        conn
        |> put_flash(:info, "Currencies created successfully.")
        |> redirect(to: currencies_path(conn, :show, currencies))
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    currencies = Currency.get_currencies!(id)
    render(conn, "show.html", currencies: currencies)
  end

  def edit(conn, %{"id" => id}) do
    currencies = Currency.get_currencies!(id)
    changeset = Currency.change_currencies(currencies)
    render(conn, "edit.html", currencies: currencies, changeset: changeset)
  end

  def update(conn, %{"id" => id, "currencies" => currencies_params}) do
    currencies = Currency.get_currencies!(id)

    case Currency.update_currencies(currencies, currencies_params) do
      {:ok, currencies} ->
        conn
        |> put_flash(:info, "Currencies updated successfully.")
        |> redirect(to: currencies_path(conn, :show, currencies))
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", currencies: currencies, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    currencies = Currency.get_currencies!(id)
    {:ok, _currencies} = Currency.delete_currencies(currencies)

    conn
    |> put_flash(:info, "Currencies deleted successfully.")
    |> redirect(to: currencies_path(conn, :index))
  end
end
