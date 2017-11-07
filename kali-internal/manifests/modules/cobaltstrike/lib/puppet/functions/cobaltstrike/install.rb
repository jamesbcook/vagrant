Puppet::Functions.create_function(:'cobaltstrike::install') do
  dispatch :install do
    param 'String', :key
  end

  def install(key)
    `printf "\n" | /opt/cobaltstrike/./update`
  end
end
