FactoryGirl.define do
  factory :supplier do
    name {FFaker::Job.title}
  end
end
