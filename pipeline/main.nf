#!/usr/bin/env nextflow
// hash:sha256:ef09e9e28acfeac4e94a475c554dcd618b808d48c64d71dd0cdcf2d46febc4b7

// capsule - aind-fip-harp-base-nwb
process capsule_aind_fip_harp_base_nwb_3 {
	tag 'capsule-0521736'
	container "$REGISTRY_HOST/published/f61f6066-1a16-4f72-8482-144b26d552fe:v1"

	cpus 1
	memory '7.5 GB'

	input:
	path 'capsule/data/fiber_raw_data'

	output:
	path 'capsule/results/*', emit: to_capsule_aind_fip_dff_schema_20_2_4

	script:
	"""
	#!/usr/bin/env bash
	set -e

	export CO_CAPSULE_ID=f61f6066-1a16-4f72-8482-144b26d552fe
	export CO_CPUS=1
	export CO_MEMORY=8053063680

	mkdir -p capsule
	mkdir -p capsule/data && ln -s \$PWD/capsule/data /data
	mkdir -p capsule/results && ln -s \$PWD/capsule/results /results
	mkdir -p capsule/scratch && ln -s \$PWD/capsule/scratch /scratch

	echo "[${task.tag}] cloning git repo..."
	if [[ "\$(printf '%s\n' "2.20.0" "\$(git version | awk '{print \$3}')" | sort -V | head -n1)" = "2.20.0" ]]; then
		git -c credential.helper= clone --filter=tree:0 --branch v1.0 "https://\$GIT_ACCESS_TOKEN@\$GIT_HOST/capsule-0521736.git" capsule-repo
	else
		git -c credential.helper= clone --branch v1.0 "https://\$GIT_ACCESS_TOKEN@\$GIT_HOST/capsule-0521736.git" capsule-repo
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
	tag 'capsule-7675914'
	container "$REGISTRY_HOST/published/55a33c6a-19f5-4edc-90f0-d1e5b69e51c8:v1"

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

	export CO_CAPSULE_ID=55a33c6a-19f5-4edc-90f0-d1e5b69e51c8
	export CO_CPUS=1
	export CO_MEMORY=8053063680

	mkdir -p capsule
	mkdir -p capsule/data && ln -s \$PWD/capsule/data /data
	mkdir -p capsule/results && ln -s \$PWD/capsule/results /results
	mkdir -p capsule/scratch && ln -s \$PWD/capsule/scratch /scratch

	echo "[${task.tag}] cloning git repo..."
	if [[ "\$(printf '%s\n' "2.20.0" "\$(git version | awk '{print \$3}')" | sort -V | head -n1)" = "2.20.0" ]]; then
		git -c credential.helper= clone --filter=tree:0 --branch v1.0 "https://\$GIT_ACCESS_TOKEN@\$GIT_HOST/capsule-7675914.git" capsule-repo
	else
		git -c credential.helper= clone --branch v1.0 "https://\$GIT_ACCESS_TOKEN@\$GIT_HOST/capsule-7675914.git" capsule-repo
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
	tag 'capsule-2347641'
	container "$REGISTRY_HOST/published/3f080c71-507d-419d-98ce-81765cea8112:v1"

	cpus 1
	memory '7.5 GB'

	publishDir "$RESULTS_PATH", saveAs: { filename -> filename.matches("capsule/results/nwb") ? new File(filename).getName() : null }

	input:
	path 'capsule/data/'
	path 'capsule/data/fiber_raw_data'

	output:
	path 'capsule/results/*.json', emit: to_capsule_aind_generic_quality_control_evaluation_aggregator_1_1
	path 'capsule/results/dff-qc', emit: to_capsule_aind_generic_quality_control_evaluation_aggregator_1_2
	path 'capsule/results/nwb'

	script:
	"""
	#!/usr/bin/env bash
	set -e

	export CO_CAPSULE_ID=3f080c71-507d-419d-98ce-81765cea8112
	export CO_CPUS=1
	export CO_MEMORY=8053063680

	mkdir -p capsule
	mkdir -p capsule/data && ln -s \$PWD/capsule/data /data
	mkdir -p capsule/results && ln -s \$PWD/capsule/results /results
	mkdir -p capsule/scratch && ln -s \$PWD/capsule/scratch /scratch

	echo "[${task.tag}] cloning git repo..."
	if [[ "\$(printf '%s\n' "2.20.0" "\$(git version | awk '{print \$3}')" | sort -V | head -n1)" = "2.20.0" ]]; then
		git -c credential.helper= clone --filter=tree:0 --branch v1.0 "https://\$GIT_ACCESS_TOKEN@\$GIT_HOST/capsule-2347641.git" capsule-repo
	else
		git -c credential.helper= clone --branch v1.0 "https://\$GIT_ACCESS_TOKEN@\$GIT_HOST/capsule-2347641.git" capsule-repo
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
	tag 'capsule-5290719'
	container "$REGISTRY_HOST/published/03b3acfd-fdef-46b0-ad80-50e9d4e00827:v2"

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

	export CO_CAPSULE_ID=03b3acfd-fdef-46b0-ad80-50e9d4e00827
	export CO_CPUS=1
	export CO_MEMORY=8053063680

	mkdir -p capsule
	mkdir -p capsule/data && ln -s \$PWD/capsule/data /data
	mkdir -p capsule/results && ln -s \$PWD/capsule/results /results
	mkdir -p capsule/scratch && ln -s \$PWD/capsule/scratch /scratch

	echo "[${task.tag}] cloning git repo..."
	if [[ "\$(printf '%s\n' "2.20.0" "\$(git version | awk '{print \$3}')" | sort -V | head -n1)" = "2.20.0" ]]; then
		git -c credential.helper= clone --filter=tree:0 --branch v2.0 "https://\$GIT_ACCESS_TOKEN@\$GIT_HOST/capsule-5290719.git" capsule-repo
	else
		git -c credential.helper= clone --branch v2.0 "https://\$GIT_ACCESS_TOKEN@\$GIT_HOST/capsule-5290719.git" capsule-repo
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
	fiber_raw_data_to_aind_fip_dff_schema_2_0_5 = Channel.fromPath(params.fiber_raw_data_url + "/", type: 'any')
	fiber_raw_data_to_aind_fip_harp_base_nwb_6 = Channel.fromPath(params.fiber_raw_data_url + "/", type: 'any')
	fiber_raw_data_to_aind_fip_harp_qc_raw_7 = Channel.fromPath(params.fiber_raw_data_url + "/", type: 'any')

	// run processes
	capsule_aind_fip_harp_base_nwb_3(fiber_raw_data_to_aind_fip_harp_base_nwb_6.collect())
	capsule_aind_fip_harp_qc_raw_4(fiber_raw_data_to_aind_fip_harp_qc_raw_7.collect())
	capsule_aind_fip_dff_schema_20_2(capsule_aind_fip_harp_base_nwb_3.out.to_capsule_aind_fip_dff_schema_20_2_4.collect(), fiber_raw_data_to_aind_fip_dff_schema_2_0_5.collect())
	capsule_aind_generic_quality_control_evaluation_aggregator_1(capsule_aind_fip_dff_schema_20_2.out.to_capsule_aind_generic_quality_control_evaluation_aggregator_1_1.collect(), capsule_aind_fip_dff_schema_20_2.out.to_capsule_aind_generic_quality_control_evaluation_aggregator_1_2, capsule_aind_fip_harp_qc_raw_4.out.to_capsule_aind_generic_quality_control_evaluation_aggregator_1_3.collect())
}
