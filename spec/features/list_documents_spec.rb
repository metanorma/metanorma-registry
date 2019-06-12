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
              contributor {
                organization {
                  name
                }
              }

              copyright {
                from
                owner {
                  organization {
                    name
                  }
                }
              }

              date {
                type
              }

              version  {
                revisionDate
              }

              editorialgroup {
                committee
              }
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
      contributors = documents.first["bibdata"]["contributor"]

      expect(documents.size).to eq(1)
      expect(last_response.status).to eq(200)
      expect(documents.first["id"]).to eq("cc-10010")
      expect(documents.first["type"]).to eq("csd-standard")

      expect(documents.first["bibdata"]["type"]).to eq("standard")
      expect(documents.first["bibdata"]["status"]).to eq("final-draft")
      expect(contributors.first["organization"]["name"]).to eq("CalConnect")
      expect(documents.first["bibdata"]["copyright"]["from"]).to eq("2019")

      expect(sections_clause.first["title"]).to eq("Scope")
    end
  end
end
