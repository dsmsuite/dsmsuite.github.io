Attribute VB_Name = "Module16"
' Version 2.1, by Sadegh Mirshekarian, 3/2012
' **************************************************************************************************************

Sub Dependence_Report()

    Application.ScreenUpdating = False
        
    ' First clear the previous report
    Worksheets("Dependence Report").Columns(2).ClearContents
    Worksheets("Dependence Report").Cells(1, 2).Value = "Depends on"
    
    ' Now generate the new report
    Worksheets("Dependence Report").Columns(1).Value = Worksheets("Elements Info").Columns(2).Value
    
    Worksheets("DSM").Select
    For i = 1 To elementNum
        For j = 1 To elementNum
            If (i <> j) And (Cells(i + 1, j + 2) = 1) Then
                Worksheets("Dependence Report").Cells(i + 1, 2) = _
                    Worksheets("Dependence Report").Cells(i + 1, 2) + Worksheets("Elements Info").Cells(j + 1, 2).Value + ",   "
             End If
        Next j
    Next i
    
    Worksheets("Dependence Report").Select

End Sub
