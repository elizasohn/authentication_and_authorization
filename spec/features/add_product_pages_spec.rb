require 'rails_helper'

describe "the add a product process" do
  it "adds a product" do
    visit products_path
    click_link 'Create new product'
    fill_in 'Name', :with => 'blender'
    fill_in 'Cost', :with => '42'
    fill_in 'Country of origin', :with => 'USA'
    click_on 'Create Product'
    expect(page).to have_content 'Product successfully created!'
    expect(page).to have_content 'Blender'
  end

  it "gives an error when no name is entered" do
    visit new_product_path
    fill_in 'Cost', :with => '42'
    fill_in 'Country of origin', :with => 'USA'
    click_on 'Create Product'
    expect(page).to have_content "Product was not created!"
    expect(page).to have_content "Name can't be blank"
  end

  it "gives an error when no cost is entered" do
    visit new_product_path
    fill_in 'Name', :with => 'blender'
    fill_in 'Country of origin', :with => 'USA'
    click_on 'Create Product'
    expect(page).to have_content "Product was not created!"
    expect(page).to have_content "Cost can't be blank"
  end

  it "gives an error when no country is entered" do
    visit new_product_path
    fill_in 'Name', :with => 'blender'
    fill_in 'Cost', :with => '42'
    click_on 'Create Product'
    expect(page).to have_content "Product was not created!"
    expect(page).to have_content "Country of origin can't be blank"
  end
end
