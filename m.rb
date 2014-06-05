require 'mail'
require 'pry'

Mail.defaults do
  retriever_method :pop3, :address    => "pop.gmail.com",
                          :port       => 995,
                          :user_name  => 'naveen@mobme.in',
                          :password   => 'i@mlegend',
                          :enable_ssl => true
end

emails = Mail.all
 binding.pry

        
