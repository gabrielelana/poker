# Poker

Repository of an Elixir Quiz challenge called "Poker"

Used as playground in the Elixir Milano Meetup held on 2019/10/07

## First Part

[See description](http://elixirquiz.github.io/2014-08-30-poker-part-1-a-deck-of-cards.html) start at branch `card-before` see the end at branch `card`

> Create a module that will allow us to create a shuffled deck of
> cards. The deck should contain the 52 cards included in a regular
> deck. How the cards and deck are represented are completely up to you.

> Since we’re working with the cards this week, also ensure that you
> have a function to compare the value of 2 individual cards. Card
> values, in high -> low order, are Ace, King, Queen, Jack, 10, 9, 8, 7,
> 6, 5, 4, 3, 2, 1

## Second Part

[See description](http://elixirquiz.github.io/2014-09-06-poker-part-2-finding-a-winner.html) start at branch `hand-before` see the end at branch `hand`

> Given that we already have a deck of cards, write a function that can
> deal hands to a number of players, between 2 and 6. Also write a
> function that can take this list of hands and determine the winner.
>
> `Straight Flush`: This hand occurs when a player has 5 cards of the
> same suit in sequence. Two flushes are compared based on the value of
> their highest card. An Ace high or Royal flush beats a King high
> flush.
>
> `Four of a kind`: A hand that contains four cards of the same value,
> and one other card. When comparing two four of a kind hands together,
> the value of the 4 cards is used to determine the winner. A hand with
> 4 fives beats a hand with 4 twos.
>
> `Full House`: A hand that contains three cards with one value, and two
> cards of another value. When comparing two full houses, the hand with
> the higher value three matching cards wins. For example, a hand with 3
> tens and 2 threes beats one with 3 fives and 2 kings.
>
> `Flush`: The flush occurs when all cards in the hand have the same
> suit, but the values are not in sequence. When two flushes are
> compared, the winner is determined as if they were high card hands
> (which we’ll see below).
>
> `Straight`: This hand occurs when a player has 5 cards in sequence,
> but the suit is not the same across all cards. When two straights are
> compared, the hand with the highest card wins. Two straights with the
> same high card are considered equal. An Ace can be positioned either
> before the 2 or after the King in a straight.
>
> `Three of a kind`: A hand that contains three cards of matching value,
> and two other cards with non-matching values. When comparing two three
> of a kind hands, the hand with the highest value triple cards
> wins. For example, three Kings beats three Jacks.
>
> `Two Pair`: This hand occurs when a player has two cards of the same
> value, plus another two cards of the same value (but not matching the
> first pair), plus any other card. When comparing two of these types of
> hand, the player with the higest value pair will win. If both players
> have matching pairs, such as both having a pair of 2s and a pair of
> 4s, then the remaining card determines the winner.
>
> `One Pair`: One pair occurs when a hand consists of two cards of
> matching value, plus three other cards whose value doesn’t match the
> value of any other card in the hand. When compairing pairs, the higer
> value pair wins. If two pairs have the same value paired cards, then
> the highest of the remaining cards determines the winner.
>
> `High Card`: The high card hand, which is the lowest value hand,
> consists of 5 cards, each of different values, and containing at least
> 2 suits. When comparing these hands, the winner is determined by the
> hand with the highest value card. If both hands have the same value
> high card, then the second highest card is compared, and so on until
> all cards are compared.
