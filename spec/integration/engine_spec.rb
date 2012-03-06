require 'spec_helper'

describe 'Kuhsaft' do

  include Capybara

  describe 'Dummy' do
    it 'should be a valid app' do
      ::Rails.application.should be_a(Dummy::Application)
    end
  end

  context 'when the engine is mounted on /admin' do

    it 'creates a route to /admin' do
      get("/admin").should route_to("dashboard#index")
    end

    it 'shows that i am in kuhsaft'

  end

end
