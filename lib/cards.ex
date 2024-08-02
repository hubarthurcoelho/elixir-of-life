defmodule Cards do
  @moduledoc """
    Provides methods for handling decks and hands of cards.
  """


  def hello do
    "Hello, World!"
  end

  def create_deck do
    values = ["Ace", "Two", "Three", "Four", "Five"]
    suits = ["Spades", "Clubs", "Hearts", "Diamonds"]

    for suit <- suits, value <- values do
      "#{value} of #{suit}"
    end
  end

  @doc """
    Receives a deck and a hand size and returns a hand and the rest of the deck.

  ## Examples

        iex> deck = Cards.create_deck()
        iex> {hand, _deck} = Cards.deal(deck, 1)
        iex> hand
        ["Ace of Spades"]

  """
  def deal(deck, hand_size) do
    Enum.split(deck, hand_size)
  end

  def shuffle(deck) do
    Enum.shuffle(deck)
  end

  def contains?(deck, card) do
    Enum.member?(deck, card)
  end

  def save(deck, filename) do
    binary = :erlang.term_to_binary(deck)

    File.write(filename, binary)
  end

  def read(filename) do
    case File.read(filename) do
      {:ok, binary} -> :erlang.binary_to_term binary
      {:error, reason} -> reason
    end
  end

  def create_hand(hand_size) do
    {hand, _deck} =
      Cards.create_deck()
      |> Cards.shuffle()
      |> Cards.deal(hand_size)
    hand
  end
end
