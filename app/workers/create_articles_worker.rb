class CreateArticlesWorker
  include Sidekiq::Worker
  sidekiq_options queue: :default

  def perform(*args)
    article = Article.create(title:"Article", body: "This is a body for Article", status: "public")
    article.update(title:"Article_#{article.id}")
  end
end
