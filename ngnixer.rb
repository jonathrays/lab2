ippattern = Regexp.new('[0-9]+(?:\.[0-9]+){3}')
hash = Hash.new
file = File.open('access.log', "r")
data = file.read
file.close
ips = data.scan(/[\d]+(?>\.[\d]+){3}/).uniq


while ips.length>1 do
  a = ips[0].split(/[.]/)[0..-2].join(".")
  if hash[a] == nil
    hash[a] = [ips.delete_at(0)]
  else
    hash[a] << ips.delete_at(0)
  end
end


hash.each do |key,value|
   puts "#{key} => #{value}"
end
