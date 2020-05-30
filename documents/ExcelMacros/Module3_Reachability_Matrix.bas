Attribute VB_Name = "Module3"
' Version 2.1, by Sadegh Mirshekarian, 3/2012
' **************************************************************************************************************

''' < Reachability Matrix Calculation >
''' -----------------------------------

''' Macro originally recorded 8/17/98 by Qi Dong and modified by Ali Yassine 3/23/99

Option Explicit
Option Base 1
Public reach As Variant         '"reach" contains the elements in the reachability matrix
Public reachToSet, reachFromSet As Variant
Public reachToSet_num, reachFromSet_num As Variant
Public startTime As Variant     'staring time is recorded to calculate the time required for partitioning



Sub Reachability_Matrix()

    Application.ScreenUpdating = False
    
    Dim i, j, k, m, reachingElement, signal, fromSetNum, toSetNum As Integer
    ReDim reach(elementNum, elementNum)
    ReDim reachToSet(elementNum, elementNum), reachToSet_num(elementNum)
    ReDim reachFromSet(elementNum, elementNum), reachFromSet_num(elementNum)
    
    startTime = Time
    
    ''' loading DSM(elementNum,elementNum,1) values
    For i = 1 To elementNum
        For j = 1 To elementNum
            DSM(i, j, 1) = Worksheets("DSM").Cells(i + 1, j + 2)
        Next j
    Next i
    
    For i = 1 To elementNum
        DSM(i, i, 1) = 1
    Next i
    
    ''' loading Parameters = element names
    Worksheets("DSM").Select
    For i = 1 To elementNum
        Parameter(i) = Cells(i + 1, 1)
    Next i
    
    '''Old reachability matrix calculator
    'Dim temp1, temp2 As Variant
    'Dim m As Integer
    'ReDim temp1(elementNum, elementNum), temp2(elementNum, elementNum)
    'For i = 1 To elementNum
    '    For j = 1 To elementNum
    '        temp2(i, j) = DSM(i, j, 1)
    '    Next j
    'Next i
    '
    'For i = 1 To elementNum - 1
    '    For j = 1 To elementNum
    '        For k = 1 To elementNum
    '            temp1(j, k) = temp2(j, k)
    '        Next k
    '    Next j
    '    For j = 1 To elementNum
    '        m = 1
    '        Do Until m > elementNum
    '            For k = 1 To elementNum
    '                temp2(j, m) = temp1(j, k) * DSM(k, m, 1) + temp2(j, m)
    '                If temp2(j, m) > 1 Then temp2(j, m) = 1
    '            Next k
    '            m = m + 1
    '        Loop
    '    Next j
    'Next i
    '''now, the final temp2 array contains the answer for the reachability matrix
    '''so give the values in temp2 to the reachability matrix
    'For i = 1 To elementNum
    '    For j = 1 To elementNum
    '        reach(i, j) = temp2(i, j)
    '    Next j
    'Next i
    
    For i = 1 To elementNum
        reachFromSet(i, 1) = i
        reachToSet(i, 1) = i
        reachFromSet_num(i) = 1
        reachToSet_num(i) = 1
    Next i
    
    For i = 1 To elementNum
        For j = 1 To (i - 1)
            toSetNum = reachToSet_num(j)
            fromSetNum = reachFromSet_num(j)
            If DSM(i, j, 1) = 1 Then ' this means that element j reaches directly to element i
                For k = 1 To fromSetNum
                    reachingElement = reachFromSet(j, k) ' the element that reaches to j
                    
                    reach(i, reachingElement) = 1
                    
                    Call addToSet(Int(i), Int(reachingElement), Int(reachFromSet_num(i)))
                Next k
            End If
            If DSM(j, i, 1) = 1 Then ' this means that element i reaches directly to element j
                For k = 1 To toSetNum
                    reachingElement = reachToSet(j, k) ' the element to which j reaches
                    
                    reach(reachingElement, i) = 1
                    
                    Call addToSet(Int(reachingElement), Int(i), Int(reachFromSet_num(reachingElement)))
                Next k
            End If
        Next j
        ' now link all element reaching to i to all elements to which i reaches
        For k = 1 To reachToSet_num(i)
            For m = 1 To reachFromSet_num(i)
                reach(reachToSet(i, k), reachFromSet(i, m)) = 1
                Call addToSet(Int(reachToSet(i, k)), Int(reachFromSet(i, m)), Int(reachFromSet_num(reachToSet(i, k))))
            Next m
        Next k
        reach(i, i) = 1
    Next i
         
    Partition
     
End Sub

Sub addToSet(e1 As Integer, e2 As Integer, e1SetNum As Integer)
    '''it is assumed that "e2" reaches to "e1"

    Dim m, signal As Integer
    
    signal = 0
    For m = 1 To e1SetNum
        If reachFromSet(e1, m) = e2 Then
            signal = 1 ' already added
            Exit For
        End If
    Next m
    
    If signal = 0 Then
        reachFromSet_num(e1) = reachFromSet_num(e1) + 1
        reachFromSet(e1, reachFromSet_num(e1)) = e2
        
        reachToSet_num(e2) = reachToSet_num(e2) + 1
        reachToSet(e2, reachToSet_num(e2)) = e1
    End If

End Sub

