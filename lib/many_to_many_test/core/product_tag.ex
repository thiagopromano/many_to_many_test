defmodule ManyToManyTest.Core.ProductTag do
  use Ecto.Schema
  import Ecto.Changeset

  schema "products_tags" do
    field :product_id, :id
    field :tag_id, :id
    field :public, :boolean

    timestamps()
  end

  @doc false
  def changeset(product_tag, attrs) do
    product_tag
    |> cast(attrs, [])
    |> validate_required([])
  end
end
