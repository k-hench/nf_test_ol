#!/usr/bin/env nextflow

Channel
	.from([["A", 1], ["B", 2], ["C", 3]])
	.set{ init_ch }

process first_process {
	label "L_loc_first_process"

	input:
	set val( letter ),  val( number ) from init_ch

	output:
	set file( "${letter}.txt" ), val( letter ), val( number ) into process_one_result

	script:
	"""
	echo -e "header\\n${letter}" > ${letter}.txt
	"""
}

process subset_vcf_hamlets_only {
	label "L_2g5m_second_process"
	//label "L_loc_second_process"
	publishDir "result/", mode: 'copy'

	input:
	set file( f ), val( letter ), val( number ) from process_one_result

	output:
	file( "${letter}${letter}.txt" ) into final_result

	script:
	"""
	cat ${f} > ${letter}${letter}.txt
	echo ${number} >> ${letter}${letter}.txt
	"""
}
