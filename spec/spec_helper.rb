require 'rspec'
require 'byebug'
require 'cards_factory'

Dir["#{File.dirname(__FILE__)}/../lib/**/*.rb"].each do |spec|
  require_relative spec
end
