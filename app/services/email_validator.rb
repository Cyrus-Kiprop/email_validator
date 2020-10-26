class EmailValidator

  def initialize(fname, lname, url)
    @fname = fname
    @lname = lname
    @url = url
    @result = OpenStruct.new(success?: false, email: nil, errors: {} )
  end

  def self.call(*args)
    new(*args).execute
  end

  def  execute
    result = nil
    combinations = generate_email_combinations(@fname, @lname, @url)

    combinations.each do |email|
      response = api_request(email)


      parsed_response = JSON.parse(response);


      # failure
      if error_in_api_request?(parsed_response)

        @result['errors'] = parsed_response['error']
        return @result

      end
      # success
      if valid_email?(parsed_response)
        @result['success?'] = true
        @result['email'] = parsed_response['email']
        return @result
      end

    end
    # no valid email found
    @result['errors'] = {
      'code'=> 404,
      'type'=> "Please choose another url",
      'info'=> "No valid email address found"
    }
    @result
  end

  private
  def generate_email_combinations(fname, lname, url)
    arr = []
    arr << ("#{fname}.#{lname}@#{url}")
    arr << ("#{fname}@#{url}")
    arr << ("#{fname}#{lname}@#{url}")
    arr << ("#{lname}.#{fname}@#{url}")
    arr << ("#{fname[0]}.#{lname}@#{url}")
    arr << ("#{fname[0]}.#{lname[0]}@#{url}")
    arr
  end

  def api_request(email)
    RestClient::Request.execute(:method => :get, :url => "http://apilayer.net/api/check?access_key=#{ENV['API_KEY']}&email=#{email}&smtp=1&format=1", :timeout => 20)
  end

  def valid_email?(data)
    data['format_valid'] && data['mx_found'] && data['smtp_check'] && !data['catch_all']
  end

  def error_in_api_request?(response)
    response && response['error']
  end

end
