module BandsQuery
    extend self
  
    def sort_data(sorter)
      filters = {
        "name-asc" => -> { get_query("bands.name ASC") },
        "name-desc" => -> { get_query("bands.name DESC") },
        "genre-asc" => -> { get_query("bands.genre ASC") },
        "genre-desc" => -> { get_query("bands.genre DESC") },
        "user-id-asc" => -> { get_query("users.id ASC") },
        "user-id-desc" => -> { get_query("users.id DESC") }
      }
  
      filters.fetch(sorter, -> { get_query }).call
    end
  
    def get_query(sorter = "users.id ASC")
      @query = User
                 .joins(:favorites) # Certifique-se que a relação favorites existe
                 .joins(favorites: :band)
                 .select(
                   "users.id AS user_id",
                   "users.name AS user_name",
                   "bands.id AS band_id",
                   "bands.name AS band_name",
                   "bands.genre AS genre"
                 )
                 .order(sorter)
  
      @query.map(&:attributes).map do |entry|
        entry.slice("user_id", "user_name", "band_id", "band_name", "genre").values
      end
    end
  end
  