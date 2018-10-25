defmodule ThreestarsWeb.EmployeesControllerTest do
  use ThreestarsWeb.ConnCase

  alias Threestars.Accounts

  @create_attrs %{email: "some email", name: "some name", phone: "some phone"}
  @update_attrs %{email: "some updated email", name: "some updated name", phone: "some updated phone"}
  @invalid_attrs %{email: nil, name: nil, phone: nil}

  def fixture(:employees) do
    {:ok, employees} = Accounts.create_employees(@create_attrs)
    employees
  end

  describe "index" do
    test "lists all employees", %{conn: conn} do
      conn = get conn, employees_path(conn, :index)
      assert html_response(conn, 200) =~ "Listing Employees"
    end
  end

  describe "new employees" do
    test "renders form", %{conn: conn} do
      conn = get conn, employees_path(conn, :new)
      assert html_response(conn, 200) =~ "New Employees"
    end
  end

  describe "create employees" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post conn, employees_path(conn, :create), employees: @create_attrs

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == employees_path(conn, :show, id)

      conn = get conn, employees_path(conn, :show, id)
      assert html_response(conn, 200) =~ "Show Employees"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post conn, employees_path(conn, :create), employees: @invalid_attrs
      assert html_response(conn, 200) =~ "New Employees"
    end
  end

  describe "edit employees" do
    setup [:create_employees]

    test "renders form for editing chosen employees", %{conn: conn, employees: employees} do
      conn = get conn, employees_path(conn, :edit, employees)
      assert html_response(conn, 200) =~ "Edit Employees"
    end
  end

  describe "update employees" do
    setup [:create_employees]

    test "redirects when data is valid", %{conn: conn, employees: employees} do
      conn = put conn, employees_path(conn, :update, employees), employees: @update_attrs
      assert redirected_to(conn) == employees_path(conn, :show, employees)

      conn = get conn, employees_path(conn, :show, employees)
      assert html_response(conn, 200) =~ "some updated email"
    end

    test "renders errors when data is invalid", %{conn: conn, employees: employees} do
      conn = put conn, employees_path(conn, :update, employees), employees: @invalid_attrs
      assert html_response(conn, 200) =~ "Edit Employees"
    end
  end

  describe "delete employees" do
    setup [:create_employees]

    test "deletes chosen employees", %{conn: conn, employees: employees} do
      conn = delete conn, employees_path(conn, :delete, employees)
      assert redirected_to(conn) == employees_path(conn, :index)
      assert_error_sent 404, fn ->
        get conn, employees_path(conn, :show, employees)
      end
    end
  end

  defp create_employees(_) do
    employees = fixture(:employees)
    {:ok, employees: employees}
  end
end
