defmodule HoursReport.UtilsTest do
  use ExUnit.Case

  alias HoursReport.Utils

  describe "to_name_atom/1" do
    test "returns the name as an atom" do
      name = "Joao"
      expected_atom_name = :joao

      assert expected_atom_name == Utils.to_name_atom(name)
    end
  end

  describe "to_month_atom/1" do
    for {month_number, expected_month_atom} <- [
          {1, :janeiro},
          {2, :fevereiro},
          {3, :marco},
          {4, :abril},
          {5, :maio},
          {6, :junho},
          {7, :julho},
          {8, :agosto},
          {9, :setembro},
          {10, :outubro},
          {11, :novembro},
          {12, :dezembro}
        ] do
      @params {month_number, expected_month_atom}

      test "when pass #{month_number}, returns \"#{expected_month_atom}\"" do
        {month_number, expected_month_atom} = @params

        assert expected_month_atom == Utils.to_month_atom(month_number)
      end
    end
  end
end
