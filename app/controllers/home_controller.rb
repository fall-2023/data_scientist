class HomeController < ApplicationController
  def index
    @x_data = []
    @y_data = []
    CSV.foreach("lib/csv/staten_small.csv", :headers => true) { |row|
        @x_data.push( [row[0].to_f, row[1].to_f] )
        @y_data.push( row[2].to_f )
        #pp row
    }

    pp @x_data
    pp @y_data

    # Linear regression ###################################
    linear_regression = RubyLinearRegression.new
    linear_regression.load_training_data(@x_data, @y_data)
    linear_regression.train_normal_equation
    @compute_cost = linear_regression.compute_cost
    puts "Trained model with the following cost fit #{@ompute_cost}"

    # Predict the price of a 2000 sq feet property with a 1500 sq feet house
    # Linear regression:
    prediction_data = [2000, 1500]
    p_x = prediction_data[0]
    p_y = prediction_data[1]
    predicted_price = linear_regression.predict(prediction_data)
    @summary_lr = "Predicted price using normal equation for a #{p_x} sq feet house on a #{p_y} sq feet property: $#{predicted_price.round(2)}"
    puts @summary_lr
    # Gradient descent #########################################
    if false 
    linear_regression_gradient_descent = RubyLinearRegression.new
    linear_regression_gradient_descent.load_training_data(@x_data, @y_data)
    linear_regression_gradient_descent.train_gradient_descent(0.0005, 500, true)

    # Predict the price of a 2000 sq feet property with a 1500 sq feet house
    prediction_data = [2000, 1500]
    predicted_price = linear_regression_gradient_descent.predict(prediction_data)
    @summary_gd = "Predicted price using gradient descent for a 1500 sq feet house on a 2000 sq feet property: $#{predicted_price.round(2)}"
    end

    # for Chartkick ################################
    @data = [@x_data, @y_data]
  end
end
