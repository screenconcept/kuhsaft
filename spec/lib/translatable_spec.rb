require 'spec_helper'

describe Kuhsaft::Translatable do

  class Demo
    include Kuhsaft::Translatable
    translate :name
  end

  let :model do
    Demo.new
  end

  describe 'normal locale' do
    before do
      I18n.available_locales = [:en, :de]
      I18n.locale = :en
    end

    after do
      I18n.available_locales = [:en]
      I18n.locale = :en
    end

    describe '.translate' do
      it 'defines a getter for each attribute' do
        model.should respond_to(:name)
      end

      it 'defines a setter for each attributes' do
        model.should respond_to(:name=)
      end
    end

    describe '.locale_attr' do
      it 'returns a suffixed attribute name' do
        Demo.locale_attr('text').should == 'text_en'
      end
    end

    describe '#locale_attr' do
      it 'returns a suffixed attribute name' do
        model.locale_attr('text').should == 'text_en'
      end
    end

    describe 'translated attributes' do
      it 'delegates the getter to the suffixed attribute' do
        model.should_receive(:name_en).and_return('John')
        model.name.should == 'John'
      end

      it 'delegates the setter to the suffixed attribute' do
        model.should_receive(:name_en=).with('Johnny')
        model.name = 'Johnny'
      end

      context 'dynamic methods' do
        it 'delegates boolean accessors' do
          model.should_receive(:name_en?)
          model.name?
        end

        it 'delegates simple dynamic finders' do
          Demo.should_receive(:find_by_name_en).with('Max')
          Demo.find_by_name('Max')
        end
      end

      context 'when changing the locale' do
        before do
          I18n.locale = :de
        end

        it 'delegates the getter to current locale' do
          model.should_receive(:name_de).and_return('Johannes')
          model.name.should == 'Johannes'
        end

        it 'delegates the getter to current locale' do
          model.should_receive(:name_de=).with('Johannes')
          model.name = 'Johannes'
        end
      end
    end
  end

  describe 'country specific locale' do
    before do
      I18n.available_locales = [:de, 'de-CH']
      I18n.locale = 'de-CH'
    end

    after do
      I18n.available_locales = [:en]
      I18n.locale = :en
    end

    describe '.translate' do
      it 'defines a getter for each attribute' do
        model.should respond_to(:name)
      end

      it 'defines a setter for each attributes' do
        model.should respond_to(:name=)
      end
    end

    describe '.locale_attr' do
      it 'returns a suffixed attribute name' do
        Demo.locale_attr('text').should == 'text_de_ch'
      end
    end

    describe '#locale_attr' do
      it 'returns a suffixed attribute name' do
        model.locale_attr('text').should == 'text_de_ch'
      end
    end

    describe 'translated attributes' do
      it 'delegates the getter to the suffixed attribute' do
        model.should_receive(:name_de_ch).and_return('John')
        model.name.should == 'John'
      end

      it 'delegates the setter to the suffixed attribute' do
        model.should_receive(:name_de_ch=).with('Johnny')
        model.name = 'Johnny'
      end

      context 'dynamic methods' do
        it 'delegates boolean accessors' do
          model.should_receive(:name_de_ch?)
          model.name?
        end

        it 'delegates simple dynamic finders' do
          Demo.should_receive(:find_by_name_de_ch).with('Max')
          Demo.find_by_name('Max')
        end
      end

      context 'when changing the locale' do
        before do
          I18n.locale = :de
        end

        it 'delegates the getter to current locale' do
          model.should_receive(:name_de).and_return('Johannes')
          model.name.should == 'Johannes'
        end

        it 'delegates the getter to current locale' do
          model.should_receive(:name_de=).with('Johannes')
          model.name = 'Johannes'
        end
      end
    end
  end
end
