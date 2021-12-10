FactoryBot.define do
    factory :article do
        sequence(:title) {|n| "article_#{n}"}
        sequence(:body) {|n| "this is article_#{n}"}
        status {"public"}
    end
    factory :comment do
        sequence(:commenter) {|n| "person_#{n}"}
        body {"this is a comment"}
        status {"public"}
    end
end