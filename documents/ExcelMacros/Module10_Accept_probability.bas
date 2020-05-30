Attribute VB_Name = "Module10"
Option Explicit
Option Base 1

'Input Probabiliy matrix

Sub Input_Probability()
Dim i, j As Integer
 
Application.ScreenUpdating = False
If Partitioned = 0 Then              'if the DSM is not partitioned yet
                                                       'then the New Seq is the same as original
           For i = 1 To elementNum
               For j = 1 To elementNum
                   DSM(i, j, 1) = Worksheets("DSM").Cells(i + 1, j + 2)
               Next j
           Next i
End If
 
Worksheets("Probability").Select
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


Sub Accept_probability()

Worksheets("Impact").Select

End Sub

