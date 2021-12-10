require "rails_helper"

RSpec.feature "Index HTML actions", :type => :feature do
  scenario "User clicks on button New Article" do
    visit "/articles"
    click_link "New Article"
    expect(page).to have_text("New Article")
  end

  feature 'User creates an article' do
    scenario "valid form" do
        visit "/articles/new"
        fill_in 'article_title', with: 'Article 5'
        fill_in 'article_body', with: 'This is a valid body'
        click_button 'Create Article'
        expect(Article.count).to eq(1)
        expect(Article.first.title).to eq("Article 5")
        expect(current_path).to eq(article_path(Article.first.id))
    end

    scenario "invalid form" do
        visit "/articles/new"
        fill_in 'article_title', with: 'Article 5'
        fill_in 'article_body', with: 'Invalid'
        click_button 'Create Article'
        expect(Article.count).to eq(0)
        expect(page).to have_text("Body is too short (minimum is 10 characters)")
    end
   end

   feature 'User edits an article' do
    scenario "simple edit" do
        article = create(:article)
        visit "articles/#{article.id}/edit"
        fill_in 'article_body', with: 'This is a wierd body'
        click_button 'Update Article'
        expect(Article.first.body).to eq('This is a wierd body')
    end
   end

   feature 'User deletes an article' do
    scenario "simple destroy" do
        article = create(:article)
        visit article_path(Article.first.id)
        click_link 'Destroy'
        expect(Article.count).to eq(0)
    end
   end
end