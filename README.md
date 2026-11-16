# immunopipe-RadeM-2024

Analysis of the scRNA-seq data from [Rade, Michael, et al. Nature cancer (2024): 1318-1333.](https://www.nature.com/articles/s43018-024-00763-8) using [immunopipe](https://github.com/pwwang/immunopipe).

> [Rade, Michael, et al. "Single-cell multiomic dissection of response and resistance to chimeric antigen receptor T cells against BCMA in relapsed multiple myeloma" Nature cancer 5.9 (2024): 1318-1333.](https://www.nature.com/articles/s43018-024-00763-8)

## Data preparation

The data was downloaded from [GSE234261](https://www.ncbi.nlm.nih.gov/geo/query/acc.cgi?acc=GSE234261).

Note that in this repo, we only include the scRNA-seq data analysis.

See `prepare-data.sh` for details.

## Configuration

> [!NOTE]
> This is not a replication of the original paper, primarily due to the irreproducibility of the clustering results. This is a reanalysis of the data using [`immunopipe`](https://github.com/pwwang/immunopipe), showing the potential of the pipeline similar analyses listed in the paper.

## Results/Reports

You can find the results in the `Immunopipe-output/` directory.

The reports can be found at [https://imp-radem-2024.pwwang.com/output/REPORTS](https://imp-radem-2024.pwwang.com/output/REPORTS).
