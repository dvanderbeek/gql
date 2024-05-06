class Crypto::TokensController < ApplicationController
  before_action :set_crypto_token, only: %i[ show edit update destroy ]

  # GET /crypto/tokens or /crypto/tokens.json
  def index
    @crypto_tokens = Crypto::Token.all
  end

  # GET /crypto/tokens/1 or /crypto/tokens/1.json
  def show
  end

  # GET /crypto/tokens/new
  def new
    @crypto_token = Crypto::Token.new
  end

  # GET /crypto/tokens/1/edit
  def edit
  end

  # POST /crypto/tokens or /crypto/tokens.json
  def create
    success = lambda do |crypto_token|
      respond_to do |format|
        format.html { redirect_to crypto_token_url(@crypto_token), notice: "Token was successfully created." }
        format.json { render :show, status: :created, location: @crypto_token }
      end
    end

    failure = lambda do |crypto_token|
      respond_to do |format|
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @crypto_token.errors, status: :unprocessable_entity }
      end
    end

    Crypto.create_token(crypto_token_params, success, failure) do |crypto_token|
      @crypto_token = crypto_token
    end
  end

  # PATCH/PUT /crypto/tokens/1 or /crypto/tokens/1.json
  def update
    respond_to do |format|
      if @crypto_token.update(crypto_token_params)
        format.html { redirect_to crypto_token_url(@crypto_token), notice: "Token was successfully updated." }
        format.json { render :show, status: :ok, location: @crypto_token }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @crypto_token.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /crypto/tokens/1 or /crypto/tokens/1.json
  def destroy
    @crypto_token.destroy!

    respond_to do |format|
      format.html { redirect_to crypto_tokens_url, notice: "Token was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_crypto_token
      @crypto_token = Crypto::Token.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def crypto_token_params
      params.require(:crypto_token).permit(:ticker, :protocol)
    end
end
