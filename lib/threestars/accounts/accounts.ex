defmodule Threestars.Accounts do
  @moduledoc """
  The Accounts context.
  """

  import Ecto.Query, warn: false
  alias Threestars.Repo

  alias Threestars.Accounts.Position

  @doc """
  Returns the list of positions.

  ## Examples

      iex> list_positions()
      [%Position{}, ...]

  """
  def list_positions do
    Repo.all(Position)
  end

  @doc """
  Gets a single position.

  Raises `Ecto.NoResultsError` if the Position does not exist.

  ## Examples

      iex> get_position!(123)
      %Position{}

      iex> get_position!(456)
      ** (Ecto.NoResultsError)

  """
  def get_position!(id), do: Repo.get!(Position, id)

  @doc """
  Creates a position.

  ## Examples

      iex> create_position(%{field: value})
      {:ok, %Position{}}

      iex> create_position(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_position(attrs \\ %{}) do
    %Position{}
    |> Position.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a position.

  ## Examples

      iex> update_position(position, %{field: new_value})
      {:ok, %Position{}}

      iex> update_position(position, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_position(%Position{} = position, attrs) do
    position
    |> Position.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Position.

  ## Examples

      iex> delete_position(position)
      {:ok, %Position{}}

      iex> delete_position(position)
      {:error, %Ecto.Changeset{}}

  """
  def delete_position(%Position{} = position) do
    Repo.delete(position)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking position changes.

  ## Examples

      iex> change_position(position)
      %Ecto.Changeset{source: %Position{}}

  """
  def change_position(%Position{} = position) do
    Position.changeset(position, %{})
  end

  alias Threestars.Accounts.User

  @doc """
  Returns the list of users.

  ## Examples

      iex> list_users()
      [%User{}, ...]

  """
  def list_users do
    Repo.all(User)
  end

  @doc """
  Gets a single user.

  Raises `Ecto.NoResultsError` if the User does not exist.

  ## Examples

      iex> get_user!(123)
      %User{}

      iex> get_user!(456)
      ** (Ecto.NoResultsError)

  """
  def get_user!(id), do: Repo.get!(User, id)

  def get_user_by_email!(email) do
    Repo.get_by(User, email: email)
  end

  @doc """
  Creates a user.

  ## Examples

      iex> create_user(%{field: value})
      {:ok, %User{}}

      iex> create_user(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_user(attrs \\ %{}) do
    %User{}
    |> User.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a user.

  ## Examples

      iex> update_user(user, %{field: new_value})
      {:ok, %User{}}

      iex> update_user(user, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_user(%User{} = user, attrs) do
    user
    |> User.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a User.

  ## Examples

      iex> delete_user(user)
      {:ok, %User{}}

      iex> delete_user(user)
      {:error, %Ecto.Changeset{}}

  """
  def delete_user(%User{} = user) do
    Repo.delete(user)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking user changes.

  ## Examples

      iex> change_user(user)
      %Ecto.Changeset{source: %User{}}

  """
  def change_user(%User{} = user) do
    User.changeset(user, %{})
  end

  alias Threestars.Accounts.Employees

  @doc """
  Returns the list of employees.

  ## Examples

      iex> list_employees()
      [%Employees{}, ...]

  """
  def list_employees do
    Repo.all(Employees) |> Repo.preload(:positions)
  end

  @doc """
  Gets a single employees.

  Raises `Ecto.NoResultsError` if the Employees does not exist.

  ## Examples

      iex> get_employees!(123)
      %Employees{}

      iex> get_employees!(456)
      ** (Ecto.NoResultsError)

  """
  def get_employees!(id), do: Repo.get!(Employees, id)

  @doc """
  Creates a employees.

  ## Examples

      iex> create_employees(%{field: value})
      {:ok, %Employees{}}

      iex> create_employees(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_employees(attrs \\ %{}) do
    %Employees{}
    |> Employees.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a employees.

  ## Examples

      iex> update_employees(employees, %{field: new_value})
      {:ok, %Employees{}}

      iex> update_employees(employees, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_employees(%Employees{} = employees, attrs) do
    employees
    |> Employees.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Employees.

  ## Examples

      iex> delete_employees(employees)
      {:ok, %Employees{}}

      iex> delete_employees(employees)
      {:error, %Ecto.Changeset{}}

  """
  def delete_employees(%Employees{} = employees) do
    Repo.delete(employees)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking employees changes.

  ## Examples

      iex> change_employees(employees)
      %Ecto.Changeset{source: %Employees{}}

  """
  def change_employees(%Employees{} = employees) do
    Employees.changeset(employees, %{})
  end
end
