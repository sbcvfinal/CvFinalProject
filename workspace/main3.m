% CV Final Project
% Junwei Jason Zhang, Jian Jiang
% Dept. of Computer Science, SUNY-Stony Brook
% Efficient MRF Deformation Model for Non-Rigid Image Matching


%function main(option)

t1= clock;
option = 2;

% if option == 1, use grayscale images
% if option == 2, use rgb images

% Read in Images and turn them into gray scale Images
originTemplateImage = imread('../template.png');		% Template Image
originTarget1 = imread('../target1.png');	% Target Images
originTarget2 = imread('../target2.png');
originTarget3 = imread('../target3.png');

grayTemplateImage = rgb2gray(originTemplateImage);
grayTarget1 = rgb2gray(originTarget1);
grayTarget2 = rgb2gray(originTarget2);
grayTarget3 = rgb2gray(originTarget3);

blockSize = 4;
% Get the blocks
disp('Spliting image into blocks...');
if option == 2
    blockList = blockSplit(originTemplateImage, blockSize);
elseif option == 1
    blockList = blockSplit(grayTemplateImage, blockSize);
end
fprintf('Total Block Number %d\n', size(blockList, 1));
% Specify the number of iterations for ICM
iterations = 4;
% Get the labels through ICM optimization
disp('ICM iterations...');
if option == 2
    labels = ICM(blockList, originTemplateImage, originTarget3, iterations, blockSize,option);
elseif option == 1
    labels = ICM(blockList, grayTemplateImage, grayTarget3, iterations, blockSize,option);
end

% draw the result
if option ==2
    [resultTemplate resultTarget] = drawResult(originTemplateImage, originTarget3, blockList, labels, blockSize);
elseif option ==1
    [resultTemplate resultTarget] = drawResult(grayTemplateImage, grayTarget3, blockList, labels, blockSize);
end

t2= clock;
etime(t2,t1);

%end