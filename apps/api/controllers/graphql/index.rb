module Api::Controllers::Graphql
  class Index
    include Api::Action

    params do
      required(:query).filled
    end

    def call(params)
      self.body = Meetups::Schema.execute(params[:query]).to_json
    end
  end
end
