defmodule MatasanoTest.Conversion do
  use ExUnit.Case, async: true
  require Matasano.Conversion
  doctest Matasano

  test "Passing empty string to base64 decode should fail" do
    assert Matasano.Conversion.hex_to_base64("") == ""
  end

  test "Convert Hex base 16 to base 64" do
    hex = "49276d206b696c6c696e6720796f757220627261696e206c696b65206120706f69736f6e6f7573206d757368726f6f6d"
    base64 = "SSdtIGtpbGxpbmcgeW91ciBicmFpbiBsaWtlIGEgcG9pc29ub3VzIG11c2hyb29t"

    assert Matasano.Conversion.hex_to_base64(hex) == base64
    assert Matasano.Conversion.hex_to_base64("") == ""
  end
end
