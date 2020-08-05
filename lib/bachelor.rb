require 'pry'
require 'json'
#require './spec/fixtures/contestants.json'

file = File.read('./spec/fixtures/contestants.json')
data = JSON.parse(file)


# INFORMATION RETRIEVAL METHODS ===========

def all_contestants(data)
  contestant_list = []
  data.each do |season, info|
    contestant_list.concat(info)
  end
  contestant_list
end
 
def get_contestant_info_by_stat(data, stat, query, answer)
  all_contestants(data).find {|contestant| contestant[stat] == query}[answer]
end

# ========================================

def get_first_name_of_season_winner(data, season)
  winner = data[season].select { |contestant| contestant['status'] == "Winner" }
  winner[0]['name'].partition(" ").first
end

def get_contestant_name(data, occupation)
  get_contestant_info_by_stat(data, "occupation", occupation, 'name')
end

def count_contestants_by_hometown(data, hometown)
  contestants_from_location = all_contestants(data).select do |contestant|
      contestant["hometown"].include? hometown
  end
  contestants_from_location.length
end

def get_occupation(data, hometown)
  get_contestant_info_by_stat(data, "hometown", hometown, "occupation")
end

def get_average_age_for_season(data, season)
  ages = data[season].map { |info| info['age'] }
  (ages.reduce(0) { |sum, n| sum + n.to_f } / ages.length).round()
end
