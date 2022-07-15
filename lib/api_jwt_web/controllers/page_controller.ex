defmodule ApiJwtWeb.PageController do
  use ApiJwtWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
