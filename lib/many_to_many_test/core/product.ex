defmodule ManyToManyTest.Core.Product do
  use Ecto.Schema
  import Ecto.Changeset

  schema "products" do
    field :description, :string
    field :name, :string

    many_to_many :public_tags, ManyToManyTest.Core.Tag,
      join_through: ManyToManyTest.Core.ProductTag,
      join_defaults: [public: true],
      join_where: [public: true],
      on_replace: :delete

    many_to_many :private_tags, ManyToManyTest.Core.Tag,
      join_through: ManyToManyTest.Core.ProductTag,
      join_defaults: [public: false],
      join_where: [public: false],
      on_replace: :delete

    timestamps()
  end

  @doc false
  def changeset(product, attrs) do
    product
    |> cast(attrs, [:name, :description])
    |> validate_required([:name, :description])
  end
end
