require 'rails_helper'

RSpec.describe User, type: :model do
  it "is a valid User" do
    expect(User.new(name: 'João teste', email: 'joao.teste@gmail.com', password: '123456', password_confirmation: '123456')).to be_valid
  end
  
  it "is a invalid User (without email)" do
    expect(User.new(name: 'João teste', password: '123456')).to be_invalid
  end
  
  it "is a invalid User (without password)" do
    expect(User.new(name: 'João teste', email: 'joao.teste@gmail.com')).to be_invalid
  end
  
  it "is a invalid User (without name)" do
    expect(User.new(email: 'joao.teste@gmail.com', password: '123456')).to be_invalid
  end
  
end
