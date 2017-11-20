require 'open-uri'
require 'json'

def generate_grid(grid_size)
  # TODO: generate random grid of letters
  grid = []
  grid_size.times { grid << ('A'..'Z').to_a[rand(26)] }
  return grid
end

def attempt_grid(attempt, grid, start_time, end_time)
  time = end_time.to_f - start_time.to_f
  attempt.split('').each do |v, i|
    if grid.include? v.upcase
      i = grid.find_index(v.upcase)
      grid.delete_at(i)
    else return { message: "not in the grid", score: 0 }
    end
  end
  return { message: 'Well Done!', time: time, score: attempt.size.to_f / time }
end
