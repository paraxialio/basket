defmodule BasketWeb.PageController do
  use BasketWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
