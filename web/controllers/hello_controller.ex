defmodule HelpOn.HelloController do
  use HelpOn.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
  
  def show(conn, %{"requestType" => requestType} = params) do
    render conn, "show.html", requestType: requestType
  end
  
end
