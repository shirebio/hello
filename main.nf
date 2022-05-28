#!/usr/bin/env nextflow
nextflow.enable.dsl=2 

process sayHello {
	label 'ass=fat'
	input: 
		val x
	output:
    	stdout
	script:
    	"""
		echo '$x world!'
		echo "$nextflow.version"
		echo "$params"
		echo "$NXF_ORG"
		echo "$NXF_ENABLE_LABELS_PROPAGATION"
		"""
}

workflow {
	Channel.of('Hello', 'Hola') | sayHello | view
}
