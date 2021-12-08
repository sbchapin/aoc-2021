defmodule Day01Part01 do
  @spec count_greater_than_before(list(number)) :: non_neg_integer
  def count_greater_than_before(list) do
    pairs_chunked_lagged = Enum.chunk_every(list, 2, 1, :discard)

    Enum.count(
      pairs_chunked_lagged,
      fn
        [left, right] -> left < right
      end
    )
  end

  @doc """
  Solution to day01 problem statement.

  Takes all the elements in a list, copies them to pair-wise relationships, then counts those relationships.
  """
  def answer() do
    {:ok, contents} = File.read("./data/day01/input")

    contents
    |> ListUtils.parse_to_numbers()
    |> count_greater_than_before()
  end
end
