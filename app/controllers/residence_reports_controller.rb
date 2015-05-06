class ResidenceReportsController < ProtectedController
  before_action :get_client

  def index
    @residence_reports = ResidenceReport.all
    @residence_reports = @residence_reports.where(client_id: @client.id) if @client
  end

  def new
    @residence_report = @client.residence_reports.new
  end

  def create
    @residence_report = @client.residence_reports.new(residence_report_params)
    if @residence_report.save
      redirect_to [@client, @residence_report], notice: "Report created"
    end
  end

  def show
    @residence_report = @client.residence_reports.find(params[:id])
    respond_to do |format|
    format.html
    format.pdf do
      pdf = ResidenceReportPdf.new(@residence_report, view_context)
      send_data pdf.render, filename: "residence_report_#{@residence_report.id}.pdf",
                            type: "application/pdf",
                            disposition: "inline"
    end
  end
  end

  private

  def get_client
    @client = current_company.clients.find(params[:client_id]) if params[:client_id]
  end

  def residence_report_params
    params.require(:residence_report).permit(:address, :zipcode, :city, :country_code, :unit, :construction_year, :report_date, :energy_performance, :thermal_insulation)
  end
end
