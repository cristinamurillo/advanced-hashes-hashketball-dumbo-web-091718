require 'pry' 

def game_hash
  hash = {
       home: {team_name: "Brooklyn Nets", colors: "Black, White", players: 
         {"Alan Anderson" => {number: 0, shoe: 16, points: 22, rebounds: 12, assists: 12, steals: 3, blocks: 1, slam_dunks: 1}, 
         "Reggie Evans" => {number: 30, shoe: 14, points: 12, rebounds: 12, assists: 12, steals: 12, blocks: 12, slam_dunks: 7},
           "Brook Lopez"=>{number: 11, shoe: 17, points: 17, rebounds: 19, assists: 10, steals: 3, blocks: 1, slam_dunks: 15},
           "Mason Plumlee"=> {number: 1, shoe: 19, points: 26, rebounds: 12, assists: 6, steals: 3, blocks: 8, slam_dunks: 5},
           "Jason Terry" => {number: 31, shoe: 15, points: 19, rebounds: 2, assists: 2, steals: 4, blocks: 11, slam_dunks: 1}
         }},
       away: {team_name: "Charlotte Hornets", colors: "Turquoise, Purple", players: 
           {"Jeff Adrien" => {number: 4, shoe: 18, points: 10, rebounds: 1, assists: 1, steals: 2, blocks: 7, slam_dunks: 2},
             "Bismak Biyombo" => {number: 0, shoe: 16, points: 12, rebounds: 4, assists: 7, steals: 7, blocks: 15, slam_dunks: 10},
             "DeSagna Diop" => {number: 2, shoe: 14, points: 24, rebounds: 12, assists: 12, steals: 4, blocks: 5, slam_dunks: 5},
             "Ben Gordon" => {number: 8, shoe: 15, points: 33, rebounds: 3, assists: 2, steals: 1, blocks: 1, slam_dunks: 0},
             "Brendan Haywood" => {number: 33, shoe: 15, points: 6, rebounds: 12, assists: 12, steals: 22, blocks: 5, slam_dunks: 12}
           }}
       }
end

#super bonus methods
def long_name_steals_a_ton?
   most_steals = 0
   steal_master = ""
  game_hash.each { |home_away, team_info|
    team_info.each { |key, value|
      if key == :players 
        value.each { |player, stats|
          stats.each { |category, number|
            if category.to_s == "steals"
              if most_steals < number
                most_steals = number
                steal_master = player 
              end
            end 
          }
        }
      end
    }
  }
  steal_master == player_with_longest_name ? true : false
end

#bonus methods 
def player_with_longest_name
  biggest_size = 0
  longest_name = ""
   game_hash.each { |home_away, team_info|
    team_info.each { |key, value|
      if key == :players 
        value.each { |name, stats|
          if biggest_size < name.length 
            biggest_size = name.length
            longest_name = name 
          end  
        }
      end
    }
   }
   longest_name 
end

def winning_team
  total_home = 0 
  total_away = 0 
   game_hash[:home].each { |key, value|
      if key.to_s == "players"
        value.each { |player, stats|
         total_home = total_home + num_points_scored(player)
        }
      end
    }
    
   game_hash[:away].each { |key, value|
    if key.to_s == "players"
      value.each { |player, stats|
       total_away = total_away + num_points_scored(player)
      }
    end
  }
  
 total_home > total_away ? game_hash[:home][:team_name] : game_hash[:away][:team_name]
end


def most_points_scored
    highest_score = 0
    player_string = ""
  game_hash.each { |home_away, team_info|
    team_info.each { |key, value|
      if key.to_s == "players"
        value.each { |player, stats|
          stats.each { |category, number|
            if category.to_s == "points"
              if highest_score < number
                highest_score = number
                player_string = player 
              end
            end 
          }
        }
      end
    }
  }
  player_string
end 
  

#required methods
def big_shoe_rebounds
    biggest_shoe = 0
    player_string = ""
  game_hash.each { |home_away, team_info|
    team_info.each { |key, value|
      if key.to_s == "players"
        value.each { |player, stats|
          stats.each { |category, number|
            if category.to_s == "shoe"
              if biggest_shoe < number
                biggest_shoe = number
                player_string = player 
              end
            end 
          }
        }
      end
    }
  }
  player_stats(player_string)[:rebounds]
end 

def player_stats(player_name)
  hash = {}
    game_hash.each { |home_away, team_info|
      team_info.each { |key, value|
        if key.to_s == "players"
          value.each { |name, stats|
            if name == player_name
              hash = stats 
            end  
          }
        end  
      }
    }
  hash 
end

def player_numbers(team)
  array = []
  game_hash.each { |home_away, team_info|
    team_info.each { |key, value|
      if key.to_s == "team_name" && value == team
        game_hash[home_away][:players].each { |player, stats|
          stats.each { |category, number|
            if category.to_s == "number"
              array << number 
            end 
          }
        }
      end
    }
  }
  array
end



def team_names
 array = []
 game_hash.each { |home_away, team_info|
    team_info.each { |key, value|
      if key.to_s == "team_name" 
        array << value 
      end
    }
  }
  array 
end


def team_colors(team)
  array = []
  game_hash.each { |home_away, team_info|
    team_info.each { |key, value|
      if key.to_s == "team_name" && value == team
        array = game_hash[home_away][:colors].split(", ")
      end
    }
  }
 array 
end

def shoe_size(player_name)
    size = 0 
  game_hash.each { |home_away, team_info|
    team_info.each { |key, value|
      if key.to_s == "players"
        value.each { |player, stat|
          if player == player_name
            size = game_hash[home_away][key][player][:shoe]
          end  
        }
      end
    } 
  }
  size 
end

def num_points_scored(player_name)
  points = 0 
  game_hash.each { |home_away, team_info|
    team_info.each { |key, value|
      if key.to_s == "players"
        value.each { |player, stat|
          if player == player_name
            points = game_hash[home_away][key][player][:points]
          end  
        }
      end
    } 
  }
  points 
end 







