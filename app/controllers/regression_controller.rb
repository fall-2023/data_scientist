class RegressionController < ApplicationController
  def linear_regression
    #@x_data = []
    #@y_data = []
    xSum = 0.0
    ySum = 0.0
    xySum = 0.0
    xxSum = 0.0
    count = 0.0
    @data = []
    xMin = 0
    xMax = 0
    CSV.foreach("lib/csv/dataw3.csv", :headers => true) { |row|
        #@x_data.push( row[0].to_f )
        #@y_data.push( row[1].to_f )
        x = row[0].to_f
        y = row[1].to_f
        @data.push( [x,y] )
        xSum += x
        ySum += y
        xySum += x * y
        xxSum += x**2
        count += 1.0
        if (1==count)
          xMax=x
          xMin=x
        else
          if (x<xMin)
            xMin=x
          end
          if (x>xMax)
            xMax=x
          end
        end
    }
    #pp @data
    #pp "min x #{xMin} , max x #{xMax}"
    #pp @x_data
    #pp @y_data
    @slope = (count * xySum - xSum * ySum) / (count * xxSum - xSum * xSum)
    @intercept = (ySum / count) - (@slope * xSum) / count;

    i = xMin
    @model=[]
    while (i<=xMax)
      j = @slope * i + @intercept
      @model.push([i,j])
      i+=1.0
    end
    #yMin = @slope * xMin + @intercept
    #yMax = @slope * xMax + @intercept
    #@model = [ [xMin,yMin], [xMax,yMax]]
    #pp @model
    # Linear regression ###################################
    #linear_regression = RubyLinearRegression.new
    #linear_regression.load_training_data(@x_data, @y_data)
    #linear_regression.train_normal_equation
    #@compute_cost = linear_regression.compute_cost
    #puts "Trained model with the following cost fit #{@ompute_cost}"

    # Predict the price of a 2000 sq feet property with a 1500 sq feet house
    # Linear regression:
    #prediction_data = [2000, 1500]
    #p_x = prediction_data[0]
    #p_y = prediction_data[1]
    #@predicted_price = linear_regression.predict(prediction_data)
    #@summary_lr = "Predicted price using normal equation for a #{p_x} sq feet house on any sq feet property:"
    #puts @summary_lr

    # for Chartkick ################################
    #@data = [@x_data, @y_data]

  end
  def multiple_regression
    @x_data = []
    @y_data = []
    CSV.foreach("lib/csv/staten_small.csv", :headers => true) { |row|
        @x_data.push( [row[0].to_f, row[1].to_f] )
        @y_data.push( row[2].to_f )
        #pp row
    }

    #pp @x_data
    #pp @y_data

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
    @predicted_price = linear_regression.predict(prediction_data)
    @summary_lr = "Predicted price using normal equation for a #{p_x} sq feet house on a #{p_y} sq feet property:"
    puts @summary_lr

    # for Chartkick ################################
    @data = [@x_data, @y_data]
  end
  def gradient_descent
      #linear_regression_gradient_descent = RubyLinearRegression.new
      #linear_regression_gradient_descent.load_training_data(@x_data, @y_data)
      #linear_regression_gradient_descent.train_gradient_descent(0.0005, 500, true)

      # Predict the price of a 2000 sq feet property with a 1500 sq feet house
      #prediction_data = [2000, 1500]
      #predicted_price = linear_regression_gradient_descent.predict(prediction_data)
      #@summary_gd = "Predicted price using gradient descent for a 1500 sq feet house on a 2000 sq feet property: $#{predicted_price.round(2)}"
    
  end
  def polynomial_regression
  end
end
