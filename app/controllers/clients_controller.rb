class ClientsController < ProtectedController
  def index
    @clients = current_company.clients
  end

  def new
    @client = current_company.clients.new
  end

  def create
    @client = current_company.clients.new(client_params)
    if @client.save
      redirect_to clients_path(), notice: "Client created"
    end
  end

  private

  def client_params
    params.require(:client).permit(:fullname, :address, :zipcode, :city, :country_code)
  end

end
