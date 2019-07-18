% variables
param2;
% run simulation
% シミュレーションをコール
sim('pid_exercise');

% 結果をプロット
plot(sim_time, sim_input);
hold on;
plot(sim_time, sim_plantoutput);
hold off;

% 保存
saveas(gcf, "./gitignore/result2.png");

% ボーデ線図
param2_bode
