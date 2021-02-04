FactoryBot.define do
  factory :message do
    subject { "A subject" }
    body { "Je suis le plus classe du monde" }
    email { "george@abitbol.com" }
    name { "George Abitbol" }

    trait :invalid do
      email { "lololo" }
    end
  end
end
