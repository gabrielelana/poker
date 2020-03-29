defmodule Poker.Card do
  @moduledoc """
  Card module
  """

  import Kernel, except: [to_string: 1]

  @type suit :: :clubs | :diamonds | :hearts | :spades
  @type rank :: :ace | :king | :queen | :jack | 1..10
  @type t :: {rank, suit}

  @suits [:clubs, :diamonds, :hearts, :spades]
  @ranks [:ace, :king, :queen, :jack, 10, 9, 8, 7, 6, 5, 4, 3, 2]

  def suits, do: @suits
  def ranks, do: @ranks

  @spec new(rank :: rank, suit :: suit) :: t
  def new(r, s) when r in @ranks and s in @suits, do: {r, s}

  @doc """
  Parse a string into a card

  ## Examples

      iex> Poker.Card.parse("AC")
      {:ace, :clubs}
  """
  @spec parse(String.t()) :: t
  def parse("A" <> s), do: parse(:ace, s)
  def parse("K" <> s), do: parse(:king, s)
  def parse("Q" <> s), do: parse(:queen, s)
  def parse("J" <> s), do: parse(:jack, s)
  def parse("10" <> s), do: parse(10, s)
  def parse("9" <> s), do: parse(9, s)
  def parse("8" <> s), do: parse(8, s)
  def parse("7" <> s), do: parse(7, s)
  def parse("6" <> s), do: parse(6, s)
  def parse("5" <> s), do: parse(5, s)
  def parse("4" <> s), do: parse(4, s)
  def parse("3" <> s), do: parse(3, s)
  def parse("2" <> s), do: parse(2, s)

  defp parse(r, "C"), do: new(r, :clubs)
  defp parse(r, "D"), do: new(r, :diamonds)
  defp parse(r, "H"), do: new(r, :hearts)
  defp parse(r, "S"), do: new(r, :spades)

  @spec to_string(t) :: String.t()
  def to_string({:ace, s}), do: "A" <> to_string(s)
  def to_string({:king, s}), do: "K" <> to_string(s)
  def to_string({:queen, s}), do: "Q" <> to_string(s)
  def to_string({:jack, s}), do: "J" <> to_string(s)
  def to_string({n, s}), do: Kernel.to_string(n) <> to_string(s)
  def to_string(:clubs), do: "C"
  def to_string(:diamonds), do: "D"
  def to_string(:hearts), do: "H"
  def to_string(:spades), do: "S"

  @spec sorter(t, t) :: boolean
  def sorter({lr, _}, {rr, _}) do
    value_of(lr) <= value_of(rr)
  end

  @spec compare(t, t) :: number
  def compare({lr, _}, {rr, _}) do
    value_of(lr) - value_of(rr)
  end

  @spec value_of(t | rank) :: number
  def value_of({r, _}), do: value_of(r)
  def value_of(:ace), do: 14
  def value_of(:king), do: 13
  def value_of(:queen), do: 12
  def value_of(:jack), do: 11
  def value_of(n) when is_integer(n) and n in 1..10, do: n
end

defimpl String.Chars, for: Tuple do
  @suits Poker.Card.suits()
  @ranks Poker.Card.ranks()

  def to_string(c = {r, s}) when s in @suits and r in @ranks, do: Poker.Card.to_string(c)
  def to_string(t), do: Kernel.to_string(t)
end
