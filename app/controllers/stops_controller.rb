class StopsController < ApplicationController
  def index
    @stops = Stop.order(:date)
    @stop  = Stop.next
  end
end
