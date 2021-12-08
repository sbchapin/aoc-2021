defmodule Day02Part01 do
  @doc """
  tokenize a program, turning it into string tokens that will need to be parsed
  """
  def tokenize(program) do
    String.split(program, ~r/\s+/, trim: true)
  end

  @doc """
  parse a Enumerable of string tokens - first parsing symbols, then condensing the symbols
  """
  def parse(tokens) do
    # Convert all known tokens as the program expects
    symbols =
      Enum.map(
        tokens,
        fn
          "forward" -> :forward
          "down" -> :down
          "up" -> :up
          number -> String.to_integer(number)
        end
      )

    # Condense a list of known-good symbols to a list of compound statements
    Enum.reduce(
      symbols,
      [],
      fn
        :forward, instructions -> [:partial_forward | instructions]
        :down, instructions -> [:partial_down | instructions]
        :up, instructions -> [:partial_up | instructions]
        number, [:partial_forward | instructions] -> instructions ++ [forward: number]
        number, [:partial_down | instructions] -> instructions ++ [down: number]
        number, [:partial_up | instructions] -> instructions ++ [up: number]
      end
    )
  end

  @doc """
  Interpret a set of compound symbol statements as a set of instructions, producing an {x,y} outcome coordinate set
  """
  def interpret(instructions) do
    List.foldl(
      instructions,
      {0, 0},
      fn
        {:forward, x_change}, {x, y} -> {x + x_change, y}
        {:down, y_change}, {x, y} -> {x, y + y_change}
        {:up, y_change}, {x, y} -> {x, y - y_change}
      end
    )
  end

  @doc """
  Solution to day02 problem statement.

  Tokenizes the input, translates it via a mini-parser, then processes it.
  """
  def answer() do
    {:ok, contents} = File.read("./data/day02/input")

    {hpos, depth} =
      contents
      |> tokenize()
      |> parse()
      |> interpret()

    hpos * depth
  end
end
