%% Funkcja prezentuj¹ca wyniki algorytmu oraz jego przebieg.
function show(sol, iter, mean, min, max, dev, sol_m, car_m, task_m)
% Funkcja ta nie zwraca ¿adnych wartoœci.
% Otrzymuje odpowiednie przebiegi dzia³ania algorytmu oraz wyniki.
% result - wynik algorytmu
% iter - liczba iteracji
% mean - przebieg wartoœci œedniej
% min - przebiej wartoœci minimalnej
sol_c=get(sol,'cost');
figure(1);                                                                  % Okno
pause(0.00001);                                                             % Pauza
frame_h = get(handle(gcf),'JavaFrame');                                     % Java
set(frame_h,'Maximized',1);                                                 % Maksymalizacja
subplot(221);                                                               % Pierwszy wykres
plot(0:iter, mean);                                                         % Przebieg wartoœci œredniej
title('Waroœæ œrednia');                                                    % Tytu³
xlabel('Iteracje');                                                         % Oœ X
ylabel('Wartoœæ');                                                          % Oœ Y
subplot(222);                                                               % Pierwszy wykres
plot(0:iter, min);                                                          % Przebieg wartoœci œredniej
title('Waroœæ minimalna');                                                  % Tytu³
xlabel('Iteracje');                                                         % Oœ X
ylabel('Wartoœæ');                                                          % Oœ Y
subplot(223);                                                               % Pierwszy wykres
plot(0:iter, max);                                                          % Przebieg wartoœci œredniej
title('Waroœæ maksymalna');                                                 % Tytu³
xlabel('Iteracje');                                                         % Oœ X
ylabel('Wartoœæ');                                                          % Oœ Y
subplot(224);                                                               % Pierwszy wykres
plot(0:iter, dev);                                                          % Przebieg wartoœci œredniej
title('Odchylenie standardowe');                                            % Tytu³
xlabel('Iteracje');                                                         % Oœ X
ylabel('Wartoœæ');                                                          % Oœ Y
disp(['Koszt najlepszego rozwi¹zania: ' num2str(sol_c) '.']);               % Wypisz znalezione rozwi¹zanie
%figure(2);                                                                  % Drugie okno
%pause(0.00001);                                                             % Pauza
%frame_h = get(handle(gcf),'JavaFrame');                                     % Java
%set(frame_h,'Maximized',1);                                                 % Maksymalizacja
%pcolor(sol_m);                                                              % Solution matrix
disp('Uproszczona macierz rozwi¹zania:');                                   % Wypisanie uproszczonej macierzy rozwi¹zania
disp(sol_m);
for i=1:length(car_m)                                                       % Pêtla po typach samochodów
    if(car_m(i)~=0)                                                         % Jeœli dany typ wystêpuje
        disp(['Iloœæ potrzebnych samochodów typu ' num2str(i) ': ' num2str(car_m(i)) '.']); % Wypisanie iloœci samochodów danego typu
    end
end
disp('Iloœæ samochodów danego typu przyporz¹dkowana dla konkretnego zadania:'); % Wypisanie mecierzy zadañ
disp(task_m);
end