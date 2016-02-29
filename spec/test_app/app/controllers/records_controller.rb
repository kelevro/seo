class RecordsController < ApplicationController
  def index
    @records = Seo::Record.all
  end
end
