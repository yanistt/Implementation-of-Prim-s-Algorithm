function []=algoprim(M) 
% ENTREE : Matrice de poids d'un graphe donnee (regarder le compte rendu)
% SORTIE : Matrice d'entiers, qui devra etre convertie au String pour
% afficher l' arbre de poids minimal 
%------------------------------------------------------------------%
%-------------------------------------------------------------------%
Sz=size(M,1); %nombre de sommets du graphe (nbre ligne de la matrice)
vec_def=ones(1,Sz)*inf; %creation d'un vecteur 1*n rempli de valeurs infinies
APM=ones(Sz,4); % liste des aretes de l’arbre " matrice n*3 "                     
%------------------------------------------------------------------%
%-------------------------------------------------------------------%
som_dp=2; % sommet de depart, on le fixe arbitrairement a 2
vec_def(som_dp)=0;
tab_som=[]; 
Fln=1:Sz; %vecteur de 7 colonnes (1,2,3,4,5,6,7), intermediaire
%-------------------------------------------------------------------%
%-------------------------------------------------------------------%
%-------------------------------------------------------------------%
%-------------------------------------------------------------------%

while true      %on boucle a l'infini jusqu'a sortir par la boucle "BREAK"  
    %-------------------------------------------------------------------%
    Fln=setdiff(Fln,tab_som); %compare S et A et retourne les valeurs qui sont dans S mais pas dans A ensemble X\A

    [valeur,place]=min(vec_def(Fln)); % prenons le sommet avec le plus faible poids
    num_som=Fln(place); % notons le sommet correspondant
    if isempty(setxor(tab_som,1:Sz))
        %-------------------------------------------------------------------%
        break;  %Si c'est vide, c'est qu'on a termine et l'arbre a ete constitue
        %-------------------------------------------------------------------%
    end % si A=X alors FIN 
    tab_som = [tab_som num_som]; % ajout du sommet à l’arbre

    successeur = find( M(num_som,:) ~= inf & M(num_som,:)~=0 ); % successeurs du sommet i 

    Diff = setdiff(successeur,tab_som); % les successeurs moins les sommets deja dans S 
%-------------------------------------------------------------------%
for Inc = 1:length(Diff) % mise a jour des poids de l'arbre
    %-------------------------------------------------------------------%
    if M(num_som,Diff(Inc))< vec_def(Diff(Inc)) 
        %-------------------------------------------------------------------%
        vec_def(Diff(Inc))=M(num_som,Diff(Inc)); 
        APM(Diff(Inc),:)=['{' num2str(num_som) num2str(Diff(Inc)) '}']; %sauvegarde des aretes de l'arbre
        %de poids minimal sous la forme {som1som2} et cela represente un
        %arc
        %-------------------------------------------------------------------%
    end
    %-------------------------------------------------------------------%
end
%-------------------------------------------------------------------%
end
%-------------------------------------------------------------------%
disp(setstr(APM));
end