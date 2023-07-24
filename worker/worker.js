// [X] initial sls config & deploy
// [X] generate link to cancel execution
// [ ] send slack notification 1 day before asking if should exec
// [ ] execute terraform destroy
// [ ] retry at least 3 times after 1h
// [ ] notify on slack when delete starts
// [ ] notify on slack when delete is done
// [ ] notify on slack if delete fails

import SSM from './helpers/ssm.js'

export async function start () {
  const ssm = new SSM()
  const selfServiceUrl = await ssm.getParameter('/tf-dropping-worker/lambdas-url')

  console.log("hi! i'm working as expected :) may i have some vacations?")
  console.log(`${selfServiceUrl}/cancel`)
}

export async function cancel () {
  const response = {
    statusCode: 200,
    body: "ok, i'll cancel my vacations :("
  }

  console.log(response)
  return response
}
