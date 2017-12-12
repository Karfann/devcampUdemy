class PortifoliosController < ApplicationController

    def index
        @portifolio_items = Portifolio.all
    end
end
