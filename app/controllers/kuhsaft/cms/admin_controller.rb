module Kuhsaft
  module Cms
    class AdminController < ApplicationController
      respond_to :html
      layout 'kuhsaft/cms/application'
      before_filter :set_content_locale
      before_filter :authenticate_admin!

      def set_content_locale
        if params[:content_locale].present?
          I18n.locale = params[:content_locale]
        end
      end

      def after_sign_in_path_for(resource)
        kuhsaft.pages_path
      end
    end
  end
end
