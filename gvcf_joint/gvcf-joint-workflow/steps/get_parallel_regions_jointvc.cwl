$namespaces:
  dx: https://www.dnanexus.com/cwl#
arguments:
- position: 0
  valueFrom: sentinel_runtime=cores,$(runtime['cores']),ram,$(runtime['ram'])
- sentinel_parallel=batch-split
- sentinel_outputs=region
- sentinel_inputs=jointvc_batch_rec:record
- run_number=0
baseCommand:
- bcbio_nextgen.py
- runfn
- get_parallel_regions_jointvc
- cwl
class: CommandLineTool
cwlVersion: v1.0
hints:
- class: DockerRequirement
  dockerImageId: quay.io/bcbio/bcbio-vc
  dockerPull: quay.io/bcbio/bcbio-vc
- class: ResourceRequirement
  coresMin: 1
  outdirMin: 1028
  ramMin: 2048
  tmpdirMin: 2
- class: dx:InputResourceRequirement
  indirMin: 1
inputs:
- id: jointvc_batch_rec
  type:
    items:
      fields:
      - name: resources
        type: string
      - name: description
        type: string
      - name: batch_samples
        type:
        - 'null'
        - items: string
          type: array
      - name: validate__summary
        type:
        - File
        - 'null'
      - name: validate__tp
        type:
        - File
        - 'null'
      - name: validate__fp
        type:
        - File
        - 'null'
      - name: validate__fn
        type:
        - File
        - 'null'
      - name: vrn_file
        type: File
      - name: reference__fasta__base
        type: File
      - name: metadata__phenotype
        type: string
      - name: config__algorithm__variantcaller
        type: string
      - name: config__algorithm__coverage_interval
        type:
        - string
        - 'null'
      - name: metadata__batch
        type: string
      - name: config__algorithm__min_allele_fraction
        type: long
      - name: config__algorithm__validate
        type:
        - File
        - 'null'
        - string
      - name: config__algorithm__validate_regions
        type:
        - File
        - 'null'
        - string
      - name: genome_build
        type: string
      - name: genome_resources__aliases__human
        type:
        - string
        - 'null'
        - boolean
      - name: config__algorithm__tools_off
        type:
          items: string
          type: array
      - name: reference__genome_context
        type:
          items: File
          type: array
      - name: analysis
        type: string
      - name: config__algorithm__tools_on
        type:
          items: string
          type: array
      - name: config__algorithm__effects
        type:
        - string
        - 'null'
        - boolean
      - name: config__algorithm__variant_regions
        type:
        - File
        - 'null'
      - name: genome_resources__aliases__ensembl
        type: string
      - name: config__algorithm__exclude_regions
        type:
        - 'null'
        - string
        - items:
          - 'null'
          - string
          type: array
      - name: genome_resources__aliases__snpeff
        type: string
      - name: config__algorithm__variant_regions_merged
        type:
        - File
        - 'null'
      - name: regions__sample_callable
        type:
        - File
        - 'null'
      - name: config__algorithm__callable_regions
        type: File
      name: jointvc_batch_rec
      type: record
    type: array
outputs:
- id: region
  type:
    items: string
    type: array
requirements:
- class: InlineJavascriptRequirement
- class: InitialWorkDirRequirement
  listing:
  - entry: $(JSON.stringify(inputs))
    entryname: cwl.inputs.json
