require 'rails_helper'

RSpec.describe Article, :type => :model do
  it "is valid with valid attributes" do
    expect(Article.create(title: "Article 1", body: "This is an article body", status: "public")).to be_valid
  end

  it "is not valid without a title" do
    article = Article.create(title: nil)
    expect(article).to_not be_valid
  end

  it "is not valid to have a body length < 10" do
    article = Article.create(title: "Article 1", body: "not", status: "public")
    expect(article).to_not be_valid
  end

end