  class Seo::PagesController < Seo::ApplicationController
    add_breadcrumb 'Pages', :pages_path

    def index
      @pages = Seo::Page.all
    end

    def edit
      @page = Seo::Page.find(params[:id])
      @page.create_seo
      @seo = @page.seo_records.first
      add_breadcrumb @page.name
    end

    def update
      @page = Seo::Page.find(params[:id])
      if @page.update(page_params)
        flash[:success] = 'Page saved successfully'
        redirect_to action: :edit
      else
        render :edit
      end
    end

    def destroy
      Seo::Page.find(params[:id]).destroy
      redirect_to action: :index
    end

    private

    def page_params
      seo = Seo::Record.globalize_attribute_names + [:id]
      params.require(:page).permit(:name, seo_records_attributes: seo)
    end
  end
