require 'rails_helper'

describe 'the add question path' do
  it 'displays a new question' do
    visit questions_path
    click_on 'Signup'
    fill_in 'Username', :with => "steve4"
    fill_in 'Password', :with => "bird"
    fill_in 'Password confirmation', :with => "bird"
    click_on 'Sign Up!'
    click_on 'Add a question'
    fill_in 'Text', :with => "why is the sky blue?"
    click_on 'Create Question'
    expect(page).to have_content 'why is the sky blue?'
  end
end
