defmodule Bowling do

  #Redisigned/simpler code version

  def score([]), do: 0

  def score([head|tail]) do
    #first number equals the first element of the list "head"
    first = Enum.at(head, 0)
    #second number equals the second element of the list "head"
    second = Enum.at(head, 1)

    #It compares via Cond the possible outcomes: strike, spare or plain
    cond do
      #STRIKE
      #It applies recursion calling itself till meeting ([]) and it sums the call to strike_bonus
      first == 10 ->
        10 + strike_bonus(tail) + score(tail)

      #SPARE
      #It applies recursion calling itself till meeting ([]) and it sums the next immediat shot
      first + second == 10 ->
        10 + Enum.at(Enum.at(tail, 0), 0) + score(tail)

      #PLAIN
      #It adds first + second + a recurssion to its own by sending the tail and beginning the process again until reaching ([])
      true ->
        first + second + score(tail)
    end
  end

  #This function will sum the following two shots to the shot that triggered the Strike.
  defp strike_bonus(tail) do
    next_round = Enum.at(tail, 0)
    verynext_round = Enum.at(tail, 1)

    #Checks if the next shot was also a strike, so that it guarantees grabbing the real next shot
    if Enum.at(next_round, 0) == 10 do
      10 + Enum.at(verynext_round, 0)

    #Discards the next shot being a strike and grabs the shot of the next round
    else
      Enum.at(next_round, 0) + Enum.at(next_round, 1)
    end
  end

end
