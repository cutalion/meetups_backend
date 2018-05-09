require "spec_helper"

describe Graphiql::Views::ApplicationLayout do
  let(:layout)   { Graphiql::Views::ApplicationLayout.new(template, {}) }
  let(:rendered) { layout.render }
  let(:template) { Hanami::View::Template.new('apps/graphiql/templates/application.html.erb') }

  it 'contains application name' do
    rendered.must_include('Graphiql')
  end
end
