module Seo
  class PagesController < ApplicationController
    add_breadcrumb 'Pages', :pages_path
    skip_authorization_check if self.respond_to?(:skip_authorization_check)

    def index
      @pages = Page.all
    end

    def edit
      @page = Page.find(params[:id])
      add_breadcrumb @page.name
    end

    def update
      @page = Page.find(params[:id])
      if @page.update(page_params)
        flash[:success] = 'Page saved successfully'
        redirect_to action: :edit
      else
        render :edit
      end
    end

    def destroy
      Page.find(params[:id]).destroy
      redirect_to action: :index
    end

    private

    def page_params
      seo = Seo::Record.globalize_attribute_names + [:id]
      params.require(:page).permit(:name, seo_attributes: seo)
    end
  end
end
