defmodule Task1Web.User do

  use Ecto.Schema

  schema "users" do
    field :name, :string
    field :email, :string
    has_one :identity, Task1Web.Identity
  end

end
