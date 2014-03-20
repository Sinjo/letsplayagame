class SteamUser
  GAME_LIST_ENDPOINT = "http://api.steampowered.com/IPlayerService/GetOwnedGames/v0001/?key=%s&steamid=%s&format=json"

  def initialize(id)
    @id = id
  end

  def games
    url = GAME_LIST_ENDPOINT % [STEAM_CONFIG[:api_key], @id]
    RestClient.get(url)
  end
end
