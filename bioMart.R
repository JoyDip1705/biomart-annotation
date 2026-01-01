# Load the biomaRt library for accessing Ensembl biological databases
library(biomaRt)

# Read the DEG results from a local CSV file into a data frame
deg <- read.csv("C:/Users/Joy/Downloads/DEGs.csv",
                header = T,
                stringsAsFactors = F)

# Clean Ensembl IDs by removing version numbers (e.g., "ENSG000001.12" becomes "ENSG000001")
# This is necessary because BioMart filters typically require the base ID without the dot
deg$ensembl_id <- gsub("\\..*", "", deg[,1])

# Establish a connection to the Ensembl database, specifically the Human (hsapiens) gene dataset
con_mart <- useMart(biomart = "ensembl",
                    dataset = "hsapiens_gene_ensembl")

# Query BioMart to retrieve specific annotations for the cleaned Ensembl IDs
# It fetches the Ensembl ID (for matching), the Gene Symbol (external_gene_name), and the Biotype
gene_annot <- getBM(attributes = c("ensembl_gene_id",
                                   "external_gene_name",
                                   "gene_biotype"),
                    filters = "ensembl_gene_id",
                    values = deg$ensembl_id,
                    mart = con_mart)

# Display the first few rows of the retrieved annotation data to verify the results
head(gene_annot)

# Merge the original DEG data with the new annotations based on the Ensembl ID columns
# all.x = T ensures that all original genes are kept, even if no annotation was found
new_deg <- merge(deg,
                 gene_annot,
                 by.x = "ensembl_id",
                 by.y = "ensembl_gene_id",
                 all.x = T)

# Preview the final merged data frame containing both expression data and gene symbols
head(new_deg)
