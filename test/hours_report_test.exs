defmodule HoursReportTest do
  use ExUnit.Case

  describe "generate_report/1" do
    test "generates the report" do
      file_name = "test_report.csv"

      response = HoursReport.generate_report(file_name)

      expected_response = %{
        all_hours: %{
          cleiton: 4,
          daniele: 21,
          danilo: 6,
          diego: 7,
          giuliano: 10,
          jakeliny: 14,
          joseph: 3,
          mayk: 19
        },
        hours_per_month: %{
          cleiton: %{
            junho: 4
          },
          daniele: %{
            abril: 7,
            dezembro: 5,
            junho: 1,
            maio: 8
          },
          danilo: %{
            fevereiro: 6
          },
          diego: %{
            agosto: 4,
            setembro: 3
          },
          giuliano: %{
            abril: 1,
            fevereiro: 9
          },
          jakeliny: %{
            julho: 8,
            marco: 6
          },
          joseph: %{
            marco: 3
          },
          mayk: %{
            dezembro: 5,
            julho: 7,
            setembro: 7
          }
        },
        hours_per_year: %{
          cleiton: %{
            2016 => 3,
            2020 => 1
          },
          daniele: %{
            2016 => 10,
            2017 => 3,
            2018 => 7,
            2020 => 1
          },
          danilo: %{
            2019 => 6
          },
          diego: %{
            2016 => 3,
            2017 => 4
          },
          giuliano: %{
            2017 => 3,
            2019 => 6,
            2020 => 1
          },
          jakeliny: %{
            2017 => 8,
            2019 => 6
          },
          joseph: %{
            2017 => 3
          },
          mayk: %{
            2016 => 7,
            2017 => 8,
            2019 => 4
          }
        }
      }

      assert expected_response == response
    end
  end
end
