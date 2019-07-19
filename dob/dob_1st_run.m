param;

phi = 5; %hz
sqrt2 = sqrt(2.0);

sim('dob_1st');

plot(sim_pos_input);
hold on;
plot(sim_pos_output);

title("1次外乱オブザーバーの抑圧特性")
legend("指令値", "出力値", 'Location', 'southeast');
xlabel("Time [s]")
ylabel("Amplitude")


saveas(gcf, './gitignore/dob_1st.png');
