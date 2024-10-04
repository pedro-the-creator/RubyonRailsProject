require_relative "../queries/bands/index_query"  # Ajuste o caminho conforme necessário
require_relative "../pdfs/base_pdf"

class ReportsController < ApplicationController
  before_action :set_sorter
  
  # Método para gerar relatórios em PDF
  def generate_report(filename, data, headers, title)
    respond_to do |format|
      format.pdf do
        pdf = BasePdf.new(data: data, headers: headers, title: title)
        pdf.render_document  # Caso você precise desse método
        send_data(
          pdf.render,  # Garante que pdf.render retorna o conteúdo do PDF
          filename: "#{filename}.pdf",
          type: 'application/pdf',
          disposition: 'inline'
        )
      end
    end
  end

  # Método para definir o sorter
  def set_sorter
    @sorter = params[:option] || 'name-asc'  # Define um valor padrão para o sorter
  end

  # Ação para gerar o relatório de bandas
  def bands_report
    data = BandsQuery.sort_data(@sorter)  # Chama a consulta para obter os dados
    headers = ['Band Name', 'Genre', 'Members']  # Ajuste os cabeçalhos conforme necessário
    title = "Bands Report"
    generate_report("bands-report", data, headers, title)
  end
end
