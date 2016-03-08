require 'spec_helper.rb'
require './bowling.rb'

describe 'Bowling' do

  "it should determine a miss" do
    game = Bowling.new([2,7])
    game.is_miss?.should be_true
  end
end
