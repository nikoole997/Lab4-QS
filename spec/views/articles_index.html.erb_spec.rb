require 'rails_helper'

RSpec.describe "articles/index", type: :view do
    before(:each) do
        5.times { create(:article) }
        assign(:articles, Article.all)
    end

    context "Render articles" do
        it "renders a list of articles" do
            render
            articles = Article.all
            articles.each do |article|
                 expect(rendered).to have_selector("ul>li", text: article.title)
            end
            expect(rendered).not_to have_selector("ul>li", text: "Nicole")
            expect(rendered).to have_link(href: "/articles/new")
        end
    end
end