defmodule StoreAdmin.GraphQLTest do
  use ExUnit.Case

  describe "query/2" do
    test "returns a valid graphql document" do
      query_string = StoreAdmin.GraphQL.query(1, "frozen")

      schema_file = "../../schema.json"

      assert :ok == CommonGraphqlClient.StaticValidator.NpmGraphql.validate(
        query_string,
        %{schema_path: schema_file}
      )
    end
  end
end
