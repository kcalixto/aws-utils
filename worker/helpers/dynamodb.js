import AWS from 'aws-sdk'

export default class DynamoDBClient {
  tableName
  dynamoDB

  constructor (tableName) {
    this.tableName = tableName
    this.dynamoDB = new AWS.DynamoDB.DocumentClient()
  }

  async putItem (item) {
    const params = {
      TableName: this.tableName,
      Item: item
    }

    await this.dynamoDB.put(params).promise()
  }

  async getItem (key) {
    const params = {
      TableName: this.tableName,
      Key: key
    }

    const result = await this.dynamoDB.get(params).promise()
    return result.Item
  }
}
