require 'sinatra'

class MyApp < Sinatra::Base
      get '/' do
        erb :home
      end

      get '/nosp' do
        text = params[:text]
        temp_file = Tempfile.new('foo')
        open(temp_file, 'w') { |f|
          f.puts text
        }
        send_file temp_file, :filename => "file_without_trailing_whitespace.txt", :type => 'Application/octet-stream'
      end
end
