Attribute VB_Name = "Module6"
Option Explicit
Option Base 1
Dim W() As Single
Dim Level() As Single
Dim WN() As Boolean
Dim i, j, k, L, Sum, Remainder As Integer
Dim band_complete As Boolean
Sub Banding_Partitioned_DSM()  'finds the most upstream set of activities that can be worked concurrently in the time step
     
If Partitioned = 0 Then             ' check if DSM is partitioned before performing banding
    MsgBox "You need to either partition the DSM first, before performing this action on the DSM.", , "DSM Warning"
Else

    
    ReDim W(elementNum)
    ReDim Level(elementNum)
    ReDim WN(elementNum)
    L = 1
    Sum = elementNum
    For i = 1 To elementNum
    W(i) = 1
    WN(i) = False
    Next i

Application.ScreenUpdating = False


' Clear old content of "Banded DSM" page
Worksheets("Banded DSM").Select
    Range(Cells(1, 1), Cells(200, 200)).Select
    Selection.ClearContents
    With Selection.Interior
        .ColorIndex = 2
        .Pattern = xlPatternNone
    End With

For i = 1 To elementNum + 2
For j = 1 To elementNum + 2
    Worksheets("Banded DSM").Cells(i, j) = Worksheets("Partitioned DSM").Cells(i + 1, j)
Next j
Next i


Do While Sum <> 0

    For i = 1 To elementNum
        WN(i) = False               'initialize all activities to do NO work during this time step
    Next i
    j = elementNum + 1                       'keeps from looking for full band when no activities left
    
    For i = 1 To elementNum                  'find first activity that can do work during the current time step
        If W(i) <> 0 Then
            WN(i) = True
            j = i + 1               'sets j to the following activity
            Exit For                'leave loop once the first activity is found
        End If
    Next i
    
    band_complete = False                                    'all activities for band have not been found
    Do While (band_complete = False) And (j <= elementNum)            'begin to identify remaining activities in the band
        If W(j) <> 0 Then                                    'if next activity needs work
            For k = i To j - 1
                If (Partitioned_DSM(j, k, 1) <> 0) And (W(k) <> 0) Then    'if dependent on an upstream activity needing work
                    band_complete = True                     'then the complete band has been found (??? could be changed!!!)
                    Exit For
                End If
            Next k                                           'keep checking vs. activities in band
            If band_complete = False Then                    'if complete band not yet found…
                WN(j) = True                                 '…then add activity j to "work now"
            Else
                Exit Do                                      'if complete band found, then finished banding
            End If
        End If
        j = j + 1
    Loop                                                     'see if next activity can be added to the band

For i = 1 To elementNum
Remainder = L Mod 2
If WN(i) = True And Remainder = 1 Then
Worksheets("Banded DSM").Select
Range(Cells(i + 1, 1), Cells(i + 1, elementNum + 2)).Select
With Selection.Interior
        .ColorIndex = 8
        .Pattern = xlSolid
    End With
End If
Next i

For i = 1 To elementNum
If WN(i) = True Then
W(i) = 0
Level(i) = L
End If
Next i

Sum = 0
For j = 1 To elementNum
Sum = Sum + W(j)
Next j

L = L + 1

Loop

For i = 1 To elementNum
    Cells(i + 1, i + 2).Select
    With Selection.Interior
        .ColorIndex = 1
        .Pattern = xlSolid
    End With
    Cells(i + 1, i + 2).Value = New_Seq(i)
    With Selection.Font
        .ColorIndex = 2
    End With
Next i

End If

End Sub
