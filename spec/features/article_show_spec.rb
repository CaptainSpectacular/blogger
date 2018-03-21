require 'rails_helper'

describe 'user sees article traits' do
  describe 'visit articles/:id' do
    it 'shows article traits' do
      article_1 = Article.create!(title: "Title 1", body: "Body 1")

      visit articles_path
      click_link article_1.title

      expect(page).to have_content(article_1.title)
      expect(page).to have_content(article_1.body)
    end
  end
end