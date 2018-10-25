defmodule ThreestarsWeb.CurrenciesControllerTest do
  use ThreestarsWeb.ConnCase

  alias Threestars.Currency

  @create_attrs %{code_digit: 42, code_symb: "some code_symb", name: "some name"}
  @update_attrs %{code_digit: 43, code_symb: "some updated code_symb", name: "some updated name"}
  @invalid_attrs %{code_digit: nil, code_symb: nil, name: nil}

  def fixture(:currencies) do
    {:ok, currencies} = Currency.create_currencies(@create_attrs)
    currencies
  end

  describe "index" do
    test "lists all currencies", %{conn: conn} do
      conn = get conn, currencies_path(conn, :index)
      assert html_response(conn, 200) =~ "Listing Currencies"
    end
  end

  describe "new currencies" do
    test "renders form", %{conn: conn} do
      conn = get conn, currencies_path(conn, :new)
      assert html_response(conn, 200) =~ "New Currencies"
    end
  end

  describe "create currencies" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post conn, currencies_path(conn, :create), currencies: @create_attrs

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == currencies_path(conn, :show, id)

      conn = get conn, currencies_path(conn, :show, id)
      assert html_response(conn, 200) =~ "Show Currencies"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post conn, currencies_path(conn, :create), currencies: @invalid_attrs
      assert html_response(conn, 200) =~ "New Currencies"
    end
  end

  describe "edit currencies" do
    setup [:create_currencies]

    test "renders form for editing chosen currencies", %{conn: conn, currencies: currencies} do
      conn = get conn, currencies_path(conn, :edit, currencies)
      assert html_response(conn, 200) =~ "Edit Currencies"
    end
  end

  describe "update currencies" do
    setup [:create_currencies]

    test "redirects when data is valid", %{conn: conn, currencies: currencies} do
      conn = put conn, currencies_path(conn, :update, currencies), currencies: @update_attrs
      assert redirected_to(conn) == currencies_path(conn, :show, currencies)

      conn = get conn, currencies_path(conn, :show, currencies)
      assert html_response(conn, 200) =~ "some updated code_symb"
    end

    test "renders errors when data is invalid", %{conn: conn, currencies: currencies} do
      conn = put conn, currencies_path(conn, :update, currencies), currencies: @invalid_attrs
      assert html_response(conn, 200) =~ "Edit Currencies"
    end
  end

  describe "delete currencies" do
    setup [:create_currencies]

    test "deletes chosen currencies", %{conn: conn, currencies: currencies} do
      conn = delete conn, currencies_path(conn, :delete, currencies)
      assert redirected_to(conn) == currencies_path(conn, :index)
      assert_error_sent 404, fn ->
        get conn, currencies_path(conn, :show, currencies)
      end
    end
  end

  defp create_currencies(_) do
    currencies = fixture(:currencies)
    {:ok, currencies: currencies}
  end
end
