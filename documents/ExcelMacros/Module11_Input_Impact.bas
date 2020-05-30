Attribute VB_Name = "Module11"
Option Explicit
Option Base 1

'Input Impact matrix

Sub Input_Impact()
Dim i, j As Integer
 
Application.ScreenUpdating = False
 
 
Worksheets("Impact").Select
    Range(Cells(1, 1), Cells(250, 250)).Select
    Selection.ClearContents
    With Selection.Interior
        .ColorIndex = 2
        .Pattern = xlPatternNone
    End With
       
    For i = 1 To elementNum
    For j = 1 To elementNum
        If DSM(i, j, 1) = 1 Then
        Cells(i + 3, j + 3).Select
        With Selection.Interior
        .ColorIndex = 8
        .Pattern = xlSolid
        End With
    End If
    Next j
    Next i
        
    For i = 1 To elementNum
    Cells(i + 3, i + 3).Select
    With Selection.Interior
        .ColorIndex = 1
        .Pattern = xlSolid
    End With
    Next i
           
For i = 1 To elementNum
'Cells(i + 3, 3) = New_Seq(i)
'Cells(3, i + 3) = New_Seq(i)
'Cells(i + 3, 2) = Parameter(New_Seq(i))
Cells(i + 3, 3) = Worksheets("DSM").Cells(i + 1, 2)
Cells(3, i + 3) = Worksheets("DSM").Cells(i + 1, 2)
Cells(i + 3, 2) = Worksheets("DSM").Cells(i + 1, 1)
Next i

Cells(1, 1).Select
    
End Sub

