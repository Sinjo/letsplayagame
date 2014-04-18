class GamesInCommon
  def self.for_users(users)
    games_for_users = users.map(&:games).map { |json_response|
      response = JSON.parse(json_response)
      response["response"]["games"].map { |game|
        game.keep_if { |key, _|
          key == "appid" || key == "name"
        }
      }
    }

    games_for_users.reduce(&:&)
  end
end
