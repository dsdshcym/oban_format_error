defmodule ObanFormatErrorWeb.PageController do
  use ObanFormatErrorWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
