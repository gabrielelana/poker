defmodule Poker.CardTest do
  use ExUnit.Case, async: true

  alias Poker.Card

  test "compare/2 compares two cards" do
    assert Card.compare({:ace, :clubs}, {10, :spades}) > 0
    assert Card.compare({:ace, :clubs}, {:ace, :spades}) == 0
    assert Card.compare({:queen, :clubs}, {:ace, :spades}) < 0
    assert Card.compare({:ace, :clubs}, {1, :clubs}) > 0
  end

  test "from and to string" do
    for r <- Card.ranks(), s <- Card.suits() do
      assert Card.parse(to_string({r, s})) == {r, s}
    end
  end
end
