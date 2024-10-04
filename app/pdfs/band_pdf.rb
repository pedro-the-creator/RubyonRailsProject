class BandPdf < ApplicationPdf
  def initialize(band)
    super() 
    @band = band
    write_header
    write_title("Band: #{@band.name}")
    write_band_info
    write_album_info
    write_footer
  end

  def write_band_info
    move_down 20
    text "Formation Year: #{@band.formation_year}", size: 12
    move_down 10
  end

  def write_album_info
    move_down 20
    text "Albums", size: 15, style: :bold
    move_down 10

    if @band.albums.any?
      # Monta os dados dos álbuns para a tabela
      album_data = [["Album Name", "Release Year"]] + @band.albums.map do |album|
        [album.name, album.release_year]
      end

      # Cria a tabela com os dados
      table(album_data, header: true, row_colors: ["DDDDDD", "FFFFFF"], cell_style: { borders: [:bottom] }) do
        row(0).font_style = :bold # Deixa o cabeçalho em negrito
        columns(1).align = :center # Centraliza a coluna de ano de lançamento
      end
    else
      text "No albums available", size: 12
    end
  end
end
