function split_into_blocks(setName)
%SPLIT_INTO_BLOCKS split images in folder into non-overlapping blocks
%   Detailed explanation goes here
Munchen = './datasets/3k_Munchen';
imdb = imdb_from_munchen(Munchen, setName);
% split every image and save into 'BlockImages' folder
%for k=1:length(imdb.image_ids)
k=1;
im_name=sprintf('%s/%s.jpg', imdb.image_dir,imdb.image_ids{k});
image=imread(im_name);
%imshow(image);
[rows columns channels] = size(image);
[blockSizeR,blockSizeC]=bestblk([rows columns],600);
wholeBlockRows = rows / blockSizeR;
blockVectorR = [blockSizeR * ones(1, wholeBlockRows)];
wholeBlockCols = columns / blockSizeC;
blockVectorC = [blockSizeC * ones(1, wholeBlockCols)];
ca = mat2cell(image, blockVectorR, blockVectorC, channels);
for block_index=1:numel(ca)
    imwrite(ca{block_index},sprintf('%s/BlockImages/%s_%d.jpg', imdb.image_dir,imdb.image_ids{k},block_index))
end
%end
  
end



