require 'spec_helper'

describe Kuhsaft do

  describe 'Dummy' do
    it 'should be a valid app' do
      ::Rails.application.should be_a(Dummy::Application)
    end
  end

  describe Kuhsaft::DashboardController do

    it 'creates a route to /admin' do
      { :get => "/admin" }.should route_to("dashboard#index")
      #visit '/admin'
    end

    it 'shows that i am in kuhsaft'

  end

end
