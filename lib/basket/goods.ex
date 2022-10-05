defmodule Basket.Goods do
  import Ecto.Query
  import Ecto.Adapters.SQL

  alias Basket.Repo
  alias Basket.Fruit

  def a_get_fruit(min_q) do
    from(
      f in Fruit,
      where:
        f.quantity >= ^min_q and
          f.secret == false
    )
    |> Repo.all()
  end
end
