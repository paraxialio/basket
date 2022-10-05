defmodule Basket.Repo.Migrations.AddFruitsTable do
  use Ecto.Migration

  def change do
    create table("fruits") do
      add :name, :string
      add :quantity, :integer
      add :secret, :boolean

      timestamps()
    end
  end
end
