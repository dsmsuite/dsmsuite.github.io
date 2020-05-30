Attribute VB_Name = "Module15"
Public z As Integer
Sub Col_Tearing()

'z = InputBox(prompt:="Please enter the column number to be torn")

Application.ScreenUpdating = False


z = ActiveCell.Column
z = Cells(z, 2).Value

Sheets("DSM").Select
For i = 1 To elementNum
    Cells(i + 1, z + 2).Select
        Selection.ClearContents
Next i

    
Reachability_Matrix

End Sub
