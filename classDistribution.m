function [ classDist ] = classDistribution( leaves, numClasses )
%classDistribution Returns the distributions of all classes in all the
%leaves of the forest
%  leaves : All the leaves in the forest
%  numClasses : The number of the different food classes

%  classDist : The class distributions of all the leaves
fprintf('Calculating class distributions\n');

numLeaves = size(leaves, 2);
classDist = zeros(numClasses, numLeaves);

for l = 1:numLeaves
    
    if isempty(leaves(l).trData)
        continue
    end
    
    leafClasses = extractfield(leaves(l).trData, 'classIndex');
    for y = 1:numClasses
        classDist(y,l) = sum(leafClasses == y) / numel(leafClasses);
    end
end

end

