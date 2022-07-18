require "test_helper"

class UserTest < ActiveSupport::TestCase
  test "should create new user" do
    user = User.new
    assert_not user.save
  end

  test "test a valid user" do
    user = User.new(email: 'tony0@hotmail.com', encrypted_password: "123455910")
    assert_not user.valid?
  end

  test 'should not allow a user without email' do
    user = User.new(encrypted_password: "12656756777")
    refute user.valid?, 'saved user without a Email'
    assert_not_nil user.errors[:email]
  end

  test 'should not allow a user without password' do
    user = User.new(email: 'tony0@hotmail.com')
    refute user.valid?, 'saved user without a password'
    assert_not_nil user.errors[:password]
  end


end
