defmodule Poker.Hand do
  @moduledoc """
  Hand module
  """

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
  defp do_identify([{r1, s}, {r2, s}, {r3, s}, {r4, s}, {r5, s}])
       when [r2 - r1, r3 - r2, r4 - r3, r5 - r4] == [1, 1, 1, 1],
       do: {:straight_flush, {9, r5}}

  defp do_identify([{r1, _}, {r1, _}, {r1, _}, {r1, _}, {r2, _}]),
    do: {:four_of_a_kind, {8, r1, r2}}

  defp do_identify([{r1, _}, {r2, _}, {r2, _}, {r2, _}, {r2, _}]),
    do: {:four_of_a_kind, {8, r2, r1}}

  defp do_identify([{r1, _}, {r1, _}, {r1, _}, {r2, _}, {r2, _}]), do: {:full_house, {7, r1, r2}}
  defp do_identify([{r2, _}, {r2, _}, {r1, _}, {r1, _}, {r1, _}]), do: {:full_house, {7, r1, r2}}

  defp do_identify([{_, s}, {_, s}, {_, s}, {_, s}, {r5, s}]), do: {:flush, {6, r5}}

  defp do_identify([{r1, _}, {r2, _}, {r3, _}, {r4, _}, {r5, _}])
       when [r2 - r1, r3 - r2, r4 - r3, r5 - r4] == [1, 1, 1, 1],
       do: {:straight, {5, r5}}

  defp do_identify([{r1, _}, {r1, _}, {r1, _}, {_, _}, {_, _}]), do: {:three_of_a_kind, {4, r1}}
  defp do_identify([{_, _}, {r2, _}, {r2, _}, {r2, _}, {_, _}]), do: {:three_of_a_kind, {4, r2}}
  defp do_identify([{_, _}, {_, _}, {r3, _}, {r3, _}, {r3, _}]), do: {:three_of_a_kind, {4, r3}}

  defp do_identify([{r1, _}, {r1, _}, {r2, _}, {r2, _}, {r3, _}]),
    do: {:two_pair, {3, r2, r1, r3}}

  defp do_identify([{r1, _}, {r2, _}, {r2, _}, {r3, _}, {r3, _}]),
    do: {:two_pair, {3, r3, r2, r1}}

  defp do_identify([{r1, _}, {r1, _}, {r2, _}, {r3, _}, {r3, _}]),
    do: {:two_pair, {3, r3, r1, r2}}

  defp do_identify([{r1, _}, {r1, _}, {_, _}, {_, _}, {r4, _}]), do: {:one_pair, {2, r1, r4}}
  defp do_identify([{_, _}, {r2, _}, {r2, _}, {_, _}, {r4, _}]), do: {:one_pair, {2, r2, r4}}
  defp do_identify([{_, _}, {_, _}, {r3, _}, {r3, _}, {r4, _}]), do: {:one_pair, {2, r3, r4}}
  defp do_identify([{_, _}, {_, _}, {r3, _}, {r4, _}, {r4, _}]), do: {:one_pair, {2, r4, r3}}

  defp do_identify([{r1, _}, {r2, _}, {r3, _}, {r4, _}, {r5, _}]),
    do: {:high_card, {1, r5, r4, r3, r2, r1}}

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
