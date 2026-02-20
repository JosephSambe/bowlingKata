defmodule Bowling do

  def score([]), do: 0

  def score([head|tail]) do
    #first number equals the first element of the list "head"
    first = Enum.at(head, 0)
    #second number equals the second element of the list "head"
    second = Enum.at(head, 1)

    #THIS WILL ONLY WORK WITH THIS SPECIFIC TEST, IT WONT WORK FOR THE STRIKE!!
    #if the total punctiation == 10, it adds first + second + another fucntion triggered by the attom :spare, sending the tail and
    #following its explained logic
    if first + second == 10 do
      first + second + score(tail, :spare)
    #if not, it adds first + second + a recurssion to its own by sending the tail and beginning the process again until reaching ([])
    else
    first + second + score(tail)
    end
  end

  def score([head|tail], :spare) do
    #first number equals the first element of the list "head"
    first = Enum.at(head, 0)
    #second number equals the second element of the list "head"
    second = Enum.at(head, 1)

    #THIS WILL ONLY WORK WITH THIS SPECIFIC TEST, IT WONT WORK FOR THE STRIKE!!
    #if the total punctiation == 10, it adds first + second + a recurssion to its own by sending the tail and the attom :spare
    if first + second == 10 do
      (first * 2) + second + score(tail, :spare)
    else
    #if not, it adds first + second + a call to the normal function sending its tail
    (first * 2) + second + score(tail)
    end
  end
end
