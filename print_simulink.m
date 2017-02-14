function print_simulink(model, fileoutput_or_path)
%This function prints every subsystem in a model to EPS format.
%   print_simulink(model) prints every subsystem to a folder 'html'
%   print_simulink(model, 1) prints every subsystem to folder 'html', and
%       generates a file called simulink_images.m which can be used together
%       with publish to include simulink images.
%   print_simulink(model, path) prints every subsystem to folder path
%   Kristian Klausen, 2012

% File name
file = model;

% Print prefix
prefix = 'sim_';

% Format
format = 'epsc'; % Or use 'png', 'eps', 'ps', 'tiff', etc

% Directory
dir = 'html/';

if nargin >= 2
    if ischar(fileoutput_or_path)
        dir = fileoutput_or_path;
    end
end


% Load, and get list
load_system(file);
handles = find_system(file, 'FindAll', 'On', 'SearchDepth', 10, ...
    'regexp', 'on', 'blocktype', 'port');

list = get(handles,'Path');


if ~iscell(list)
    list = {list};
end
list = unique(list);

% add main model
list{end+1} = model;

% Sort alphabetically
list = sort(list);

% List now contains link to every subsystem with a port

% Create directory 'html'
[s, ss] = mkdir(dir);


% GEt only last part of path, that is, after the last /
[r1, r2] = regexpi(list, '[^/]+$', 'tokens', 'match');

% Convert to usable format
names = [r2{:}]';

% Cells of printNames.
% Just rename every non-alphanumeric char to _, all space to ''
printNames = regexprep(names', {'\s', '\W'}, {'', '_'});
% Lowercase
printNames = lower(printNames);



for i = 1 : length(list)
    item = char(list(i));

   % Print
    print(['-s' item], ['-d' format], '-r300', [dir prefix printNames{i}]);
end

%%
%% Second part. Create a file to include all simulink models

if nargin >= 2
    if fileoutput_or_path == 1

        fid = fopen('simulink_images.m', 'w');

        for i = 1:length(printNames)
            fprintf(fid, '%%%% \n%%  \n%% <latex> \n%% \\begin{figure} \n%% \\includegraphics[angle=270, width=\\textwidth]{%s} \n%% \\end{figure} \n%% </latex> \n%% \n', [prefix printNames{i}]);
        end

        fclose(fid);
    end
end
