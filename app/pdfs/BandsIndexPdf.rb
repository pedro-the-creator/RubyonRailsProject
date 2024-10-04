# app/pdfs/bands_index_pdf.rb
class BandsIndexPdf < ApplicationPdf
  def initialize(bands)
    super()
    @bands = bands
    write_header
    write_title("List of Bands")
    write_band_list
    write_footer
  end

  def write_band_list
    move_down 20
    @bands.each do |band|
      text "Band: #{band.name} (Formed: #{band.formation_year})", size: 12
      move_down 10
    end
  end
end