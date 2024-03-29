[![PWC](https://img.shields.io/endpoint.svg?url=https://paperswithcode.com/badge/a-novel-automatic-shot-boundary-detection/camera-shot-boundary-detection-on-trecvid)](https://paperswithcode.com/sota/camera-shot-boundary-detection-on-trecvid?p=a-novel-automatic-shot-boundary-detection)

[![View Temporal video segmentation: Shot boundary boundary detetion on File Exchange](https://www.mathworks.com/matlabcentral/images/matlab-file-exchange.svg)](https://uk.mathworks.com/matlabcentral/fileexchange/125710-temporal-video-segmentation-shot-boundary-boundary-detetion)

[![PWC](https://img.shields.io/endpoint.svg?url=https://paperswithcode.com/badge/a-novel-automatic-shot-boundary-detection/camera-shot-boundary-detection-on-msu-shot)](https://paperswithcode.com/sota/camera-shot-boundary-detection-on-msu-shot?p=a-novel-automatic-shot-boundary-detection)

# A Novel Automatic Shot Boundary Detection Algorithm Robust to Illumination and Motion Effect
A novel method for SBD using LBP-HF and Canny edge difference

Key features of the proposed approach
1. Illumination invariant 
2. Invariant to certain amount of motion effect
3. Use of adaptive wiener filter in preprocessing
4. Rotation invariant


This system is divided into a two stages as described in a paper A Novel Automatic Shot Boundary Detection Algorithm Robust to : Illumination and Motion Effect.

First Stage
Bolckwise LBP-HF is used for finding dissimilarity difference between consecutive frames and marking probable abrupt transition

Second stage

Blockwise canny edge difference between the corresponding blocks of consecutive frame is calculated and this stage is used as confirmation stage.

**Application installer:** 

  **For windows and mac:** [Available here!](https://drive.google.com/drive/folders/18AjsPxW48HiwY3cb23yBnYtzvsP22AJJ?usp=sharing) 



If you are using our algorithm, please consider citing the following papers:

1. **Singh, Alok**, Dalton Meitei Thounaojam, and Saptarshi Chakraborty. "**A novel automatic shot boundary detection algorithm: robust to illumination and motion effect.**" Signal, Image and Video Processing (2019): 1-9. https://doi.org/10.1007/s11760-019-01593-3

2. Chakraborty, Saptarshi, **Alok Singh**, and Dalton Meitei Thounaojam. "**A novel bifold-stage shot boundary detection algorithm: invariant to motion and illumination**." The Visual Computer (2021): 1-12.


Acknowledgements :
1. https://in.mathworks.com/
2. <a>https://in.mathworks.com/help/vision/ref/extractlbpfeatures.html</a> 
3. https://trecvid.nist.gov/
