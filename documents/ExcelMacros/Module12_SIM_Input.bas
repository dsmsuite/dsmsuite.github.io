Attribute VB_Name = "Module12"
Option Explicit
Option Base 1

'Input Activity Durations

Sub SIM_Input()
Dim i, j As Integer
          
Application.ScreenUpdating = False

Worksheets("SIM Input").Select
    Range(Cells(11, 1), Cells(250, 2)).Select
    Selection.ClearContents
Cells(11, 3).Select

For i = 1 To elementNum

'Cells(i + 10, 1) = New_Seq(i)
'Cells(i + 10, 2) = Parameter(New_Seq(i))
Cells(i + 10, 1) = Worksheets("DSM").Cells(i + 1, 2)
Cells(i + 10, 2) = Worksheets("DSM").Cells(i + 1, 1)
Next i
          
Cells(1, 1).Select
    
End Sub

Sub Clear_Sim_Input()

Application.ScreenUpdating = False

Worksheets("SIM Input").Select
    Range(Cells(11, 3), Cells(250, 6)).Select
    Selection.ClearContents
Cells(11, 3).Select

End Sub
Sub Accept_Sim_Input()

Worksheets("Probability").Select

End Sub
