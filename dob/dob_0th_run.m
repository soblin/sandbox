param;

gd = 5; %hz

sim('dob_0th');

plot(sim_pos_input);
hold on;
plot(sim_pos_output);

title("0次外乱オブザーバーの抑圧特性")
legend("指令値", "出力値", 'Location', 'southeast');
xlabel("Time [s]")
ylabel("Amplitude")

saveas(gcf, './gitignore/dob_0th.png');
