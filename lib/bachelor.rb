require 'pry'
require 'json'
#require './spec/fixtures/contestants.json'

file = File.read('./spec/fixtures/contestants.json')
data = JSON.parse(file)

def get_contestant_info_by_stat(data, stat, query, answer)
  data.each do |season, info|
    info.select do |contestant|
      return contestant[answer] if contestant[stat] == query
    end
  end
end

def get_contestant_name(data, occupation)
  get_contestant_info_by_stat(data, "occupation", occupation, 'name')
end

def get_first_name_of_season_winner(data, season)
  winner = data[season].select do |contestant| contestant['status'] == "Winner"
  end
  winner[0]['name'].partition(" ").first
end


=begin
def get_contestant_name(data, occupation)
  data.each do |season, info|
    info.select do |contestant| 
      return contestant['name'] if contestant['occupation'] == occupation
    end
  end
end
=end



def count_contestants_by_hometown(data, hometown)
  residents = 0
  data.each do |season, info|
    info.each do |contestant|
      residents += 1 if contestant['hometown'].include? hometown
    end
  end
  residents
end


=begin
def get_occupation(data, hometown)
  data.each do |season, info|
    info.select do |contestant| 
      return contestant['occupation'] if contestant['hometown'] == hometown
    end
  end
end
=end

def get_occupation(data, hometown)
  get_contestant_info_by_stat(data, "hometown", hometown, "occupation")
end

def get_average_age_for_season(data, season)
  age = 0
  contestants = 0
  data.each do |season, info|
    info.select do |contestant|
end
