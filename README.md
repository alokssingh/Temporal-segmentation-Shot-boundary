# A Novel Automatic Shot Boundary Detection Algorithm Robust to Illumination and Motion Effect
A novel method for SBD using LBP-HF and Canny edge difference

Key features of the proposed approach
1. Illumination invariant 
2. Invariant to certain amount of motion effect
3. Use of adaptive wiener filtere in preprocessing
4. Rotation invariant


This system is divided into a two stages as described in a paper A Novel Automatic Shot Boundary Detection Algorithm Robust to : Illumination and Motion Effect.

First Stage
Bolckwise LBP-HF is used for finding dissimilarity difference between consecutive frames and marking probable abrupt transition

Second stage

Blockwise canny edge difference between the corresponding blocks of consecutive frame is calculated and this stage is used as confirmation stage.






If you are using our algorithm, please consider citing the following papers:

1. **Singh, Alok**, Dalton Meitei Thounaojam, and Saptarshi Chakraborty. "**A novel automatic shot boundary detection algorithm: robust to illumination and motion effect.**" Signal, Image and Video Processing (2019): 1-9.

2. **Singh, Alok**, Thoudam Doren Singh, and Sivaji Bandyopadhyay. "**NITS-VC System for VATEX Video Captioning Challenge 2020**." arXiv preprint arXiv:2006.04058 (2020).
