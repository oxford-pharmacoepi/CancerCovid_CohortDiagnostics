# CancerCovid_CohortDiagnostics

This code is designed to run cohort diagnostics on the following outcome cohorts for the Cancer Covid study:

- Use of endocrine treatments in breast and prostate cancer (Aromatase Inhibitors, Tamoxifen, Androgen Deprivation Therapy with GnRH, GnRH as monotherapy for prostate cancer; LHRH antagonists);
- Endocrine treatment-related outcomes (osteoporosis, osteopenia, bone fracture, prescriptions of bisphosphonates and denosumab);
- Screening tests relevant to all four cancers (mammograms, biopsy of breast, bowel cancer screening programmes, sigmoidoscopy, colonoscopy, bronchoscopy, prostate specific antigen tests).

Note that this code does not run cohort diagnostics on breast, colorectal, lung and prostate cancer cohorts as these cohorts have previously been validated in another cancer study.

## To Run
1. Download this entire repository (you can download as a zip folder using Code -> Download ZIP, or you can use GitHub Desktop).
2. Open the project CancerCovid_CohortDiagnostics.Rproj in RStudio (when inside the project, you will see its name on the top-right of your RStudio session)
3. Open and work though the CodeToRun.R file which should be the only file that you need to interact with. Run the lines in the file, adding your database specific information and so on (see comments within the file for instructions). The last line of this file will run the study (source(here("RunStudy.R")).
4. After running you should then have a zip folder with results to share in your output folder.


## Changing/ adding cohort definitions
Cohort definitions are in the folder 1_InstantiateCohorts\Cohorts. Whatever cohorts are present in this folder will be run, with the file name used as the name for the cohort.
