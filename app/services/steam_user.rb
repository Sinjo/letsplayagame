class SteamUser
  GAME_LIST_ENDPOINT = "http://api.steampowered.com/IPlayerService/GetOwnedGames/v0001/?key=%s&steamid=%s&include_appinfo=1&format=json"
  RESOLVE_VANITY_URL_ENDPOINT = "http://api.steampowered.com/ISteamUser/ResolveVanityURL/v0001/?key=%s&vanityurl=%s&format=json"

  def self.from_community_id(id)
    new(id)
  end

  def self.from_vanity_id(id)
    community_id = JSON.parse(community_id_from_vanity_id(id))["response"]["steamid"]
    self.from_community_id(community_id)
  end

  def games
    url = GAME_LIST_ENDPOINT % [STEAM_CONFIG[:api_key], @id]
    RestClient.get(url)
  end

  private
  def initialize(id)
    @id = id
  end

  def self.community_id_from_vanity_id(id)
    url = RESOLVE_VANITY_URL_ENDPOINT % [STEAM_CONFIG[:api_key], id]
    RestClient.get(url)
  end
end
