defmodule Task1.Repo.Migrations.CreateIdentity do
  use Ecto.Migration

  def change do

    create table(:identities) do
      add :nick_name, :string
      add :identity_mark, :string
      add :user_id, references(:users)
    end

  end
end
