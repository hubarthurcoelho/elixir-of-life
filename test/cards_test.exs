defmodule CardsTest do
  use ExUnit.Case
  doctest Cards

  test "Tests the creation of a deck" do
    deck = Cards.create_deck()
    appropriate_deck_size = 20

    assert length(deck) == appropriate_deck_size
  end
end
