function [T] = parseInfoRound(inText)
% Reads in a long char vector, specificially the output .txt generated by
% BasicParadigmEnhanced program during a touchscreen task recording.
% Creates a table-row of data about the entire recording. 

% Author: Ed Bello
% Created: 2019/03/29




TriggersPattern = 'Triggers:\s+(\d+)';
data = regexp(inText, TriggersPattern, 'tokens');
Triggers = str2double(cell2mat(data{1}));

PresentationsPattern = 'Presentations:\s+(\d+)';
data = regexp(inText, PresentationsPattern, 'tokens');
Presentations = str2double(cell2mat(data{1}));

SuccessTrialsPattern = 'SuccessTrials:\s+(\d+)';
data = regexp(inText, SuccessTrialsPattern, 'tokens');
SuccessTrials = str2double(cell2mat(data{1}));

ErrorTrialsPattern = 'ErrorTrials:\s+(\d+)';
data = regexp(inText, ErrorTrialsPattern, 'tokens');
ErrorTrials = str2double(cell2mat(data{1}));

AbortedTrialsPattern = 'AbortedTrials:\s+(\d+)';
data = regexp(inText, AbortedTrialsPattern, 'tokens');
AbortedTrials = str2double(cell2mat(data{1}));

TargetHoldFailureTrialsPattern = 'TargetHoldFailureTrials:\s+(\d+)';
data = regexp(inText, TargetHoldFailureTrialsPattern, 'tokens');
TargetHoldFailureTrials = str2double(cell2mat(data{1}));

ReplicationsCompletedPattern = 'ReplicationsCompleted:\s+(\d+)';
data = regexp(inText, ReplicationsCompletedPattern, 'tokens');
ReplicationsCompleted = str2double(cell2mat(data{1}));

% Get total time of this round
tBegPattern = 'Date:\s+\d+/\d+/\d+\s+(\d+:\d+:\d+)';

monthPattern = 'Date:\s+(\d+)';
data = regexp(inText, monthPattern, 'tokens');
MM = str2double(cell2mat(data{1}));

dayPattern = 'Date:\s+\d+/(\d+)';
data = regexp(inText, dayPattern, 'tokens');
DD = str2double(cell2mat(data{1}));

yearPattern = 'Date:\s+\d+/\d+/(\d+)';
data = regexp(inText, yearPattern, 'tokens');
YYYY = str2double(cell2mat(data{1}));



T = table(YYYY, MM, DD, ...
          Triggers, ...
          Presentations, ...
          SuccessTrials, ...
          ErrorTrials, ...
          AbortedTrials, ...
          TargetHoldFailureTrials, ...
          ReplicationsCompleted);


end

