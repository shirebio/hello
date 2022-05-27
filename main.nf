#!/usr/bin/env nextflow
nextflow.enable.dsl=2 

process sayHello {
	label 'ass=fat'
	label k: 'value'
	input: 
		val x
	output:
    	stdout
	script:
    	"""
		echo '$x world!'
		echo 'also hey'

		"""
}

workflow {
	Channel.of('Bonjour', 'Ciao', 'Hello', 'Hola') | sayHello | view
}
