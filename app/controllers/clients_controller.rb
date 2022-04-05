class ClientsController < ApplicationController
  before_action :set_client, only: %i[ show edit update destroy ]
  before_action :set_professions, only: %i[new edit show]

  # GET /clients or /clients.json
  def index

    @q = Client.ransack(params[:q])
    @clients = @q.result(distinct: true).order(:name).page params[:page]
    end

  # GET /clients/1 or /clients/1.json
  def show
    @client = Client.find(params[:id])
  end

  # GET /clients/new
  def new
    @client = Client.new
  end

  # GET /clients/1/edit
  def edit
  end

  # POST /clients or /clients.json
  def create
    @client = Client.new(client_params)
    @client_professions = Profession.where(id: params[:client]["profession"])
    respond_to do |format|
      if @client.save
        @client.professions << @client_professions

        format.html { redirect_to client_url(@client), notice: "Client was successfully created." }
        format.json { render :show, status: :created, location: @client }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @client.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /clients/1 or /clients/1.json
  def update
    respond_to do |format|
      @client.professions.delete_all
      @client_professions = Profession.where(id: params[:client]["profession"])
      @client.professions << @client_professions

      if @client.update(client_params)
        format.html { redirect_to client_url(@client), notice: "Client was successfully updated." }
        format.json { render :show, status: :ok, location: @client }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @client.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /clients/1 or /clients/1.json
  def destroy
    @client.destroy
    respond_to do |format|
      format.html { redirect_to clients_url, notice: "Client was successfully destroyed." }
      format.json { head :no_content }
    end
  end
  def export_csv
    @client = Client.all
    send_data @client.to_csv, filename: "client-#{DateTime.now.strftime("%d%m%Y%H%M")}.csv"
  end
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_client
      @client = Client.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def client_params
      params.require(:client).permit(:name, :email)
    end

  def set_professions
    @professions = Profession.all.pluck(:name,:id)
  end

end
