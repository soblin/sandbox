%{
モーションコントロール P.104
PIDの例題の計算
%}
clear;
syms C(s)
syms Kp Kd Ki tau

% PID controller
C(s) = sym(Kp) + sym(Ki / s) + sym(Kd * s / (tau * s + 1));

% Plant
syms P(s)
P(s) = sym(1 / (s * (5 * s + 1)));

% u to y
syms T_(s)
T_(s) = sym(C(s) * P(s) / (1 + C(s) * P(s)));
syms T(s)
T(s) = simplifyFraction(T_(s), 'Expand', true);

% tau=0を代入した伝達関数
syms T0(s)
T0(s) = subs(T(s), tau, 0);

% 分母を三重極にする
% malabではtupleのignoreのプレースホルダーはチルダ
[n, d] = numden(T0);
n = collect(n);
d = collect(d);

%{
d(s) = 5*s^3 + (Kd + 1)*s^2 + Kp*s  + Ki
     = 5*s^3 + 105*s^2      + 735*s + 1715
Kd = 104
Kp = 735
Ki = 1715
%}
