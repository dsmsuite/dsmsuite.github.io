Attribute VB_Name = "Module7"
Public x, y As Integer
Sub Tearing()

'x = InputBox(prompt:="Please enter the row number of mark to be torn")
'y = InputBox(prompt:="Please enter the column number of mark to be torn")

Application.ScreenUpdating = False


ActiveCell.Select
x = ActiveCell.row
y = ActiveCell.Column

x = Cells(x, 2).Value
y = Cells(y, 2).Value

Sheets("DSM").Select
Cells(x + 1, y + 2).Select
    Selection.ClearContents

    
Reachability_Matrix

End Sub

