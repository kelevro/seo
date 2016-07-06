  class Seo::PagesController < Seo::ApplicationController
    add_breadcrumb 'Pages', :pages_path

    def index
      @pages = Seo::Page.all
    end

    def edit
      @page = Seo::Page.find(params[:id])
      @page.create_seo
      load_seo(@page)
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
      seo_params = [translations_attributes: [:id, :locale, :title, :description,
                                              :keywords, :seo_text]]
      params.require(:page).permit(:name, seo_records_attributes: [:id, *seo_params])
    end
  end
