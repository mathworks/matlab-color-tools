function addsandbox()
%addsandbox  Install sandbox
%
%  See also: rmsandbox
%
%  Copyright 2016-2017 The MathWorks, Inc.

thisFolder = fileparts( mfilename( 'fullpath' ) );

% TODO: Add folders to add to MATLAB path
tbxFolder = fullfile( thisFolder, 'tbx' );
fl = dir( tbxFolder );
fl = fl( [fl.isdir] & ~strcmp( {fl.name}, '.' ) & ~strcmp( {fl.name}, '..' ) );

foldersToAdd = [
    tbxFolder;
    strcat( [tbxFolder filesep], {fl.name}' )
    ];

% Capture path
oldPathList = path();

% Add toolbox directory to saved path
userPathList = userpath();
if isempty( userPathList )
    userPathCell = cell( [0 1] );
else
    userPathCell = textscan( userPathList, '%s', 'Delimiter', ';' );
    userPathCell = userPathCell{:};
end
savedPathList = pathdef();
savedPathCell = textscan( savedPathList, '%s', 'Delimiter', ';' );
savedPathCell = savedPathCell{:};
savedPathCell = setdiff( savedPathCell, userPathCell, 'stable' );
savedPathCell = [foldersToAdd; savedPathCell];
path( sprintf( '%s;', userPathCell{:}, savedPathCell{:} ) )
savepath()

% Restore path plus toolbox directory
path( oldPathList )
addpath( sprintf( '%s;', foldersToAdd{:} ) )

end % addsandbox