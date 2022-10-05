# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Basket.Repo.insert!(%Basket.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.
alias Basket.Fruit
alias Basket.Repo

fruits = [
  %{
    name: "Apple",
    quantity: 2,
    secret: false
  },
  %{
    name: "Cherry",
    quantity: 8,
    secret: false
  },
  %{
    name: "Lime",
    quantity: 5,
    secret: false
  },
  %{
    name: "Peach",
    quantity: 100,
    secret: true
  }
]

Enum.map(fruits, fn fruit ->
  changeset = Fruit.changeset(%Fruit{}, fruit)
  Repo.insert!(changeset)
end)
