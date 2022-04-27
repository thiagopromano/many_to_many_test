defmodule ManyToManyTest.CoreTest do
  use ManyToManyTest.DataCase

  alias Ecto.Changeset

  alias ManyToManyTest.Core
  alias ManyToManyTest.Core.Product
  alias ManyToManyTest.Core.Tag

  test "removing public tag should only affect specified tag" do
    tag = tag_fixture()

    product =
      product_fixture()
      |> Repo.preload([:public_tags, :private_tags])

    product =
      product
      |> Changeset.change(public_tags: [tag], private_tags: [tag])
      |> Repo.update!()

    product =
      product
      |> Repo.reload()
      |> Repo.preload([:public_tags, :private_tags])

    assert length(product.private_tags) == 1
    assert length(product.public_tags) == 1

    product =
      product
      |> Changeset.change(public_tags: [])
      |> Repo.update!()

    product =
      product
      |> Repo.reload()
      |> Repo.preload([:public_tags, :private_tags])

    assert length(product.private_tags) == 1
    assert length(product.public_tags) == 0
  end

  def product_fixture() do
    %Product{}
    |> Product.changeset(%{
      name: "Product Name",
      description: "Sample description"
    })
    |> Repo.insert!()
  end

  def tag_fixture() do
    %Tag{}
    |> Tag.changeset(%{
      name: "Tag Name"
    })
    |> Repo.insert!()
  end
end
