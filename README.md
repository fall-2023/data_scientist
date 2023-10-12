# Pain Point
Real-time, web-based data science and visualization inside of any web application.

Currently, we launch a browser-based instance of Jupyter Lab, perform some calculations, and plot inside of the Jupyter environment.  Visualization is limited to exporting to a jpeg or pdf file.  Then to display on a web site, that file is copied over. 

Worse, is using an API to transfer data to a d/s service and load its results back into the presentation stack.

Even worse, is requiring users to log into an external d/s platform.

## Solution: a vitamin
Why not keep the data science closer to the reporting app, and use a popular web framework to perform data science and visualization.

## Data Model
[ideas fd](https://ideas.firstdraft.com/ideas/11743)

## Service Object: RegressionModel
- [ref @toptal](https://www.toptal.com/ruby-on-rails/rails-service-objects-tutorial)
- [ref @honeybadger](https://www.honeybadger.io/blog/refactor-ruby-rails-service-object/)


## Gems & knowledge
- [linear regression](https://github.com/daugaard/linear-regression)
- [great example](https://github.com/daugaard/example-linear-regression)
- [blog](https://www.practicalai.io/implementing-linear-regression-using-ruby/)
- [matrix](https://github.com/ruby/matrix)
- [csv](https://github.com/ruby/csv)
- [chartkick](https://github.com/ankane/chartkick)
- [chartkick.com](https://chartkick.com/)
- not used [rubyplot](https://github.com/SciRuby/rubyplot)
```
gem "chartkick"
gem "groupdate"
```
- [wild example](https://github.com/gorails-screencasts/gorails-episode-194/blob/master/app/controllers/charts_controller.rb)
- [arkane](https://github.com/ankane/chartkick)
- [chartkick.com](https://chartkick.com/)
- [groupdate gem](https://github.com/ankane/groupdate)

# data
- `dataw3.csv` from https://www.w3schools.com/ai/tryit.asp?filename=tryai_plotly_regression3
  - `slope:0.07909090909090909`
  - `intercept:2.454545454545454`

## Plotly
https://plotly.com/javascript/

# Linear Regression
- [w3](https://www.w3schools.com/python/python_ml_linear_regression.asp)
- [w3 regressions](https://www.w3schools.com/ai/ai_regressions.asp)

# Multiple Regression
- [w3](https://www.w3schools.com/python/python_ml_multiple_regression.asp)
- [rosetta code](https://www.rosettacode.org/wiki/Multiple_regression#Ruby)
# Polynomial regression
- [w3 poly](https://www.w3schools.com/python/python_ml_polynomial_regression.asp)
## Rosetta Code
https://www.rosettacode.org/wiki/Polynomial_regression#Ruby
```
require 'matrix'

def regress x, y, degree
  x_data = x.map { |xi| (0..degree).map { |pow| (xi**pow).to_r } }

  mx = Matrix[*x_data]
  my = Matrix.column_vector(y)

  ((mx.t * mx).inv * mx.t * my).transpose.to_a[0].map(&:to_f)
end
```
Testing:
```
p regress([0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10],
          [1, 6, 17, 34, 57, 86, 121, 162, 209, 262, 321],
          2)
```
Output:
```
[1.0, 2.0, 3.0]
```
## En Denis
[endenis](https://gist.github.com/endenis/24f569879957be0b3b4f)
```
require 'matrix'

def polynomial_regression x, y, degree
  rows = x.map do |i|
    (0..degree).map { |power| (i ** power).to_f }
  end
  mx, my = Matrix.rows(rows), Matrix.columns([y])
  ((mx.transpose * mx).inv * mx.transpose * my).transpose.row(0).to_a.reverse
end
```
# project-9.1
[Issue #91](https://github.com/DPI-PTTL/tasks/issues/91)
[spec](https://dpi.instructure.com/courses/186/assignments/1708?module_item_id=3784)
[resources](https://dpi.instructure.com/courses/186/pages/project-resources)

## all pg
- change database.yml for all pg
- `rails db:create`
- `rails s`  instead of  `bin/dev`

## bootstrap 5 & JS
[ref](https://www.linkedin.com/pulse/rails-7-bootstrap-52-importmap-md-habibur-rahman-habib)

## devise
[github](https://github.com/heartcombo/devise#getting-started)
[rails girls](https://guides.railsgirls.com/devise)
`rails generate devise:install`
`<%= link_to "Sign out", destroy_user_session_path, data: { "turbo-method": :delete }, class: "nav-link" %>`
`rails generate devise:views`
`config/initializers/devise.rb`=>`config.scoped_views = true`

[adding extra fields](https://gist.github.com/withoutwax/46a05861aa4750384df971b641170407)
```
rails generate migration add_token_to_users token:string
```
Depending on your application's configuration some manual setup may be required:

  1. Ensure you have defined default url options in your environments files. Here
     is an example of default_url_options appropriate for a development environment
     in `config/environments/development.rb`:
```
       config.action_mailer.default_url_options = { host: 'localhost', port: 3000 }
```
     In production, `:host` should be set to the actual host of your application.

     * Required for all applications. *

  2. Ensure you have defined root_url to *something* in your config/routes.rb.
     For example:
```
       root to: "home#index"
```    
     * Not required for API-only Applications *

  3. Ensure you have flash messages in app/views/layouts/application.html.erb.
     For example:

       <p class="notice"><%= notice %></p>
       <p class="alert"><%= alert %></p>

     * Not required for API-only Applications *

  4. You can copy Devise views (for customization) to your app by running:

       rails g devise:views
       
     * Not required *

# Rails Template

This is a base Ruby on Rails repository configured for learning with Codespaces (and Gitpod).

- Ruby version: `3.2.1`
- Rails version: `7.0.4.3`


We've added additional Ruby gems and other software that aren't automatically available in a new Rails app.

### Additional gems:

- [`appdev_support`](https://github.com/firstdraft/appdev_support)
- [`annotate`](https://github.com/ctran/annotate_models)
- [`awesome_print`](https://github.com/awesome-print/awesome_print)
- [`better_errors`](https://github.com/BetterErrors/better_errors)
- [`binding_of_caller`](https://github.com/banister/binding_of_caller)
- [`dotenv-rails`](https://github.com/bkeepers/dotenv)
- [`draft_generators`](https://github.com/firstdraft/draft_generators/)
- [`draft_matchers`](https://github.com/jelaniwoods/draft_matchers/)
- [`devise`](https://github.com/heartcombo/devise)
- [`faker`](https://github.com/faker-ruby/faker)
- [`grade_runner`](https://github.com/firstdraft/grade_runner/)
- [`htmlbeautifier`](https://github.com/threedaymonk/htmlbeautifier/)
- [`http`](https://github.com/httprb/http)
- [`pry_rails`](https://github.com/pry/pry-rails)
- [`rails_db`](https://github.com/igorkasyanchuk/rails_db)
- [`rails-erd`](https://github.com/voormedia/rails-erd)
- [`rspec-html-matchers`](https://github.com/kucaahbe/rspec-html-matchers)
- [`rspec-rails`](https://github.com/rspec/rspec-rails)
- [`rufo`](https://github.com/ruby-formatter/rufo)
- [`specs_to_readme`](https://github.com/firstdraft/specs_to_readme)
- [`table_print`](https://github.com/arches/table_print)
- [`web_git`](https://github.com/firstdraft/web_git)
- [`webmock`](https://github.com/bblimke/webmock)

### Additional software:
- OS Ubuntu 20.04.5 LTS
- Chromedriver
- Fly.io's `flyctl`
- Google Chrome (headless browser)
- Graphviz
- Heroku 
- Node JS 18
- NPM 8.19.3
- Parity
- Postgresql 12
- Redis
- Yarn

### VS Code extensions:
- aliariff.vscode-erb-beautify
- mbessey.vscode-rufo
- vortizhe.simple-ruby-erb
