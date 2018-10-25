# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Threestars.Repo.insert!(%Threestars.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.


user = %{user_name: "Admin", password: "123456", employees_id: 1}

create_employees = %{email: "test@abv.bg", name: "Pesho Kukata", phone: "0888888888", positions_id: 1}

position = %{name: "Boss"}

Threestars.Accounts.create_position(position)

Threestars.Accounts.create_employees(create_employees)

Threestars.Accounts.create_user(user)

