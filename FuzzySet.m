clear;
close all;
clc;
%%%%%%%%%%%%%%%%%%%%%%%%
x=1:10;
number_x=numel(x);
for i=1:number_x
    muF(i,1)=x(i)/(x(i)+2); %F
    F_hat(i,1)=1-muF(i,1);
    muG(i,1)=2^-x(i);       %G
    G_hat(i,1)=1-muG(i,1);
    muH(i,1)=1/(1+10*(x(i)-2)^2);   %H
    H_hat(i,1)=1-muH(i,1);
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %union
    union_FG(i,1)=max(muF(i,1),muG(i,1));
    union_FH(i,1)=max(muF(i,1),muH(i,1));
    union_GH(i,1)=max(muG(i,1),muH(i,1));
    union_FGH(i,1)=max(union_FG(i,1),muH(i,1));
    union_FH_hat(i,1)=1-union_FH(i,1);
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %intersect 
    intersect_FG(i,1)=min(muF(i,1),muG(i,1));
    intersect_FH(i,1)=min(muF(i,1),muH(i,1));
    intersect_GH(i,1)=min(muG(i,1),muH(i,1));
    intersect_FGH(i,1)=min(union_FG(i,1),muH(i,1));
    intersect_FHhat(i,1)=min(muF(i,1),H_hat(i,1));
    intersect_GhatH_hat(i,1)=1-min(G_hat(i,1),muH(i,1));
end
subplot(5,3,1)
hold on
grid on;
plot(x,muF,'LineWidth',2);
plot(x,F_hat,'LineWidth',2);
axis([1 10 0 1])
title('muF and Fhat')

legend('muF','Fhat')
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
subplot(5,3,2)
hold on
grid on;
plot(x,muG,'LineWidth',2);
plot(x,G_hat,'LineWidth',2);
axis([1 10 0 1])
title('muG and Ghat')

legend('muG','Ghat')
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
subplot(5,3,3)
hold on
grid on;
plot(x,muH,'LineWidth',2);
plot(x,H_hat,'LineWidth',2);
axis([1 10 0 1])
title('muH and Hhat')

legend('muH','Hhat')
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
subplot(5,3,4)
hold on
grid on;
plot(x,muF,'-.');
plot(x,muG,'-.');
plot(x,union_FG,'LineWidth',2);
axis([1 10 0 1])
title('union F and G')

legend('F','G','union F&G')
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
subplot(5,3,5)
hold on
grid on;
plot(x,muF,'-.');
plot(x,muH,'-.');
plot(x,union_FH,'LineWidth',2);
axis([1 10 0 1])
title('union F and H')

legend('F','H','union F&H')
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
subplot(5,3,6)
hold on
grid on;
plot(x,muG,'-.');
plot(x,muH,'-.');
plot(x,union_GH,'LineWidth',2);
axis([1 10 0 1])
title('union G and H')

legend('G','H','union G&H')
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
subplot(5,3,7)
hold on
grid on;
plot(x,muF,'-.');
plot(x,muG,'-.');
plot(x,intersect_FG,'LineWidth',2,'Color','g');
axis([1 10 0 1])
title('intersect F and G')

legend('F','G','intersect F&G')
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
subplot(5,3,8)
hold on
grid on;
plot(x,muF,'-.');
plot(x,muH,'-.');
plot(x,intersect_FH,'LineWidth',2,'Color','g');
axis([1 10 0 1])
title('intersect F and H')

legend('F','H','intersect F&H')
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
subplot(5,3,9)
hold on
grid on;
plot(x,muG,'-.');
plot(x,muH,'-.');
plot(x,intersect_GH,'LineWidth',2,'Color','g');
axis([1 10 0 1])
title('intersect G and H')

legend('G','H','intersect G&H')
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
subplot(5,3,10)
hold on
grid on;
plot(x,muF,'-.');
plot(x,H_hat,'-.');
plot(x,intersect_FHhat,'LineWidth',2,'Color','m');
axis([1 10 0 1])
title('intersect F and Hhat')

legend('F','Hhat','intersect F&Hhat')
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
subplot(5,3,11)
hold on
grid on;
plot(x,G_hat,'-.');
plot(x,muH,'-.');
plot(x,intersect_GhatH_hat,'LineWidth',2,'Color','m');
axis([1 10 0 1])
title('intersect (Ghat and H) hat')

legend('Ghat','H','intersect (Ghat&H) hat')
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
subplot(5,3,12)
hold on
grid on;
plot(x,muF,'-.');
plot(x,muH,'-.');
plot(x,union_FH_hat,'LineWidth',2,'Color','m');
axis([1 10 0 1])
title('union (F and H) hat')

legend('F','H','union (F&H) hat')
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
subplot(5,3,13)
hold on
grid on;
plot(x,muF,'-.');
plot(x,muG,'-.');
plot(x,muH,'-.');
plot(x,union_FGH,'LineWidth',2,'Color','k');
axis([1 10 0 1])
title('union F and G and H')

legend('F','G','H','union F&G&H')
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
subplot(5,3,14)
hold on
grid on;
plot(x,muF,'-.');
plot(x,muG,'-.');
plot(x,muH,'-.');
plot(x,intersect_FGH,'LineWidth',2,'Color','k');
axis([1 10 0 1])
title('intersect F and G and H')

legend('F','G','H','intersect F&G&H')
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%