defmodule Threestars.AccountsTest do
  use Threestars.DataCase

  alias Threestars.Accounts

  describe "positions" do
    alias Threestars.Accounts.Position

    @valid_attrs %{name: "some name"}
    @update_attrs %{name: "some updated name"}
    @invalid_attrs %{name: nil}

    def position_fixture(attrs \\ %{}) do
      {:ok, position} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Accounts.create_position()

      position
    end

    test "list_positions/0 returns all positions" do
      position = position_fixture()
      assert Accounts.list_positions() == [position]
    end

    test "get_position!/1 returns the position with given id" do
      position = position_fixture()
      assert Accounts.get_position!(position.id) == position
    end

    test "create_position/1 with valid data creates a position" do
      assert {:ok, %Position{} = position} = Accounts.create_position(@valid_attrs)
      assert position.name == "some name"
    end

    test "create_position/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Accounts.create_position(@invalid_attrs)
    end

    test "update_position/2 with valid data updates the position" do
      position = position_fixture()
      assert {:ok, position} = Accounts.update_position(position, @update_attrs)
      assert %Position{} = position
      assert position.name == "some updated name"
    end

    test "update_position/2 with invalid data returns error changeset" do
      position = position_fixture()
      assert {:error, %Ecto.Changeset{}} = Accounts.update_position(position, @invalid_attrs)
      assert position == Accounts.get_position!(position.id)
    end

    test "delete_position/1 deletes the position" do
      position = position_fixture()
      assert {:ok, %Position{}} = Accounts.delete_position(position)
      assert_raise Ecto.NoResultsError, fn -> Accounts.get_position!(position.id) end
    end

    test "change_position/1 returns a position changeset" do
      position = position_fixture()
      assert %Ecto.Changeset{} = Accounts.change_position(position)
    end
  end

  describe "employees" do
    alias Threestars.Accounts.Employee

    @valid_attrs %{email: "some email", name: "some name", phone: "some phone"}
    @update_attrs %{email: "some updated email", name: "some updated name", phone: "some updated phone"}
    @invalid_attrs %{email: nil, name: nil, phone: nil}

    def employee_fixture(attrs \\ %{}) do
      {:ok, employee} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Accounts.create_employee()

      employee
    end

    test "list_employees/0 returns all employees" do
      employee = employee_fixture()
      assert Accounts.list_employees() == [employee]
    end

    test "get_employee!/1 returns the employee with given id" do
      employee = employee_fixture()
      assert Accounts.get_employee!(employee.id) == employee
    end

    test "create_employee/1 with valid data creates a employee" do
      assert {:ok, %Employee{} = employee} = Accounts.create_employee(@valid_attrs)
      assert employee.email == "some email"
      assert employee.name == "some name"
      assert employee.phone == "some phone"
    end

    test "create_employee/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Accounts.create_employee(@invalid_attrs)
    end

    test "update_employee/2 with valid data updates the employee" do
      employee = employee_fixture()
      assert {:ok, employee} = Accounts.update_employee(employee, @update_attrs)
      assert %Employee{} = employee
      assert employee.email == "some updated email"
      assert employee.name == "some updated name"
      assert employee.phone == "some updated phone"
    end

    test "update_employee/2 with invalid data returns error changeset" do
      employee = employee_fixture()
      assert {:error, %Ecto.Changeset{}} = Accounts.update_employee(employee, @invalid_attrs)
      assert employee == Accounts.get_employee!(employee.id)
    end

    test "delete_employee/1 deletes the employee" do
      employee = employee_fixture()
      assert {:ok, %Employee{}} = Accounts.delete_employee(employee)
      assert_raise Ecto.NoResultsError, fn -> Accounts.get_employee!(employee.id) end
    end

    test "change_employee/1 returns a employee changeset" do
      employee = employee_fixture()
      assert %Ecto.Changeset{} = Accounts.change_employee(employee)
    end
  end

  describe "users" do
    alias Threestars.Accounts.User

    @valid_attrs %{name: "some name", password_hash: "some password_hash"}
    @update_attrs %{name: "some updated name", password_hash: "some updated password_hash"}
    @invalid_attrs %{name: nil, password_hash: nil}

    def user_fixture(attrs \\ %{}) do
      {:ok, user} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Accounts.create_user()

      user
    end

    test "list_users/0 returns all users" do
      user = user_fixture()
      assert Accounts.list_users() == [user]
    end

    test "get_user!/1 returns the user with given id" do
      user = user_fixture()
      assert Accounts.get_user!(user.id) == user
    end

    test "create_user/1 with valid data creates a user" do
      assert {:ok, %User{} = user} = Accounts.create_user(@valid_attrs)
      assert user.name == "some name"
      assert user.password_hash == "some password_hash"
    end

    test "create_user/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Accounts.create_user(@invalid_attrs)
    end

    test "update_user/2 with valid data updates the user" do
      user = user_fixture()
      assert {:ok, user} = Accounts.update_user(user, @update_attrs)
      assert %User{} = user
      assert user.name == "some updated name"
      assert user.password_hash == "some updated password_hash"
    end

    test "update_user/2 with invalid data returns error changeset" do
      user = user_fixture()
      assert {:error, %Ecto.Changeset{}} = Accounts.update_user(user, @invalid_attrs)
      assert user == Accounts.get_user!(user.id)
    end

    test "delete_user/1 deletes the user" do
      user = user_fixture()
      assert {:ok, %User{}} = Accounts.delete_user(user)
      assert_raise Ecto.NoResultsError, fn -> Accounts.get_user!(user.id) end
    end

    test "change_user/1 returns a user changeset" do
      user = user_fixture()
      assert %Ecto.Changeset{} = Accounts.change_user(user)
    end
  end

  describe "employees" do
    alias Threestars.Accounts.Employees

    @valid_attrs %{email: "some email", name: "some name", phone: "some phone"}
    @update_attrs %{email: "some updated email", name: "some updated name", phone: "some updated phone"}
    @invalid_attrs %{email: nil, name: nil, phone: nil}

    def employees_fixture(attrs \\ %{}) do
      {:ok, employees} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Accounts.create_employees()

      employees
    end

    test "list_employees/0 returns all employees" do
      employees = employees_fixture()
      assert Accounts.list_employees() == [employees]
    end

    test "get_employees!/1 returns the employees with given id" do
      employees = employees_fixture()
      assert Accounts.get_employees!(employees.id) == employees
    end

    test "create_employees/1 with valid data creates a employees" do
      assert {:ok, %Employees{} = employees} = Accounts.create_employees(@valid_attrs)
      assert employees.email == "some email"
      assert employees.name == "some name"
      assert employees.phone == "some phone"
    end

    test "create_employees/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Accounts.create_employees(@invalid_attrs)
    end

    test "update_employees/2 with valid data updates the employees" do
      employees = employees_fixture()
      assert {:ok, employees} = Accounts.update_employees(employees, @update_attrs)
      assert %Employees{} = employees
      assert employees.email == "some updated email"
      assert employees.name == "some updated name"
      assert employees.phone == "some updated phone"
    end

    test "update_employees/2 with invalid data returns error changeset" do
      employees = employees_fixture()
      assert {:error, %Ecto.Changeset{}} = Accounts.update_employees(employees, @invalid_attrs)
      assert employees == Accounts.get_employees!(employees.id)
    end

    test "delete_employees/1 deletes the employees" do
      employees = employees_fixture()
      assert {:ok, %Employees{}} = Accounts.delete_employees(employees)
      assert_raise Ecto.NoResultsError, fn -> Accounts.get_employees!(employees.id) end
    end

    test "change_employees/1 returns a employees changeset" do
      employees = employees_fixture()
      assert %Ecto.Changeset{} = Accounts.change_employees(employees)
    end
  end
end
