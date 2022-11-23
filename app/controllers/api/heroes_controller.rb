class Api::HeroesController < ApplicationController
  include Authenticable

  before_action :authenticate_with_token, except: [:index, :show] 
  skip_before_action :verify_authenticity_token
  before_action :set_hero, only: %i[ show edit update destroy ]

  # GET /heroes or /heroes.json
  def index
    @heroes = Hero.search(params[:term]).organizar_por_nome 
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
    @hero = Hero.create!(hero_params)

    render json: @hero, status: :created
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
