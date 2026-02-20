defmodule Bowling do

  def score([]), do: 0

  def score([head|tail]) do
    #first number equals the first element of the list "head"
    first = Enum.at(head, 0)
    #second number equals the second element of the list "head"
    second = Enum.at(head, 1)
    #adds first + second + a recurssion to its own by sending the tail and beginning the process again until reaching ([])
    first + second + score(tail)
  end
end
