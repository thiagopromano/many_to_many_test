defmodule ManyToManyTest.Repo.Migrations.CreateProductsTags do
  use Ecto.Migration

  def change do
    create table(:products_tags) do
      add :product_id, references(:products, on_delete: :nothing)
      add :tag_id, references(:tags, on_delete: :nothing)
      add :public, :boolean

      timestamps()
    end

    create index(:products_tags, [:product_id])
    create index(:products_tags, [:tag_id])
  end
end
