# jenkins
8. Do: Wrap Your Inputs in a Timeout
Pipeline has an easy mechanism for timing out any given step of your pipeline. As a best practice, you should always plan for timeouts around your inputs.

Why? For healthy cleanup of the pipeline, that’s why. Wrapping your inputs in a timeout will allow them to be cleaned-up (i.e., aborted) if approvals don’t occur within a given window.

Example:
1
​
2
timeout(time:5, unit:'DAYS') {
3
    input message:'Approve deployment?', submitter: 'it-ops'
4
}

###########3parralel steps
https://www.jenkins.io/doc/pipeline/examples/
#### Allow sequential stages inside parallel in Declarative syntax
https://issues.jenkins.io/browse/JENKINS-55127?page=com.atlassian.jira.plugin.system.issuetabpanels%3Aall-tabpanel
https://issues.jenkins.io/browse/JENKINS-46809?page=com.atlassian.jira.plugin.system.issuetabpanels%3Acomment-tabpanel&showAll=true
