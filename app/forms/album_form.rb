class AlbumForm
    include ActiveModel::Model
  
    attr_accessor :album_name, :release_year, :band_name
    attr_reader :album
  
    def save
      band = Band.find_or_create_by(name: band_name)
      @album = Album.new(name: album_name, release_year: release_year, band: band)
      
      if @album.save
        true
      else
        false
      end
    end
  end
  