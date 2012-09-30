require 'rails/generators'
require 'rails/generators/rails/app/app_generator'

module Kuhsaft
  class AppGenerator < Rails::Generators::AppGenerator
    def finish_template
      super
    end

    protected

    def get_builder_class
      Kuhsaft::AppBuilder
    end
  end
end

