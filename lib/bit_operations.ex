defmodule Matasano.BitOperations do
  @doc ~S"""
  Returns a `base16` encoded `lowercase` result `string` of fixed XOR operation for two `base16` encoded `strings` `a` and `b`

  ## Examples
      iex> Matasano.BitOperations.string_xor("15BC", "684A")
      "7df6"
  """
  @spec string_xor(String.t, String.t) :: String.t
  def string_xor(a, b) when byte_size(a) === byte_size(b) do
    # TODO: Add case clause to catch errors and show error message?
    {:ok, x} = Base.decode16(a, case: :mixed)
    {:ok, y} = Base.decode16(b, case: :mixed)

    do_string_xor(x, y, "") |> Base.encode16(case: :lower)
  end

  def string_xor(a, b) when byte_size(a) !== byte_size(b) do
    {:error, "string byte size must match for the arguments"}
  end

  defp do_string_xor <<xhead::8, xtail::binary>>, <<yhead::8, ytail::binary>>, accumulator do
    use Bitwise, only_operators: true
    do_string_xor(xtail, ytail, accumulator <> << xhead ^^^ yhead >>)
  end

  defp do_string_xor <<>>, <<>>, accumulator do
    accumulator
  end
end
