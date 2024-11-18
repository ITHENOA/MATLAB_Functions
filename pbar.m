function pbar(currentStep,lastStep,opt)
% ITHENOA 7-May-2024
% ITHENOA 21-May-2024 {add 'Info' option}
% ITHENOA 18-Nov-2024 {add remainTime}
arguments
    currentStep {mustBeInteger,mustBePositive}
    lastStep {mustBeInteger,mustBePositive}
    opt.EveryStepShow {mustBeInteger,mustBePositive} = 1
    opt.MaxHashtag {mustBeInteger,mustBePositive} = 20 % to represent '100%'
    opt.CustomProgressLine {mustBeTextScalar} = '#'
    opt.Info {mustBeTextScalar} = ''
    opt.startTime = [] % matlab datetime
end

if rem(currentStep,opt.EveryStepShow) == 0 || currentStep == lastStep % update rate
    clc
    n_hashtag = floor(round(currentStep/lastStep*100)/(100/opt.MaxHashtag));
    disp([char(opt.Info),' |',repmat(char(opt.CustomProgressLine),1,n_hashtag), ...
        repmat(' ',1,opt.MaxHashtag-n_hashtag),'|',' ', ...
        num2str(round(currentStep/lastStep*100)),'% '])
    if ~isempty(opt.startTime)
        remtime = (lastStep-currentStep) * (datetime - opt.startTime) / currentStep;
        fprintf(['\b',char(remtime), newline])
    end
end
