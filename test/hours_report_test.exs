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

  describe "generate_report_parallel/1" do
    test "generates the report" do
      file_names = ["test_report.csv", "test_report.csv"]

      response = HoursReport.generate_report_parallel(file_names)

      expected_response = %{
        all_hours: %{
          cleiton: 8,
          daniele: 42,
          danilo: 12,
          diego: 14,
          giuliano: 20,
          jakeliny: 28,
          joseph: 6,
          mayk: 38
        },
        hours_per_month: %{
          cleiton: %{
            junho: 8
          },
          daniele: %{
            abril: 14,
            dezembro: 10,
            junho: 2,
            maio: 16
          },
          danilo: %{
            fevereiro: 12
          },
          diego: %{
            agosto: 8,
            setembro: 6
          },
          giuliano: %{
            abril: 2,
            fevereiro: 18
          },
          jakeliny: %{
            julho: 16,
            marco: 12
          },
          joseph: %{
            marco: 6
          },
          mayk: %{
            dezembro: 10,
            julho: 14,
            setembro: 14
          }
        },
        hours_per_year: %{
          cleiton: %{
            2016 => 6,
            2020 => 2
          },
          daniele: %{
            2016 => 20,
            2017 => 6,
            2018 => 14,
            2020 => 2
          },
          danilo: %{
            2019 => 12
          },
          diego: %{
            2016 => 6,
            2017 => 8
          },
          giuliano: %{
            2017 => 6,
            2019 => 12,
            2020 => 2
          },
          jakeliny: %{
            2017 => 16,
            2019 => 12
          },
          joseph: %{
            2017 => 6
          },
          mayk: %{
            2016 => 14,
            2017 => 16,
            2019 => 8
          }
        }
      }

      assert expected_response == response
    end
  end
end
