defmodule KoroibosEx.StatsControllerTest do
	use KoroibosExWeb.ConnCase
	import KoroibosEx.Factory
  
	test "#show renders olympian stats" do
		olympians = insert_pair(:olympian)
		conn = get(build_conn(), "/api/v1/olympian_stats")
    
	  assert json_response(conn, 200) == %{
			"olympian_stats" => %{
					"average_age" => "10.0000000000000000",
					"average_weight" => %{
							"female_olympians" => "100.0000000000000000",
							"male_olympians" => nil,
							"unit" => "kg"
					},
					"total_competing_olympians" => 2
				}
			}
	end
end