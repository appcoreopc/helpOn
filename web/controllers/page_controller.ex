defmodule HelpOn.PageController do
  use HelpOn.Web, :controller
   
   
  def index(conn, _params) do 

    alias HelpOn.User
    import Ecto.Query
    import Poison

    #IO.inspect conn

    users = HelpOn.Repo.all(from u in User, select: u.name)

    #conn  |> put_flash(:info, "Welcome to Phoenix, from flash info!")
    #|> put_flash(:error, "Let's pretend we have an error.")
    #|> render("index.html")
    render conn, "index.html"

    #IO.inspect conn.req_headers
    #IO.inspect conn

    #users = HelpOn.Repo.all(User)

    #render conn, "index.html", users: users
    #render conn, users: users
    #json conn, to_string Poison.Encoder.encode(users, [])

    #json conn, %{id: 1}


  end
end
