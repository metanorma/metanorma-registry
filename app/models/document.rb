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

  def self.all(type = nil, start = 0, offset = 10)
    new(type: type, start: start, offset: offset).all
  end

  private

  attr_reader :options

  def documents
    @documents ||= Pathname.glob(
      MetanormaRegistry.data_path.join("**", "*.xml")
    ).sort
  end

  def build_document_hash(document)
    if document
      parsed_document = Hash.from_xml(document.read)
      document_type = parsed_document.keys.first

      parsed_document[document_type].merge(
        id: document.sub_ext("").basename.to_s,
        type: document_type.to_s.gsub("_", "-"),
      ).with_indifferent_access
    end
  end

  # Important note:
  #
  # Ignore the complexity for now, we are manually
  # filtering out documents for now, in long term we
  # are not going to keep this one here.
  #
  def metanorma_documents(start, offset)
    found_document = 0
    counter = (start || 1) - 1
    documents_hash = []

    while counter < documents.length && found_document < offset
      document = build_document_hash(documents[counter])

      if document
        if options[:type]
          if options[:type] == document[:type]
            found_document += 1
            documents_hash << document
          end
        else
          break if counter >= (start + offset - 1)
          documents_hash << document
        end
      end

      counter += 1
    end

    documents_hash
  end
end
