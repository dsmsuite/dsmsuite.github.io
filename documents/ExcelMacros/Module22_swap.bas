Attribute VB_Name = "Module22"
' Version 2.1, by Sadegh Mirshekarian, 3/2012
' **************************************************************************************************************

Sub Swap()

    Dim Row1, Row2      As Variant
    Dim Row12, Row22    As Integer
    Dim lastInd         As Integer
    
    Worksheets("Elements Info").Select
    
    Row1 = InputBox(prompt:="Please enter the (worksheet) row number (NOT the DSM element number) of the first element to swap:")
    Row2 = InputBox(prompt:="Please enter the (worksheet) row number (NOT the DSM element number) of the second element to swap:")
    
    ' determining the current last valid index in the Elements Info tab
    For i = 1 To 250
        If Cells(i, 1) = 251 Then lastInd = i - 1 ' 251 is the last element indicator
    Next i
    
    If (IsNumeric(Row1) = False) Or (IsNumeric(Row2) = False) Then
        MsgBox "You must enter numeric values for each input.", vbCritical, "Error!"
    ElseIf (Row1 < 2) Or (Row1 > lastInd) Or (Row2 < 2) Or (Row2 > lastInd) Then
        MsgBox "Input entries must be in the valid range.", vbCritical, "Error!"
    Else
        Row1 = Val(Row1)
        Row2 = Val(Row2)
        
        If Row1 > Row2 Then
            Row12 = Row1
            Row1 = Row2
            Row2 = Row12
        End If
        
        Row12 = Row1 + 1
        Row22 = Row2 + 1
        
        Application.ScreenUpdating = False
        
        Rows([Row1]).Select
        Selection.Insert Shift:=xlDown
        Rows([Row22]).Select
        Selection.Cut Destination:=Rows([Row1])
        Rows([Row12]).Select
        Selection.Cut Destination:=Rows([Row22])
        Rows([Row12]).Select
        Selection.Delete Shift:=xlUp
        Rows([Row1]).Select
    End If
    
    'Range("A1").Select
    
End Sub

