require "spec_helper"

RSpec.describe "Filter document" do
  context "with valid data" do
    it "returns the list of filtered document" do
      stub_metanorma_data_directory
      query_string = <<~MSG
        {
          documents(type: "csd-standard") {
            id
            type
            bibdata {
              type
              status
            }
          }
        }
      MSG

      post "/graphql", query: query_string
      response = JSON.parse(last_response.body)
      documents = response["data"]["documents"]

      expect(last_response.status).to eq(200)
      expect(documents.first["type"]).to eq("csd-standard")
      expect(documents.first["bibdata"]["status"]).to eq("final-draft")
    end
  end
end
