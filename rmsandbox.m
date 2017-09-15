function rmsandbox()
%rmsandbox  Uninstall sandbox
%
%  See also: addsandbox
%
%  Copyright 2016-2017 The MathWorks, Inc.

thisFolder = fileparts( mfilename( 'fullpath' ) );

% TODO: Add folders to remove from MATLAB path
tbxFolder = fullfile( thisFolder, 'tbx' );
fl = dir( tbxFolder );
fl = fl( [fl.isdir] & ~strcmp( {fl.name}, '.' ) & ~strcmp( {fl.name}, '..' ) );

foldersToRemove = [
    tbxFolder;
    strcat( [tbxFolder filesep], {fl.name}' )
    ];

% Capture path
oldPathList = path();

% Remove toolbox directory from saved path
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
savedPathCell = setdiff( savedPathCell, foldersToRemove, 'stable' );
path( sprintf( '%s;', userPathCell{:}, savedPathCell{:} ) )
savepath()

% Restore path minus toolbox directory
path( oldPathList )
rmpath( sprintf( '%s;', foldersToRemove{:} ) )

end % rmsandbox