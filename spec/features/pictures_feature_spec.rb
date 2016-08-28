require 'rails_helper'

feature 'pictures' do
  context 'no pictures have been added' do
    scenario 'should display a prompt to add a picture' do
      visit '/pictures'
      expect(page).to have_content 'No pictures yet'
      expect(page).to have_link 'Post a picture'
    end
  end

  context 'pictures have been added' do
    before do
      Picture.create(caption: 'Machu Picchu')
    end

    scenario 'display pictures' do
      visit '/pictures'
      expect(page).to have_content('Machu Picchu')
      expect(page).not_to have_content('No pictures yet')
    end
  end

  context 'posting a caption' do
    scenario 'prompts user to fill out a form, then displays the new caption' do
      visit '/pictures'
      click_link 'Post a picture'
      fill_in 'Caption', with: 'Ethereal haze over Machu Picchu'
      click_button 'Create Picture'
      expect(page).to have_content 'Ethereal haze over Machu Picchu'
      expect(current_path).to eq '/pictures'
    end
  end

  context 'viewing pictures' do
    let!(:picture){ Picture.create caption: 'Ethereal haze over Machu Picchu' }

    scenario 'lets a user view a deidcated picture page' do
      visit '/pictures'
      click_link 'Ethereal haze over Machu Picchu'
      expect(page).to have_content 'Ethereal haze over Machu Picchu'
      expect(current_path).to eq "/pictures/#{picture.id}"
    end
  end

  context 'editing caption' do
    before { Picture.create caption: 'Ethereal haze over Machu Picchu' }

    scenario 'let a user edit a caption' do
     visit '/pictures'
     click_link 'Ethereal haze over Machu Picchu'
     click_link 'Edit'
     fill_in 'Caption', with: 'Marvelous Machu Picchu'
     click_button 'Update Picture'
     expect(page).to have_content 'Marvelous Machu Picchu'
     expect(page).not_to have_content 'Ethereal haze over Machu Picchu'
     expect(current_path).to eq '/pictures'
    end
  end
end
