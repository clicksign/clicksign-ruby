require 'spec_helper'

describe Clicksign::Document do
  include_context 'mock upload'

  context 'creating new document' do
    let(:client) { Clicksign.client }
    subject(:document) { described_class.create(client, file: 'binary...') }
    it { expect(document).to be_kind_of(described_class) }
  end

  context 'parsing attributes' do
    let(:attributes) do
      {
        key: '080109de-a370-11e5-8ed5-7cd1c3e91b23',
        original_name: 'sample.pdf',
        status: 'running',
        created_at: '2015-12-15 19:12:08 -0200',
        list: {
          started_at: '2015-12-15 19:22:08 -0200',
          user_key: '353da45c-a370-11e5-804f-7cd1c3e91b23',
          signatures: [
            { email: 'jane.doe@example.com', act: 'sign' },
            { email: 'john.doe@example.com', act: 'sign' },
            { email: 'john.roe@example.com', act: 'witness' }
          ]
        }
      }
    end

    subject(:document) { described_class.build(attributes) }

    it { expect(document.key).to eq('080109de-a370-11e5-8ed5-7cd1c3e91b23') }
    it { expect(document.name).to eq('sample.pdf') }
    it { expect(document.status).to eq('running') }
    it { expect(document.created_at).to_not be_nil }
    it { expect(document.started_at).to_not be_nil }
    it { expect(document.user_key).to eq('353da45c-a370-11e5-804f-7cd1c3e91b23') }
    it { expect(document.signers.count).to eq(3) }
  end
end
