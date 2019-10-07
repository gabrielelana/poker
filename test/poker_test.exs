defmodule PokerTest do
  use ExUnit.Case
  doctest Poker

  test "greets the world" do
    assert Poker.hello() == :world
  end
end
