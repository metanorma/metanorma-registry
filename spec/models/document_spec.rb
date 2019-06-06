require "spec_helper"

RSpec.describe Document do
  describe ".all" do
    it "list all documents in data directory" do
      stub_metanorma_data_directory

      documents = Document.all(0, 2)

      expect(documents.count).to eq(2)
      expect(documents.first[:id]).to eq("cc-10010")
      expect(documents.first[:type]).to eq("csd-standard")

      expect(documents.first.keys).to match([
        "xmlns", "bibdata", "termdocsource", "preface", "sections",
        "annex", "bibliography", "id", "type"
      ])
    end
  end
end
