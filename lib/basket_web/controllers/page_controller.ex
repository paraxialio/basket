defmodule BasketWeb.PageController do
  use BasketWeb, :controller

  alias Basket.Goods

  def index(conn, _params) do
    render(conn, "index.html")
  end

  def basket_a(conn, %{"min_q" => min_q}) do
    fruits = Goods.a_get_fruit(min_q)
    render(conn, "index.html", fruits: fruits)
  end
end
