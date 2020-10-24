require 'rest-client'
module UserHelper
  def validator(f, l, u)
    fname = f.downcase()
    lname = l.downcase()
    link = u.downcase()
    response = getNames(fname, lname, link)
    response
  end

  # validate the data
  def checkData(data)
    return (data['format_valid'] && data['mx_found'] && data['smtp_check'] && !data['catch_all'])
  end

  # create anc check usernames
  def getNames(f, l, e)
    arr = []
    arr << ("#{f}.#{l}@#{e}")
    arr << ("#{f}@#{e}")
    arr << ("#{f}#{l}@#{e}")
    arr << ("#{l}.#{f}@#{e}")
    arr << ("#{f[0]}.#{l}@#{e}")
    arr << ("#{f[0]}.#{l[0]}@#{e}")

    results = nil
    arr.each do |email|
      request = RestClient.get("http://apilayer.net/api/check?access_key=#{ENV['API_KEY']}&email=#{email}&smtp=1&format=1")
      check = checkData(JSON.parse(request))
      results = JSON.parse(request) if check
      return results['email'] if results
    end
  end
end
