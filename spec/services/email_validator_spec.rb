require 'spec_helper'

RSpec.describe EmailValidator do

  let(:result) { EmailValidator.call('Ben', 'Pratt', '8returns.com') }

  valid_response = {
    "email" => "support@apilayer.com",
    "did_you_mean" => "",
    "user" => "support",
    "domain" => "apilayer.net",
    "format_valid" => true,
    "mx_found" => true,
    "smtp_check" => true,
    "catch_all" => false,
    "role" => true,
    "disposable" => false,
    "free" => false,
    "score" => 0.8
  }

  invalid_response = {
  "success"=> false,
  "error"=> {
    "code"=> 210,
    "type"=> "no_email_address_supplied",
    "info"=> "Please specify an email address. [Example: support@apilayer.com]"
  }
  }

before(:each) do
  stub_request(:get, "http://apilayer.net/api/check?access_key=6a04e3ea9b8a8d0f1f7c9e1565897d06&email=Ben.Pratt@8returns.com&format=1&smtp=1").to_return(body: valid_response.to_json)
 end


  context 'when the api response is valid' do
    it 'should a OpenStruct result' do
      expect(result.class).to eq(OpenStruct)
      expect(result.success?).to eq(true)
      expect(result.email).to eq('support@apilayer.com')
    end
  end

  describe 'when there is an invalid email' do
    before(:each) do
      stub_request(:get, "http://apilayer.net/api/check?access_key=6a04e3ea9b8a8d0f1f7c9e1565897d06&email=Ben.Pratt@8returns.com&format=1&smtp=1").to_return(body: invalid_response.to_json)
     end

    it 'should return an OpenStruct result with an error key ' do
      expect(result.class).to eq(OpenStruct)
      expect(result.success?).to eq(false)
      expect(result.email).to eq(nil)
      expect(result.errors.class).to  eq(Hash)
      expect(result.errors.keys.length).to_not  be(0)
    end
  end

end
