unit BinaryTree;

{$mode objfpc}{$H+}
    
interface
    
uses
    SysUtils, Classes, Node;

type
    PTNode = ^TNode;
    TBinaryTree = class
        mRoot: PTNode;
        constructor Create(expression: String);
        destructor Destroy; override;

    end;
implementation
    
    constructor TBinaryTree.Create(expression: String);
        begin
            new(mRoot);
            mRoot^ := TNode.Create(expression);
        end;

    destructor TBinaryTree.Destroy;
        begin
            
        end;

    
end.