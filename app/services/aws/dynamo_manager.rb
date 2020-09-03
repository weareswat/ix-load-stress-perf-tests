require 'aws-sdk-dynamodb'

module Aws
  class DynamoManager
    attr_reader :dynamo_client

    def initialize
      @dynamo_client ||= Aws::DynamoDB::Client.new(
          access_key_id: "AKIAJPTPBFWKDI2CKMJA",
          secret_access_key: "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",
          region: "eu-west-1".freeze
      )
    end

    def create_item(table_name, item_hash)
      dynamo_client.put_item({
                                 item: item_hash,
                                 return_consumed_capacity: "TOTAL",
                                 table_name: table_name,
                                 return_values: "ALL_OLD", # accepts NONE, ALL_OLD, UPDATED_OLD, ALL_NEW, UPDATED_NEW
                             })
    end

    def get_item_by_pk(table_name, partition_key_attr, partition_key_val)
      item = dynamo_client.query({
                                     key_condition_expression: "#{partition_key_attr} = :key",
                                     expression_attribute_values: { ":key": partition_key_val },
                                     table_name: table_name
                                 })
      item.items[0] || {}
    end

    def delete_item(table_name, key_hash)
      dynamo_client.delete_item({
                                    table_name: table_name,
                                    key: key_hash
                                })
    end

    def update_item(table_name, item_hash, new_sequence_number)
      dynamo_client.put_item({
                                 item: item_hash,
                                 condition_expression: "CurrentNumber < :lastNumber",
                                 expression_attribute_values: {":lastNumber": new_sequence_number},
                                 return_consumed_capacity: "TOTAL",
                                 table_name: table_name,
                                 return_values: "ALL_OLD", # accepts NONE, ALL_OLD, UPDATED_OLD, ALL_NEW, UPDATED_NEW
                             })
    end

    def get_item_by_pk_sk(table_name, partition_key_attr, partition_key_val, sort_key_attr, sort_key_val)
      item = dynamo_client.query({
                                     key_condition_expression: "#{partition_key_attr} = :key and #{sort_key_attr} = :sortkey",
                                     expression_attribute_values: {":key": partition_key_val, ":sortkey": sort_key_val},
                                     table_name: table_name
                                 })
      item.items[0] || {}
    end

  end
end