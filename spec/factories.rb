FactoryGirl.define do
  sequence(:title) { |n| n }

  factory :page, class: 'Kuhsaft::Page' do |p|
    p.parent nil
    p.position 1
    p.title { "English Title #{FactoryGirl.generate(:title)}" }
    p.published 1
    p.body 'lorem ipsum'
    p.url ''
  end

  factory :text_brick, class: 'Kuhsaft::TextBrick' do |tb|
    tb.type 'Kuhsaft::TextBrick'
    tb.text 'DummyText'
  end

  factory :asset, class: Kuhsaft::Asset do |a|
    a.file File.open("#{Kuhsaft::Engine.root}/spec/dummy/app/assets/images/spec-image.png")
  end
end
