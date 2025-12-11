#!/usr/bin/env nextflow
// hash:sha256:58e4699cf0d92f4b3903c3d03bebf95d22ca03f924787ec012087c377ad9f922

// capsule - aind-fip-harp-base-nwb
process capsule_aind_fip_harp_base_nwb_3 {
	tag 'capsule-3393406'
	container "$REGISTRY_HOST/capsule/a9427f6e-026c-474c-acdd-71ac64b7bfe0"

	cpus 1
	memory '7.5 GB'

	input:
	path 'capsule/data/fiber_raw_data'

	output:
	path 'capsule/results/*', emit: to_capsule_aind_fip_dff_schema_20_2_5

	script:
	"""
	#!/usr/bin/env bash
	set -e

	export CO_CAPSULE_ID=a9427f6e-026c-474c-acdd-71ac64b7bfe0
	export CO_CPUS=1
	export CO_MEMORY=8053063680

	mkdir -p capsule
	mkdir -p capsule/data && ln -s \$PWD/capsule/data /data
	mkdir -p capsule/results && ln -s \$PWD/capsule/results /results
	mkdir -p capsule/scratch && ln -s \$PWD/capsule/scratch /scratch

	echo "[${task.tag}] cloning git repo..."
	if [[ "\$(printf '%s\n' "2.20.0" "\$(git version | awk '{print \$3}')" | sort -V | head -n1)" = "2.20.0" ]]; then
		git -c credential.helper= clone --filter=tree:0 "https://\$GIT_ACCESS_TOKEN@\$GIT_HOST/capsule-3393406.git" capsule-repo
	else
		git -c credential.helper= clone "https://\$GIT_ACCESS_TOKEN@\$GIT_HOST/capsule-3393406.git" capsule-repo
	fi
	mv capsule-repo/code capsule/code && ln -s \$PWD/capsule/code /code
	rm -rf capsule-repo

	echo "[${task.tag}] running capsule..."
	cd capsule/code
	chmod +x run
	./run

	echo "[${task.tag}] completed!"
	"""
}

// capsule - aind-fip-harp-qc-raw
process capsule_aind_fip_harp_qc_raw_4 {
	tag 'capsule-9412949'
	container "$REGISTRY_HOST/capsule/7764def7-3a9e-4ca1-abed-aebb4246f885"

	cpus 1
	memory '7.5 GB'

	input:
	path 'capsule/data/fiber_raw_data'

	output:
	path 'capsule/results/*', emit: to_capsule_aind_generic_quality_control_evaluation_aggregator_1_3

	script:
	"""
	#!/usr/bin/env bash
	set -e

	export CO_CAPSULE_ID=7764def7-3a9e-4ca1-abed-aebb4246f885
	export CO_CPUS=1
	export CO_MEMORY=8053063680

	mkdir -p capsule
	mkdir -p capsule/data && ln -s \$PWD/capsule/data /data
	mkdir -p capsule/results && ln -s \$PWD/capsule/results /results
	mkdir -p capsule/scratch && ln -s \$PWD/capsule/scratch /scratch

	echo "[${task.tag}] cloning git repo..."
	if [[ "\$(printf '%s\n' "2.20.0" "\$(git version | awk '{print \$3}')" | sort -V | head -n1)" = "2.20.0" ]]; then
		git -c credential.helper= clone --filter=tree:0 "https://\$GIT_ACCESS_TOKEN@\$GIT_HOST/capsule-9412949.git" capsule-repo
	else
		git -c credential.helper= clone "https://\$GIT_ACCESS_TOKEN@\$GIT_HOST/capsule-9412949.git" capsule-repo
	fi
	mv capsule-repo/code capsule/code && ln -s \$PWD/capsule/code /code
	rm -rf capsule-repo

	echo "[${task.tag}] running capsule..."
	cd capsule/code
	chmod +x run
	./run

	echo "[${task.tag}] completed!"
	"""
}

// capsule - aind-fip-dff-schema-2.0
process capsule_aind_fip_dff_schema_20_2 {
	tag 'capsule-2174900'
	container "$REGISTRY_HOST/capsule/81cd8544-03e9-4b3b-bb8a-53a595aa31c6"

	cpus 1
	memory '7.5 GB'

	publishDir "$RESULTS_PATH", saveAs: { filename -> filename.matches("capsule/results/nwb") ? new File(filename).getName() : null }

	input:
	path 'capsule/data/fiber_raw_data'
	path 'capsule/data/'

	output:
	path 'capsule/results/*.json', emit: to_capsule_aind_generic_quality_control_evaluation_aggregator_1_1
	path 'capsule/results/dff-qc', emit: to_capsule_aind_generic_quality_control_evaluation_aggregator_1_2
	path 'capsule/results/nwb'

	script:
	"""
	#!/usr/bin/env bash
	set -e

	export CO_CAPSULE_ID=81cd8544-03e9-4b3b-bb8a-53a595aa31c6
	export CO_CPUS=1
	export CO_MEMORY=8053063680

	mkdir -p capsule
	mkdir -p capsule/data && ln -s \$PWD/capsule/data /data
	mkdir -p capsule/results && ln -s \$PWD/capsule/results /results
	mkdir -p capsule/scratch && ln -s \$PWD/capsule/scratch /scratch

	echo "[${task.tag}] cloning git repo..."
	if [[ "\$(printf '%s\n' "2.20.0" "\$(git version | awk '{print \$3}')" | sort -V | head -n1)" = "2.20.0" ]]; then
		git -c credential.helper= clone --filter=tree:0 "https://\$GIT_ACCESS_TOKEN@\$GIT_HOST/capsule-2174900.git" capsule-repo
	else
		git -c credential.helper= clone "https://\$GIT_ACCESS_TOKEN@\$GIT_HOST/capsule-2174900.git" capsule-repo
	fi
	mv capsule-repo/code capsule/code && ln -s \$PWD/capsule/code /code
	rm -rf capsule-repo

	echo "[${task.tag}] running capsule..."
	cd capsule/code
	chmod +x run
	./run

	echo "[${task.tag}] completed!"
	"""
}

// capsule - aind-generic-quality-control-evaluation-aggregator
process capsule_aind_generic_quality_control_evaluation_aggregator_1 {
	tag 'capsule-2492677'
	container "$REGISTRY_HOST/capsule/13f4f8c8-b0af-4ff0-9de0-e9656051b0ea"

	cpus 1
	memory '7.5 GB'

	publishDir "$RESULTS_PATH", saveAs: { filename -> new File(filename).getName() }

	input:
	path 'capsule/data/'
	path 'capsule/data/dff-qc'
	path 'capsule/data/'

	output:
	path 'capsule/results/*'

	script:
	"""
	#!/usr/bin/env bash
	set -e

	export CO_CAPSULE_ID=13f4f8c8-b0af-4ff0-9de0-e9656051b0ea
	export CO_CPUS=1
	export CO_MEMORY=8053063680

	mkdir -p capsule
	mkdir -p capsule/data && ln -s \$PWD/capsule/data /data
	mkdir -p capsule/results && ln -s \$PWD/capsule/results /results
	mkdir -p capsule/scratch && ln -s \$PWD/capsule/scratch /scratch

	echo "[${task.tag}] cloning git repo..."
	if [[ "\$(printf '%s\n' "2.20.0" "\$(git version | awk '{print \$3}')" | sort -V | head -n1)" = "2.20.0" ]]; then
		git -c credential.helper= clone --filter=tree:0 "https://\$GIT_ACCESS_TOKEN@\$GIT_HOST/capsule-2492677.git" capsule-repo
	else
		git -c credential.helper= clone "https://\$GIT_ACCESS_TOKEN@\$GIT_HOST/capsule-2492677.git" capsule-repo
	fi
	mv capsule-repo/code capsule/code && ln -s \$PWD/capsule/code /code
	rm -rf capsule-repo

	echo "[${task.tag}] running capsule..."
	cd capsule/code
	chmod +x run
	./run

	echo "[${task.tag}] completed!"
	"""
}

params.fiber_raw_data_url = 's3://aind-private-data-prod-o5171v/behavior_778334_2025-04-22_11-15-30'

workflow {
	// input data
	fiber_raw_data_to_aind_fip_dff_schema_2_0_4 = Channel.fromPath(params.fiber_raw_data_url + "/", type: 'any')
	fiber_raw_data_to_aind_fip_harp_base_nwb_6 = Channel.fromPath(params.fiber_raw_data_url + "/", type: 'any')
	fiber_raw_data_to_aind_fip_harp_qc_raw_7 = Channel.fromPath(params.fiber_raw_data_url + "/", type: 'any')

	// run processes
	capsule_aind_fip_harp_base_nwb_3(fiber_raw_data_to_aind_fip_harp_base_nwb_6.collect())
	capsule_aind_fip_harp_qc_raw_4(fiber_raw_data_to_aind_fip_harp_qc_raw_7.collect())
	capsule_aind_fip_dff_schema_20_2(fiber_raw_data_to_aind_fip_dff_schema_2_0_4.collect(), capsule_aind_fip_harp_base_nwb_3.out.to_capsule_aind_fip_dff_schema_20_2_5)
	capsule_aind_generic_quality_control_evaluation_aggregator_1(capsule_aind_fip_dff_schema_20_2.out.to_capsule_aind_generic_quality_control_evaluation_aggregator_1_1.collect(), capsule_aind_fip_dff_schema_20_2.out.to_capsule_aind_generic_quality_control_evaluation_aggregator_1_2, capsule_aind_fip_harp_qc_raw_4.out.to_capsule_aind_generic_quality_control_evaluation_aggregator_1_3.collect())
}
