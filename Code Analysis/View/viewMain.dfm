object frmMain: TfrmMain
  Left = 0
  Top = 0
  Caption = 'Code Analysis'
  ClientHeight = 595
  ClientWidth = 652
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Ribbon1: TRibbon
    Left = 0
    Top = 0
    Width = 652
    Height = 143
    ActionManager = ActionManager1
    Caption = 'Code Analysis'
    Tabs = <
      item
        Caption = 'Home'
        Page = RibbonPage1
      end>
    DesignSize = (
      652
      143)
    StyleName = 'Ribbon - Luna'
    object RibbonPage1: TRibbonPage
      Left = 0
      Top = 50
      Width = 651
      Height = 93
      Caption = 'Home'
      Index = 0
      object RibbonGroup1: TRibbonGroup
        Left = 4
        Top = 3
        Width = 88
        Height = 86
        ActionManager = ActionManager1
        Caption = 'Application'
        GroupIndex = 0
      end
      object RibbonGroup2: TRibbonGroup
        Left = 94
        Top = 3
        Width = 124
        Height = 86
        ActionManager = ActionManager1
        Caption = 'Code Edit'
        GroupIndex = 1
      end
      object TRibbonGroup
        Left = 220
        Top = 3
        Width = 76
        Height = 86
        ActionManager = ActionManager1
        Caption = 'Analysis'
        GroupIndex = 2
      end
    end
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 576
    Width = 652
    Height = 19
    Panels = <>
  end
  object PageControl1: TPageControl
    Left = 0
    Top = 143
    Width = 652
    Height = 433
    ActivePage = TabSheet2
    Align = alClient
    TabOrder = 2
    object TabSheet1: TTabSheet
      Caption = 'Code Source'
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object redout: TRichEdit
        Left = 0
        Top = 0
        Width = 644
        Height = 405
        Align = alClient
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Courier New'
        Font.Style = []
        ParentFont = False
        ScrollBars = ssBoth
        TabOrder = 0
      end
    end
    object TabSheet3: TTabSheet
      Caption = 'Formatted Code'
      ImageIndex = 2
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object pnlFormatted: TPanel
        Left = 0
        Top = 0
        Width = 417
        Height = 405
        Align = alLeft
        Anchors = [akLeft, akTop, akRight, akBottom]
        BevelOuter = bvNone
        Caption = 'pnlFormatted'
        TabOrder = 0
        object lblFormatted: TLabel
          Left = 0
          Top = 0
          Width = 78
          Height = 13
          Align = alTop
          Alignment = taCenter
          Caption = 'Formatted Code'
          Layout = tlCenter
        end
        object redFormatted: TRichEdit
          Left = 0
          Top = 13
          Width = 417
          Height = 392
          Align = alClient
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          ScrollBars = ssBoth
          TabOrder = 0
        end
      end
      object pnlStrings: TPanel
        Left = 417
        Top = 0
        Width = 224
        Height = 405
        Align = alLeft
        BevelOuter = bvNone
        Caption = 'pnlStrings'
        TabOrder = 1
        object lblStrings: TLabel
          Left = 0
          Top = 0
          Width = 33
          Height = 13
          Align = alTop
          Alignment = taCenter
          Caption = 'Strings'
          Layout = tlCenter
        end
        object redStrings: TRichEdit
          Left = 0
          Top = 13
          Width = 224
          Height = 392
          Align = alClient
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          ScrollBars = ssBoth
          TabOrder = 0
        end
      end
    end
    object TabSheet2: TTabSheet
      Caption = 'Code Analysis'
      ImageIndex = 1
      object TreeView1: TTreeView
        Left = 0
        Top = 0
        Width = 644
        Height = 405
        Align = alClient
        Images = DM1.imgIcon32
        Indent = 35
        TabOrder = 0
      end
    end
  end
  object ActionManager1: TActionManager
    ActionBars = <
      item
        Items = <
          item
            Action = FileOpen1
            ImageIndex = 5
            ShortCut = 16463
          end
          item
            Action = FileSaveAs1
            ImageIndex = 6
          end
          item
            Action = Analysis
            Caption = 'A&nalysis'
            ImageIndex = 7
          end>
        ActionBar = RibbonGroup1
      end
      item
        Items = <
          item
            Action = EditCut1
            ImageIndex = 0
            ShortCut = 16472
          end
          item
            Action = EditCopy1
            ImageIndex = 1
            ShortCut = 16451
          end
          item
            Action = EditPaste1
            ImageIndex = 2
            ShortCut = 16470
          end
          item
            Action = EditSelectAll1
            ShortCut = 16449
          end
          item
            Action = EditUndo1
            ImageIndex = 3
            ShortCut = 16474
          end
          item
            Action = EditDelete1
            ImageIndex = 4
            ShortCut = 46
          end>
        ActionBar = RibbonGroup2
      end
      item
      end>
    Images = imgIcons16
    Left = 368
    Top = 48
    StyleName = 'Ribbon - Luna'
    object EditCut1: TEditCut
      Category = 'Edit'
      Caption = 'Cu&t'
      Hint = 'Cut|Cuts the selection and puts it on the Clipboard'
      ImageIndex = 0
      ShortCut = 16472
    end
    object EditCopy1: TEditCopy
      Category = 'Edit'
      Caption = '&Copy'
      Hint = 'Copy|Copies the selection and puts it on the Clipboard'
      ImageIndex = 1
      ShortCut = 16451
    end
    object EditPaste1: TEditPaste
      Category = 'Edit'
      Caption = '&Paste'
      Hint = 'Paste|Inserts Clipboard contents'
      ImageIndex = 2
      ShortCut = 16470
    end
    object EditSelectAll1: TEditSelectAll
      Category = 'Edit'
      Caption = 'Select &All'
      Hint = 'Select All|Selects the entire document'
      ShortCut = 16449
    end
    object EditUndo1: TEditUndo
      Category = 'Edit'
      Caption = '&Undo'
      Hint = 'Undo|Reverts the last action'
      ImageIndex = 3
      ShortCut = 16474
    end
    object EditDelete1: TEditDelete
      Category = 'Edit'
      Caption = '&Delete'
      Hint = 'Delete|Erases the selection'
      ImageIndex = 4
      ShortCut = 46
    end
    object FileOpen1: TFileOpen
      Category = 'File'
      Caption = '&Open...'
      Hint = 'Open|Opens an existing file'
      ImageIndex = 5
      ShortCut = 16463
      OnAccept = FileOpen1Accept
    end
    object FileSaveAs1: TFileSaveAs
      Category = 'File'
      Caption = 'Save &As...'
      Hint = 'Save As|Saves the active file with a new name'
      ImageIndex = 6
    end
    object FileRun1: TFileRun
      Category = 'File'
      Browse = False
      BrowseDlg.Title = 'Run'
      Caption = '&Run...'
      Hint = 'Run|Runs an application'
      Operation = 'open'
      ShowCmd = scShowNormal
    end
    object Analysis: TAction
      Category = 'File'
      Caption = 'Analysis'
      ImageIndex = 7
      OnExecute = AnalysisExecute
    end
  end
  object imgIcons16: TImageList
    Left = 304
    Top = 48
    Bitmap = {
      494C010108003000340010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000003000000001002000000000000030
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000091A99A74DBE2DE26000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000E9ED
      EB17366148D4104325FD0F4224FF0F4224FF0F4224FFE8EDEA18000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000E6EBE81A0F4224FF0F4224FF0F4224FF0F4224FF0F4224FF0F4224FF0F42
      24FFE3E9E61D0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000008080000080
      8000008080000080800000808000008080000080800000808000008080000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000008080000080800000000000000000000000000000000000C0C0C0000000
      0000008080000000000000000000000000000000000000000000000000000000
      00000F4224FF0F4224FF0F4224FF0F4224FF0F4224FF0F4224FF0F4224FF0F42
      24FF0F4224FF456C55C500000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000FFFF00000000000080
      8000008080000080800000808000008080000080800000808000008080000080
      8000000000000000000000000000000000000000000000000000000000000000
      0000008080000080800000000000000000000000000000000000C0C0C0000000
      0000008080000000000000000000000000000000000000000000000000000000
      00000F4224FF0F4224FF0F4224FF0F4224FF0F4224FF0F4224FF0F4224FF0F42
      24FF0F4224FF0F4224FFE5EAE71B000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF0000FFFF000000
      0000008080000080800000808000008080000080800000808000008080000080
      8000008080000000000000000000000000000000000000000000000000000000
      0000008080000080800000000000000000000000000000000000000000000000
      0000008080000000000000000000000000000000000000000000000000000000
      0000335E45D80F4224FF0F4224FF0F4224FF0F4224FF0F4224FF0F4224FF0F42
      24FF0F4224FF0F4224FF0F4224FF000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000FFFF00FFFFFF0000FF
      FF00000000000080800000808000008080000080800000808000008080000080
      8000008080000080800000000000000000000000000000000000000000000000
      0000008080000080800000808000008080000080800000808000008080000080
      8000008080000000000000000000000000000000000000000000D5DED92CD0DA
      D332000000000F4224FF0F4224FF0F4224FF0F4224FF0F4224FF0F4224FF0F42
      24FF0F4224FF0F4224FF0F4224FF000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF0000FFFF00FFFF
      FF0000FFFF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000008080000080800000000000000000000000000000000000000000000080
      800000808000000000000000000000000000000000000F4224FF0F4224FF0F42
      24FF000000000F4224FF0F4224FF0F4224FF0F4224FF0F4224FFD7E0DA2A0F42
      24FF0F4224FF0F4224FF39634AD2000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000FFFF00FFFFFF0000FF
      FF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FFFF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000080800000000000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C0000000
      000000808000000000000000000000000000527661B7C5D1CA3D124427FB2453
      37E81C4C30F10F4224FF0F4224FF0F4224FF0F4224FF0F4224FF658673A30F42
      24FF0F4224FF0F4224FFFDFDFD02000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF0000FFFF00FFFF
      FF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000080800000000000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C0000000
      0000008080000000000000000000000000000F4224FF0F4224FF2A573CE20F42
      24FF0F4224FF0F4224FF0F4224FF0F4224FF0F4224FFF2F5F30D0F4224FF0F42
      24FF0F4224FF89A2937D00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000FFFF00FFFFFF0000FF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000080800000000000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C0000000
      00000000000000000000000000000000000091A89B740F4224FF0F4224FF809C
      8B86F0F3F1100F4224FF0F4224FF0F4224FF648572A4638471A50F4224FF0F42
      24FF0F4224FF0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000080800000000000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C0000000
      0000C0C0C0000000000000000000000000003F674FCC00000000000000008CA5
      967A0F4224FF0F4224FF0F4224FF0F4224FF000000000F4224FF0F4224FF0F42
      24FF0F4224FF0000000000000000BECBC3450000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000F42
      24FF1F4E32EE0F4224FF0F4224FF0F4224FF000000000F4224FF0F4224FF0F42
      24FF0F4224FF0F4224FF0F4224FF0F4224FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000015472AF80F4224FF0F4224FF6E8D7B9900000000386249D30F4224FF0F42
      24FF0F4224FF0F4224FF0F4224FF4C725DBD0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000104325FD0F4224FF0000000000000000000000001C4C30F10F42
      24FF0F4224FF0F4224FF134528FA000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000335E45D8000000000000000000000000000000000000
      0000B1C2B852FBFBFB0400000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000008000000080000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000080000000800000008000000080000000800000008000
      0000800000008000000080000000800000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000800000000000000000000000800000000000000000000000800000008000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000800000008000000080000000800000008000
      0000800000008000000080000000800000000000000000000000000000000000
      0000000000000000000080000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00800000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000800000000000000000000000800000000000000080000000000000000000
      0000800000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000080000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00800000000000000086868600008080008686
      8600008080008686860080000000FFFFFF000000000000000000000000000000
      00000000000000000000FFFFFF00800000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000800000000000000000000000800000000000000080000000000000000000
      0000800000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000080000000FFFFFF0000000000000000000000
      00000000000000000000FFFFFF00800000000000000000808000868686000080
      8000868686000080800080000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00800000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000008000000080000000800000000000000080000000000000000000
      0000800000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000080000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00800000000000000086868600008080008686
      8600008080008686860080000000FFFFFF00000000000000000000000000FFFF
      FF00800000008000000080000000800000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000800000000000000080000000800000008000
      0000000000000000000000000000000000000000000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF0080000000FFFFFF0000000000000000000000
      00000000000000000000FFFFFF00800000000000000000808000868686000080
      8000868686000080800080000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0080000000FFFFFF0080000000000000000000000000000000663300006633
      0000663300006633000066330000000000000000000000000000000000000000
      0000000000006666000000000000000000000000000000000000000000000000
      0000000000000000000000000000800000000000000080000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF000000
      000000000000000000000000000080000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00800000000000000086868600008080008686
      8600008080008686860080000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00800000008000000000000000000000000000000000000000996600006666
      0000666600009966000000000000000000000000000000000000000000000000
      0000000000006666000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF0080000000FFFFFF000000000000000000FFFF
      FF00800000008000000080000000800000000000000000808000868686000080
      8000868686000080800080000000800000008000000080000000800000008000
      0000800000000000000000000000000000000000000000000000996600006666
      000099660000CC99660000000000000000000000000000000000000000000000
      0000000000006666000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF000000
      000000000000000000000000000080000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0080000000FFFFFF0080000000000000000000000086868600008080008686
      8600008080008686860000808000868686000080800086868600008080008686
      8600008080000000000000000000000000000000000000000000996600009966
      0000CC99660066660000CC996600000000000000000000000000000000000000
      0000CC9966006666000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF0080000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00800000008000000000000000000000000000000000808000868686000000
      0000000000000000000000000000000000000000000000000000000000008686
      8600868686000000000000000000000000000000000000000000996600000000
      000000000000CC9966006666000066660000CC9966000000000000000000CC99
      660066660000CC99660000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF000000
      000000000000FFFFFF0000000000800000008000000080000000800000008000
      0000800000000000000000000000000000000000000086868600868686000000
      0000000000000000000000000000000000000000000000000000000000008686
      8600008080000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000CC9966006666000066660000666600006666
      0000CC9966000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000000000FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000808000868686000080
      80000000000000FFFF00000000000000000000FFFF0000000000868686000080
      8000868686000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000FFFF0000FFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000300000000100010000000000800100000000000000000000
      000000000000000000000000FFFFFF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000FFFFFFFFFF7EF9FFFFFFFFFFBFFFE03F
      EFFD001FF003F007C7FF000FE003F003C3FB0007E003F001E3F70003E003F001
      F1E70001E003C801F8CF000020038801FC1F001FE0020001FE3F001FE0030003
      FC1F001FE0030007F8CF8FF1E0036086E1E7FFF9E003E080C3F3FF75FFFFF080
      C7FDFF8FBF7DF9C1FFFFFFFF7F7EFDF3FFFFFFFFFFFFFFFFF9FFFFFFFC00FFFF
      F6CFFE008000FFFFF6B7FE000000FFFFF6B7FE000000FFFFF8B780000000FFFF
      FE8F80000001C1FBFE3F80000003C3FBFF7F80000003C3FBFE3F80010003C1F3
      FEBF80030003D863FC9F80070FC3FE07FDDF807F0003FFFFFDDF80FF8007FFFF
      FDDF81FFF87FFFFFFFFFFFFFFFFFFFFF00000000000000000000000000000000
      000000000000}
  end
end