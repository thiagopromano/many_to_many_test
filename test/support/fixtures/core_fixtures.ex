defmodule ManyToManyTest.CoreFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `ManyToManyTest.Core` context.
  """

  @doc """
  Generate a product.
  """
  def product_fixture(attrs \\ %{}) do
    {:ok, product} =
      attrs
      |> Enum.into(%{
        description: "some description",
        name: "some name"
      })
      |> ManyToManyTest.Core.create_product()

    product
  end

  @doc """
  Generate a unique tag name.
  """
  def unique_tag_name, do: "some name#{System.unique_integer([:positive])}"

  @doc """
  Generate a tag.
  """
  def tag_fixture(attrs \\ %{}) do
    {:ok, tag} =
      attrs
      |> Enum.into(%{
        name: unique_tag_name()
      })
      |> ManyToManyTest.Core.create_tag()

    tag
  end
end
