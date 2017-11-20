require_relative '../models/grid.rb'

class PagesController < ApplicationController
  def home
  end

  def game
    def initialize
      @grid = generate_grid(9).join(" ")
      @start_time = Time.now

    end
  end

  def score
    @full_grid = params[:grid]
    @grid = @full_grid.split(' ')
    @start_time = DateTime.parse(params[:start_time])
    @attempt = params[:response]
    @end_time = Time.now
    @result = attempt_grid(@attempt, @grid, @start_time, @end_time)
    best(@result[:score], @attempt, @full_grid)
  end

  private

  def best(score, word, grid)
    if session[:best_score] != nil
      if score > session[:best_score]
        session[:grid] = grid
        session[:best_score] = score
        session[:best_word] = word
      end
    else
      session[:grid] = grid
      session[:best_score] = score
      session[:best_word] = word
    end
  end
end
