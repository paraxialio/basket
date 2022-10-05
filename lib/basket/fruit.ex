defmodule Basket.Fruit do
  use Ecto.Schema
  import Ecto.Changeset

  schema "fruits" do
    field :name, :string
    field :quantity, :integer
    field :secret, :boolean

    timestamps()
  end

  def changeset(fruit, attrs) do
    fruit
    |> cast(attrs, [:name, :quantity, :secret])
  end
end
