defmodule PokerTest do
  use ExUnit.Case
  doctest Poker
  doctest Poker.Card

  test "greets the world" do
    assert Poker.hello() == :world
  end
end
