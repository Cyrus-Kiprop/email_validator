require 'rest-client'

module UserHelper

  def validator (f,l,u)
    fname = f.downcase()
    lname = l.downcase()
    link = u.downcase()
    response = getNames(fname, lname, link)
    response
  end

  # validate the data
  def checkData(data)
    p data
    return true if data[:format_valid] &&
      data[:mx_found] &&
      data[:smtp_check] &&
      !data[:catch_all]
    return false
  end
  # create anc check usernames
  def getNames(f, l, e)
     arr = [];
    arr.push("#{f}.#{l}@#{e}");
    arr.push("#{f}@#{e}");
    arr.push("#{f}#{l}@#{e}");
    arr.push("#{l}.#{f}@#{e}");
    arr.push("#{f[0]}.#{l}@#{e}");
    arr.push("#{f[0]}.#{l[0]}@#{e}");
    results = nil
    arr.each do |i|
      request = RestClient.get("http://apilayer.net/api/check?access_key=8958e54d32b824916adaddf25882d661&email=#{i}&smtp=1&format=1")

      check = checkData(JSON.parse(request))
      if(check)
        results = JSON.parse(request);
        break;
      end
    end
    return results.nil? ? false : result[:email] ;
  end
end
