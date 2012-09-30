require 'pry'
module Kuhsaft
  class AppBuilder < Rails::AppBuilder
    def readme
      config = {
        application_name: ask('What is the name of the App?'),
        maintainer:       ask('Who is the maintainer of the App?'),
        consultant:       ask('Who is the primary consultant for the App?')
      }

      template 'README.md.erb', 'README.md', config
    end

    def remove_public_index
      remove_file 'public/index.html'
    end

    def remove_rails_logo_image
      remove_file 'app/assets/images/rails.png'
    end
  end
end

