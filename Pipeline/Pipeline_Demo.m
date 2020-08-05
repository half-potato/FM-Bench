clear; clc; close all;
wkdir = '../'; % The root foler of FM-Bench
addpath([wkdir 'vlfeat-0.9.21/toolbox/']);
vl_setup;

% Datasets = {'TUM', 'KITTI', 'Tanks_and_Temples', 'CPC'};
Datasets = {'KITTI'};

matcher='SIFT-RT'; % SIFT with Ratio Test
estimator='RANSAC';
basedir = wkdir;
wkdir = [wkdir 'output/' 'SIFT' '/'];
disp(wkdir)

for s = 1 : length(Datasets)
     dataset = Datasets{s};
    
    % An example for DoG detector
    FeatureDetection(basedir, wkdir, dataset);
    
    % An example for SIFT descriptor
    FeatureExtraction(basedir, wkdir, dataset);
   
    % An example for exhaustive nearest neighbor matching with ratio test
    FeatureMatching(basedir, wkdir, dataset, matcher);
    
    % An example for RANSAC based FM estimation
    GeometryEstimation(basedir, wkdir, dataset, matcher, estimator);
    
end


