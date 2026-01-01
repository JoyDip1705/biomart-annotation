# DEG Annotation with biomaRt

This project provides an automated R workflow to annotate Differentially Expressed Genes (DEGs) using the [Ensembl BioMart](www.ensembl.org) database. It converts Ensembl Gene IDs into human-readable gene symbols and biotypes.

## 🚀 Features
* **ID Normalization:** Automatically strips version numbers from Ensembl IDs (e.g., `ENSG000001.12` → `ENSG000001`) to ensure compatibility with BioMart.
* **Automated Mapping:** Fetches `external_gene_name` and `gene_biotype` directly from the `hsapiens_gene_ensembl` dataset.
* **Data Integration:** Merges annotations back into your original DEG results for a complete analysis-ready table.

## 🛠️ Prerequisites
Before running the script, ensure you have the following R packages installed:

```R
if (!require("BiocManager", quietly = TRUE))
    install.packages("BiocManager")

BiocManager::install("biomaRt")


📁 Usage

1. Prepare your data: Ensure your DEG file is in CSV format with Ensembl IDs in the first column.
2. Update the path: Change the file path in read.csv() to match your local file location.
3. Run the script.

📊 Sample Output
The script generates a merged data frame (new_deg) containing:
ensembl_id	    ... (original data)	external_gene_name	gene_biotype
ENSG00000139618	...	                BRCA2	              protein_coding
ENSG00000157764	...	                BRAF	              protein_coding

🧪 Best Practices Applied

1. Reproducibility: Avoids GUI-based editing to ensure the analysis is traceable.
2. Clean Code: Uses extensive commenting and descriptive variable names.
3. Data Integrity: Treats the original dataset as read-only by creating a new new_deg object.

