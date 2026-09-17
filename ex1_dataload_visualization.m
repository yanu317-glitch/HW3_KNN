% clear: 작업공간의 변수를 모두 지워라/ close all: 그림이 떠있다면 다 지워라/
% clc 명령창에 있는 것들을 다 지워라 
clear; close all; clc; 

%붓꽃 데이터 불러오기 
%meas 1열: sepal length
%meas 2열: sepal width
%meas 3열: petal length
%meas 4열: petal width

load fisheriris;


%%특징 그려보기 
figure;
plot(meas(:,1), meas(:,2),'k.');
xlabel('Sepal length');
ylabel('Sepal width');

%% 각 종을 숫자로 표현 1:setosa 2:versicolor 3:viginica
spcs2num=[];
for k=1:1:length(species)
    if strcmp(species(k), 'setoas') == 1
        spcs2num(k,1) = 1;
    elseif strcmp(species(k),'versicolor')==1
        spcs2num(k,1) = 2;
    elseif strcmp(species(k),'viginica')==1
        spcs2num(k,1) = 3;
    end
end

%% 종별로 다른 색으로 그려보기
idx1= find(spcs2num==1);  %setaos만 찾기
idx2= find(spcs2num==1);  %versicolor만 찾기
idx3= find(spcs2num==1);  %viginica만 찾기

figure;
plot(meas(idx1:1), meas(idx1:2),'r.'); hold on; %setosa 빨간색 점
plot(meas(idx2:1), meas(idx2:2),'go'); hold on; %versicolor만 녹색 동그라미
plot(meas(idx3:1), meas(idx3:2),'bx'); hold on; %viginica만 파란색 x
xlabel('Sepal length');
ylabel('Sepal width');

figure;
plot(meas(idx1:3), meas(idx1:4),'r.'); hold on; %setosa 빨간색 점
plot(meas(idx2:3), meas(idx2:4),'go'); hold on; %versicolor만 녹색 동그라미
plot(meas(idx3:3), meas(idx3:4),'bx'); hold on; %viginica만 파란색 x
xlabel('Sepal length');
ylabel('Sepal width');


%% 학습데이터와 평가데이터 나누기
% 두개의 그룹만 먼저 나눠봅시다 versicolor vs. virginica
% 오늘은 편의상 아래와 같이 나누겠음
% 1~50: setosa, 51~100: versicolor, 101~150: virginica
% 학습데이터. 71~100: versicolor, 121~150: virginica 총 60개
% 평가데이터. 51~70: versicolor, 101~120: virginica 총 40개

tr_id = [71:1:100 121:1:150];
Training_data = meas(tr_id,:);
Training_label = spcs2num(tr_id,:);

ts_id = [51:1:70 101:1:120];
Test_data = meas(ts_id,:);
Test_label = spcs2num(ts_id,:);

