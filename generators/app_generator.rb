require 'rails/generators'
require 'rails/generators/rails/app/app_generator'

module Kuhsaft
  class AppGenerator < Rails::Generators::AppGenerator
    def finish_template
      invoke :kuhsaft_customization
      super
    end

    def kuhsaft_customization
      invoke :remove_files_we_dont_need
      invoke :outro
    end

    def remove_files_we_dont_need
      build :remove_public_index
      build :remove_rails_logo_image
    end

    def outro
      say 'Application is ready!'
    end

    protected

    def get_builder_class
      Kuhsaft::AppBuilder
    end
  end
end

