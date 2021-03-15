defmodule HoursReport do
  alias HoursReport.Parser
  alias HoursReport.Utils

  def generate_report(file_name) do
    file_name
    |> Parser.parse_file()
    |> Enum.reduce(initial_report(), &sum_hours/2)
  end

  def generate_report_parallel(file_names) do
    file_names
    |> Task.async_stream(&generate_report/1)
    |> Enum.reduce(initial_report(), &merge_reports/2)
  end

  defp sum_hours(line, report) do
    report
    |> sum_all_hours(line)
    |> sum_hours_per_month(line)
    |> sum_hours_per_year(line)
  end

  defp sum_all_hours(%{all_hours: all_hours} = report, [name, hours, _date]) do
    name = Utils.to_name_atom(name)
    sum_hours = hours + Map.get(all_hours, name, 0)
    all_hours = Map.put(all_hours, name, sum_hours)

    %{report | all_hours: all_hours}
  end

  defp sum_hours_per_month(
         %{hours_per_month: hours_per_month} = report,
         [name, hours, {_year, month, _day}]
       ) do
    name = Utils.to_name_atom(name)
    hours_per_month_of_user = Map.get(hours_per_month, name, %{})

    hours_per_month_of_user =
      hours_per_month_of_user
      |> sum_hours_per_month_of_user(hours, month)

    hours_per_month = Map.put(hours_per_month, name, hours_per_month_of_user)

    %{report | hours_per_month: hours_per_month}
  end

  defp sum_hours_per_month_of_user(
         hours_per_month_of_user,
         hours,
         month
       ) do
    month = Utils.to_month_atom(month)
    sum_month_hours = hours + Map.get(hours_per_month_of_user, month, 0)

    Map.put(hours_per_month_of_user, month, sum_month_hours)
  end

  defp sum_hours_per_year(
         %{hours_per_year: hours_per_year} = report,
         [name, hours, {year, _month, _day}]
       ) do
    name = Utils.to_name_atom(name)
    hours_per_year_of_user = Map.get(hours_per_year, name, %{})

    hours_per_year_of_user =
      hours_per_year_of_user
      |> sum_hours_per_year_of_user(hours, year)

    hours_per_year = Map.put(hours_per_year, name, hours_per_year_of_user)

    %{report | hours_per_year: hours_per_year}
  end

  defp sum_hours_per_year_of_user(hours_per_year_of_user, hours, year) do
    sum_year_hours = hours + Map.get(hours_per_year_of_user, year, 0)

    Map.put(hours_per_year_of_user, year, sum_year_hours)
  end

  defp merge_reports(
         {:ok, report_one},
         report_two
       ) do
    merge_map(report_one, report_two)
  end

  defp merge_map(map_one, map_two) when is_map(map_one) and is_map(map_two) do
    Map.merge(map_one, map_two, &merge_map_values/3)
  end

  defp merge_map_values(_key, value_one, value_two)
       when is_integer(value_one) and is_integer(value_two) do
    value_one + value_two
  end

  defp merge_map_values(_key, value_one, value_two)
       when is_map(value_one) and is_map(value_two) do
    merge_map(value_one, value_two)
  end

  defp build_report(all_hours, hours_per_month, hours_per_year) do
    %{all_hours: all_hours, hours_per_month: hours_per_month, hours_per_year: hours_per_year}
  end

  defp initial_report(), do: build_report(%{}, %{}, %{})
end
