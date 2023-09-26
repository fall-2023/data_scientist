class HomeController < ApplicationController
  def index
    @x_data = []
    @y_data = []
    CSV.foreach("lib/csv/data.csv", :headers => true) { |row|
        @x_data.push( [row[0].to_i, row[1].to_i] )
        @y_data.push( row[2].to_i )
    }

    # Create regression model
    linear_regression = RubyLinearRegression.new
    # Load training data
    linear_regression.load_training_data(@x_data, @y_data)
    # Train the model using the normal equation
    linear_regression.train_normal_equation

    # Output the cost
    puts "Trained model with the following cost fit #{linear_regression.compute_cost}"

    @data = [@x_data, @y_data]
  end
end
