FactoryGirl.define do
  factory :material do
    title {FFaker::Job.title}
    episode 1
    year FFaker::Vehicle.year
    som "2016-07-24 20:01:36"
    eom "2016-07-24 20:01:36"
    aspect_ratio FFaker::Name.name
    material_type FFaker::Name.name
    delivery_channel_group FFaker::Name.name
    supplier
  end
end
