unit DM;

interface

uses
  SysUtils, Classes, ImgList, Controls;

type
  TDM1 = class(TDataModule)
    imgIcon32: TImageList;
    BalloonHint1: TBalloonHint;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DM1: TDM1;

implementation

{$R *.dfm}

end.
