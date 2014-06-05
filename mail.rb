
#require 'mysql2'
require 'active_record'

ActiveRecord::Base.establish_connection(
  adapter: "mysql2"
  database: "email_read"
  usename: "root"
  password: "legend"
  pool: "5"
  timeout: "5000"
)  

class Email < ActiveRecord::Base
end

require 'mail'

Mail.defaults do
  retriever_method :pop3, :address    => "pop.gmail.com",
                          :port       => 995,
                          :user_name  => 'naveen@mobme.in',
                          :password   => 'i@mlegend',
                          :enable_ssl => true
end


 

#CREATE TABLE emails (id INTEGER PRIMARY KEY NOT NULL AUTO_INCREMENT, from_address varchar(255), to_address varchar(500),
#cc varchar(255), subject varchar(500), date datetime, message_id varchar(255), body text,
#attachments BLOB);
