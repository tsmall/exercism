"""Functions to help play and score a game of blackjack.

How to play blackjack:    https://bicyclecards.com/how-to-play/blackjack/
"Standard" playing cards: https://en.wikipedia.org/wiki/Standard_52-card_deck
"""


FACE_CARD_VALUE = 10
ACE_LOW_VALUE = 1
ACE_HIGH_VALUE = 11

FACE_CARDS = {'K', 'Q', 'J'}

BUST_POINTS = 21


def value_of_card(card):
    """Determine the scoring value of a card.

    :param card: str - given card.
    :return: int - value of a given card.  See below for values.

    1.  'J', 'Q', or 'K' (otherwise known as "face cards") = 10
    2.  'A' (ace card) = 1
    3.  '2' - '10' = numerical value.
    """
    if card in FACE_CARDS:
        return FACE_CARD_VALUE

    if card == 'A':
        return ACE_LOW_VALUE

    return int(card)


def higher_card(card_one, card_two):
    """Determine which card has a higher value in the hand.

    :param card_one, card_two: str - cards dealt in hand.  See below for values.
    :return: str or tuple - resulting Tuple contains both cards if they are of equal value.

    1.  'J', 'Q', or 'K' (otherwise known as "face cards") = 10
    2.  'A' (ace card) = 1
    3.  '2' - '10' = numerical value.
    """
    card_one_value = value_of_card(card_one)
    card_two_value = value_of_card(card_two)

    if card_one_value > card_two_value:
        return card_one

    if card_two_value > card_one_value:
        return card_two

    return (card_one, card_two)


def value_of_ace(card_one, card_two):
    """Calculate the most advantageous value for the ace card.

    :param card_one, card_two: str - card dealt. See below for values.
    :return: int - either 1 or 11 value of the upcoming ace card.

    1.  'J', 'Q', or 'K' (otherwise known as "face cards") = 10
    2.  'A' (ace card) = 11 (if already in hand)
    3.  '2' - '10' = numerical value.
    """
    def check_for_ace_in_hand(card_value):
        if card_value == ACE_LOW_VALUE:
            return ACE_HIGH_VALUE

        return card_value

    card_one_value = value_of_card(card_one)
    card_two_value = value_of_card(card_two)
    current_points = check_for_ace_in_hand(card_one_value) + check_for_ace_in_hand(card_two_value)

    if current_points + ACE_HIGH_VALUE > BUST_POINTS:
        return ACE_LOW_VALUE

    return ACE_HIGH_VALUE


def is_blackjack(card_one, card_two):
    """Determine if the hand is a 'natural' or 'blackjack'.

    :param card_one, card_two: str - card dealt. See below for values.
    :return: bool - is the hand is a blackjack (two cards worth 21).

    1.  'J', 'Q', or 'K' (otherwise known as "face cards") = 10
    2.  'A' (ace card) = 11 (if already in hand)
    3.  '2' - '10' = numerical value.
    """
    if card_one == 'A':
        return card_two in FACE_CARDS or card_two == '10'

    if card_one in FACE_CARDS or card_one == '10':
        return card_two == 'A'

    return False


def can_split_pairs(card_one, card_two):
    """Determine if a player can split their hand into two hands.

    :param card_one, card_two: str - cards dealt.
    :return: bool - can the hand be split into two pairs? (i.e. cards are of the same value).
    """
    return (
        card_one == card_two
        or (card_one == 'K' and card_two == 'Q')
        or (card_one == 'Q' and card_two == 'K')
    )


def can_double_down(card_one, card_two):
    """Determine if a blackjack player can place a double down bet.

    :param card_one, card_two: str - first and second cards in hand.
    :return: bool - can the hand can be doubled down? (i.e. totals 9, 10 or 11 points).
    """
    if card_one == 'A' and card_two == 'A':
        return False

    return value_of_card(card_one) + value_of_card(card_two) <= 11
