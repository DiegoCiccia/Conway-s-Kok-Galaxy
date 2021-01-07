%% Conway's Game of Life
% Kok's Galaxy Shape
%% Author: Diego Ciccia


%% Kok's Galaxy

% The following code creates a nice representation of the Kok's Galaxy shape
% created following the rules of Conway's Game of life. We recall:
% - if the surroundings of an empty position contain exactly 3 points, a
%   new point is created;
% - if the surroundings of a point contain 2 or 3 points, the points
%   remains at the same position;
% - if the surroundings of a point contain less than 2 or more than 3
%   points, the point is erased.

% The code build first a matrix containing 1s and 0s which indicate the
% points and then it shows the final result in a iterative graph.

N=100; % n° of periods
S=500; % size of the matrix
G=zeros(S,S); % matrix and coordinates of the starting points

G=zeros(S,S);
G(202,204)=1;
G(202,207)=1;
G(202,209)=1;
G(203,202)=1;
G(203,203)=1;
G(203,205)=1;
G(203,207)=1;
G(203,208)=1;
G(203,209)=1;
G(204,203)=1;
G(204,210)=1;
G(205,202)=1;
G(205,203)=1;
G(205,209)=1;
G(207,203)=1;
G(207,209)=1;
G(207,210)=1;
G(208,202)=1;
G(208,209)=1;
G(209,203)=1;
G(209,204)=1;
G(209,205)=1;
G(209,207)=1;
G(209,209)=1;
G(209,210)=1;
G(210,203)=1;
G(210,205)=1;
G(210,208)=1;

lx=199; 
ox=213;
ly=199;
oy=213;
dp=3;

for n=1:N % the iteration applies the previous Conway's rules 
    
    px=((ox+lx)/2)+dp;
    py=((oy+ly)/2)+dp;
    txt=['t = ', num2str(n)];
    text(px,py,txt);
    xlim([lx ox])
    ylim([ly oy])
    grid on
    drawnow
            
    if n==1
        V=G;
    else
        G=V;        
    end
    
    for i=1:S

        if i==1
            xd=1;
            xu=i+1;
        elseif i~=1 && i<S
            xd=i-1;
            xu=i+1;
        else
            xd=i-1;
            xu=S;
        end

        for j=1:S

            if j==1
                yd=1;
                yu=j+1;
            elseif j~=1 && j<S
                yd=j-1;
                yu=j+1;
            else
                yd=j-1;
                yu=S;
            end
           
                    
            if G(i,j)==0
                 M=sum(sum(G(xd:xu,yd:yu)));
                if M==3
                    V(i,j)=1;
                else
                    V(i,j)=0;
                end
            
            elseif G(i,j)==1
                 M=sum(sum(G(xd:xu,yd:yu)))-1;
                if M<2
                    V(i,j)=0;
                elseif M>3
                    V(i,j)=0;
                else
                    V(i,j)=1;
                end
            end
        end
    end 
    
    P=zeros(S^2,2);
    d=1;
    for i=1:S
        for j=1:S
            if V(i,j)==1               
               P(d,:)=[i,j];
               d=d+1;
            end
        end
    end
    
    P=P(any(P,2),:);
    scatter(P(:,1),P(:,2), 'filled')
    
    xlim([lx ox])
    ylim([ly oy])    
end

hold on
grid on
txt=['t = ', num2str(N)];
text(px,py,txt);




