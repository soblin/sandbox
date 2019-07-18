param1;
% シミュレーションをコール
sim('pid_exercise');

% 結果をプロット
plot(sim_time, sim_input);
hold on;
plot(sim_time, sim_plantoutput);
hold off;

% 保存
saveas(gcf, "./gitignore/result1.png");
