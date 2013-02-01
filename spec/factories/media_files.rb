FactoryGirl.define do
  factory :media_file, class: Sevenpages::MediaFile do
    source File.open(File.join(Rails.root, '../fixtures/media_files/valid_image.jpg'))
  end
end