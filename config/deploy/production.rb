set :stage, :production
set :rails_env, :production

server '178.62.51.55', user: 'enmanuel', roles: %w{web app db}, primary: true
