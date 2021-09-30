defmodule Task1Web.Identity do

  use Ecto.Schema

  schema "identities" do

    field :nick_name, :string
    field :identity_mark, :string
    belongs_to :user, Task1Web.User
  end
end
