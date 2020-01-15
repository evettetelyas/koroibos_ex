defmodule KoroibosEx.EventsControllerTest do
	use KoroibosExWeb.ConnCase
	import KoroibosEx.Factory
  
	test "#index renders all sports and their events" do
		olympians = insert_pair(:olympian)
		events = insert_pair(:event)
		conn = get(build_conn(), "/api/v1/events")
    
	  assert json_response(conn, 200) == %{
			"data" => [%{
				"events" => ["Untz Untz"], 
				"sport" => "Beatboxing"}
				]}
	end

	test "#show renders all medalists for an event" do
		olympians = insert_pair(:olympian)
		events = insert_pair(:event)
		conn = get(build_conn(), "/api/v1/events/#{Enum.at(events, 0).id}/medalists")
    
	  assert json_response(conn, 200) == %{
			"data" => %{
				"event" => "Untz Untz", 
				"medalists" => [
					%{
						"name" => Enum.at(olympians, 1).name,
						"age" => 10,
						"team" => "USA",
						"medal" => "Gold"
					}]
				}
			}
	end

	test "error view renders message for events that do not exist" do
		olympians = insert_pair(:olympian)
		events = insert_pair(:event)
		conn = get(build_conn(), "/api/v1/events/9999999/medalists")
    
	  assert json_response(conn, 404) == %{
			"errors" => %{
				"detail" => "Not Found"
			}
		}
	end
end