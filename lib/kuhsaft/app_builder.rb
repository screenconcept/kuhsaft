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
  end
end

