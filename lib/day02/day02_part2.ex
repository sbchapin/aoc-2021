defmodule Day02Part02 do
  @doc """
  Interpret a set of compound symbol statements as a set of instructions, producing an {h_pos,depth,aim} outcome coordinate set
  """
  def interpret(instructions) do
    List.foldl(
      instructions,
      {0, 0, 0},
      fn
        {:forward, h_change}, {h, depth, aim} -> {h + h_change, aim * h_change + depth, aim}
        {:down, aim_change}, {h, depth, aim} -> {h, depth, aim + aim_change}
        {:up, aim_change}, {h, depth, aim} -> {h, depth, aim - aim_change}
      end
    )
  end

  @doc """
  Solution to day02 problem statement.

  Tokenizes the input, translates it via a mini-parser, then processes it.
  """
  def answer() do
    {:ok, contents} = File.read("./data/day02/input")

    {hpos, depth, _aim} =
      contents
      |> Day02Part01.tokenize()
      |> Day02Part01.parse()
      |> interpret()

    hpos * depth
  end
end
