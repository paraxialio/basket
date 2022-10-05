defmodule Basket.Goods do
  import Ecto.Query

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

  # Commented out because compilation fails with this function
  # def b_get_fruit(min_q) do
  #   from(
  #     f in Fruit,
  #     where: fragment("f0.quantity >= #{min_q} AND f0.secret = FALSE")
  #   )
  #   |> Repo.all()
  # end

  def c_get_fruit(min_q) do
    min_q = String.to_integer(min_q)
    from(
      f in Fruit,
      where: fragment("f0.quantity >= ? AND f0.secret = FALSE", ^min_q)
    )
    |> Repo.all()
  end

  # sobelow_skip ["SQL"]
  def d_get_fruit(min_q) do
    q = """
    SELECT f.id, f.name, f.quantity, f.secret
    FROM fruits AS f
    WHERE f.quantity >= $1 AND f.secret = FALSE
    """
    {:ok, %{rows: rows}} =
      Ecto.Adapters.SQL.query(Repo, q, [String.to_integer(min_q)])
    Enum.map(rows, fn row ->
      [id, name, quantity, secret] = row
      %Fruit{id: id, name: name, quantity: quantity, secret: secret}
    end)
  end

  # This is the only function vulnerable to SQL injection
  def e_get_fruit(min_q) do
    q = """
    SELECT f.id, f.name, f.quantity, f.secret
    FROM fruits AS f
    WHERE f.quantity >= #{min_q} AND f.secret = FALSE
    """
    {:ok, %{rows: rows}} =
      Ecto.Adapters.SQL.query(Repo, q)
    Enum.map(rows, fn row ->
      [id, name, quantity, secret] = row
      %Fruit{id: id, name: name, quantity: quantity, secret: secret}
    end)
  end
end
