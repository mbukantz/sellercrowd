require 'pry'

class Bowling
  attr_accessor :scoreboard

  def initialize(scoreboard)
    @scoreboard = scoreboard
  end

  def frame
    @scoreboard.first
  end

  def next_frame
    @scoreboard[1]
  end

  def subsequent_frame
    @scoreboard[2]
  end

  def is_miss?
    if frame[0] + frame[1] < 10
      true
    end
  end

  def is_spare?
    if frame[0] < 10 && (frame[0] + frame[1] == 10)
      true
    end
  end

  def is_strike?
    if frame[0] == 10
      true
    end
  end

  def spare_scores
    10 + next_frame[0]
  end


  def strike_scores
    if next_frame[0] == 10 && subsequent_frame[0] == 10
      30
    elsif next_frame[0] == 10 && subsequent_frame[0] == 0
      20
    else
      10 + next_frame[0] + next_frame[1]
    end
  end

  def frame_score
    if is_strike?
      strike_scores
    elsif is_spare?
      spare_scores
    else is_miss?
      frame[0] + frame[1]
    end
  end

  def normal_frames
    [8, [@scoreboard.length - 2,0].max].min
  end

  def normal_frame_score
    score = 0
    normal_frames.times do |i|
      score += frame_score
      @scoreboard.shift
    end
    score
  end

  def ninth_frame_score
    if frame[0] == 10 && next_frame[0] == 10 && next_frame[1] == 10
      30
    elsif frame[0] + frame[1] == 10 && frame[0]!= 10
      10 + next_frame[0]
    end
  end

  def tenth_frame_score
    if frame[0] == 10 && frame[1] == 10 && frame[2] == 10
      30
    elsif frame[0] == 10 || frame[1] == 10 || (frame[0] + frame[1] == 10)
      frame[0] + frame[1] + frame[2]
    end
  end


  def score
    score = 0
    if @scoreboard.length < 9
      score += normal_frame_score
    elsif @scoreboard.length == 9
      score += normal_frame_score
      score += ninth_frame_score
        @scoreboard.shift
    else @scoreboard.length == 10
      score += normal_frame_score
      score += ninth_frame_score
        @scoreboard.shift
      score += tenth_frame_score
    end
    score
  end
end
#
# puts Bowling.new([[10, 0], [10, 0], [10, 0],[10, 0],[10, 0],[10, 0],[10, 0],[10, 0],[10, 0],[10, 10, 10]]).score
