defmodule Poker.Hand do
  alias Poker.Card

  @type t :: [Card.t()]

  @type kind_of_hand ::
          :straight_flush
          | :four_of_a_kind
          | :full_house
          | :flush
          | :straight
          | :three_of_a_kind
          | :two_pair
          | :one_pair
          | :high_card

  @spec parse([String.t() | t]) :: t
  def parse(hand), do: hand |> Enum.map(&Card.parse/1)

  @spec identify(t) :: {kind_of_hand, rank :: tuple}
  def identify(hand) do
    [hand]
    |> Enum.map(&parse/1)
    |> Enum.flat_map(fn hand -> [hand, hand |> aces_as_ones] end)
    |> Enum.map(fn hand ->
      hand
      |> Enum.sort(&Card.sorter/2)
      |> Enum.map(fn c = {_, s} -> {Card.value_of(c), s} end)
      |> do_identify
    end)
    |> Enum.sort_by(&value_of/1)
    |> List.last()
  end

  # @spec do_identify([{number, Card.rank()}]) :: {kind_of_hand, tuple}

  defp aces_as_ones(hand) do
    hand
    |> Enum.map(fn
      {:ace, s} -> {1, s}
      c -> c
    end)
  end

  @spec value_of(t | {kind_of_hand, tuple} | binary) :: number
  def value_of(<<r::size(24)>>), do: r

  def value_of({_, {r1, r2}}),
    do: value_of(<<r1::size(4), r2::size(4), 0::size(16)>>)

  def value_of({_, {r1, r2, r3}}),
    do: value_of(<<r1::size(4), r2::size(4), r3::size(4), 0::size(12)>>)

  def value_of({_, {r1, r2, r3, r4}}),
    do: value_of(<<r1::size(4), r2::size(4), r3::size(4), r4::size(4), 0::size(8)>>)

  def value_of({_, {r1, r2, r3, r4, r5}}),
    do: value_of(<<r1::size(4), r2::size(4), r3::size(4), r4::size(4), r5::size(4), 0::size(4)>>)

  def value_of({_, {r1, r2, r3, r4, r5, r6}}),
    do: value_of(<<r1::size(4), r2::size(4), r3::size(4), r4::size(4), r5::size(4), r6::size(4)>>)

  def value_of(hand), do: value_of(identify(hand))
end
