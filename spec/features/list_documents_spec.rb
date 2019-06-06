require "spec_helper"

RSpec.describe "List documents" do
  context "with valid request" do
    it "returns list of documents" do
      stub_metanorma_data_directory
      query_string = <<~MSG
        {
          documents {
            id
            type
            bibdata
            termdocsource
            preface
          }
        }
      MSG

      post "/graphql", query: query_string

      response = JSON.parse(last_response.body)
      documents = response["data"]["documents"]

      expect(documents.size).to eq(2)
      expect(last_response.status).to eq(200)
      expect(documents.first["id"]).to eq("cc-10010")
      expect(documents.first["type"]).to eq("csd-standard")
      expect(documents.first[""])
    end
  end
end
