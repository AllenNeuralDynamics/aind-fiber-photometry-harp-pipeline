#!/usr/bin/env nextflow
// hash:sha256:89b4c8b534e7a74b6934c2bba16528aec48d9b3d40f3b98a16c553f7d1e93663

// capsule - aind-fip-harp-base-nwb
process capsule_aind_fip_harp_base_nwb_3 {
	tag 'capsule-0521736'
	container "$REGISTRY_HOST/published/f61f6066-1a16-4f72-8482-144b26d552fe:v3"

	cpus 1
	memory '7.5 GB'

	input:
	path 'capsule/data/fiber_raw_data'

	output:
	path 'capsule/results/*', emit: to_capsule_aind_fip_dff_2_1

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
		git -c credential.helper= clone --filter=tree:0 --branch v3.0 "https://\$GIT_ACCESS_TOKEN@\$GIT_HOST/capsule-0521736.git" capsule-repo
	else
		git -c credential.helper= clone --branch v3.0 "https://\$GIT_ACCESS_TOKEN@\$GIT_HOST/capsule-0521736.git" capsule-repo
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
	container "$REGISTRY_HOST/published/55a33c6a-19f5-4edc-90f0-d1e5b69e51c8:v6"

	cpus 1
	memory '7.5 GB'

	publishDir "$RESULTS_PATH", mode: 'copy', saveAs: { filename -> filename.matches("capsule/results/qc-raw") ? new File(filename).getName() : null }

	input:
	path 'capsule/data/fiber_raw_data'

	output:
	path 'capsule/results/qc-raw'
	path 'capsule/results/*.json', emit: to_capsule_aind_metadata_manager_capsule_5_7

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
		git -c credential.helper= clone --filter=tree:0 --branch v6.0 "https://\$GIT_ACCESS_TOKEN@\$GIT_HOST/capsule-7675914.git" capsule-repo
	else
		git -c credential.helper= clone --branch v6.0 "https://\$GIT_ACCESS_TOKEN@\$GIT_HOST/capsule-7675914.git" capsule-repo
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

// capsule - aind-fip-dff
process capsule_aind_fip_dff_2 {
	tag 'capsule-1001867'
	container "$REGISTRY_HOST/published/603a2149-6281-4a7b-bbd6-ff50ca0e064e:v20"

	cpus 2
	memory '15 GB'

	publishDir "$RESULTS_PATH", mode: 'copy', saveAs: { filename -> filename.matches("capsule/results/(dff-qc|fiber\\.nwb\\.zarr)") ? new File(filename).getName() : null }

	input:
	path 'capsule/data/fib_raw_nwb/'
	path 'capsule/data/fiber_raw_data'

	output:
	path 'capsule/results/{dff-qc,fiber.nwb.zarr}'
	path 'capsule/results/*.json', emit: to_capsule_aind_metadata_manager_capsule_5_5
	path 'capsule/results/dff-qc/*.json', emit: to_capsule_aind_metadata_manager_capsule_5_6

	script:
	"""
	#!/usr/bin/env bash
	set -e

	export CO_CAPSULE_ID=603a2149-6281-4a7b-bbd6-ff50ca0e064e
	export CO_CPUS=2
	export CO_MEMORY=16106127360

	mkdir -p capsule
	mkdir -p capsule/data && ln -s \$PWD/capsule/data /data
	mkdir -p capsule/results && ln -s \$PWD/capsule/results /results
	mkdir -p capsule/scratch && ln -s \$PWD/capsule/scratch /scratch

	echo "[${task.tag}] cloning git repo..."
	if [[ "\$(printf '%s\n' "2.20.0" "\$(git version | awk '{print \$3}')" | sort -V | head -n1)" = "2.20.0" ]]; then
		git -c credential.helper= clone --filter=tree:0 --branch v20.0 "https://\$GIT_ACCESS_TOKEN@\$GIT_HOST/capsule-1001867.git" capsule-repo
	else
		git -c credential.helper= clone --branch v20.0 "https://\$GIT_ACCESS_TOKEN@\$GIT_HOST/capsule-1001867.git" capsule-repo
	fi
	mv capsule-repo/code capsule/code && ln -s \$PWD/capsule/code /code
	rm -rf capsule-repo

	echo "[${task.tag}] running capsule..."
	cd capsule/code
	chmod +x run
	./run ${params.capsule_aind_fip_dff_2_args}

	echo "[${task.tag}] completed!"
	"""
}

// capsule - aind-metadata-manager-capsule
process capsule_aind_metadata_manager_capsule_5 {
	tag 'capsule-8324994'
	container "$REGISTRY_HOST/published/22261566-0b4f-42aa-bcaa-58efa55bf653:v7"

	cpus 1
	memory '7.5 GB'

	publishDir "$RESULTS_PATH", mode: 'copy', saveAs: { filename -> new File(filename).getName() }

	input:
	path 'capsule/data/dff-qc/'
	path 'capsule/data/dff-qc/'
	path 'capsule/data/'
	path 'capsule/data'

	output:
	path 'capsule/results/*'

	script:
	"""
	#!/usr/bin/env bash
	set -e

	export CO_CAPSULE_ID=22261566-0b4f-42aa-bcaa-58efa55bf653
	export CO_CPUS=1
	export CO_MEMORY=8053063680

	mkdir -p capsule
	mkdir -p capsule/data && ln -s \$PWD/capsule/data /data
	mkdir -p capsule/results && ln -s \$PWD/capsule/results /results
	mkdir -p capsule/scratch && ln -s \$PWD/capsule/scratch /scratch

	echo "[${task.tag}] cloning git repo..."
	if [[ "\$(printf '%s\n' "2.20.0" "\$(git version | awk '{print \$3}')" | sort -V | head -n1)" = "2.20.0" ]]; then
		git -c credential.helper= clone --filter=tree:0 --branch v7.0 "https://\$GIT_ACCESS_TOKEN@\$GIT_HOST/capsule-8324994.git" capsule-repo
	else
		git -c credential.helper= clone --branch v7.0 "https://\$GIT_ACCESS_TOKEN@\$GIT_HOST/capsule-8324994.git" capsule-repo
	fi
	mv capsule-repo/code capsule/code && ln -s \$PWD/capsule/code /code
	rm -rf capsule-repo

	echo "[${task.tag}] running capsule..."
	cd capsule/code
	chmod +x run
	./run ${params.capsule_aind_metadata_manager_capsule_5_args}

	echo "[${task.tag}] completed!"
	"""
}

params.fiber_raw_data_url = 's3://aind-open-data/804430_2025-10-30_23-15-07'

workflow {
	// input data
	fiber_raw_data_to_aind_fip_dff_2 = Channel.fromPath(params.fiber_raw_data_url + "/", type: 'any')
	fiber_raw_data_to_aind_fip_harp_base_nwb_3 = Channel.fromPath(params.fiber_raw_data_url + "/", type: 'any')
	fiber_raw_data_to_aind_fip_harp_qc_raw_4 = Channel.fromPath(params.fiber_raw_data_url + "/", type: 'any')
	fiber_raw_data_to_aind_metadata_manager_capsule_8 = Channel.fromPath(params.fiber_raw_data_url + "/", type: 'any')

	// run processes
	capsule_aind_fip_harp_base_nwb_3(fiber_raw_data_to_aind_fip_harp_base_nwb_3.collect())
	capsule_aind_fip_harp_qc_raw_4(fiber_raw_data_to_aind_fip_harp_qc_raw_4.collect())
	capsule_aind_fip_dff_2(capsule_aind_fip_harp_base_nwb_3.out.to_capsule_aind_fip_dff_2_1.collect(), fiber_raw_data_to_aind_fip_dff_2.collect())
	capsule_aind_metadata_manager_capsule_5(capsule_aind_fip_dff_2.out.to_capsule_aind_metadata_manager_capsule_5_5.collect(), capsule_aind_fip_dff_2.out.to_capsule_aind_metadata_manager_capsule_5_6.collect(), capsule_aind_fip_harp_qc_raw_4.out.to_capsule_aind_metadata_manager_capsule_5_7.collect(), fiber_raw_data_to_aind_metadata_manager_capsule_8.collect())
}
