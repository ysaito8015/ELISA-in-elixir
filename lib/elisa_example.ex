defmodule ElisaExample do
  #Functions to handle CSV files
  # https://github.com/dashbitco/nimble_csv
  alias NimbleCSV.RFC4180, as: CSV

  # This is going to read the CSV file and return a stream of data
  @spec read_csv :: Stream.t()
  def read_csv do
    "./data/ELISA.csv"
    |> File.stream!()
    |> CSV.parse_stream()
    |> Stream.map(fn [x1, x2, x3, x4, x5, x6, x7, x8, x9, x10, x11, x12] ->
      [
        Float.parse(x1) |> elem(0),
        Float.parse(x2) |> elem(0),
        Float.parse(x3) |> elem(0),
        Float.parse(x4) |> elem(0),
        Float.parse(x5) |> elem(0),
        Float.parse(x6) |> elem(0),
        Float.parse(x7) |> elem(0),
        Float.parse(x8) |> elem(0),
        Float.parse(x9) |> elem(0),
        Float.parse(x10) |> elem(0),
        Float.parse(x11) |> elem(0),
        Float.parse(x12) |> elem(0)
      ]
    end)
  end

  def run do
    stream = read_csv()
    tensor = Enum.to_list(stream)
    |> Nx.tensor(type: {:f, 64}, names: [:x, :y])
    # IEx.Helpers.i(tensor)
    background = tensor[7][0]
    # IEx.Helpers.i(background) # 0.05290000140666962
    dbg(background)
    a = Nx.subtract(tensor, background)
    # dbg(a[7][0]) # 0.0
    standard = a[x: 0..6][y: 0..1]
    dbg((standard))
  end
end
