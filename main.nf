#!/usr/bin/env nextflow
nextflow.enable.dsl=2 

process sayHello {
	label 'ass=fat'
	# label frog:'ribbit'
	input: 
		val x
	output:
    	stdout
	script:
    	"""
		echo '$x world!'
		echo "nextflow.version --> $nextflow.version"
		echo "params --> $params"
		echo "workflow.userName --> $workflow.userName"
		echo "workflow.configFiles --> $workflow.configFiles"
		echo "workflow.commandLine --> $workflow.commandLine"
		echo "workflow.repository --> $workflow.repository"
		echo "workflow.commitId --> $workflow.commitId"
		echo "workflow.revision --> $workflow.revision"
		echo "workflow.profile --> $workflow.profile"
		echo "workflow.runName --> $workflow.runName"
		echo "workflow.sessionId --> $workflow.sessionId"
		"""
}

workflow {
	Channel.of('Hello', 'Hola') | sayHello | view
}
