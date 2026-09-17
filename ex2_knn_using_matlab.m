%% 매트랩 내부 함수를 이용한 knn 모델 만들기(학습: 결정해야 할 것:k 거리를 어떤 방법으로 할지)
k = 3; %인접한 이웃 3개를 보겠다.
mdl = fitcknn(Training_data,Training_label, 'NumNeighbors',k,'Distance','euclidean');

% knn에서 거리를 계산하는 default 방법은 유클리디안이므로, 이렇게 작성해도 됨
% k 뒤에 없애는 방식

% 2줄이면 끝!!

%%평가해보기 #1
%test의 첫번째 데이터를 넣어보자
result = predict(mdl,Test_data(1,:))

%% 그려보기
figure;
subplot(211); bar(Test_label); axis tight;
subplot(212); bar(result); axis tight;

figure;
subplot(311); bar(Test_label); axis tight;
subplot(312); bar(result); axis tight;
subplot(313); bar(Test_label - result); axis tight;
