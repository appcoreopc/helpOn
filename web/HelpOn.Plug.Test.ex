defmodule HelpOn.Plugs.Test do
  
  import Plug.Conn

  def init(default), do: default

  #def call(%Plug.Conn{params: %{"locale" => loc}} = conn, _default) when loc in @locales do
  #  assign(conn, :locale, loc)
  #end
  #def call(conn, default), do: assign(conn, :locale, default)
  def call(conn, default) do
      IO.puts "Implementing plugs..."
      IO.inspect default
      conn
  end 
end