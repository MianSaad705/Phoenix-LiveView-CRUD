defmodule Task1Web.PageController do
  use Task1Web, :controller
  alias Task1.Repo
  alias Task1Web.User
  alias Task1Web.Identity
  def index(conn,_params) do

    IO.inspect(conn.assigns)
    render(conn, "index.html")
  end

  def create(conn, %{"data" => data}) do
    identity=%Identity{nick_name: data["nick_name"], identity_mark: data["identity_mark"]}
    user=%User{name: data["name"] , email: data["email"], identity: identity}
    case Repo.insert user do
      {:ok, _struct}->
        IO.inspect("success")
      {:error, _changeset}-> IO.inspect("Failed")
    end

    conn
    |> redirect(to: Routes.page_path(conn, :index))
  end

end
