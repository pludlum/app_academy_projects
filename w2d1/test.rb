p 'enter a secret num'
begin
  input = gets.chomp
  Integer(input)
rescue
  p 'not the secret num'
end
