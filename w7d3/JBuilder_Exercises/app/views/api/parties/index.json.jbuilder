json.array! @parties do |party|
  json.partial! 'parties', party: party
  json.guests party.guests do |guest|
    json.name guest.name
  end
end
