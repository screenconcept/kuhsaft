require 'spec_helper'
require_relative '../../lib/kuhsaft/page_tree'
require_relative '../../app/models/kuhsaft/page'

# TODO: THESE SPECS ONLY WORK WHEN THE FULL SUITE IS RUN. FIX THAT!

module Kuhsaft
  describe PageTree do
    let(:page_tree) do { '0' => { 'id' => '1', 'children' => { '0' => { 'id' => '2' } } },
                         '1' => { 'id' => '3' } }end

    before :each do
      @page1 = FactoryGirl.create(:page, id: 1, position: 10)
      @page2 = FactoryGirl.create(:page, id: 2, position: 10)
      @page3 = FactoryGirl.create(:page, id: 3, position: 10)
    end

    describe 'update' do
      it 'sets the correct position of the root nodes' do
        PageTree.update(page_tree)
        @page1.reload.position.should == 0
        @page2.reload.position.should == 0
        @page3.reload.position.should == 1
      end

      it 'sets the correct parent attribute for the nodes' do
        PageTree.update(page_tree)
        @page1.reload.parent_id.should be_nil
        @page2.reload.parent_id.should == 1
        @page3.reload.parent_id.should be nil
      end
    end
  end
end
