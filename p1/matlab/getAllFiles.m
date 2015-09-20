function imageList = getAllFiles(dirName)

  dirData = dir(dirName);      
  dirIndex = [dirData.isdir];  
  imageList = {dirData(~dirIndex).name}';  
  if ~isempty(imageList)
    imageList = cellfun(@(x) fullfile(dirName,x),...  
                       imageList,'UniformOutput',false);
  end
  subDirs = {dirData(dirIndex).name};  
  validIndex = ~ismember(subDirs,{'.','..'});  
                                               
  for iDir = find(validIndex)                  
    nextDir = fullfile(dirName,subDirs{iDir});    
    imageList = [imageList; getAllFiles(nextDir)];  
  end

end
