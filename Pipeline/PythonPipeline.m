clear; clc; close all;
rootdir = '../'; % The root foler of FM-Bench

% Datasets = {'TUM', 'KITTI', 'Tanks_and_Temples', 'CPC'};
Datasets = {'KITTI'};

matcher='RT'; % SIFT with Ratio Test
estimator='RANSAC';

basedir = rootdir;

detectors = {'superpoint', 'SIFT'};
%detectors = {'SIFT'};

for d = 1:length(detectors)
    detector = detectors{d};
    disp(detector);

    wkdir = [rootdir 'output/' detector '/'];

    for s = 1 : length(Datasets)
        dataset = Datasets{s};

        % An example for exhaustive nearest neighbor matching with ratio test
        FeatureMatching(basedir, wkdir, dataset, detector);

        % An example for RANSAC based FM estimation
        GeometryEstimation(basedir, wkdir, dataset, detector, estimator);

    end
end

