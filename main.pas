{$mode objfpc}{$H+}

uses

    BinaryTree;    
 
var

    Tree: TBinaryTree;
    expression: String;
    
begin

    expression := '2*sin(3*pi/4)*sqrt(18-3^2)^3+cos(tan(pi/6))+4*ln(-ln(0.01))';
    (*expression := '((2+3^2)^2-(5*2)^2)/((1+2)^2-(3-1)^2)-(1.2)';*)
    
    Tree := TBinaryTree.Create(expression);


end.