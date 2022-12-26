object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Delphi ChatGTP interface'
  ClientHeight = 420
  ClientWidth = 519
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  DesignSize = (
    519
    420)
  PixelsPerInch = 96
  TextHeight = 13
  object Button1: TButton
    Left = 24
    Top = 43
    Width = 129
    Height = 25
    Caption = 'Ask the machine'
    TabOrder = 0
    OnClick = Button1Click
  end
  object Edit1: TEdit
    Left = 24
    Top = 16
    Width = 473
    Height = 21
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 1
  end
  object Memo1: TMemo
    Left = 24
    Top = 74
    Width = 473
    Height = 338
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 2
  end
end
