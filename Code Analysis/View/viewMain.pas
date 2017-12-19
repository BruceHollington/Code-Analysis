unit viewMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtActns, StdActns, ActnList, ImgList, ActnMan, ToolWin, ActnCtrls,
  Ribbon, RibbonLunaStyleActnCtrls, StdCtrls, ComCtrls, ExtCtrls, DM;

type
  TfrmMain = class(TForm)
    Ribbon1: TRibbon;
    RibbonPage1: TRibbonPage;
    RibbonGroup1: TRibbonGroup;
    ActionManager1: TActionManager;
    imgIcons16: TImageList;
    EditCut1: TEditCut;
    EditCopy1: TEditCopy;
    EditPaste1: TEditPaste;
    EditSelectAll1: TEditSelectAll;
    EditUndo1: TEditUndo;
    EditDelete1: TEditDelete;
    FileOpen1: TFileOpen;
    FileSaveAs1: TFileSaveAs;
    FileRun1: TFileRun;
    RibbonGroup2: TRibbonGroup;
    StatusBar1: TStatusBar;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    redout: TRichEdit;
    TabSheet2: TTabSheet;
    Analysis: TAction;
    TabSheet3: TTabSheet;
    redFormatted: TRichEdit;
    redStrings: TRichEdit;
    lblFormatted: TLabel;
    lblStrings: TLabel;
    pnlFormatted: TPanel;
    pnlStrings: TPanel;
    TreeView1: TTreeView;
    procedure FileOpen1Accept(Sender: TObject);
    procedure AnalysisExecute(Sender: TObject);
    procedure extractString(line: String; lineNo: Integer);
    procedure appendString(lineNo: Integer; replacer: String);
    function noKey(lineNo: Integer): Boolean;
    function getImage(itemNo:Integer;itemText:String):Integer;
    procedure replaceStrings(lineNo:Integer);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmMain: TfrmMain;
  stemp: String;
  parents: array of Integer; //contains the index of the parents in order from oldest to youngest

implementation

{$R *.dfm}

procedure TfrmMain.AnalysisExecute(Sender: TObject);
var
  I: Integer;
  parentNo: Integer; //contains the current parent number of level which the items need to be made children of
  J: Integer;
begin
  TreeView1.Items.Clear;
  setlength(parents, redFormatted.Lines.Count); //sets the max number of parents to the possible number of items
  parentNo := -1;
  I := -1;
  repeat
    Inc(I);
  until (pos('unit', redFormatted.Lines[I]) > 0); //locates the line that will initiate the unit
  TreeView1.Items.Add(nil, redFormatted.Lines[I]);
  parentNo := 0;
  parents[parentNo] := TreeView1.Items.Count - 1;
  Inc(I);

  while I < redFormatted.Lines.Count do
  begin // start loop for all lines

    if (pos('interface', redFormatted.Lines[I]) > 0) then       //if the line contains INTERFACE then it sets the parent to 1 as it will always belong to the first parent
    begin
      parentNo := 0;
      TreeView1.Items.AddChild(TreeView1.Items[parents[parentNo]],redFormatted.Lines[I]);
      Inc(parentNo);
      parents[parentNo] := TreeView1.Items.Count - 1;
      Inc(I);
      Continue;
    end;

    if (pos('implementation', redFormatted.Lines[I]) > 0) then  //if the line contains IMPLEMENTATION then it sets the parent to 1 as it will always belong to the first parent
    begin
      parentNo := 0;
      TreeView1.Items.AddChild(TreeView1.Items[parents[parentNo]],redFormatted.Lines[I]);
      Inc(parentNo);
      parents[parentNo] := TreeView1.Items.Count - 1;
      Inc(I);
      Continue;
    end;

    if (pos('type', redFormatted.Lines[I]) > 0) then       //if the line contains TYPE then it must continue until it finds an END, accounting for private and public declarations on the way
    begin
      parentNo := 1;
      TreeView1.Items.AddChild(TreeView1.Items[parents[parentNo]],redFormatted.Lines[I]);
      Inc(parentNo);
      parents[parentNo] := TreeView1.Items.Count - 1;
      Inc(I);
      repeat
         if (redFormatted.Lines[I]='private') or (redFormatted.Lines[I]='public') then
         begin
           parentNo:=2;
           TreeView1.Items.AddChild(TreeView1.Items[parents[parentNo]],redFormatted.Lines[I]);
           Inc(parentNo);
           parents[parentNo] := TreeView1.Items.Count - 1;
         end
         Else
           TreeView1.Items.AddChild(TreeView1.Items[parents[parentNo]],redFormatted.Lines[I]);
         Inc(I);
      until (pos('end;', redFormatted.Lines[I]) > 0);
      Dec(parentNo);
      TreeView1.Items.AddChild(TreeView1.Items[parents[parentNo]],redFormatted.Lines[I]);
      Dec(parentNo);
      Inc(I);
      Continue;
    end;

    if (pos('function', redFormatted.Lines[I]) > 0) or (pos('procedure',redFormatted.Lines[I]) > 0) then
    begin                                                              //if the line contains FUNCTION or PROCEDURE then it sets the parent to 1 ad both implementation and interface are the second parents
      parentNo := 1;
      TreeView1.Items.AddChild(TreeView1.Items[parents[parentNo]],redFormatted.Lines[I]);
      Inc(parentNo);
      parents[parentNo] := TreeView1.Items.Count - 1;
      Inc(I);
      Continue;
    end;

    if redFormatted.Lines[I]='var' then
      begin                                                //if the line equals VAR then it adds all the following lines of code to it as children until it finds a BEGIN or IMPLEMENTATION
      TreeView1.Items.AddChild(TreeView1.Items[parents[parentNo]],redFormatted.Lines[I]);
      Inc(parentNo);
      parents[parentNo] := TreeView1.Items.Count - 1;
      Inc(I);
      repeat
      TreeView1.Items.AddChild(TreeView1.Items[parents[parentNo]],redFormatted.Lines[I]);
      Inc(I);
      until ((redFormatted.Lines[I]='begin') or (redFormatted.Lines[I]='implementation'));
      parents[parentNo] := 0;
      Dec(parentNo);
      Continue;
      end;

    if (pos('if ', redFormatted.Lines[I]) > 0) or (pos('for ', redFormatted.Lines[I]) > 0) or (pos('while', redFormatted.Lines[I]) > 0) or (pos('else', redFormatted.Lines[I]) > 0) then
    begin                                 //checks if the line contains a decision making statement
      if noKey(I + 1) then                //checks the next line to see whether there is another decision making statement
      begin
        TreeView1.Items.AddChild(TreeView1.Items[parents[parentNo]],redFormatted.Lines[I]);
        TreeView1.Items.AddChild(TreeView1.Items[TreeView1.Items.Count - 1],redFormatted.Lines[I + 1]);
        I := I + 2;                    //if no decision making statement follows then it simply adds the next line as a child
        Continue;
      end
      else
      begin
        TreeView1.Items.AddChild(TreeView1.Items[parents[parentNo]],redFormatted.Lines[I]);
        Inc(parentNo);                                       //if a decision making statement is found then it treats the statement as a begin
        parents[parentNo] := TreeView1.Items.Count - 1;
        Inc(I);
        Continue;
      end;
    end;

    if (pos('begin', redFormatted.Lines[I]) > 0) or (pos('repeat', redFormatted.Lines[I]) > 0) then
    begin                                                    //if the line contains BEGIN or REPEAT then it increases the parent number by one
      TreeView1.Items.AddChild(TreeView1.Items[parents[parentNo]],redFormatted.Lines[I]);
      Inc(parentNo);
      parents[parentNo] := TreeView1.Items.Count - 1;
      Inc(I);
      Continue;
    end;

    if (redFormatted.Lines[I] = 'end') or (pos('end;', redFormatted.Lines[I]) > 0) or (pos('end.', redFormatted.Lines[I]) > 0) or (pos('until', redFormatted.Lines[I]) > 0)then
    begin
      TreeView1.Items.AddChild(TreeView1.Items[parents[parentNo]],redFormatted.Lines[I]);
    if  (pos('until', redFormatted.Lines[I]) = 0) then
    begin
      parents[parentNo] := 0;
      Dec(parentNo);                                          //if the line contains an END then it moves back 2 parents while if it contains until, it only moves back 1 parent
    end;
      parents[parentNo] := 0;
      Dec(parentNo);
      Inc(I);
      Continue;
    end;

    TreeView1.Items.AddChild(TreeView1.Items[parents[parentNo]],redFormatted.Lines[I]); //for all other cases it adds a child to the current parent
    Inc(I);

  end; // end loop for all lines

  for J := 0 to TreeView1.Items.Count - 1 do
  begin
   TreeView1.Items[J].ImageIndex:= getImage(J,TreeView1.Items[J].Text); //assigns each item a corresponding icon
   if pos('{}',TreeView1.Items[J].Text)>0 then   //if the placeholder: {} is found, it replaces it with the corresponding strings
    replaceStrings(J);
  end;

end;

procedure TfrmMain.appendString(lineNo: Integer; replacer: String);
var                                //separates lines that have a begin or an end in them
  temp: String;
begin
  redFormatted.Lines.Insert(lineNo + 1, replacer);
  redStrings.Lines.Insert(lineNo + 1, '');
  temp := redFormatted.Lines[lineNo];
  Delete(temp, pos(replacer, temp), length(replacer));
  redFormatted.Lines.Delete(lineNo);
  redFormatted.Lines.Insert(lineNo, temp);
end;

procedure TfrmMain.extractString(line: String; lineNo: Integer);
var                                       //removes strings so that they don't affect the location of key words or phrases
  temp: String;
  newLine: String;
begin
  newLine := line;
  temp := '';
  repeat
    Delete(line, 1, pos('''', line));
    temp := temp + Copy(line, 1, pos('''', line) - 1) + '`'; //uses ` as a placeholder to separate the strings on lines with multiple strings
    Delete(line, 1, pos('''', line));
  until (pos('''', line) = 0);
  redStrings.Lines.Add(temp);
  temp := '';
  repeat
    temp := temp + Copy(newLine, 1, pos('''', newLine) - 1) + '{}';
    Delete(newLine, 1, pos('''', newLine));
    Delete(newLine, 1, pos('''', newLine));
  until (pos('''', newLine) = 0);
  temp := temp + newLine;
  redFormatted.Lines.Delete(lineNo);
  redFormatted.Lines.Insert(lineNo, temp);
end;

procedure TfrmMain.FileOpen1Accept(Sender: TObject);
var
  temp: String;
  I: Integer;
  tf: textfile;
begin
  redStrings.Lines.Clear;
  redout.Lines.Clear;
  redFormatted.Lines.Clear;
  redout.Lines.LoadFromFile(FileOpen1.Dialog.FileName);    //loads the original file for the user to see
  assignfile(tf, FileOpen1.Dialog.FileName);
  Reset(tf);
  stemp := '';
  while not eof(tf) do
  begin
    readln(tf, temp);
    if temp <> '' then
    begin
      while temp[1] = ' ' do
        Delete(temp, 1, 1);                     //removes all spaces and blank lines
      stemp := stemp + trim(temp) + #13#10;
    end;
  end;
  CloseFile(tf);
  redFormatted.Lines.Add(lowercase(stemp));     //makes the code lowercase so that locating key phrases is possible
  I:=0;
  while (I<redFormatted.Lines.Count) do
  begin
    if (pos('''', redFormatted.Lines[I]) > 0) then   //checks if there is a ' to indicate a string
    begin
      extractString(redFormatted.Lines[I], I); //code to remove the string from the line of code
    end
    else
      redStrings.Lines.Add('');

    if pos('//', redFormatted.Lines[I])>0 then   //checks to see whether there is a comment in the line and removes it if there is
    begin
    temp:= redFormatted.Lines[I];
      Delete(temp,pos('//', temp),length(stemp)-(pos('//', stemp)-1));
      if trim(temp)<>'' then            //adds the edited line if there is anything in it, otherwise it deletes the line and its corresponding line in the srtings richedit
      begin
      redFormatted.Lines.Delete(I);
      redFormatted.Lines.Insert(I,trim(temp));
      end
      else
      begin
        redFormatted.Lines.Delete(I);
        redStrings.Lines.Delete(redStrings.Lines.Count-1);
        Dec(I);
      end;
    end;
    if (pos('begin', redFormatted.Lines[I]) > 3) then //checks whether the line contains a begin or end and makes the adjustments so that they are on separate lines
      appendString(I, 'begin');
    if (pos(' end', redFormatted.Lines[I]) > 3) then
      appendString(I, ' end');
  inc(I);
  end;
  while redFormatted.Lines[redFormatted.Lines.Count-1]='' do  //deletes any blank lines at the end of the richedit
  redFormatted.Lines.Delete(redFormatted.Lines.Count-1);

end;


function TfrmMain.getImage(itemNo: Integer; itemText: String): Integer;
begin                                    //checks whether the line contains the key words of phrases to identify the type of expression to assign the correct icon
  if pos('interface',itemText)>0 then
    begin
      result:=1;
      exit;
    end;
  if pos('implementation',itemText)>0 then
    begin
      result:=2;
      exit;
    end;
  if pos('function',itemText)>0 then
  begin
    if (pos('()',itemText)>0) or (pos('(',itemText)=0) then
    begin
      result:=11;
      exit;
    end
    else
    begin
      if (pos('var',itemText)>0) then
      begin
        result:=13;
        exit;
      end
      else
      begin
        result:=12;
        exit;
      end;
    end;
  end;
  if pos('procedure',itemText)>0 then
    begin
    if (pos('()',itemText)>0) or (pos('(',itemText)=0) then
    begin
      result:=14;
      exit;
    end
    else
    begin
      if (pos('var',itemText)>0) then
      begin
        result:=16;
        exit;
      end
      else
      begin
        result:=15;
        exit;
      end;
    end;
  end;
  if (pos('type',itemText)>0) or ((pos(':',itemText)>0)and (pos(':=',itemText)=0)) or (itemText='var') or (itemText='private') or (itemText='public') then
  begin
    result:=3;
    exit;
  end;
  if pos(':=',itemText)>0 then
  begin
    result:=4;
    exit;
  end;
  if (itemText = 'begin') then
  begin
    result:=5;
    exit;
  end;
  if (itemText = 'end') or (itemText = 'end;') or (itemText = 'end.') then
  begin
    result:=6;
    exit;
  end;
  if pos('if ',itemText)>0 then
  begin
    result:=7;
    exit;
  end;
  if pos('case',itemText)>0 then
  begin
    result:=8;
    exit;
  end;
  if (pos('showmessage',itemText)>0) or (pos('print',itemText)>0) or (pos('writeln',itemText)>0) then
  begin
    result:=9;
    exit;
  end;
  if (pos('readln',itemText)>0) or (pos('messagedlg',itemText)>0) then
  begin
    result:=10;
    exit;
  end;
  if pos('for ',itemText)>0 then
  begin
    result:=17;
    exit;
  end;
  if pos('while ',itemText)>0 then
  begin
    result:=18;
    exit;
  end;
  if pos('repeat',itemText)>0 then
  begin
    result:=20;
    exit;
  end;
  Result:=19;

end;

function TfrmMain.noKey(lineNo: Integer): Boolean;
var                      //checks for key words in the line specified
  temp: Boolean;
begin
  temp := true;
  if (pos('begin', redFormatted.Lines[lineNo]) > 0) then
    temp := false;
  if (pos('for ', redFormatted.Lines[lineNo]) > 0) then
    temp := false;
  if (pos('if ', redFormatted.Lines[lineNo]) > 0) then
    temp := false;
  if (pos('while ', redFormatted.Lines[lineNo]) > 0) then
    temp := false;
  if (pos('repeat ', redFormatted.Lines[lineNo]) > 0) then
    temp := false;
  result := temp;
end;

procedure TfrmMain.replaceStrings(lineNo: Integer);
var                                        //replaces removed strings from lines
temp,stringsToAdd:String;
placeHolder:Integer;
begin
  temp:=TreeView1.Items[lineNo].Text;
  while pos('{}',temp)>0 do          //repeats until no more placeholders are found in the line
  begin
    placeHolder:=pos('{}',temp);
    stringsToAdd:=redStrings.Lines[lineNo];
    if pos('{}',stringsToAdd)>0 then
      Exit;
    delete(temp,placeHolder,2);
    Insert(''''+copy(stringsToAdd,1,pos('`',stringsToAdd)-1)+'''',temp,placeHolder);  //uses ` to mark where the strings end
    Delete(stringsToAdd,1,pos('`',stringsToAdd));                                     //replaces the {} with '' and inserts the string inside
  end;
  TreeView1.Items[lineNo].Text:=temp;
  temp:='';
  stringsToAdd:='';
end;

end.
