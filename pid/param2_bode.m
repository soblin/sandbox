param2;
% 伝達関数を計算
syms C(s) P(s)

C(s) = sym(1 + 1 / (s * tau_i) + tau_d * s / (tau * s + 1)) * Kp;
P(s) = sym(1 / (T * s + 1)) * sym( 1 / (m*s + cc)) * sym(1 / s);

tfunc_open = sym(C(s) * P(s));
tfunc_close = sym((C(s) * P(s)) / (1 + C(s) * P(s)));
tfunc_close = simplifyFraction(tfunc_close, 'Expand', true);

% matlabのtfオブジェクトへ
% https://jp.mathworks.com/matlabcentral/answers/310042-how-to-convert-symbolic-expressions-to-transfer-functions
syms s

sys = char(tfunc_open);
s = tf('s');
eval(['sys = ', sys]);

[GainMargin, PhaseMargin, GainCross, PhaseCross] = margin(sys);
fprintf("ゲイン余裕, 位相余裕, ゲイン交差周波数, 位相交差周波数\n %f dB, %f deg,  %f, %f\n", 20*log10(GainMargin), PhaseMargin, GainCross, PhaseCross);


bode(sys);
saveas(gcf, './gitignore/param2_bode.png');