defmodule Poker.HandTest do
  use ExUnit.Case, async: true

  alias Poker.Hand

  # test "identify and rank a straight flush" do
  #   assert Hand.identify(~w{2S 3S 4S 5S 6S}) == {:straight_flush, {9, 6}}
  #   assert Hand.identify(~w{6S 5S 4S 2S 3S}) == {:straight_flush, {9, 6}}
  #   assert Hand.identify(~w{AS 2S 3S 4S 5S}) == {:straight_flush, {9, 5}}
  #   assert Hand.identify(~w{AS KS QS JS 10S}) == {:straight_flush, {9, 14}}
  # end

  # test "identify and rank four of a kind" do
  #   assert Hand.identify(~w{AS AD AC AH 6S}) == {:four_of_a_kind, {8, 14, 6}}
  #   assert Hand.identify(~w{6S AD AC AH AS}) == {:four_of_a_kind, {8, 14, 6}}
  #   assert Hand.identify(~w{QS QD QC QH AS}) == {:four_of_a_kind, {8, 12, 14}}
  #   assert Hand.identify(~w{QS AD QC QH QD}) == {:four_of_a_kind, {8, 12, 14}}
  # end

  # test "identify and rank full house" do
  #   assert Hand.identify(~w{AS AD 2C 2H 2S}) == {:full_house, {7, 2, 14}}
  #   assert Hand.identify(~w{2S 2D 2C AH AS}) == {:full_house, {7, 2, 14}}
  #   assert Hand.identify(~w{AS AD AC 2H 2S}) == {:full_house, {7, 14, 2}}
  # end

  # test "identify and rank a flush" do
  #   assert Hand.identify(~w{2S 4S 6S 7S 8S}) == {:flush, {6, 8}}
  #   assert Hand.identify(~w{AS 4S 6S 7S 8S}) == {:flush, {6, 14}}
  # end

  # test "identify and rank a straight" do
  #   assert Hand.identify(~w{2S 3D 4S 5S 6S}) == {:straight, {5, 6}}
  #   assert Hand.identify(~w{AS 2D 3S 4S 5S}) == {:straight, {5, 5}}
  #   assert Hand.identify(~w{10S JD QS KS AS}) == {:straight, {5, 14}}
  # end

  # test "identify and rank three of a kind" do
  #   assert Hand.identify(~w{AS AD AC 4H 6S}) == {:three_of_a_kind, {4, 14}}
  #   assert Hand.identify(~w{AS 2D 2C 2H 6S}) == {:three_of_a_kind, {4, 2}}
  #   assert Hand.identify(~w{AS 2D 3C 3H 3S}) == {:three_of_a_kind, {4, 3}}
  # end

  # test "identify and rank two pair" do
  #   assert Hand.identify(~w{AS AD 2C 2H 6S}) == {:two_pair, {3, 14, 2, 6}}
  #   assert Hand.identify(~w{AS AD 2C 3H 3S}) == {:two_pair, {3, 14, 3, 2}}
  #   assert Hand.identify(~w{AS 2D 2C 3H 3S}) == {:two_pair, {3, 3, 2, 14}}
  # end

  # test "identify and rank one pair" do
  #   assert Hand.identify(~w{AS AD 2C 3H 6S}) == {:one_pair, {2, 14, 6}}
  #   assert Hand.identify(~w{AC 2S 2D 3H 6S}) == {:one_pair, {2, 2, 14}}
  #   assert Hand.identify(~w{AC 2S 3D 3H 6S}) == {:one_pair, {2, 3, 14}}
  #   assert Hand.identify(~w{AC 2S 3D 6H 6S}) == {:one_pair, {2, 6, 14}}
  # end

  # test "identify and rank high card" do
  #   assert Hand.identify(~w{AS 3D 5C QH 8S}) == {:high_card, {1, 14, 12, 8, 5, 3}}
  #   assert Hand.identify(~w{2S 3D 5C QH 8S}) == {:high_card, {1, 12, 8, 5, 3, 2}}
  # end

  # test "compare hands" do
  #   assert Hand.value_of(~w{2S 3S 4S 5S 6S}) > Hand.value_of(~w{AS 2S 3S 4S 5S})
  #   assert Hand.value_of(~w{2S 3S 4S 5S 6S}) > Hand.value_of(~w{AS AD AC AH 6S})
  #   assert Hand.value_of(~w{2S 2D 3S 3D 6S}) > Hand.value_of(~w{2C 2H 3D 3H 5S})
  #   assert Hand.value_of(~w{4S 4D 4C 2D 2S}) > Hand.value_of(~w{3S 3D 3C AH AS})

  #   assert Hand.value_of(~w{2S 3D 5C 8S QH}) > Hand.value_of(~w{2D 3H 5D 8H JH})
  #   assert Hand.value_of(~w{2S 3D 5C 8S QH}) > Hand.value_of(~w{2D 3H 5D 7H QS})
  #   assert Hand.value_of(~w{2S 3D 5C 8S QH}) > Hand.value_of(~w{2D 3H 4D 8H QS})
  #   assert Hand.value_of(~w{2S 4D 5C 9S QH}) > Hand.value_of(~w{2D 3H 5D 9H QS})
  #   assert Hand.value_of(~w{3S 4D 5C 9S QH}) > Hand.value_of(~w{2D 4H 5D 9H QS})

  #   assert Hand.value_of(~w{2S 2D 3S 3D 6S}) == Hand.value_of(~w{2C 2H 3D 3H 6H})
  #   assert Hand.value_of(~w{2S 3S 4S 5S 6S}) == Hand.value_of(~w{2C 3C 4C 5C 6C})
  # end
end
