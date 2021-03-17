object MainForm: TMainForm
  Left = 0
  Top = 0
  Caption = 'Main'
  ClientHeight = 676
  ClientWidth = 885
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 24
    Top = 24
    Width = 20
    Height = 13
    Caption = 'Url :'
  end
  object SendBtn: TButton
    Left = 368
    Top = 19
    Width = 75
    Height = 25
    Caption = 'Send'
    TabOrder = 0
    OnClick = SendBtnClick
  end
  object DBGrid: TDBGrid
    Left = 8
    Top = 379
    Width = 841
    Height = 273
    Options = [dgEditing, dgAlwaysShowEditor, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object ResMessage: TRichEdit
    Left = 480
    Top = 152
    Width = 369
    Height = 201
    Font.Charset = HANGEUL_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    Lines.Strings = (
      'ResMessage')
    ParentFont = False
    TabOrder = 2
    Zoom = 100
  end
  object BaseURIEdit: TEdit
    Left = 64
    Top = 21
    Width = 289
    Height = 21
    TabOrder = 3
    Text = 'http://localhost:8080/api/board/all'
  end
end
