defmodule Hamming do
  @doc """
  Returns number of differences between two strands of DNA, known as the Hamming Distance.

  ## Examples

  iex> Hamming.hamming_distance('AAGTCATA', 'TAGCGATC')
  {:ok, 4}
  """
  @spec hamming_distance([char], [char]) :: {:ok, non_neg_integer} | {:error, String.t()}
  def hamming_distance(strand1, strand2) do
    try do
      case {strand1, strand2} do
        {'', ''} -> {:ok, 0}
        _ -> :lists.zipwith(fn x, y -> x == y end, strand1, strand2)
            |> Enum.filter(fn x -> !x end)
            |> Enum.count
            |> fn x -> {:ok, x} end.()
      end
    rescue
      _ in FunctionClauseError -> {:error, "Lists must be the same length"}
    end
  end
end
