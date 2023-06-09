
function robotanim(l1,l2,alfa,beta)
% Animacja dzia�ania manipulatora planarnego o dw�ch ramionach
% Posta� wywo�ania: robotanim(l1,l2,alfa,beta)
% gdzie:
% l1, l2 - d�ugo�ci ramion (skalary),
% alfa, beta - k�ty przegub�w (wektory). 
% K.Bartecki, 2017
  
  figure;  
  title('Animacja dzia�ania manipulatora dla danych k�t�w przegub�w \alpha i \beta');
  axis([-(l1+l2+0.1) l1+l2+0.1 -(l1+l2+0.1) l1+l2+0.1]);
  xlabel('x')
  ylabel('y')
  grid on
  hold on;
    
  xp1=0; yp1=0;				% �rodek manipulatora (po�o�enie 1 przegubu)
  xp2=xp1; yp2=yp1+l1;      % po�o�enie 2 przegubu
  xc=xp2; yc=yp2+l2;        % po�o�enie chwytaka
  
  x=[xp1 xp2 NaN xp2 xc];
  y=[yp1 yp2 NaN yp2 yc];
    
  hndl=plot(x,y,'LineWidth',5,'Marker','.','MarkerSize',30);
  ht = text(0.1,0,'Naci�nij dowolny klawisz')
  pause
  delete(ht)
   
  for i=1:length(alfa)
     
     xp2=xp1+l1*cos(alfa(i)); 
     yp2=yp1+l1*sin(alfa(i));
     xc=xp2+l2*cos(alfa(i)+beta(i)); 
     yc=yp2+l2*sin(alfa(i)+beta(i));
     
     x=[xp1 xp2 NaN xp2 xc];
     y=[yp1 yp2 NaN yp2 yc];
     set(hndl,'XData',x,'YData',y);
     drawnow;
     plot(xc,yc,'Marker','.','MarkerSize',5)
     pause(0.1)
      
 end 