# bioinformatic
Trader optimazation algoritm
Classification-based machine learning techniques have been applied to a wide range of biological/clinical applications, resulting in profoundly practical outcomes. Given the importance of artificial intelligence-based techniques in healthcare systems, different machine learning approaches together with various software packages have been designed and developed. However, the existing methods suffer from several limitations such as overfitting on a specific dataset, ignoring the feature selection concept in the preprocessing step, and losing their performance on large-size datasets. To tackle the mentioned restrictions, in this study, we propose a machine learning system consisting of two main steps. First, our previously suggested optimization algorithm (Trader) was extended to select a near-optimal subset of features/genes. Second, a voting-based machine learning technique was proposed to classify the data of interest. To evaluate the performance of the proposed method, it was applied to 13 biological/clinical datasets, and the outcomes were comprehensively compared with the prior methods. The results demonstrated that the Trader algorithm eventuated to a more accurate prediction than other popular/efficient optimization algorithms. Additionally, the proposed machine learning technique gained about 10% of improvement relative to the existing approaches in terms of the mean values associated with 5-fold cross-validation accuracy, precision, recall, specificity, and F-measure. Collectively, it can be concluded that a proper configuration of efficient algorithms and methods can yield practical diagnosis health and treatment plans.

Table 1. The properties of the datasets obtained from the UCI repository
Dataset Name	No of Instances	No of Features	No of Class	Data Type	Missing Values
LIV	345	6	2	Numerical and binary	NO
PID	768	8	2	numerical	NO
SHD	270	13	2	Numerical and binary	NO
CHD2	303	13	2	Numerical and binary	NO
CHD5	303	13	5	Numerical and binary	NO
HEP	150	19	2	Numerical and binary	YES
PAR	197	22	2	Real	YES
WDBC	569	31	2	Real	NO
LUNG	32	56	3	Numerical and binary	YES
ARRYTH	452	279	16	Double	YES
PARKINSON	756	754	2	Numerical and binary	NO
ARCENE	900	10000	2	Numerical	NO
GENEEXPR	801	20531	5	Double	NO
