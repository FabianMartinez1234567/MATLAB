% Definimos la función de transferencia usando tf(num,den)
 G = tf([1 2],[1 2 3]),


 % RESPUESTA ANTE UN ESCALÓN ENTRE t=0 y t=10
 figure(1);
 t = linspace(0,10,1000);
 step(G,t);
 grid on;                    % dibuja una retícula

 % RESPUESTA ANTE UN IMPULSO ENTRE t=0 y t=10
 figure(2);
 t = linspace(0,10,1000);
 impulse(G,t);
 grid on;                    % dibuja una retícula



 % RESPUESTA ANTE UNA SEÑAL CUALQUIERA 
 figure(3);

 A = 2;      % amplitud de la senoide
 phi = 0;    % fase de la senoide
 f   = 0.2;  % frecuencia de la senoide

 % Para trabajar con una señal cualquiera u(t) hay que definir un vector de 
 % tiempos y otro vector con los valores que toma dicha señal en cada uno 
 % de esos instantes de tiempo
 t = linspace(0,10,1000);        % vector de tiempos
 u = A*sin(2*pi*f*t + phi);      % vector de datos
 y = lsim(G,u,t);        % simulamos el sistema definido por G para la entrada definida por u(t)


 % Dibujamos el resultado de la simulación
 plot(t,u,t,y);              % dibujamos u(t) e y(t) en una misma figura
 legend('entrada u(t)','salida y(t)');
 grid on;                    % dibuja una retícula
 title('Respuesta ante una señal u(t)');