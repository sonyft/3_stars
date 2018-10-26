defmodule ThreestarsWeb.EmployeesController do
  use ThreestarsWeb, :controller

  alias Threestars.Accounts
  alias Threestars.Accounts.Employees

  def index(conn, _params) do
    employees = Accounts.list_employees()
    render(conn, "index.html", employees: employees)
  end

  def new(conn, _params) do
    changeset = Accounts.change_employees(%Employees{})
    positions = Accounts.list_positions
    render(conn, "new.html", positions: positions, changeset: changeset)
  end

  def create(conn, %{"employees" => employees_params}) do
    positions = Accounts.list_positions
    case Accounts.create_employees(employees_params) do
      {:ok, _} ->
        conn
        |> put_flash(:info, "Employees created successfully.")
        |> redirect(to: employees_path(conn, :index))
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", positions: positions, changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    employees = Accounts.get_employees!(id)
    render(conn, "show.html", employees: employees)
  end

  def edit(conn, %{"id" => id}) do
    employees = Accounts.get_employees!(id)
    positions = Accounts.list_positions
    changeset = Accounts.change_employees(employees)
    render(conn, "edit.html", positions: positions, employees: employees, changeset: changeset)
  end

  def update(conn, %{"id" => id, "employees" => employees_params}) do
    employees = Accounts.get_employees!(id)

    case Accounts.update_employees(employees, employees_params) do
      {:ok, employees} ->
        conn
        |> put_flash(:info, "Employees updated successfully.")
        |> redirect(to: employees_path(conn, :show, employees))
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", employees: employees, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    employees = Accounts.get_employees!(id)
    {:ok, _employees} = Accounts.delete_employees(employees)

    conn
    |> put_flash(:info, "Employees deleted successfully.")
    |> redirect(to: employees_path(conn, :index))
  end
end
