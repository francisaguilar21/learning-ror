require "net/http"
require "json"

class DogBreedService < ApplicationService
  BASE_URL = "https://dogapi.dog/api/v2"

  def fetch_breeds
    uri = URI("#{BASE_URL}/breeds")
    response = Net::HTTP.get(uri)
    JSON.parse(response)
  end

  def fecth_breed(id)
    uri = URI("#{BASE_URL}/breeds/#{id}")
    response = Net::HTTP.get(uri)
    JSON.parse(response)
  end
end
