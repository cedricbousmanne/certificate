class ResidenceReportsController < ProtectedController
  before_action :get_client
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
  end

  private

  def get_client
    @client = current_company.clients.find(params[:client_id])
  end

  def residence_report_params
    params.require(:residence_report).permit(:address, :zipcode, :city, :country_code, :unit, :construction_year, :report_date, :energy_performance, :thermal_insulation)
  end
end
