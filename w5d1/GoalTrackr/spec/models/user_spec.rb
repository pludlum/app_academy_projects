require 'rails_helper'

RSpec.describe User, type: :model do


  subject(:user) do
    User.create!(
      username: "goal_master89",
      password: "password"
    )
  end


  it {should validate_presence_of(:username) }
  it {should validate_uniqueness_of(:username) }



    describe 'Uses digests instead of passwords' do
      it 'does not save passwords' do
        User.create!(username: "hmm", password: "password")
        user = User.find_by(username: "hmm")
        expect(user.password).to be(nil)
      end

      it 'creates a password digest' do
        expect(BCrypt::Password).to receive(:create)
        User.new(username: "someoneelse", password: "password")
    end
  end
end

# describe "password encryption" do
#     it "does not save passwords to the database" do
#       User.create!(username: "mary_mack", password: "abcdef")
#       user = User.find_by_username("mary_mack")
#       expect(user.password).not_to be("abcdef")
#     end
#
#     it "encrypts the password using BCrypt" do
#       expect(BCrypt::Password).to receive(:create)
#       User.new(username: "mary_mack", password: "abcdef")
#     end
#   end
#
#   it { should validate_presence_of(:username) }
#   it { should validate_uniqueness_of(:username) }
#   it { should have_many(:goals) }
#   it { should have_many(:cheers_given) }
#   it { should have_many(:cheers_received).through(:goals) }
