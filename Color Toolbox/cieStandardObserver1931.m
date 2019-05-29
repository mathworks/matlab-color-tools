function out = cieStandardObserver1931(spacing)

if nargin < 1
    spacing = 1;
end

switch spacing
    case 1
        out = cie1931_1nm;
        
    case 5
        out = cie1931_5nm;
        
    otherwise
        error('color:cie:BadObserverSpacing',...
            'Invalid observer spacing. Specify either 1 or 5.')
end

function out = cie1931_1nm

function out = cie1931_5nm
