require_relative "../queries/bands/index_query"

class BandsReportsController < ApplicationController
  before_action :set_sorter

  def generate_report(filename, data, headers, title)
    respond_to do |format|
      format.pdf do
        pdf = BasePdf.new(data: data, headers: headers, title: title)
        send_data(pdf.render, filename: "#{filename}.pdf", type: 'application/pdf', disposition: "inline")
      end
    end
  end

  def set_sorter
    @sorter = params[:option] || 'name-asc'  # Altere para uma opção válida
  end

  def bands_report
    data = BandsQuery.sort_data(@sorter)
    headers = ['Band Name', 'Genre', 'Members']  # Ajuste conforme necessário
    title = "Bands Report"
    generate_report("bands-report", data, headers, title)
  end
end