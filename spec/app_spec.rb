require "spec_helper"

RSpec.describe "Metanorma Registry" do
  it "response with a success status code" do
    get "/"

    expect(last_response).to be_ok
    expect(last_response.body).to eq("Welcome to the metanorma Registry!")
  end
end
