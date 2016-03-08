require 'spec_helper'
require './bowling.rb'


describe 'Bowling' do

  it "should identify first frame" do
    game = Bowling.new([[2,7],[10,0],[4,3]])
    expect(game.frame).to eq([2,7])
  end

  it "should identify next_frame frame" do
    game = Bowling.new([[2,7],[10,0],[4,3]])
    expect(game.next_frame).to eq([10,0])
  end

  it "should identify subsequent frame" do
    game = Bowling.new([[2,7],[10,0],[4,3]])
    expect(game.subsequent_frame).to eq([4,3])
  end


  it "should determine a miss" do
    game = Bowling.new([[2,7]])
    expect(game).to be_is_miss
  end

  it "should determine a spare" do
    game = Bowling.new([[6,4]])
    expect(game).to be_is_spare
  end

  it "should determine a strike" do
    game = Bowling.new([[10,0]])
    expect(game).to be_is_strike
  end

  it "should determine a spare" do
    game = Bowling.new([[7,3]])
    expect(game).to be_is_spare
  end

  it "should calculate a spare score" do
    game = Bowling.new([[7,3],[5,4]])
    expect(game.spare_scores).to be == 15
  end

  it "should calculate three strikes in a row" do
    game = Bowling.new([[10,0],[10,0],[10,0]])
    expect(game.strike_scores).to be == 30
  end

  it "should calculate two strikes in a row and whiff" do
    game = Bowling.new([[10,0],[10,0],[0,0]])
    expect(game.strike_scores).to be == 20
  end

  it "should calculate two strike and miss" do
    game = Bowling.new([[10,0],[10,0],[6,3]])
    expect(game.strike_scores).to be == 26
  end

  it "should calculate one strike and misses" do
    game = Bowling.new([[10,0],[6,3],[6,4]])
    expect(game.strike_scores).to be == 19
  end

  it "should calculate the number of 'normal' frames" do
    game = Bowling.new([[10,0],[6,3],[6,4],[8,1]])
    expect(game.normal_frames).to be == 4
  end

  it "should calculate the number of 'normal' frames" do
    game = Bowling.new([[10,0],[6,3],[6,4],[8,1],[10,0],[6,3],[6,4],[8,1]])
    expect(game.normal_frames).to be == 8
  end

  it "should calculate the appropriate score with less than 10 frames" do
    game = Bowling.new([[10,0],[6,3],[6,4],[8,1]])
    expect(game.score).to be == 55
  end

  it "should calculate the score with less than 10 and turkey" do
    game = Bowling.new([[10,0],[10,0],[10,0],[8,1],[6,2],[7,1],[9,0]])
    expect(game.score).to be == 111
  end

  it "should calculate the score with 10 frames" do
    game = Bowling.new([[10,0],[10,0],[10,0],[8,1],[6,2],[7,1],[0,0],[8,2],[7,2],[6,4,3]])
    expect(game.score).to be == 141
  end

  it "should calculate the score with 10 frames and turkey at end" do
    game = Bowling.new([[7,1],[4,0],[6,3],[8,1],[6,2],[7,1],[0,0],[8,2],[7,2],[10,10,10]])
    expect(game.score).to be == 102
  end

  it "should determine a perfect score" do
    game = Bowling.new([[10,0],[10,0],[10,0],[10,0],[10,0],[10,0],[10,0],[10,0],[10,0],[10,10,10]])
    expect(game.score).to be == 300
  end

end
