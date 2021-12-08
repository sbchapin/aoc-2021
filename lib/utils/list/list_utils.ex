defmodule ListUtils do
  @spec parse_to_numbers(String.t()) :: list
  def parse_to_numbers(input) do
    parse_every(input, &String.to_integer/1)
  end

  @spec parse_every(String.t(), (String.t() -> any)) :: list
  def parse_every(input, fx) do
    input
    |> String.split("\n", trim: true)
    |> Enum.map(fx)
  end
end
