require 'rails_helper'

RSpec.describe User, type: :model do

  # username,email,passwordがあれば有効
  it "username,email,passwordがあれば有効" do
    user = User.new(username:"にんじん",email:"dddd@dddd",password:123456)
    expect(user).to be_valid
  end

  # usernameが入力されていないので保存できない（結果はfalse）
  it "usernameが入力されていないので保存できない（結果はfalse）" do
    user = User.new(email:"dddd@dddd",password:123456)
    expect(user.save).to be_falsey
  end

  # passwordが入力されていないので保存できない（結果はfalse）
  it "passwordが入力されていないので保存できない（結果はfalse）" do
    user = User.new(username:"にんじん",email:"dddd@dddd")
    expect(user.save).to be_falsey
  end

  # emailが入力されていないので保存できない（結果はfalse）
  it "emailが入力されていないので保存できない（結果はfalse）" do
    user = User.new(username:"にんじん",password:123456)
    expect(user.save).to be_falsey
  end

  # 必須項目が入力されていないので保存できない（結果はfalse）
  it "必須項目が入力されていないので保存できない（結果はfalse）" do
    user = User.new
    expect(user.save).to be_falsey
  end

  #dependent: :destroyが実装されているか
  it 'dependent: :destroyが実装されているか' do
    user = User.create(username: 'Tom', email: 'tom@example.com',password:123456)
    user.items.create(tittle: 'RSpec必勝法', content: 'あとで書く')
    expect{ user.destroy }.to change{ Item.count }.by(-1)
  end
end
