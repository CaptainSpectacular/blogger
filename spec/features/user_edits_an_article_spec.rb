require 'rails_helper'

describe 'user edits an article' do
  describe 'visit article edit page' do
    it 'can edit the article' do
      article = Article.create!(title: "Title 1", body: "Body 1")

      visit article_path(article)
      click_on('Edit')

      fill_in 'article[title]', with: 'New Title'
      fill_in 'article[body]', with: 'New Body'
      click_on 'Update Article'

      expect(current_path).to eq(article_path(article))
      expect(page).to have_content('New Title')
      expect(page).to have_content('New Body')
    end
  end
end