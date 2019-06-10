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
            bibdata {
              type
              status
            }

            sections  {
              clause {
                title
              }
            }

            termdocsource
            preface
          }
        }
      MSG

      post "/graphql", query: query_string

      response = JSON.parse(last_response.body)
      documents = response["data"]["documents"]
      sections_clause = documents.first["sections"]["clause"]

      expect(documents.size).to eq(1)
      expect(last_response.status).to eq(200)
      expect(documents.first["id"]).to eq("cc-10010")
      expect(documents.first["type"]).to eq("csd-standard")

      expect(documents.first["bibdata"]["type"]).to eq("standard")
      expect(documents.first["bibdata"]["status"]).to eq("final-draft")

      expect(sections_clause.first["title"]).to eq("Scope")
    end
  end
end
