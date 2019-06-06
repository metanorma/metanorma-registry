module Metanorma
  module StubHelper
    def stub_metanorma_data_directory
      allow(MetanormaRegistry).to receive(:data_path).and_return(
        MetanormaRegistry.root_path.join("spec", "fixtures", "data")
      )
    end
  end
end
