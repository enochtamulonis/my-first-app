class CountdownController < ApplicationController
  def create
    CountdownJob.perform_later
  end
end