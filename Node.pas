unit Node;

{$mode objfpc}{$H+}
    
interface
    
uses
    Sysutils, Classes, Math, character, regexpr;

type
	PTNode = ^TNode;
    TNode = class
		mExpression: String;
		mNumValue: Real;
		mOpArray: Array[0..6] of String;
		mPriorArr: Array[0..4] of String;
		mPartsArr: Array of String;
		mTmp: String;
		mRightNode: PTNode;
		mLeftNode: PTNode;

		constructor Create(expression: String);
		destructor Destroy; override;
		procedure Split();
		function Find(arr: Array of String; str: String): Boolean;
		function ReadParenthesis(text: String): Boolean;

	end;

implementation

    constructor TNode.Create(expression: String);
        var
            i: Integer;
        begin
            mOpArray[0] := ('[\^]');
            mOpArray[1] := ('[/]');
            mOpArray[2] := ('[*]');
            mOpArray[3] := ('[+]');
            mOpArray[4] := ('[-]');
            mOpArray[5] := ('[0-9]');
            mOpArray[6] := ('.(\(*\))');

			mPriorArr[0] := ('+');
			mPriorArr[1] := ('-');
			mPriorArr[2] := ('*');
			mPriorArr[3] := ('/');
			mPriorArr[4] := ('^');

			(*new(mRightNode);
			new(mLeftNode);*)
            mPartsArr := NIL;
            mExpression := expression;
            split();
			
            for i := 0 to Length( mPartsArr ) do
                begin
                    WriteLn( mPartsArr[i] );
                end;
        end;


    function TNode.ReadParenthesis(text: String): Boolean;
        var
            count: Integer;
            i: Integer;
        begin
            count := 0;
            for i := 0 to Length(text) do
            begin
                if text[i] = '(' then
                    count := count + 1;
                if text[i] = ')' then
                    count := count - 1;
            end;
            if( count = 0 ) then
            begin
                readParenthesis := true;
                exit;
            end;
            if( count <> 0 ) then
            begin
                readParenthesis := false;
                exit;
            end;
        end;

    procedure TNode.Split();
		var
			i, j: Integer;
        begin
        	j := 0;
        	mTmp := '';
            for i := 1 to Length(mExpression) do
                begin
                    mTmp := mTmp + mExpression[i];
                    if ( Find(mOpArray, mTmp) and readParenthesis(mTmp) ) then
                        begin
                            SetLength( mPartsArr, Length(mPartsArr) + 1 );
                            mPartsArr[j] := mTmp;
                            j := j + 1;
                            mTmp := '';
                        end;
                end;
        end;


	function TNode.Find(arr: Array of String; str: String): Boolean;
        var
            j: Integer;
			RegexObj: TRegExpr;
        begin
            RegexObj := TRegExpr.Create;
            for j := 0 to Length(arr)-1 do
            begin
                RegexObj.Expression := arr[j];
                if ( RegexObj.Exec(str) ) then
                begin
                    find := true;
                    RegexObj.Free();
                    exit;
                end;
            end;
            find := false;
            RegexObj.Free();
            exit;
        end;

	destructor TNode.Destroy;
		begin
			
		end;
		
end.