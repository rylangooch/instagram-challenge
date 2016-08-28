require 'rails_helper'

feature 'Commenting' do
  before { Picture.create caption: 'Ethereal haze over Machu Picchu' }

  scenario 'allows users to leave a comment using a form' do
     visit '/pictures'
     click_link 'Ethereal haze over Machu Picchu'
     click_link 'Comment'
     fill_in 'Comment', with: 'Stunning snap sis!'
     click_button 'Leave Comment'
     expect(current_path).to eq '/pictures'
     expect(page).to have_content('Stunning snap sis!')
  end

  scenario 'comments are visible on the dedicated picture page' do
    visit '/pictures'
    click_link 'Ethereal haze over Machu Picchu'
    click_link 'Comment'
    fill_in 'Comment', with: 'Stunning snap sis!'
    click_button 'Leave Comment'
    click_link 'Ethereal haze over Machu Picchu'
    expect(page).to have_content('Stunning snap sis!')
  end
end
