require 'rails_helper'

RSpec.describe ArticlesController, type: :request do

  describe "POST /articles" do
    it "Create Article" do
      expect(Article.count).to be_zero
      create(:article)
      expect(Article.count).to eq(1)
    end
  end

  describe "PUT /articles/:id" do
    it "Update Article" do
      article = create(:article, title: "Article 1")
      article.update(title: "Article Teste")
      expect(article.title).to eq("Article Teste")
    end
  end

  
  describe "Delete /articles/:id" do
    it "Delete Article without comments" do
      article = create(:article)
      expect(Article.count).to eq(1)
      article.destroy
      expect(Article.count).to eq(0)
    end

    it "Delete Article with comments" do
      article = create(:article)
      comment = create(:comment, article_id: article.id)
      expect(Article.count).to eq(1)
      expect(Comment.count).to eq(1)
      article.destroy
      expect(Article.count).to eq(0)
      expect(Comment.count).to eq(0)
    end
  end

end
