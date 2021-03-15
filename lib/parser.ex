defmodule HoursReport.Parser do
  def parse_file(file_name) do
    "reports/#{file_name}"
    |> File.stream!()
    |> Stream.map(fn line -> parse_line(line) end)
  end

  defp parse_line(line) do
    line
    |> String.trim()
    |> String.split(",")
    |> map_line()
  end

  defp map_line([name, hours, day, month, year]) do
    hours = String.to_integer(hours)
    date = parse_date(year, month, day)

    [name, hours, date]
  end

  defp parse_date(year, month, day) do
    year = String.to_integer(year)
    month = String.to_integer(month)
    day = String.to_integer(day)

    {year, month, day}
  end
end
