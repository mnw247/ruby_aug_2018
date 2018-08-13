class TimesController < ApplicationController
  def main
    date_time = Time.now.in_time_zone("America/Chicago")
    @date = date_time.strftime("%b %d, %Y")
    @time = date_time.strftime("%I:%M, %p %Z")
    render 'times/main'
  end
end
