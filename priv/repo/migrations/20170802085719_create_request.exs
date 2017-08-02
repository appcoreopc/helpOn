defmodule HelpOn.Repo.Migrations.CreateRequest do
  use Ecto.Migration

  def change do
    create table(:requests) do
      add :type, references(:requesttypes, on_delete: :nothing)
      add :provider, references(:providers, on_delete: :nothing)

      timestamps()
    end
    create index(:requests, [:type])
    create index(:requests, [:provider])

  end
end
