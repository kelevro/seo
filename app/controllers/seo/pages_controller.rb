  class Seo::PagesController < Seo::ApplicationController
    add_breadcrumb 'Pages', :pages_path

    def index
      authorize! :update, :seo_pages
      @pages = Seo::Page.all
    end

    def edit
      authorize! :update, :seo_pages
      @page = Seo::Page.find(params[:id])
      add_breadcrumb @page.name
    end

    def update
      authorize! :update, :seo_pages
      @page = Seo::Page.find(params[:id])
      if @page.update(page_params)
        flash[:success] = 'Page saved successfully'
        redirect_to action: :edit
      else
        render :edit
      end
    end

    def destroy
      authorize! :destroy, :seo_pages
      Seo::Page.find(params[:id]).destroy
      redirect_to action: :index
    end

    private

    def page_params
      seo = Seo::Record.globalize_attribute_names + [:id]
      params.require(:page).permit(:name, seo_attributes: seo)
    end
  end
