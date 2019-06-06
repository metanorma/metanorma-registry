require "pathname"

class Document
  def initialize(options)
    @options = options
  end

  def all
    metanorma_documents(
      options[:start], options[:offset]
    )
  end

  def self.all(start = 0, offset = 10)
    new(start: start, offset: offset).all
  end

  private

  attr_reader :options

  def documents
    @documents ||= Pathname.glob(
      MetanormaRegistry.data_path.join("**", "*.xml")
    )
  end

  def metanorma_documents(start, offset)
    documents[start...(start + offset)].map do |document|
      build_document_hash(document)
    end
  end

  def build_document_hash(document)
    parsed_document = Hash.from_xml(document.read)
    document_type = parsed_document.keys.first

    parsed_document[document_type].merge(
      id: document.sub_ext("").basename.to_s,
      type: document_type.to_s.gsub("_", "-"),
    ).with_indifferent_access
  end
end
