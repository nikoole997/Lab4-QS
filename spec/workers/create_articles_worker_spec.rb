require 'rails_helper'
require 'sidekiq/testing'

RSpec.describe CreateArticlesWorker, type: :worker   do
  describe "Test Queue" do
    it 'Test queue' do
     expect(Article.count).to eq(0)
     assert_equal 0, CreateArticlesWorker.jobs.size

     CreateArticlesWorker.perform_async
     assert_equal 1, CreateArticlesWorker.jobs.size

     CreateArticlesWorker.drain
     expect(Article.count).to eq(1)
    end
  end
end
