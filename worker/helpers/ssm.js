import { AWS } from 'aws-sdk'

export default class SSM {
  conn

  constructor () {
    this.conn = new AWS.SSM()
  }

  async getParameter (key) {
    const params = {
      Name: key,
      WithDecryption: true
    }

    const result = await this.conn.getParameter(params).promise()
    return result.Parameter.Value
  }
}
