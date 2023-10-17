require 'rails_helper'

RSpec.describe AppSchema do
  it 'matches the dumped schema (rails graphql:schema:dump)' do

    #Queries are not set up, but mutations are what we are using
    expected_json_content = "{\n  \"errors\": [\n    {\n      \"message\": \"Schema is not configured for queries\",\n      \"locations\": [\n        {\n          \"line\": 1,\n          \"column\": 1\n        }\n      ],\n      \"path\": [\n        \"query IntrospectionQuery\"\n      ],\n      \"extensions\": {\n        \"code\": \"missingQueryConfiguration\"\n      }\n    },\n    {\n      \"message\": \"Fragment FullType was defined, but not used\",\n      \"locations\": [\n        {\n          \"line\": 21,\n          \"column\": 1\n        }\n      ],\n      \"path\": [\n        \"fragment FullType\"\n      ],\n      \"extensions\": {\n        \"code\": \"useAndDefineFragment\",\n        \"fragmentName\": \"FullType\"\n      }\n    }\n  ]\n}"
    
    expected_schema_content = "\n" # Set the expected content to a newline character
    
    aggregate_failures do
      expect(described_class.to_definition).to eq(expected_schema_content)
      expect(described_class.to_json).to eq(expected_json_content)
      expect(described_class.to_json).to eq(File.read(Rails.root.join('schema.json')).rstrip)
    end
  end
end