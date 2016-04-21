defmodule Matasano do
  use Bitwise

  @doc ~S"""
  Converts the given base16 encoded (hexadecimal) `string` into base64 encoded `string`

  ## Examples
      iex> Matasano.hex_to_base64("ABC123")
      "q8Ej"
  """
  @spec hex_to_base64(String.t) :: String.t
  def hex_to_base64 string do
    Base.decode16!(string, case: :mixed) |> Base.encode64()
  end

  @doc ~S"""
  Returns a fixed XOR operations for two strings `a` and `b`

  ## Examples
      todo: examples here
  """
  @spec string_xor(String.t, String.t, String.t) :: String.t
  def string_xor <<xhead::8, xtail::binary>>, <<yhead::8, ytail::binary>>, accumulator do
    string_xor(xtail, ytail, accumulator <> << xhead ^^^ yhead >>)
  end

  def string_xor <<>>, <<>>, accumulator do
    accumulator
  end
end
