
defmodule Task1Web.DataLive.Edit do

  use Task1Web, :live_view
  alias Task1.Repo
  alias Task1Web.User
  alias Task1Web.Identity
  alias Task1Web.Helper
  import Ecto.Query
  def mount(%{"id"=> id, "name" => name, "email"=> email, "mark"=>mark, "nick_name"=>nickname},_session,socket) do
    {:ok, assign( socket, id: id, name: name, email: email, mark: mark, nick_name: nickname)}
  end
  def handle_event("save",%{"data"=> data} , socket) do
    if (Helper.validate(data)) do
      name=data["name"]
      email=data["email"]
      mark=data["identity_mark"]
      nickname=data["nick_name"]
      record_id=String.to_integer(socket.assigns.id)
      query=from u in User,
                 where: u.id ==^record_id,
                 select: u
      query1=from i in Identity,
                  where: i.user_id ==^record_id,
                  select: i
      Repo.update_all(query,set: [name: name, email: email])
      Repo.update_all(query1,set: [nick_name: nickname, identity_mark: mark])

      {:noreply, socket
                 |> push_redirect(to: "/data")
                 |> put_flash(:info, "Updated successfully")}

      else
      {:noreply, socket
                 |> put_flash(:error, "All fields are required")}
    end

  end
end
