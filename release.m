function release( tbxname )
%release  Example release script to build, test and package a MATLAB
%toolbox
%
%  Copyright 2016-2017 The MathWorks, Inc.

%% Check input argument
assert( nargin > 0, 'Please provide a valid toolbox name as an input argument.' );
validateattributes( tbxname, {'char'}, {'nonempty'}, '', '', 1 );

%% Get this directory and the current directory
cfdir = fileparts( mfilename( 'fullpath' ) );
tbxDir = fullfile( cfdir, 'tbx');
currentDir = pwd;

%% Add sandbox to MATLAB path
run( fullfile( cfdir, 'addsandbox.m' ) );

%% Check MATLAB and related tools
assert( ~verLessThan( 'MATLAB', '9.1' ), 'MATLAB R2016b or higher is required.' )

%% Check installation
fprintf( 1, 'Checking installation...' );
v = ver( tbxname );
switch numel( v )
    case 0
        fprintf( 1, ' failed.\n' );
        error( '%s not found.', tbxname );
    case 1
        % OK so far
        fprintf( 1, ' Done.\n' );
    otherwise
        fprintf( 1, ' failed.\n' );
        error( 'There are multiple copies of ''%s'' on the MATLAB path.', tbxname );
end

%% Build documentation & examples
fprintf( 1, 'Generating documentation & examples...' );
try
    % Do something;
    fprintf( 1, ' Done.\n' );
catch e
    fprintf( 1, ' failed.\n' );
    e.rethrow()
end

%Build doc search database
builddocsearchdb( fullfile( tbxDir, 'doc' ));

%% Run tests
fprintf( 1, 'Running tests...' );
cd( fullfile( fileparts( tbxDir ), 'tests' ) )
[log, results] = evalc( 'runtests' );
cd( currentDir )
if ~any( [results.Failed] )
    fprintf( 1, ' Done.\n' );
else
    fprintf( 1, ' failed.\n' );
    error( '%s', log )
end

%%  Package and rename.
fprintf( 1, 'Packaging...' );
try
    prj = fullfile( currentDir, [ tbxname, '.prj'] );
    if verLessThan( 'matlab', '9.0' )
        name = char( com.mathworks.toolbox_packaging.services.ToolboxPackagingService.openProject( prj ) );
        com.mathworks.toolbox_packaging.services.ToolboxPackagingService.packageProject( name )
        com.mathworks.toolbox_packaging.services.ToolboxPackagingService.closeProject( name )
    else
        matlab.addons.toolbox.packageToolbox( prj );
    end
    
    oldMltbx = fullfile( currentDir, [tbxname '.mltbx'] );
    newMltbx = fullfile( fileparts( tbxDir ), 'releases', [tbxname ' v' v.Version '.mltbx'] );
    movefile( oldMltbx, newMltbx )
    
    fprintf( 1, ' Done.\n' );
catch e
    fprintf( 1, ' failed.\n' );
    e.rethrow()
end

%% Check package
fprintf( 1, 'Checking package...' );
if verLessThan( 'matlab', '9.0' )
    info = mlAddonGetProperties( newMltbx );
    tver = info.version;
else
    tver = matlab.addons.toolbox.toolboxVersion( newMltbx );
end 

if strcmp( tver, v.Version )
    fprintf( 1, ' Done.\n' );
else
    fprintf( 1, ' failed.\n' );
    error( 'Package version ''%s'' does not match code version ''%s''.', tver, v.Version )
end

%% Show message
fprintf( 1, 'Created package ''%s''.\n', newMltbx );

end % release
