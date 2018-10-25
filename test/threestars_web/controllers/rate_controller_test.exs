defmodule ThreestarsWeb.RateControllerTest do
  use ThreestarsWeb.ConnCase

  alias Threestars.Currency

  @create_attrs %{rate: 120.5}
  @update_attrs %{rate: 456.7}
  @invalid_attrs %{rate: nil}

  def fixture(:rate) do
    {:ok, rate} = Currency.create_rate(@create_attrs)
    rate
  end

  describe "index" do
    test "lists all rate", %{conn: conn} do
      conn = get conn, rate_path(conn, :index)
      assert html_response(conn, 200) =~ "Listing Rate"
    end
  end

  describe "new rate" do
    test "renders form", %{conn: conn} do
      conn = get conn, rate_path(conn, :new)
      assert html_response(conn, 200) =~ "New Rate"
    end
  end

  describe "create rate" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post conn, rate_path(conn, :create), rate: @create_attrs

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == rate_path(conn, :show, id)

      conn = get conn, rate_path(conn, :show, id)
      assert html_response(conn, 200) =~ "Show Rate"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post conn, rate_path(conn, :create), rate: @invalid_attrs
      assert html_response(conn, 200) =~ "New Rate"
    end
  end

  describe "edit rate" do
    setup [:create_rate]

    test "renders form for editing chosen rate", %{conn: conn, rate: rate} do
      conn = get conn, rate_path(conn, :edit, rate)
      assert html_response(conn, 200) =~ "Edit Rate"
    end
  end

  describe "update rate" do
    setup [:create_rate]

    test "redirects when data is valid", %{conn: conn, rate: rate} do
      conn = put conn, rate_path(conn, :update, rate), rate: @update_attrs
      assert redirected_to(conn) == rate_path(conn, :show, rate)

      conn = get conn, rate_path(conn, :show, rate)
      assert html_response(conn, 200)
    end

    test "renders errors when data is invalid", %{conn: conn, rate: rate} do
      conn = put conn, rate_path(conn, :update, rate), rate: @invalid_attrs
      assert html_response(conn, 200) =~ "Edit Rate"
    end
  end

  describe "delete rate" do
    setup [:create_rate]

    test "deletes chosen rate", %{conn: conn, rate: rate} do
      conn = delete conn, rate_path(conn, :delete, rate)
      assert redirected_to(conn) == rate_path(conn, :index)
      assert_error_sent 404, fn ->
        get conn, rate_path(conn, :show, rate)
      end
    end
  end

  defp create_rate(_) do
    rate = fixture(:rate)
    {:ok, rate: rate}
  end
end
