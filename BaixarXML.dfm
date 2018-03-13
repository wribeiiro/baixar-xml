object TFBaixarXML: TTFBaixarXML
  Left = 0
  Top = 0
  Caption = 'BaixarXML'
  ClientHeight = 304
  ClientWidth = 761
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  Visible = True
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 264
    Top = 39
    Width = 179
    Height = 16
    Caption = 'Chave da Nota Fiscal Eletr'#244'nica'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label5: TLabel
    Left = 8
    Top = 191
    Width = 517
    Height = 13
    Caption = 
      '* Arquivos baixados sem o certificado digital n'#227'o possuem valida' +
      'de jur'#237'dica, pois n'#227'o h'#225' a assinatura digital.'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label4: TLabel
    Left = 8
    Top = 221
    Width = 84
    Height = 13
    Caption = 'Certificado Digital'
    Visible = False
  end
  object Label2: TLabel
    Left = 154
    Top = 263
    Width = 142
    Height = 13
    Caption = 'Sua Key do CaptchaBoss.com'
    Visible = False
  end
  object GroupBox1: TGroupBox
    Left = 8
    Top = 8
    Width = 745
    Height = 177
    Caption = ' Baixar XML '
    TabOrder = 0
    object LabAtualizarCaptcha: TLabel
      Left = 26
      Top = 132
      Width = 200
      Height = 21
      Cursor = crHandPoint
      Alignment = taCenter
      AutoSize = False
      Caption = 'Atualizar Imagem'
      Color = 13158600
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsUnderline]
      ParentColor = False
      ParentFont = False
      Layout = tlCenter
      OnClick = LabAtualizarCaptchaClick
    end
    object Label3: TLabel
      Left = 359
      Top = 87
      Width = 198
      Height = 16
      Caption = 'Digite o c'#243'digo da imagem ao lado'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label6: TLabel
      Left = 74
      Top = 64
      Width = 110
      Height = 13
      Caption = 'Carregando Imagem...'
    end
    object Image1: TImage
      Left = 18
      Top = 31
      Width = 200
      Height = 89
    end
    object EditCaptcha: TEdit
      Left = 256
      Top = 83
      Width = 97
      Height = 24
      CharCase = ecUpperCase
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
    end
    object EditChave: TEdit
      Left = 256
      Top = 53
      Width = 473
      Height = 24
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      MaxLength = 44
      ParentFont = False
      TabOrder = 1
    end
    object BotaoBaixarCom: TButton
      Left = 256
      Top = 120
      Width = 129
      Height = 33
      Caption = 'Baixar com Certificado'
      TabOrder = 2
      OnClick = BotaoBaixarComClick
    end
    object BotaoBaixarSem: TButton
      Left = 412
      Top = 120
      Width = 145
      Height = 33
      Caption = 'Baixar sem Certificado'
      TabOrder = 3
      OnClick = BotaoBaixarSemClick
    end
  end
  object EditCertificado: TEdit
    Left = 8
    Top = 240
    Width = 297
    Height = 21
    TabOrder = 1
    Visible = False
  end
  object ButBaixarSemCaptcha: TButton
    Left = 8
    Top = 267
    Width = 140
    Height = 34
    Caption = 'Baixar Sem Captcha'
    TabOrder = 2
    Visible = False
  end
  object EditKeyCaptchaBoss: TEdit
    Left = 154
    Top = 279
    Width = 297
    Height = 21
    TabOrder = 3
    Text = '4XA25OYERSC4C87EOSY1IC3SH8MEG5X93SKPK28Q'
    Visible = False
  end
  object CheckHttps: TCheckBox
    Left = 456
    Top = 281
    Width = 48
    Height = 17
    Caption = 'Https'
    Checked = True
    State = cbChecked
    TabOrder = 4
    Visible = False
  end
  object CheckBoxComErro: TCheckBox
    Left = 510
    Top = 281
    Width = 73
    Height = 17
    Caption = 'Com Erro'
    TabOrder = 5
    Visible = False
  end
  object Timer1: TTimer
    OnTimer = Timer1Timer
    Left = 640
    Top = 120
  end
end
