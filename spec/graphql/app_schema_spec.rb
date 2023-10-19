require 'rails_helper'

RSpec.describe BeFoodieBrainSchema do
  it 'matches the dumped schema (rails graphql:schema:dump)' do
    schema_content = File.read(File.join(Rails.root, 'schema.graphql')).rstrip
    json_content = File.read(File.join(Rails.root, 'schema.json')).rstrip

    aggregate_failures do
      expect(described_class.to_definition).to eq(schema_content + "\n")
      expect(described_class.to_json).to eq(json_content)
    end
  end
end

