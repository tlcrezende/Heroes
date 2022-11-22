class Api::HeroesController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :set_hero, only: %i[ show edit update destroy ]

  # GET /heroes or /heroes.json
  def index
    @heroes = Hero.all.organizar_por_nome
    render json: @heroes
  end

  # GET /heroes/1 or /heroes/1.json
  def show
    render json: @hero
  end

  # GET /heroes/new
  def new
    @hero = Hero.new
    render json: @hero
  end

  # GET /heroes/1/edit
  def edit
  end

  # POST /heroes or /heroes.json
  def create
    @hero = Hero.new(hero_params)

    respond_to do |format|
      if @hero.save
        format.html { redirect_to hero_url(@hero), notice: "Hero was successfully created." }
        format.json { render :show, status: :created, location: @hero }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @hero.errors, status: :unprocessable_entity }
      end
    end
    render json: @hero
  end

  # PATCH/PUT /heroes/1 or /heroes/1.json
  def update

    @hero.update(hero_params)
    render json: @hero
  end

  # DELETE /heroes/1 or /heroes/1.json
  def destroy
    @hero.destroy
    render json: @hero
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_hero
      @hero = Hero.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def hero_params
      params.require(:hero).permit(:name)
    end
end
