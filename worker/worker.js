// [ ] initial sls config & deploy
// [ ] generate link to cancel execution
// [ ] send slack notification 1 day before asking if should exec
// [ ] execute terraform destroy
// [ ] retry at least 3 times after 1h
// [ ] notify on slack when delete starts
// [ ] notify on slack when delete is done
// [ ] notify on slack if delete fails

export async function start () {

export async function cancel () {
  return {
    body: "ok, i'll cancel my vacations :(",
    stausCode: 200
  }
}
