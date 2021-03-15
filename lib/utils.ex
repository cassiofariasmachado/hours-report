defmodule HoursReport.Utils do
  def to_name_atom(name) do
    name
    |> String.trim()
    |> String.downcase()
    |> String.to_atom()
  end

  def to_month_atom(month) do
    case month do
      1 -> :janeiro
      2 -> :fevereiro
      3 -> :marco
      4 -> :abril
      5 -> :maio
      6 -> :junho
      7 -> :julho
      8 -> :agosto
      9 -> :setembro
      10 -> :outubro
      11 -> :novembro
      12 -> :dezembro
    end
  end
end
