%% Funkcja prezentuj�ca wyniki algorytmu oraz jego przebieg.
function show(sol, iter, mean, min, max, dev, sol_m, car_m, task_m)
% Funkcja ta nie zwraca �adnych warto�ci.
% Otrzymuje odpowiednie przebiegi dzia�ania algorytmu oraz wyniki.
% result - wynik algorytmu
% iter - liczba iteracji
% mean - przebieg warto�ci �edniej
% min - przebiej warto�ci minimalnej
sol_c=get(sol,'cost');
figure(1);                                                                  % Okno
pause(0.00001);                                                             % Pauza
frame_h = get(handle(gcf),'JavaFrame');                                     % Java
set(frame_h,'Maximized',1);                                                 % Maksymalizacja
subplot(221);                                                               % Pierwszy wykres
plot(0:iter, mean);                                                         % Przebieg warto�ci �redniej
title('Waro�� �rednia');                                                    % Tytu�
xlabel('Iteracje');                                                         % O� X
ylabel('Warto��');                                                          % O� Y
subplot(222);                                                               % Pierwszy wykres
plot(0:iter, min);                                                          % Przebieg warto�ci �redniej
title('Waro�� minimalna');                                                  % Tytu�
xlabel('Iteracje');                                                         % O� X
ylabel('Warto��');                                                          % O� Y
subplot(223);                                                               % Pierwszy wykres
plot(0:iter, max);                                                          % Przebieg warto�ci �redniej
title('Waro�� maksymalna');                                                 % Tytu�
xlabel('Iteracje');                                                         % O� X
ylabel('Warto��');                                                          % O� Y
subplot(224);                                                               % Pierwszy wykres
plot(0:iter, dev);                                                          % Przebieg warto�ci �redniej
title('Odchylenie standardowe');                                            % Tytu�
xlabel('Iteracje');                                                         % O� X
ylabel('Warto��');                                                          % O� Y
disp(['Koszt najlepszego rozwi�zania: ' num2str(sol_c) '.']);               % Wypisz znalezione rozwi�zanie
%figure(2);                                                                  % Drugie okno
%pause(0.00001);                                                             % Pauza
%frame_h = get(handle(gcf),'JavaFrame');                                     % Java
%set(frame_h,'Maximized',1);                                                 % Maksymalizacja
%pcolor(sol_m);                                                              % Solution matrix
disp('Uproszczona macierz rozwi�zania:');                                   % Wypisanie uproszczonej macierzy rozwi�zania
disp(sol_m);
for i=1:length(car_m)                                                       % P�tla po typach samochod�w
    if(car_m(i)~=0)                                                         % Je�li dany typ wyst�puje
        disp(['Ilo�� potrzebnych samochod�w typu ' num2str(i) ': ' num2str(car_m(i)) '.']); % Wypisanie ilo�ci samochod�w danego typu
    end
end
disp('Ilo�� samochod�w danego typu przyporz�dkowana dla konkretnego zadania:'); % Wypisanie mecierzy zada�
disp(task_m);
end