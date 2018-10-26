defmodule Threestars.Accounts.Employees do
  use Ecto.Schema
  import Ecto.Changeset


  schema "employees" do
    field :email, :string
    field :name, :string
    field :phone, :string

    has_many(:user, Threestars.Accounts.User)
    belongs_to(:positions, Threestars.Accounts.Position)

    timestamps()
  end

  @doc false
  def changeset(employees, attrs) do
    employees
    |> cast(attrs, [:name, :email, :phone, :positions_id])
    |> validate_required([:name, :email, :phone, :positions_id])
  end
end
