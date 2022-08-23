require 'rails_helper'

RSpec.describe 'features', type: :feature do
  describe 'index page' do
    let(:user) do
      User.create!(name: 'Dinma',
                   photo: 'https://as2.ftcdn.net/v2/jpg/02/17/51/67/1000_F_217516770_nHjCK3C82B2ZUC3JB3qQs8W2BGLHxZfa.jpg',
                   bio: 'Developer',
                   postcounter: 1)
    end

    it 'shows the right content' do
      user.save
      visit users_path
      expect(page).to have_content('Dinma')
    end

    it 'shows the profile picture of user' do
      user.save
      visit users_path
      find("img[src='https://as2.ftcdn.net/v2/jpg/02/17/51/67/1000_F_217516770_nHjCK3C82B2ZUC3JB3qQs8W2BGLHxZfa.jpg']")
    end

    it 'shows the Number of posts' do
      user.save
      visit users_path
      expect(page).to have_content("Number of posts: #{user.postcounter}")
    end

    it 'redirects to users show page' do
      user.save
      visit users_path
      click_on user.name
      expect(page).to have_content('Posts :')
    end
  end
end
