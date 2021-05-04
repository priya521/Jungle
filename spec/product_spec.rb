require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    it 'should exist id for new records' do
      @category = Category.new(:name => 'Shoes')
      @product = Product.new(:name => 'WaterBottle', :price=>100, :quantity=>1, :category=>@category)
      @product.save!
      expect(@product.id).to be_present
    end

    it 'should exist name for new records' do
      @category = Category.new(:name => 'Shoes')
      @product = Product.new( :name => nil, :price=>100, :quantity=>1, :category=>@category)
      @product.valid?
      expect(@product.errors.full_messages).to include("Name can't be blank")
    end

    it 'should exist price for new records' do
      @category = Category.new(:name => 'Shoes')
      @product = Product.new( :name => 'WaterBottle', :quantity=>1, :category=>@category)
      @product.valid?
      expect(@product.errors.full_messages).to include("Price can't be blank")
    end

    it 'should exist quantity for new records' do
      @category = Category.new(:name => 'Shoes')
      @product = Product.new( :name => 'WaterBottle', :price=>100, :category=>@category)
      @product.valid?
      expect(@product.errors.full_messages).to include("Quantity can't be blank")
    end

    it 'should exist category for new records' do
      @product = Product.new( :name => 'WaterBottle', :price=>100, :quantity=>1, :category=>nil)
      @product.valid?
      expect(@product.errors.full_messages).to include("Category can't be blank")
    end
  end
end