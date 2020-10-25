require 'rails_helper'
require 'json'
require_relative "../../app/helpers/user_helper"

RSpec.describe 'User Helper', type: :helper do

  let(:user) {{lname: 'Pratt', fname: 'Ben', url: '8returns.com'}}
  let(:response) {
    {
      "email"=> "support@apilayer.com",
      "did_you_mean"=> "",
      "user"=> "support",
      "domain"=> "apilayer.net",
      "format_valid"=> true,
      "mx_found"=> true,
      "smtp_check"=> true,
      "catch_all"=> false,
      "role"=> true,
      "disposable"=> false,
      "free"=> false,
      "score"=> 0.8
    }
  }

  let(:error) {
    {
      success: false,
      error: {
        code: 210,
        type: "no_email_address_supplied",
        info: "Please specify an email address. [Example: support@apilayer.com]"
      }
    }
  }


  class HelperClass
  end

  before(:each) do
    @helper_class = HelperClass.new
    @helper_class.extend(UserHelper)
  end

  describe 'Error handling from the user api' do
    it'should return a true value iff error in mailboxlayer api request' do
      expect(@helper_class.check_error(error)).to eq true
    end
  end

  describe 'Email combination generator' do
    it 'should return an array of length six' do
      expect(@helper_class.comb_gen(user[:fname], user[:lname], user[:url] ).length).to eq 6
    end
    it 'should return an array of emails' do
      expect(@helper_class.comb_gen(user[:fname], user[:lname], user[:url]).class).to eq(Array)
    end

    it 'should generate six emails based on the combination formula' do
      expect(@helper_class.comb_gen(user[:fname], user[:lname], user[:url])).to eq([
        'Ben.Pratt@8returns.com',
        'Ben@8returns.com',
        'BenPratt@8returns.com',
        'Pratt.Ben@8returns.com',
        'B.Pratt@8returns.com',
        'B.P@8returns.com'
      ])
    end

    it 'should not return a falsy combination' do

      expect(@helper_class.comb_gen(user[:fname], user[:lname], user[:url])).to_not eq([
        'Ben.Pratt@8returns.com',
        'Bn@8returns.com',
        'BenPratt@8returns.com',
        'Pratt.Ben@8returns.com',
        'B.Pratt@8returns.com',
        'B.P@8returns.com'
      ])
    end
  end


  describe "Valid email checke" do
    it 'should return true if all the condition of a valid email are passed' do
      expect(@helper_class.check_data?(response)).to eq true
    end
    it 'should return false if no valid email is found' do
      response['smtp_check'] = false
      expect(@helper_class.check_data?(response)).to eq false
    end
  end

end
