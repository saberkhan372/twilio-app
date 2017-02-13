require 'bundler'
Bundler.require
Dotenv.load


configure :development do
  set :database, "sqlite3:dbname/database.db"
end

configure :production do
 db = URI.parse(ENV['DATABASE_URL'] || 'postgres:///localhost/mydb')
end
