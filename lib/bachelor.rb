require 'pry'
require 'json'
#require './spec/fixtures/contestants.json'

file = File.read('./spec/fixtures/contestants.json')
data = JSON.parse(file)


def get_first_name_of_season_winner(data, season)
  winner = data[season].select do |contestant| 
    contestant['status'] == "Winner"
  end
  winner[0]['name'].partition(" ").first
end

def get_contestant_name(data, occupation)
  data.each do |season, info|
    info.select do |contestant| 
      if contestant['occupation'] == occupation
        return contestant['name']
      end
    end
  end
end


def count_contestants_by_hometown(data, hometown)
  residents = 0
  data.each do |season, info|
    info.each do |contestants|
      residents += 1 if contestants['hometown'].include? hometown
    end
  end
  residents
end

'''def get_occupation(data, hometown)
  worker = data.select do |contestant| contestant['hometown']

end'''

def get_average_age_for_season(data, season)
  # code here
end
