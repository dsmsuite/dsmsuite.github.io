Attribute VB_Name = "Module1"
' Version 2.1, by Sadegh Mirshekarian, 3/2012
' **************************************************************************************************************
Option Base 1

Public elementNum       As Integer      'number of elements in the DSM. this is updated as the DSM is updated.
Public Partitioned      As Integer      'flag for Partitioned DSM: 0=not partitioned, 1=paritioned
Public DSM              As Variant
Public Partitioned_DSM  As Variant
Public Parameter        As Variant
Public New_Seq          As Variant

' **************************************************************************************************************
Sub Auto_Open()

    MenuBars(xlWorksheet).Reset
    MenuBars(xlWorksheet).Menus.Add "&DSM", "Help"
    
    MenuBars(xlWorksheet).Menus("DSM").MenuItems.Add _
        Caption:="&Clear DSM", _
        OnAction:="Clear_DSM"
        
    MenuBars(xlWorksheet).Menus("DSM").MenuItems.Add Caption:="&Swap two elements", OnAction:="Swap"
    
    MenuBars(xlWorksheet).Menus("DSM").MenuItems.Add _
        Caption:="&Generate dependence report", _
        OnAction:="Dependence_Report"
    
    MenuBars(xlWorksheet).Menus("DSM").MenuItems.Add _
       Caption:="&Band Unpartitioned DSM", _
      OnAction:="Banding_Unpartitioned_DSM"
        
    MenuBars(xlWorksheet).Menus("DSM").MenuItems.Add _
        Caption:="&Partition DSM", _
        OnAction:="Reachability_Matrix"
      
    MenuBars(xlWorksheet).Menus("DSM").MenuItems.Add _
        Caption:="&Band Partitioned DSM", _
        OnAction:="Banding_Partitioned_DSM"
    
    'MenuBars(xlWorksheet).Menus("DSM").MenuItems.Add _
    '    Caption:="&Cluster DSM", _
    '    OnAction:="Cluster_DSM"
    
    MenuBars(xlWorksheet).Menus("DSM").MenuItems.Add _
        Caption:="&Tear DSM Mark", _
        OnAction:="Tearing"
    
    MenuBars(xlWorksheet).Menus("DSM").MenuItems.Add _
        Caption:="&Undo Tear Mark", _
        OnAction:="Untear_Previous_Mark"
        
    MenuBars(xlWorksheet).Menus("DSM").MenuItems.Add _
        Caption:="&Tear DSM Column", _
        OnAction:="Col_Tearing"
    
    MenuBars(xlWorksheet).Menus("DSM").MenuItems.Add _
        Caption:="&Simulate DSM", _
        OnAction:="SIM_Input"
    
    MenuBars(xlWorksheet).Menus("DSM").MenuItems.Add _
        Caption:="&About DSM", _
        OnAction:="about_DSM"
    
    Toolbars.Add "DSM"
    
    Toolbars("DSM").ToolbarButtons.Add Button:=206, Before:=1
    Toolbars("DSM").ToolbarButtons.Add Button:=49, Before:=2
    'Toolbars("DSM").ToolbarButtons.Add Button:=95, Before:=3
    Toolbars("DSM").ToolbarButtons.Add Button:=149, Before:=4
    Toolbars("DSM").ToolbarButtons.Add Button:=208, Before:=5
    Toolbars("DSM").ToolbarButtons.Add Button:=213, Before:=6
    
    With Toolbars("DSM").ToolbarButtons(1)
        .OnAction = "Clear_DSM"
        .Name = "Clear DSM"
        .StatusBar = "Clear the interdependencies in the DSM"
    End With
    
    With Toolbars("DSM").ToolbarButtons(2)
        .OnAction = "reachability_matrix"
        .Name = "Partition DSM"
        .StatusBar = "DSM Paritioning"
    End With
    
    'With Toolbars("DSM").ToolbarButtons(2)
    '    .OnAction = "Cluster_DSM"
    '    .Name = "Cluster DSM"
    '    .StatusBar = "DSM Clustering"
    '    End With
    
    With Toolbars("DSM").ToolbarButtons(3)
        .OnAction = "Tearing"
        .Name = "Tear DSM Mark"
        .StatusBar = "Tear a DSM Mark"
    End With
    
    With Toolbars("DSM").ToolbarButtons(4)
        .OnAction = "Untear_Previous_Mark"
        .Name = "Untear a torn DSM Mark"
        .StatusBar = "Untear a torn DSM Mark"
    End With
    
    With Toolbars("DSM").ToolbarButtons(5)
        .OnAction = "SIM_Input"
        .Name = "Simulate DSM"
        .StatusBar = "DSM Simulation"
    End With
    
    Toolbars("DSM").Position = xlLeft
    Toolbars("DSM").Visible = True
    
    'MsgBox "Please work with one DSM file at a time." & _
        "Save and close current DSM before starting a new one.", vbExclamation, "DSM Warning"
    
    
    Call Update_DSM
    
    ' Check if it is the first time running the macro, and show a dialog box if it is
    With Worksheets("New Sequence")
        If (.Cells(1, 2) = 0) And (.Cells(1, 3) = 99) Then
            MsgBox "Welcome to the new DSM Excel Macro, Version 2.1" & Chr(13) & Chr(13) & "Have fun partitioning!", vbOKOnly, "MIT, Engineering Systems Division"
            .Cells(1, 2) = ""
            .Cells(1, 3) = ""
        End If
    End With
    
    Cells(1, 1).Select

End Sub

' **************************************************************************************************************
Sub Clear_DSM()
    If MsgBox("This will irreversibly clear all the relationships in your DSM. Are you sure?", vbYesNo, "Warning!") = vbYes Then
        Application.ScreenUpdating = False
        
        Partitioned = 0               ' in the begining the DSM is not partitioned
    
        Worksheets("DSM").Select
        Range(Cells(2, 3), Cells(250, 250)).ClearContents
        
        For i = 1 To elementNum
            Cells(i + 1, i + 2) = i
        Next i
    End If
End Sub

' **************************************************************************************************************
Sub Auto_Close()
    MenuBars(xlWorksheet).Menus("DSM").Delete
    Toolbars("DSM").Delete
End Sub
' **************************************************************************************************************

''' This subroutine updates the DSM based on information provided in the "Elements Info" Tab
Sub Update_DSM()
    Dim cellStatus      As Variant
    Dim colorShift       As Integer
    Dim tempComment     As String
    Dim commentMsg      As String
                
    Application.ScreenUpdating = False

    ' saving previous DSM interdependency data
    Dim oldElementNum As Integer
    
    Worksheets("DSM").Select
    oldElementNum = 250
    
    For i = 1 To 250
        If IsEmpty(Cells(i + 1, 2)) = True Then
            oldElementNum = i - 1
            Exit For
        End If
    Next i
    
    ReDim tmpDSM(oldElementNum + 1, oldElementNum + 1)
    
    For i = 1 To oldElementNum
        For j = 1 To oldElementNum
            If (Cells(i + 1, j + 2) = 1) And (i <> j) Then
                tmpDSM(i + 1, j + 1) = 1
            End If
        Next j
    Next i
    
    ' updating elementNum
    elementNum = 250
    Worksheets("Elements Info").Select
    
    For i = 1 To 250
        If Cells(i + 1, 1) = 251 Then
            elementNum = i - 1
            Exit For
        ElseIf IsEmpty(Cells(i + 1, 1)) = False Then
            tmpDSM(Cells(i + 1, 1) + 1, 1) = i + 1  ' The first row and column of tmpDSM indicate which Excel row and column
            tmpDSM(1, Cells(i + 1, 1) + 1) = i + 2  ' correspond to each DSM row and column AFTER the new changes applied
        End If
    Next i
    
    If elementNum = 0 Then
        MsgBox "Error loading DSM or DSM is empty! No changes will be made to the current DSM."
    Else
        ReDim DSM(elementNum, elementNum, 3)
        ReDim Partitioned_DSM(elementNum, elementNum, 3)
        ReDim Parameter(elementNum)
        ReDim New_Seq(elementNum)
        
        ' updating cell information based on given data
        Worksheets("DSM").Select
        Range(Cells(1, 1), Cells(250, 250)).Select
        Selection.ClearContents
        Selection.ClearComments
        With Selection
            .Interior.ColorIndex = 2
            .Interior.Pattern = xlPatternNone
        End With
        Cells(1, 1).Interior.ColorIndex = 10
        Cells(1, 1).Font.ColorIndex = 2
        Cells(1, 1) = "Element Name"
        
        For i = 2 To elementNum + 1
            ' formating the DSM sheet
            Cells(i, 1) = Worksheets("Elements Info").Cells(i, 3)
            Cells(i, 2) = i - 1
            Cells(1, i + 1) = i - 1
            Cells(i, i + 1).Select
            With Selection
                .Interior.ColorIndex = 1
                .Interior.Pattern = xlSolid
                .Font.ColorIndex = 2
            End With
            Cells(i, i + 1).Value = i - 1
            
            ' updating cell completion levels
            cellStatus = Worksheets("Elements Info").Cells(i, 5)
            
            If IsEmpty(cellStatus) = False Then
                If IsNumeric(cellStatus) Then
                    colorShift = Int(0.4 * cellStatus * 100)
                    
                    If (cellStatus >= 0) And (cellStatus <= 100) Then
                        Cells(i, 2).Interior.Color = RGB(210 - colorShift, 250 - colorShift, 210 - colorShift)
                        Cells(1, i + 1).Interior.Color = RGB(210 - colorShift, 250 - colorShift, 210 - colorShift)
                    Else
                        Cells(i, 2).Interior.Color = RGB(250, 250, 250)
                        Cells(1, i + 1).Interior.Color = RGB(250, 250, 250)
                    End If
                    
                    commentMsg = "Completion: " + Str(cellStatus * 100) + "%"
                Else
                    MsgBox "One of the completion level values is not recognizable.", vbInformation, "Careful!"
                End If
            Else
                commentMsg = ""
            End If
        
            ' updating cell comments
            tempComment = Worksheets("Elements Info").Cells(i, 2).Value + " " + vbCrLf + vbCrLf + commentMsg
            
            Cells(i, 1).AddComment tempComment
            Cells(1, i + 1).AddComment tempComment
            Cells(i, i + 1).AddComment tempComment
            
            Cells(i, 1).Comment.Visible = 0
            Cells(1, i + 1).Comment.Visible = 0
            Cells(i, i + 1).Comment.Visible = 0
            
            ' restoring old interdependencies
            If IsEmpty(Worksheets("Elements Info").Cells(i, 1)) = False Then
                For j = 1 To oldElementNum
                    If tmpDSM(Worksheets("Elements Info").Cells(i, 1) + 1, j + 1) = 1 Then
                        If IsEmpty(tmpDSM(1, j + 1)) = False Then
                            Cells(i, tmpDSM(1, j + 1)) = 1
                        End If
                    End If
                Next j
            End If
            
            Worksheets("Elements Info").Cells(i, 1) = i - 1
            
        Next i
    End If
    
    Partitioned = 0
    
    Worksheets("Dependence Report").Cells(1, 2).Value = "Depends on [Needs Updating!]"
    Worksheets("Partitioned DSM").Cells(1, 1).Value = "PARTITIONED DSM [Needs Updating!]"
    
    Cells(1, 1).Select
    
    ' MsgBox elementNum & " elements loaded. Max 250 elements allowed."
    
End Sub


