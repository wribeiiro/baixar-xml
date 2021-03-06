unit BaixarXML;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls, UAguarde,
  JPEG, utils, UTDownloadXMLNFeDLL;

type
  TTFBaixarXML = class(TForm)
    GroupBox1: TGroupBox;
    Label1: TLabel;
    LabAtualizarCaptcha: TLabel;
    EditCaptcha: TEdit;
    Label3: TLabel;
    EditChave: TEdit;
    Label5: TLabel;
    EditCertificado: TEdit;
    Label4: TLabel;
    ButBaixarSemCaptcha: TButton;
    EditKeyCaptchaBoss: TEdit;
    Label2: TLabel;
    CheckHttps: TCheckBox;
    CheckBoxComErro: TCheckBox;
    Label6: TLabel;
    BotaoBaixarCom: TButton;
    BotaoBaixarSem: TButton;
    Timer1: TTimer;
    Image1: TImage;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure LabAtualizarCaptchaClick(Sender: TObject);
    procedure BotaoBaixarComClick(Sender: TObject);
    procedure BotaoBaixarSemClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    var ArquivoXML : String;
    var QuemChamou : String;
  end;

var
  TFBaixarXML: TTFBaixarXML;
  //FBaixarXML: TFBaixarXML;
  BaixarXMLNFe: TDownloadXMLNFeDLL;


implementation

{$R *.dfm}
Function LocalDoExe: String;
begin
    Result := ExtractFilePath(ParamStr(0));
end;

procedure TTFBaixarXML.BotaoBaixarComClick(Sender: TObject);
var
    Arquivo: String;
begin
    if (Trim(EditChave.Text) = '') then
    begin
        Application.MessageBox('Digite a chave da nfe.','Mensagem do Sistema',MB_OK+MB_ICONINFORMATION);
        EditChave.SetFocus;
        Exit;
    end;
    if (Trim(EditCaptcha.Text) = '') then
    begin
        Application.MessageBox('Digite o c�digo da imagem.','Mensagem do Sistema',MB_OK+MB_ICONINFORMATION);
        EditCaptcha.SetFocus;
        Exit;
    end;
    if (Trim(EditCertificado.Text) = '') then
    begin
        EditCertificado.Text := BaixarXMLNFe.GetCertificadoDigital;
        if Trim(EditCertificado.Text) <> '' then
            BaixarXMLNFe.SetCertificadoDigital(EditCertificado.Text)
        else
        if BaixarXMLNFe.Msg <> '' then
        begin
            MsgErr('Erro ao tentar obter o certificado digital: ' + BaixarXMLNFe.Msg);
            Exit;
        end;
     end;

     try
        Arquivo := LocalDoExe +'XML\'+EditChave.Text+'.xml';

        Application.CreateForm(TFAguarde,FAguarde);
        FAguarde.Show;
        //********** BAIXANDO NO MODO COM CERTIFICADO DIGITAL **********************
        if BaixarXMLNFe.BaixarXMLNFeComCert(EditChave.Text, EditCaptcha.Text, Arquivo) then
        begin
            FAguarde.Close;
            FAguarde.Release;
            if Trim(BaixarXMLNFe.Msg) = '' then
            begin
                ArquivoXML:=LocalDoExe+'XML\'+EditChave.Text+'.xml';
                Close;
            end;
        end;
        if BaixarXMLNFe.Msg <> '' then
            MsgErr('Erro: ' + BaixarXMLNFe.Msg);
            //LabErro.Caption:= BaixarXMLNFe.Msg;
            EditCaptcha.Clear;
            LabAtualizarCaptchaClick(nil);

     finally
        FAguarde.Close;
        FAguarde.Release;
     end;
end;

procedure TTFBaixarXML.BotaoBaixarSemClick(Sender: TObject);
var
Arquivo: String;
begin
    if (Trim(EditChave.Text) = '') then
    begin
      Application.MessageBox('Digite a chave da nfe.','Mensagem do Sistema',MB_OK+MB_ICONINFORMATION);
      EditChave.SetFocus;
      Exit;
    end;
    if (Trim(EditCaptcha.Text) = '') then
    begin
      Application.MessageBox('Digite o c�digo da imagem.','Mensagem do Sistema',MB_OK+MB_ICONINFORMATION);
      EditCaptcha.SetFocus;
      Exit;
    end;

  try
        Arquivo:= LocalDoExe+'XML\'+EditChave.Text+'.xml';

        Application.CreateForm(TFAguarde,FAguarde);
        FAguarde.Show;
      //********** BAIXANDO NO MODO COM CERTIFICADO DIGITAL **********************
      if BaixarXMLNFe.BaixarXMLNFeSemCert(EditChave.Text, EditCaptcha.Text, Arquivo) then
      begin
          FAguarde.Close;
          FAguarde.Release;

          if Trim(BaixarXMLNFe.Msg) = '' then
          begin
            ArquivoXML:=LocalDoExe+'XML\'+EditChave.Text+'.xml';
            Close;
      end;
      if BaixarXMLNFe.Msg <> '' then
        MsgErr('Erro: ' + BaixarXMLNFe.Msg);
        //LabErro.Caption:= BaixarXMLNFe.Msg;
        EditCaptcha.Clear;
        LabAtualizarCaptchaClick(nil);
      end;

   finally
    FAguarde.Close;
    FAguarde.Release;
  end;

end;

procedure TTFBaixarXML.FormCreate(Sender: TObject);
begin
  DoubleBuffered := True;
end;

procedure TTFBaixarXML.FormShow(Sender: TObject);
begin
  TFBaixarXML.Height := 258;
  Timer1.Enabled      := True;
end;

procedure TTFBaixarXML.LabAtualizarCaptchaClick(Sender: TObject);
begin

    try
        //********Pode ser usado no final do nome do arquivo gif, jpg e bmp***********
        if BaixarXMLNFe.Captcha(LocalDoExe+'Captcha.jpg') then
        begin
            if FileExists(LocalDoExe+'Captcha.jpg') then
                Image1.Picture.LoadFromFile(LocalDoExe+'Captcha.jpg');
                Label6.Visible := False;
                EditCaptcha.Clear;
                EditCaptcha.SetFocus;
            end
            else
                MsgErr('Erro quando foi baixar o captcha.' + BaixarXMLNFe.Msg);
    finally

    end;
end;

procedure TTFBaixarXML.Timer1Timer(Sender: TObject);
begin

  Timer1.Enabled := False;

  try

    BaixarXMLNFe := TDownloadXMLNFeDLL.Create;
    BaixarXMLNFe.CaptchaBossURL('http://fasttypers.org/imagepost.ashx');
    BaixarXMLNFe.DLLLicenca('510XY2AUGMHX6JTXXL08');
    BaixarXMLNFe.Https(true);

    LabAtualizarCaptchaClick(Sender);
  finally
  //F_Carregando.Close;
  end;
end;

end.
