module Api::Controllers::Graphql
  class Index
    include Api::Action

    params do
      required(:query).filled
    end

    def call(params)
      self.body = Meetups::Graphql::Schema.execute(
        params[:query],
        variables: params[:variables].to_h.transform_keys(&:to_s),
        operation_name: params[:operationName]
      ).to_json
    end
  end
end
