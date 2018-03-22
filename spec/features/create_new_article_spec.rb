require 'rails_helper'

describe 'user creates new article' do
  describe 'fill in title and body' do
    it 'creates new article' do
      visit articles_path

      click_link 'Create New Article'

      expect(current_path).to eq(new_article_path)

      fill_in 'article[title]', with: 'GoodTitle'
      fill_in 'article[body]', with: 'This is the body'
      click_on 'Create Article'

      article = Article.where("title='GoodTitle'").last

      expect(current_path).to eq(article_path(article.id))
      expect(page).to have_content('GoodTitle')
      expect(page).to have_content('This is the body')
    end
  end
end