defmodule Poker.Deck do
  @moduledoc """
  Deck module
  """

  alias Poker.Card

  @type t :: [Card.t()]

  @cards_in_deck 5
  @cards for rank <- Card.ranks(), suit <- Card.suits(), do: {rank, suit}

  @spec new() :: t
  def new do
    @cards
  end

  @spec shuffle(t) :: t
  def shuffle(deck, seed \\ :os.timestamp()) do
    :random.seed(seed)
    Enum.shuffle(deck)
  end

  @spec deal_to(t, number) :: [Hand.t()]
  def deal_to(deck, number_of_players) when number_of_players in 2..6 do
    shuffle(deck)
    |> Enum.chunk_every(number_of_players)
    |> Enum.take(@cards_in_deck)
    |> transpose
  end

  defp transpose([]), do: []
  defp transpose([[] | _]), do: []
  defp transpose(l), do: [Enum.map(l, &hd/1) | transpose(Enum.map(l, &tl/1))]
end
