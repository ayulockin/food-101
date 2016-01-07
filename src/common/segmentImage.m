function segments = segmentImage(image)
%segmentImage Performs segmentation on an image using the SLIC algorithm
%   image: The image to be segmented
%   segments: The produced segments by the SLIC algorithm

% Calculate region size
regionSize = round(max(size(image)) * 0.3);

% Calculate regularizer
regularizer = 0.1;

% Convert input image to L*a*b
imlab = vl_xyz2lab(vl_rgb2xyz(image));

% Compute the segmentation
% Add one to the result in order to start the superpixel indexing from one
% instead of zero
segments = vl_slic(single(imlab), regionSize, regularizer, 'MinRegionSize', (1/2 * regionSize) ^ 2) + 1;

end
