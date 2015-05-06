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
      redirect_to clients_path(), notice: "Le client a été créé"
    end
  end

  def edit
    @client = current_company.clients.find(params[:id])
  end

  def update
    @client = current_company.clients.find(params[:id])
    if @client.update_attributes(client_params)
      redirect_to clients_path(), notice: "Le client a été modifié"
    end
  end

  private

  def client_params
    params.require(:client).permit(:fullname, :address, :zipcode, :city, :country_code)
  end

end
