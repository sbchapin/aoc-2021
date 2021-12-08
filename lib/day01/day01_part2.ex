defmodule Day01Part02 do
  @spec summarize_window(list, pos_integer) :: list
  def summarize_window(list, window_size \\ 3) do
    Enum.chunk_every(list, window_size, 1, :discard)
    |> Enum.map(&Enum.sum/1)
  end

  @doc """
  Augment to day01 problem statement, part 2.

  Takes sliding windows and sums them
  """
  def answer() do
    {:ok, contents} = File.read("./data/day01/input")

    contents
    |> ListUtils.parse_to_numbers()
    |> summarize_window()
    |> Day01Part01.count_greater_than_before()
  end
end
