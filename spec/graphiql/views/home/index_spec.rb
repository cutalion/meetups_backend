require_relative '../../../spec_helper'

describe Graphiql::Views::Home::Index do
  let(:exposures) { Hash[format: :html] }
  let(:template)  { Hanami::View::Template.new('apps/graphiql/templates/home/index.html.erb') }
  let(:view)      { Graphiql::Views::Home::Index.new(template, exposures) }
  let(:rendered)  { view.render }

  it 'exposes #format' do
    view.format.must_equal exposures.fetch(:format)
  end
end
