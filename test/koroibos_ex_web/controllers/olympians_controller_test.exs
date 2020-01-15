defmodule KoroibosEx.OlympiansControllerTest do
	use KoroibosExWeb.ConnCase
	import KoroibosEx.Factory
  
	test "#index renders all olympians" do
		olympians = insert_pair(:olympian)
		conn = get(build_conn(), "/api/v1/olympians")
    
	  assert json_response(conn, 200) == %{
		"data" => [
			%{
				"name" => Enum.at(olympians, 0).name,
				"age" => Enum.at(olympians, 0).age,
				"sport" => Enum.at(olympians, 0).sport,
				"team" => Enum.at(olympians, 0).team,
				"total_medals_won" => 0
			},
			%{
				"name" => Enum.at(olympians, 1).name,
				"age" => Enum.at(olympians, 1).age,
				"sport" => Enum.at(olympians, 1).sport,
				"team" => Enum.at(olympians, 1).team,
				"total_medals_won" => 1
			}
		]
	}
	end

	test "#index with age param renders youngest olympian" do
		olympians = insert_pair(:olympian)
		conn = get(build_conn(), "/api/v1/olympians?age=youngest")
    
	  assert json_response(conn, 200) == %{
			"data" => [%{
					"name" => Enum.at(olympians, 0).name,
					"age" => Enum.at(olympians, 0).age,
					"sport" => Enum.at(olympians, 0).sport,
					"team" => Enum.at(olympians, 0).team,
					"total_medals_won" => 0
				}]
			}
	end
  
	test "#index with age param renders oldest olympian" do
		olympians = insert_pair(:olympian)
		conn = get(build_conn(), "/api/v1/olympians?age=oldest")
    
	  assert json_response(conn, 200) == %{
			"data" => [%{
					"name" => Enum.at(olympians, 1).name,
					"age" => Enum.at(olympians, 1).age,
					"sport" => Enum.at(olympians, 1).sport,
					"team" => Enum.at(olympians, 1).team,
					"total_medals_won" => 1
				}]
			}
	end
end