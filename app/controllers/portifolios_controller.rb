class PortifoliosController < ApplicationController

    def index
        @portifolio_items = Portifolio.all
    end

    def new
        @portifolio_item = Portifolio.new
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

      private

        # Never trust parameters from the scary internet, only allow the white list through.
        def portifolio_params
            params.require(:portifolio).permit(:title, :subtitle, :body)
        end
end
