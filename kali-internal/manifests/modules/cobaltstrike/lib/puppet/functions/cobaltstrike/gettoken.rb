require 'net/http'
Puppet::Functions.create_function(:'cobaltstrike::gettoken') do
  dispatch :gettoken do
    param 'String', :key
  end

  def gettoken(key)
    uri = URI("https://www.cobaltstrike.com/download?dlkey=#{key}")
    res = Net::HTTP.get(uri)
    res.split("\n").grep(/download-btn/)[0].split('/')[2]
  end
end
