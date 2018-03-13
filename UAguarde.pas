unit UAguarde;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, JvExControls, JvAnimatedImage, JvGIFCtrl, Vcl.StdCtrls;

type
  TFAguarde = class(TForm)
    JvGIFAnimator1: TJvGIFAnimator;
    Label1: TLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FAguarde: TFAguarde;

implementation

{$R *.dfm}

end.
