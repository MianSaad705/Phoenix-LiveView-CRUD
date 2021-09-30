defmodule Task1Web.DataLive.Data do

  use Task1Web, :live_view
  alias Task1Web.User
  alias Task1Web.Identity
  alias Task1.Repo
  import Ecto.Query

  def mount(  _params, _session, socket) do
    data=
    Repo.all(User)
    |> Repo.preload(:identity)
    {:ok, assign(socket , data: data )}
  end

  def handle_event("add_new",_params, socket) do

    {:noreply, push_redirect(socket, to: "/")}
  end

  def handle_event("handle_edit", params, socket) do
      {:noreply, push_redirect(socket, to: Routes.live_path(socket,Task1Web.DataLive.Edit, params))}
  end

  def handle_event("handle_delete", data, socket) do
    id=String.to_integer(data["id"])
    query= from i in Identity ,
    where: i.user_id== ^id,
    select: i
    query1= from u in User ,
                where: u.id== ^id,
                select: u
    Repo.delete_all(query)
    Repo.delete_all(query1);
    {:noreply, socket
    |> put_flash(:info, "Deleted SuccessFully")
    |> push_redirect(to: "/data")}
  end
end
