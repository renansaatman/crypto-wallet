class CoinsController < ApplicationController
  # layout "adm"
  before_action :set_coin, only: %i[ show edit update destroy ]
  before_action :set_mining_type_options, only: %i[ new create edit update ]

  # GET /coins or /coins.json
  def index
    @coins = Coin.all
  end

  # GET /coins/1 or /coins/1.json
  def show
  end

  # GET /coins/new
  def new
    @coin = Coin.new
  end

  # GET /coins/1/edit
  def edit
  end

  # POST /coins or /coins.json
  def create
    @coin = Coin.new(coin_params)

    respond_to do |format|
      if @coin.save
        format.html { redirect_to @coin, notice: "Coin was successfully created." }
        format.json { render :show, status: :created, location: @coin }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @coin.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /coins/1 or /coins/1.json
  def update
    respond_to do |format|
      if @coin.update(coin_params)
        format.html { redirect_to @coin, notice: "Coin was successfully updated." }
        format.json { render :show, status: :ok, location: @coin }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @coin.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /coins/1 or /coins/1.json
  def destroy
    @coin.destroy!

    respond_to do |format|
      format.html { redirect_to coins_path, status: :see_other, notice: "Coin was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

    def set_mining_type_options
      @mining_type_options = MiningType.all.pluck(:description, :id)
    end
    # Use callbacks to share common setup or constraints between actions.
    def set_coin
      @coin = Coin.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def coin_params
      params.expect(coin: [ :description, :acronym, :url_image, :mining_type_id ])
    end
end
