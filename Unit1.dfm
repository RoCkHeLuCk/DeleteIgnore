object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'DeleteIgnoreV1.0'
  ClientHeight = 422
  ClientWidth = 447
  Color = clBtnFace
  Constraints.MinHeight = 200
  Constraints.MinWidth = 309
  DoubleBuffered = True
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDefault
  OnClose = FormClose
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object pgcDeleteIgnore: TPageControl
    Left = 0
    Top = 0
    Width = 447
    Height = 422
    ActivePage = tbsIgnoreList
    Align = alClient
    TabOrder = 0
    object tbsIgnoreList: TTabSheet
      Caption = 'Ignore List'
      object Splitter1: TSplitter
        Left = 0
        Top = 137
        Width = 439
        Height = 6
        Cursor = crVSplit
        Align = alTop
        Beveled = True
      end
      object gpbIncludedList: TGroupBox
        Left = 0
        Top = 0
        Width = 439
        Height = 137
        Margins.Top = 0
        Align = alTop
        Caption = 'Included List'
        TabOrder = 0
        object mmoIncluded: TMemo
          Left = 2
          Top = 15
          Width = 435
          Height = 120
          Align = alClient
          ScrollBars = ssBoth
          TabOrder = 0
          WordWrap = False
        end
      end
      object gpbExcludedList: TGroupBox
        Left = 0
        Top = 143
        Width = 439
        Height = 125
        Align = alClient
        Caption = 'Excluded List'
        TabOrder = 1
        object mmoExculded: TMemo
          Left = 2
          Top = 15
          Width = 435
          Height = 108
          Align = alClient
          ScrollBars = ssBoth
          TabOrder = 0
          WordWrap = False
        end
      end
      object Panel1: TPanel
        Left = 0
        Top = 268
        Width = 439
        Height = 126
        Align = alBottom
        TabOrder = 2
        DesignSize = (
          439
          126)
        object Label4: TLabel
          Left = 5
          Top = 11
          Width = 94
          Height = 13
          Alignment = taRightJustify
          AutoSize = False
          Caption = 'Search for:'
        end
        object edtSearchFor: TEdit
          Left = 105
          Top = 8
          Width = 291
          Height = 21
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 0
        end
        object Button1: TButton
          Left = 402
          Top = 6
          Width = 30
          Height = 25
          Anchors = [akTop, akRight]
          Caption = '...'
          TabOrder = 1
          OnClick = Button1Click
        end
        object btnFind: TButton
          Left = 173
          Top = 35
          Width = 100
          Height = 25
          Anchors = [akTop]
          Caption = 'Find'
          TabOrder = 2
          OnClick = btnFindClick
        end
        object ckbEmptyFolder: TCheckBox
          Left = 29
          Top = 39
          Width = 122
          Height = 17
          Anchors = [akTop]
          Caption = 'Find Empty Folder'
          TabOrder = 3
        end
        object Memo1: TMemo
          AlignWithMargins = True
          Left = 4
          Top = 66
          Width = 431
          Height = 56
          Align = alBottom
          BevelInner = bvNone
          BevelOuter = bvNone
          BorderStyle = bsNone
          Ctl3D = False
          Enabled = False
          Lines.Strings = (
            'Help:'
            'Use Regex start the line with "\"'
            'Disable the line start with "#"'
            'The others will be treated with the file mask directive')
          ParentCtl3D = False
          ReadOnly = True
          TabOrder = 4
        end
      end
    end
    object tbsFindList: TTabSheet
      Caption = 'Find List'
      ImageIndex = 1
      OnShow = tbsFindListShow
      object clbFindList: TCheckListBox
        Left = 0
        Top = 0
        Width = 439
        Height = 356
        Align = alClient
        ItemHeight = 13
        PopupMenu = ppmFindList
        TabOrder = 0
      end
      object pnlWaitFind: TPanel
        Left = 0
        Top = 0
        Width = 439
        Height = 356
        Align = alClient
        BevelOuter = bvNone
        Caption = 'Search'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 1
        DesignSize = (
          439
          356)
        object Gauge1: TGauge
          Left = 6
          Top = 240
          Width = 424
          Height = 19
          Anchors = [akLeft, akRight]
          ForeColor = clWindowText
          Progress = 50
          ExplicitTop = 69
          ExplicitWidth = 270
        end
        object lblFiles: TLabel
          Left = 6
          Top = 203
          Width = 424
          Height = 19
          Alignment = taCenter
          Anchors = [akLeft, akRight]
          AutoSize = False
          Caption = '...'
          ExplicitTop = 131
          ExplicitWidth = 270
        end
        object btnCancel: TButton
          Left = 167
          Top = 280
          Width = 100
          Height = 25
          Anchors = []
          Caption = 'Cancel'
          TabOrder = 0
          OnClick = btnCancelClick
        end
      end
      object pnlIgnore: TPanel
        Left = 0
        Top = 356
        Width = 439
        Height = 38
        Align = alBottom
        BevelOuter = bvNone
        TabOrder = 2
        DesignSize = (
          439
          38)
        object btnDelete: TButton
          Left = 167
          Top = 6
          Width = 100
          Height = 25
          Anchors = [akTop]
          Caption = 'Delete'
          Enabled = False
          TabOrder = 0
          OnClick = btnDeleteClick
        end
        object ckbSendTrash: TCheckBox
          Left = 37
          Top = 10
          Width = 112
          Height = 17
          Anchors = [akTop]
          Caption = 'Send Recicle Bin'
          Checked = True
          State = cbChecked
          TabOrder = 1
        end
      end
    end
    object TabSheet1: TTabSheet
      Caption = 'About'
      ImageIndex = 2
      DesignSize = (
        439
        394)
      object Image1: TImage
        Left = 184
        Top = 24
        Width = 44
        Height = 44
        Anchors = [akTop]
        AutoSize = True
        Center = True
        Picture.Data = {
          0954506E67496D61676589504E470D0A1A0A0000000D494844520000002C0000
          002C08060000001E845A01000000097048597300000B1300000B1301009A9C18
          0000072C4944415478DAC5997B5054551CC77FE75C56F6A2C66349C354C04014
          1F15880FB2870F8C51B1E909DA434D33D0C2202549B109341FA00422A632E663
          D469D28AC92429B5D060141474151393D1A24C8431DD65EF027BCFE9DC0517AE
          A0DEBB2BF2FD87D9BBE7F1393F7EAF7317819D1236653983C1380CFEA90AA7D7
          AE8E022206D19A6A7764690442A9750C42A8E9AFE72316E0B8D3C8CDA30474BA
          03D0D7A7809F1D5363CFBE48ED84FA756B74E49FBF63E8E5CA487AF3C6602AD4
          A9DB901D02B97B5623AFDE79B8D7A319CE8B96967608B03923B53BADFAEB035A
          59114B6E5CF784662B3A22E4AC6DC03E7EDF231FDFC5DA84A4F3F70DD89CB662
          02292BC92457AA02001C076D03E1A63371BE7E29747C78061F3E49B01B5858BB
          02C3BF5713C9EFFA25B4CEA0BDEFA4ADC53951AE5FFF83A877DF28ED92E45AD5
          C0A6CDD95A547E26473C73F27520A443595B0B3FEA7D11860645B82C483CA718
          D8B47BBB168EFCB295549C8DBC1FBEAA562CAB5CC2C34327F21F2E6A03DD06D8
          74E0078CF67D97259ED3C7007D7096BD5D92A551C0C011FC62B97BB40116162F
          88164B8A3600CBA79D2DEC37309F0E1F19D175564C43BBC0C2CAE421A4A8A080
          1A6FBA75366C1331A6DC90E045FCDAF5ABDB00B3CAA5A1C78AF2C9A50BCF7536
          676BB12263E2424606693F5A7A5E0EFCC9A257C8B1A35FD3C606FB57EF20E180
          C17B5DB2B7BC6203AEFB69BF13DA9653CC0AC313EA8E8F41756036F7176AB20F
          EAE2DC809F0D1BC9B3326E9DCD026D1C292ECCA7A2052B5AA19B2BE0B844C07D
          BD413C560434671D28AA80A163819BFAA61556DC9A0370B2503134D72F6023BF
          7947B415D8143D6327B9503E4DF189A7C78026729AD55A941515316F1F90EC34
          B86B8119350634F11F01EAD6CDFA51AC380FE2FCD9CA0E2AEDE9D1A31A87470C
          42A64DEBDDE1E7BC73A4B6BAA762E099F340F36A94EDDF6B85FE713F90F5A90C
          5A6C3BE1E909A0793F0E50F7EEB647E21F17408C7D5BB16B485D1E0E1DF33262
          A96C0C397CE010559377DD74C025A702E7DFBFE51903B5E431E8AC55F2B1CC0D
          341F2C94C152A3111AD359A62A3CA47C4F262E70E82624C4CC4C102BCEAE5235
          53D2431EC02D4B9341DB2C2DB9876801183D1E34F317D8DCC03AC66080C6CF53
          55C34AC25EBD4F22E1EDA93BC4CB17DF503D5B92E723C0252D07AE7F40CB3391
          59FA401E90B213CD6EF0901C362B1DA020DFAEED700F2F0B32CD9B55C6DAC7C7
          ED5A4192ABAEC9D27EFE2DCF98A569433D202DDF026B7503C9B207EDDECA7A5B
          31BD305E4F8C3707DBBD8A248F1EC07DB2426EE956A2869BD098C92C7BF42787
          B691621C19C78FD0B348750C5892AE2770292C107DFBC961CD0258D6AE067AC4
          31581B74DD84503D2B188E033F1D069AD80F65016615730F4BEB407414D81419
          A12735571D0396B2416CBC2CC064BA1588EB563AB40D967CB82E7AC6AFF442F9
          3376AF22E5D9B80479EA620146AF55036EE51E4D15F187E68A28DAB313204D17
          40C29CB7B2C58BBFC7D8B5423B15CC1A60EB5880959F066EE967F240948ACB8F
          CCD2527B6BC73D117BF5B98E84F9EFCE16CF946E563D5BEA0D24CBDE5EC132D6
          B46403297B7CBA4A96F26CBD47562AA87D65C0AE4D0791B03EFD71B23FB7849A
          4D4E8A670E0D014D52327383D696952A585ADB3C2BE5E9E4D5324B4BD0966FF7
          B02E2F531DF093C39721D3777BB490BB474FFEACF4533C715E02384D9E228795
          DCE0C81D2A98541125F76855C649D55F6099F3BAE27E1AF15D018F7D7E74533F
          1C333385F5134B9402A30953C0E93DE6BB1A0D7303437305BB476F70ABF76876
          0F4BE15120CB12955BB747AF33746CD8B026E09C0D8164DFB7A5D4F05F1735D0
          C87F009082C300FA6265935897875F8CB2061CD9BB0BC07843E16688756A4F2C
          E43337A6D9EE74A659D376934B7F44293EF203147675AF8171E1035CE6C5D5B6
          5C4233D28690C3F9C799953BF61D9A6A31EB0E0B5DCAAF4A4F69FAD42CD3975F
          20545A9A269697C577C6EBA93B09F7EA7B1E8D782A847F2FCE2003B642EFDAE6
          06DF7F7388545F79B2B341AD70CEBC098F7A66329F9472D8F6ECF64142D2C241
          E4D489DF689DD1B553693166693070219FBD254D7688F6C60AC949AF9192C2ED
          B4CEE0DC29B052561812BC8BF6E9F3A64B7CA22C51DFF1FDB090183F9D9C3DB5
          F18143230CD87FE057101C32C365F65C739BAFEF36D79C92F49A58FCDBA607E6
          1E4E1AC90D36C053A3E3F9A9D3CDED0DB9E76F1CE6CC35C1CCA77790CB170776
          64F6406E3A033734E863322234DB257CD21DEBB5B21F65766E75A3C78B92C8E5
          CAB9D470E3FEE669D6E3727D7C7FC1FE01B1CE094BF4F73C98D275CD39D9088C
          C6C1545FF631A9BDF61203575CC6DBDD58D385A2877B9EC2BE7ECBA9B76F2E3F
          2B5AD19B1CD53F2C36C16F08A4278E4FA5667314BD76C5870ACA5A53C47C14B9
          BA5F451E9E0791EF633B495070BE4BD84455173DBB806FC994BB478BAAAA02A0
          E25C08D4D707114083D0F51A0FFA5F2D509100EECAAE4DBD7D4424D4E9C159AB
          076FDF62D07996F1EFCCBD6EEF9EFF0367A408A7436333B40000000049454E44
          AE426082}
        ExplicitLeft = 112
      end
      object Label1: TLabel
        Left = 142
        Top = 74
        Width = 129
        Height = 19
        Anchors = [akTop]
        Caption = 'DeleteIgnore V1.0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        ExplicitLeft = 70
      end
      object Label2: TLabel
        Left = 107
        Top = 99
        Width = 197
        Height = 19
        Anchors = [akTop]
        Caption = 'Autor: Franco M. A. Caixeta'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        ExplicitLeft = 35
      end
      object Label3: TLabel
        Left = 144
        Top = 124
        Width = 128
        Height = 19
        Anchors = [akTop]
        Caption = 'License: FreeWare'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        ExplicitLeft = 71
      end
    end
  end
  object ppmFindList: TPopupMenu
    Left = 316
    Top = 288
    object ShowinExplorer1: TMenuItem
      Caption = 'Show in Explorer'
      OnClick = ShowinExplorer1Click
    end
    object N1: TMenuItem
      Caption = '-'
    end
    object SelectAll1: TMenuItem
      Caption = 'Select All'
      ShortCut = 16449
      OnClick = SelectAll1Click
    end
    object Invert1: TMenuItem
      Caption = 'Invert Select'
      ShortCut = 16457
      OnClick = Invert1Click
    end
    object CleanSelect1: TMenuItem
      Caption = 'Clean Select'
      ShortCut = 16451
      OnClick = CleanSelect1Click
    end
  end
  object FileOpenDialog1: TFileOpenDialog
    FavoriteLinks = <>
    FileTypes = <>
    Options = [fdoPickFolders, fdoForceFileSystem, fdoPathMustExist, fdoForceShowHidden]
    Title = 'Search For'
    Left = 356
    Top = 288
  end
end
