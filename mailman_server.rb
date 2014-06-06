#!/usr/bin/env ruby
require 'active_record'
require 'mailman'
require 'pry'
require 'pdfkit'

ActiveRecord::Base.establish_connection(
  adapter: "mysql2",
  database: "email_read",
  username: "root",
  password: "legend",
  pool: "5",
  timeout: "5000"
)  

class Email < ActiveRecord::Base
end


#Mailman.config.logger = Logger.new("log/mailman.log")  # uncomment this if you can want to create a log file
Mailman.config.poll_interval = 3  # change this number as per your needs. Default is 60 seconds
Mailman.config.pop3 = {
  server: 'pop.gmail.com', port: 995, ssl: true,
  username: "naveen@mobme.in",
  password: "i@mlegend"
}

Mailman::Application.run do
  default do

    begin
      email_attachments = []
      if message.attachments.any?
        p "file written"
        message.attachments.each do | attachment |
          filename = Time.now.strftime("%Y%m%d%H%M%S") + "_" + attachment.filename 
          File.open(filename, "w+b") { |f| f.write attachment.body.decoded }
          email_attachments << filename        
        end  

      else
        
        p "file saved"
        html = message.text_part.body.decoded
        kit = PDFKit.new(html, :page_size => 'Letter')
        pdf = kit.to_pdf
        #file = kit.to_file('/home/naveen/Email/body.pdf')
        filename = Time.now.strftime("%Y%m%d%H%M%S") + "_" + "body.pdf"
        File.open(filename, "w+b") { |f| f.write pdf }
        email_attachments << filename

      end  
     

      #p "Found a new message"
      #p message.from.first # message.from is an array
      #p message.to # message.to is an array again..
      #p message.subject           
      #p message.cc.to_json                     
      #p message.date.to_json 
      #p message.message_id
      #p message.text_part.body.decoded
      #p message.attachments
      #binding.pry
      
      email = Email.new(from_address: message.from.first,
                        to_address: message.to.to_json,
                        cc: message.cc.to_json,
                        subject: message.subject,
                        date: message.date.to_s,
                        message_id: message.message_id,
                        body: message.text_part.body.decoded,
                        attachments: email_attachments.to_json )
      email.save


    rescue Exception => e
      Mailman.logger.error "Exception occurred while receiving message:n#{message}"
      Mailman.logger.error [e, *e.backtrace].join("n")
    end
  end
end
