%{
0次外乱オブザーバーの外乱抑圧特性
%}
param;
gd = 5; %hz
phi = 5; %hz
sqrt2 = sqrt(2.0);

% 外乱から速度出力への伝達関数
temp = (Kt / J) / (Ktn / Jn);

syms dob0(s) dob1(s) dob0_conju(s) dob1_conju(s)
dob0(s) = sym(s / (s + temp * gd)) * sym(1 / (J * s));
dob1(s) = sym(s^2 / (s^2 + temp * (sqrt2 * phi * s + phi))) * sym(1 / (J * s));
dob0_conju(s) = sym(1 - dob0(s));
dob1_conju(s) = sym(1 - dob1(s));

sys0 = char(dob0);
sys1 = char(dob1);
sys0_conju = char(dob0_conju);
sys1_conju = char(dob1_conju);

syms s
s = tf('s')
eval(['sys0 = ', sys0]);
eval(['sys1 = ', sys1]);
eval(['sys0_conju = ', sys0_conju]);
eval(['sys1_conju = ', sys1_conju]);

bode(sys0, sys1, {1, 1000});
legend("0次", "1次");
saveas(gcf, './gitignore/bode.png');
%saveas(gcf, './gitignore/dob0th_bode.png');
%bode(sys1);
%saveas(gcf, './gitignore/dob1st_bode.png');
bode(sys0_conju, sys1_conju, {1, 1000});
legend("0次", "1次");
saveas(gcf, './gitignore/bode_conju.png');
