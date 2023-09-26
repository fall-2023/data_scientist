class HomeController < ApplicationController
  def index
    CSV.foreach("lib/csv/data.csv", :headers => true) { |row|
      pp row
    }
  end
end
