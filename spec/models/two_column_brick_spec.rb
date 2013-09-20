require 'spec_helper'

describe Kuhsaft::TwoColumnBrick do

  let :two_column_brick do
    Kuhsaft::TwoColumnBrick.new
  end

  describe '#user_can_add_childs?' do
    it 'returns false' do
      two_column_brick.user_can_add_childs?.should be_false
    end
  end

  describe '#user_can_delete?' do
    it 'returns true' do
      two_column_brick.user_can_delete?.should be_true
    end
  end

  describe '#user_can_save?' do
    it 'returns true' do
      two_column_brick.user_can_save?.should be_true
    end
  end

  describe '#renders_own_childs?' do
    it 'returns true' do
      two_column_brick.renders_own_childs?.should be_true
    end
  end

  describe '#partitioning' do
    context 'when no partition is set' do
      it 'returns 0 (50/50)' do
        two_column_brick.partitioning.should be(0)
      end
    end

    context 'when the partition is set' do
      it 'returns the value' do
        two_column_brick.partitioning = 1
        two_column_brick.partitioning.should be(1)
      end
    end
  end

  describe '.partitionings' do
    it 'returns the 3 default partitions' do
      Kuhsaft::TwoColumnBrick.partitionings.should have(3).items
    end
  end

  describe '#create' do
    it 'creates two single columns as childs' do
      two_column_brick.save
      two_column_brick.bricks.should be_all { |brick| brick.should be_a(Kuhsaft::ColumnBrick) }
    end
  end

  describe '#bricks' do
    it 'can have childs' do
      two_column_brick.should respond_to(:bricks)
    end
  end

  describe '#to_style_class' do
    it 'adds the row class to the default styles' do
      Kuhsaft::TwoColumnBrick.new.to_style_class.should == 'kuhsaft-two-column-brick row-fluid'
    end
  end

  describe '#add_columns' do
    it 'sets the position of the first column brick to 1' do
      Kuhsaft::TwoColumnBrick.new.send(:add_columns).to_a.first.position.should == 1
    end

    it 'sets the position of the second column brick to 2' do
      Kuhsaft::TwoColumnBrick.new.send(:add_columns).to_a.second.position.should == 2
    end
  end
end
