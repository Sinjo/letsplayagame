class GamesInCommon
  def self.for_users(users)
    game_ids = users.map(&:games).map { |json_response|
      response = JSON.parse(json_response)
      response["response"]["games"].map { |game_hash|
        game_hash["appid"]
      }
    }

    game_ids.reduce(&:&)
  end
end
