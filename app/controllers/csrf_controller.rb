class CsrfController < ApplicationController

  def index
    response.headers["Access-Control-Allow-Origin"] = "*"

    seed = rand(1000)
    @first_name = "hacker#{seed}"
    @last_name = "me"
    @email = "#{@first_name}@#{@last_name}.com"

    @contacts = [
        {
            email: @email,
            first_name: @first_name,
            last_name: @last_name,
            custom_value1: "",
            custom_value2: "",
            custom_value3: "",
            custom_value4: "",
            custom_value5: "",
            custom_value6: ""
        }
    ]

    respond_to do |format|
      format.html # index.html.erb
    end
  end

end
