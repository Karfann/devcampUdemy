class PortifoliosController < ApplicationController
  before_action :set_portifolio, only: [:show, :edit, :update, :destroy]
  layout 'portifolio'
  access all: [:show, :index], user: {except: [:destroy, :new, :create, :edit, :update]}, site_admin: :all
  
  def index
      @portifolio_items = Portifolio.all
  end

  def new
      @portifolio_item = Portifolio.new
      3.times { @portifolio_item.technologies.build}
  end

  def create
    @portifolio_item = Portifolio.new(portifolio_params)

    respond_to do |format|
      if @portifolio_item.save
        format.html { redirect_to portifolios_path, notice: 'Portifolio was successfully created.' }
        format.json { render :show, status: :created, location: @portifolio_item }
      else
        format.html { render :new }
        format.json { render json: @portifolio_item.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
  end

  def update
      
      respond_to do |format|
        if @portifolio_item.update(portifolio_params)
          format.html { redirect_to portifolios_path, notice: 'The record successfully updated.' }
          format.json { render :show, status: :ok, location: @portifolio_item }
        else
          format.html { render :edit }
          format.json { render json: @portifolio_item.errors, status: :unprocessable_entity }
        end
      end
  end

  def destroy
    @portifolio_item.destroy
    respond_to do |format|
      format.html { redirect_to portifolios_url, notice: 'Portifolio was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def show
  end

  private

    def set_portifolio
      @portifolio_item = Portifolio.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def portifolio_params
        params.require(:portifolio).permit( :title, 
                                            :subtitle, 
                                            :body, 
                                            technologies_attributes: [:name]
                                          )
    end
end