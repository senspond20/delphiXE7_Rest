object MainForm: TMainForm
  Left = 0
  Top = 0
  Caption = 'Main'
  ClientHeight = 643
  ClientWidth = 848
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 24
    Top = 29
    Width = 20
    Height = 13
    Caption = 'Url :'
  end
  object SendBtn: TButton
    Left = 352
    Top = 24
    Width = 75
    Height = 25
    Caption = 'Send'
    TabOrder = 0
    OnClick = SendBtnClick
  end
  object DBGrid: TDBGrid
    Left = -1
    Top = 348
    Width = 602
    Height = 213
    Options = [dgEditing, dgAlwaysShowEditor, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object ResMessage: TRichEdit
    Left = -1
    Top = 141
    Width = 841
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
    Left = 50
    Top = 26
    Width = 289
    Height = 21
    TabOrder = 3
    Text = 'http://senspond.iptime.org/blog/api/user'
  end
end
