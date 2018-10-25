defmodule Threestars.Accounts.User do
  use Ecto.Schema
  import Ecto.Changeset

  schema "users" do
    field(:user_name, :string)
    field(:password, :string, virtual: true)
    field(:password_hash, :string)
    belongs_to(:employees, Threestars.Accounts.Employees)
    field(:invalid, :boolean, defaults: true)

    timestamps()
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:user_name, :password_hash, :employees_id, :invalid])
    |> validate_required([:user_name, :employees_id])
    |> cast(attrs, ~w(password)a, [])
    |> validate_length(:password, min: 6, max: 50)
    |> unique_constraint(:user_name)
    |> hash_password
  end

  defp hash_password(changeset) do
    case changeset do
      %Ecto.Changeset{valid?: true, changes: %{password: password}} ->
        put_change(
          changeset,
          :password_hash,
          Comeonin.Bcrypt.hashpwsalt(password)
        )

      _ ->
        changeset
    end
  end
end
