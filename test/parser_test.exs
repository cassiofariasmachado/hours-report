defmodule HoursReport.ParserTest do
  use ExUnit.Case

  alias HoursReport.Parser

  describe "parse_file/1" do
    test "parse the file" do
      file_name = "test_report.csv"

      response =
        file_name
        |> Parser.parse_file()
        |> Enum.map(& &1)

      expected_response = [
        ["Daniele", 7, {2018, 4, 29}],
        ["Mayk", 4, {2019, 12, 9}],
        ["Daniele", 5, {2016, 12, 27}],
        ["Mayk", 1, {2017, 12, 2}],
        ["Giuliano", 3, {2017, 2, 13}],
        ["Cleiton", 1, {2020, 6, 22}],
        ["Giuliano", 6, {2019, 2, 18}],
        ["Jakeliny", 8, {2017, 7, 18}],
        ["Joseph", 3, {2017, 3, 17}],
        ["Jakeliny", 6, {2019, 3, 23}],
        ["Cleiton", 3, {2016, 6, 20}],
        ["Daniele", 5, {2016, 5, 1}],
        ["Giuliano", 1, {2020, 4, 2}],
        ["Daniele", 3, {2017, 5, 5}],
        ["Daniele", 1, {2020, 6, 26}],
        ["Diego", 3, {2016, 9, 11}],
        ["Mayk", 7, {2017, 7, 28}],
        ["Mayk", 7, {2016, 9, 3}],
        ["Danilo", 6, {2019, 2, 28}],
        ["Diego", 4, {2017, 8, 15}]
      ]

      assert expected_response == response
    end
  end
end
