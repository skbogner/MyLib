defmodule MyLib.Random do

  # Return a pseudo-random number between 0 and 1
  def random() do
    # use crypto to avoid using timestamps
    # (unique even for concurrent processes)
    << a :: 32, b :: 32, c :: 32 >> = :crypto.rand_bytes(12)
    # seed the random and produce a random number
    :random.seed(a, b, c)
    :random.uniform
  end
end
