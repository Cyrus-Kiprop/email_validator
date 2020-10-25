require 'rest-client'
module UserHelper
  def validator(fname, lname, url)
    get_names(fname.downcase, lname.downcase, url.downcase)
  end

  # validate the data
  def check_data?(data)
    return (data['format_valid'] && data['mx_found'] && data['smtp_check'] && !data['catch_all'])
  end

  # create anc check usernames
  def get_names(fname, lname, url)
    results = nil
    arr = []
    arr << ("#{fname}.#{lname}@#{url}")
    arr << ("#{fname}@#{url}")
    arr << ("#{fname}#{lname}@#{url}")
    arr << ("#{lname}.#{fname}@#{url}")
    arr << ("#{fname[0]}.#{lname}@#{url}")
    arr << ("#{fname[0]}.#{lname[0]}@#{url}")

    arr.each do |email|
      request = RestClient.get("http://apilayer.net/api/check?access_key=#{ENV['API_KEY']}&email=#{email}&smtp=1&format=1")

      parsed_request = JSON.parse(request)

      # check for response errors while validating the email
      errors = request_error?(parsed_request)

      # respond back to the user with the errors encountered
      if errors
        result = parsed_request['error']
        return result
      end

      # find the email that passes the criteria
      check = check_data?(parsed_request)
      results = parsed_request if check
      return results['email'] if results
    end
    false
  end

  def request_error?(request)
    request && request['error']
  end

  def check_error(result)
    result.class  == Hash
  end
end
