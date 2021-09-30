defmodule Task1Web.PageLive do
  use Task1Web, :live_view

  alias Task1.Repo
  alias Task1Web.User
  alias Task1Web.Identity
  alias Task1Web.Helper

  @impl true
  def mount(_params, _session, socket) do
    {:ok, assign(socket, query: "", results: %{})}
  end
  @impl true
  def handle_event("save", %{"data"=> data}, socket) do
   if (Helper.validate(data)) do
     identity=%Identity{nick_name: data["nick_name"], identity_mark: data["identity_mark"]}
     user=%User{name: data["name"] , email: data["email"], identity: identity}
     case Repo.insert user do
       {:ok, _struct}->
         {:noreply, socket
                    |> put_flash(:info, "Added SuccessFully")
                    |> push_redirect(to: "/data")}
       {:error, _changeset}->
         IO.inspect("Failed")
     end
   else


    {:noreply, socket
               |> put_flash(:error, "All Fields Are Required")}

  end
end
  def handle_event("list", _params, socket) do
    {:noreply, push_redirect(socket, to: "/data")}
  end
end
