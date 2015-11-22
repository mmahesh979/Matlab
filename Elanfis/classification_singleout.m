% multi-class classification problem

%clear all;clc;

%  load glassdataset
% load glass_index
for nu=1:50
cidx=10*vertebral_i;
setdata=vertebral;
nclas=3;
[nData ninput]=size(setdata);
r=randperm(nData);
r1=r(1:207);r2=r(208:310);



% Generating training data (first 45 samples of each type)



Data=[setdata cidx];

traindata=Data(r1,:);
test=setdata(r1,:);
%testdata=setdata(r2,:);
testdata=Data(r2,:); %for OS-Fuzzy-ELM
check=cidx(r2);


% training extreme-ANFIS and simulating
% [finalRMSE,Parameters] = extremeanfis(traindata,4,1,50);
% [output] = simextremeanfis(test,Parameters);

% Generating FIS from extreme-ANFIS
% OutputFismat = extremeanfis2fis(traindata,Parameters);
% output1 = evalfis(testdata, OutputFismat);

% Simuulating for remaining data
[trainedout,test_output, TrainingTime1, TestingTime1] = OSFuzzyELM_One(traindata, testdata,0,30, 'gaussmf');
% [test_output] = simextremeanfis(testdata,Parameters);

    for j=1:length(test_output)
        if(test_output(j)<15)
            test_output(j)=10;
        end
        if((test_output(j)>15)&&(test_output(j)<25))
            test_output(j)=20;
        end
        if((test_output(j)>25)&&(test_output(j)<35))
            test_output(j)=30;
        end
        if((test_output(j)>35)&&(test_output(j)<45))
            test_output(j)=40;
        end
        if((test_output(j)>45)&&(test_output(j)<55))
            test_output(j)=50;
        end
        if((test_output(j)>55)&&(test_output(j)<65))
            test_output(j)=60;
        end
        if((test_output(j)>65)&&(test_output(j)<75))
            test_output(j)=70;
        end
        if((test_output(j)>75)&&(test_output(j)<85))
            test_output(j)=80;
        end
        if((test_output(j)>85)&&(test_output(j)<95))
            test_output(j)=90;
        end
        if((test_output(j)>95))
            test_output(j)=100;
        end
    end


k=1;
for i=1:length(test_output)
    if check(i)==test_output(i)
        p(k)=1;
        k=k+1;
    end
end
result(nu)=k;
end