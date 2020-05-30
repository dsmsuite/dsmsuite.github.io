Attribute VB_Name = "Module9"

Option Explicit                 'all variables must be explicitly declared

Option Base 1                   'all arrays begin at one (instead of zero, which is default)

Dim r As Integer                'run number
Dim r_Max As Integer            'number of runs to do
'Dim elementNum As Integer                'number of activities
Dim W() As Single               'the work vector; activities with work remaining
Dim Winit() As Single           'the initial values for the work vector
Dim WN() As Boolean             'the "work now" vector; activites to work in current time step
Dim LC() As Single              'the learning curve vector
'Dim DSM() As Variant            'the DSM array containing iteration probabilities and rework amounts
Dim t As Integer                'time step number
Dim delta_t As Single           'time step size
'Dim stab_batch As Integer       'number of runs to do (batch) between output distribution stability checks
'Dim c As Single                 'cumulative cost
Dim S As Single                 'cumulative schedule duration
'Dim ActC() As Single            'cost samples for newly beginning activities
Dim ActS() As Single            'duration samples for newly beginning activities
'Dim ActC_3pt() As Single        'cost min, likely, max
Dim ActS_3pt() As Single        'duration min, likely, max
Dim i As Integer                'counter
Dim j As Integer                'counter
Dim k As Integer                'counter
Dim band_complete As Boolean    'indicates that all activities comprising a band for a time step have been found
Dim CSP_Samples() As Single     'dynamic array (9, r) of CSP samples resulting from runs (C,S,P,Pmin,Plikely,Pmax,PtechMin,PtechLikely,PtechMax)
'Dim current_means(3) As Single  'means of CSP_Samples(r,1 To 3)
'Dim current_vars(3) As Single   'variances of CSP_Samples(1 To 3, r)
'Dim last_means(3) As Single     'means of CSP_Samples(1 To 3, r-1)
'Dim last_vars(3) As Single      'variances of CSP_Samples(1 To 3, r-1)
'Dim last_means_check(3) As Single  'means of CSP_Samples(1 To 3, r-stab_batch)
'Dim last_vars_check(3) As Single   'variances of CSP_Samples(1 To 3, r-stab_batch)
'Dim PMF_stable As Single        'simulation stopping criteria, when PMF mean and variance less than this amount
'Dim Do_Perf As Boolean          'whether or not to do perf. analyses
Dim Act_Seq() As Integer        'DSM sequencing vector

Sub CSP_Model()
    
Application.ScreenUpdating = False

    
    Dim finish_run As Boolean                                           'indicates a run is complete
    Dim More_Runs As Boolean                                            'indicates simulation is complete
    Dim Single_Run_Data As Boolean                                      'get data for a single, sample run?

    Randomize                                                           'initialize random-number generator
    r = 0                                                               'initialize run #
    
    'ReDim ActC(elementNum)
    ReDim ActS(elementNum)
    'ReDim ActC_3pt(elementNum, 3) As Single
    ReDim ActS_3pt(elementNum, 3) As Single
    ReDim W(elementNum)
    ReDim Winit(elementNum)
    ReDim WN(elementNum)
    ReDim LC(elementNum)
    ReDim CSP_Samples(9, 1)
    ReDim Act_Seq(elementNum)
    
    Worksheets("Single Run Data").Select
    Range(Cells(6, 3), Cells(105, 5)).ClearContents
    Range(Cells(108, 5), Cells(207, 5)).ClearContents
    

    More_Runs = True
    delta_t = Worksheets("SIM Input").Cells(3, 2)                 'initialize time step size
    'PMF_stable = Worksheets("SIM Input").Cells(6, 2)              'init simulation stopping criterion
    r_Max = Worksheets("SIM Input").Cells(5, 2)                   'initialize max # of runs to do
    'stab_batch = Worksheets("SIM Input").Cells(9, 2)              'initialize stability batch size
    Single_Run_Data = Worksheets("SIM Input").Cells(4, 2)         'collect single run data?
    'Do_Perf = 0                                                         'do performance analyses?
    Worksheets("SIM Results").Range("B3:B2000").ClearContents      'erase all prior data
     'Worksheets("SIM Results").Range("T3:T6").ClearContents
     'For i = 1 To 3
     'current_means(i) = 0.0000001                                    'init means of sample results to near zero
     'current_vars(i) = 0.0000001                                     'init vars of sample results to near zero
     'last_means_check(i) = 0.0000001
     'last_vars_check(i) = 0.0000001
     'Next i
     
    Worksheets("SIM Input").Select
    
        If Partitioned = 0 Then           'if the DSM is not partitioned yet, then the New Seq is the same as original
            For i = 1 To elementNum
                New_Seq(i) = Worksheets("DSM").Cells(i + 1, 2)
            For j = 1 To elementNum
                Partitioned_DSM(i, j, 1) = DSM(i, j, 1)
            Next j
            Next i
        End If
    
    For i = 1 To elementNum
    For j = 1 To elementNum
         DSM(i, j, 2) = Worksheets("Probability").Cells(i + 3, j + 3) 'init dim 2 w/ DSM probabilities
         DSM(i, j, 3) = Worksheets("Impact").Cells(i + 3, j + 3)      'init dim 3 w/ DSM impacts
    Next j
    Next i
    
    
    For i = 1 To elementNum
     '  ActC_3pt(i, 1) = Worksheets("DSM").Cells(5 + i, 36)              'collect activity min. cost
     '  ActC_3pt(i, 2) = Worksheets("DSM").Cells(5 + i, 37)              'collect activity most likely cost
     '  ActC_3pt(i, 3) = Worksheets("DSM").Cells(5 + i, 38)              'collect activity max. cost
        ActS_3pt(i, 1) = Cells(i + 10, 3)                                'collect activity min. duration
        ActS_3pt(i, 2) = Cells(i + 10, 4)                                'collect activity most likely duration
        ActS_3pt(i, 3) = Cells(i + 10, 5)                                'collect activity max. duration
        'Winit(i) = Worksheets("SIM Input").Cells(5 + i, 41)             'initialize initial work vector
        Winit(i) = 1
        LC(i) = Cells(i + 10, 6)                                         'initialize learning vector
        Act_Seq(i) = New_Seq(i)                                          'initialize activity sequencing

        For j = 1 To elementNum
            Partitioned_DSM(i, j, 2) = DSM(New_Seq(i), New_Seq(j), 2)
            Partitioned_DSM(i, j, 3) = DSM(New_Seq(i), New_Seq(j), 3)
        Next j
    Next i
        
    Do While (r <= r_Max)
        r = r + 1                                                        'increment run #
        Application.StatusBar = "     Run # " & r & " of " & r_Max       'display run # on status bar
        t = 1                                                            'initialize time step #
        'c = 0                                                           'initialize cumulative cost to zero
        finish_run = False                                               'initialize run as not finished
        If (r = 1) And (Single_Run_Data) Then                            'stuff to do for single run data only
            Worksheets("Single Run Data").Range("F4:IV210").ClearContents 'erase all prior, single run data
            Worksheets("Single Run Data").Range("F61:IV94").ClearContents
            Worksheets("Single Run Data").Cells(4, 6).Value = 0          'place initial values
            Worksheets("Single Run Data").Cells(5, 6).Value = 0
            Worksheets("Single Run Data").Cells(106, 6).Value = 0
            For i = 1 To elementNum
                Worksheets("Single Run Data").Cells(5 + i, 6 + t).Value = Winit(i)
                Worksheets("Single Run Data").Cells(5 + i, 5).Value = Act_Seq(i)
                Worksheets("Single Run Data").Cells(107 + i, 5).Value = Act_Seq(i)
            Next i
        End If
        
        'Worksheets("SIM Input").Calculate                                'recalculate DSM worksheet now
        
        For i = 1 To elementNum
            W(i) = Winit(i)                                             'initialize W vector
            'ActC(i) = Sample_TriPDF(ActC_3pt(i, 1), ActC_3pt(i, 2), ActC_3pt(i, 3))  'sample cost for each activity
            ActS(i) = Sample_TriPDF(ActS_3pt(i, 1), ActS_3pt(i, 2), ActS_3pt(i, 3))  'sample duration for ea. activity
        Next i
            Act_Resequencing                                            'call procedure to resequence CS samples
        For i = 1 To elementNum
            If (r = 1) And (Single_Run_Data) Then _
                'Worksheets("Single Run Data").Cells(5 + i, 2).Value = ActC(i)
                Worksheets("Single Run Data").Cells(5 + i, 3).Value = ActS(i)
            End If
            ActS(i) = max(1, CInt(ActS(i) / delta_t))                   'convert duration to integer time steps (round off)
            If (r = 1) And (Single_Run_Data) Then _
                Worksheets("Single Run Data").Cells(5 + i, 4).Value = ActS(i)
        Next i
    
        Do While (finish_run = False)                                   'loop for each time step
            Banding                                                     'subroutine to choose activities to work during time step
            For i = 1 To elementNum
                If WN(i) = True Then                                    'if activity doing work this time step
                    W(i) = max(0, W(i) - (1 / ActS(i)))                 'do work on these activities (work to do can't go below zero)
                    If W(i) < 0.01 Then W(i) = 0                        'prevents rounding errors from prolonging activities
                    'c = c + (ActC(i) / ActS(i))                         'add to cumulative cost
                End If
                If (WN(i) = True) And (W(i) = 0) Then                   'if activity just finished its work, then
                    For j = 1 To i - 1                                  'loop through column above newly finished activity
                        If Partitioned_DSM(j, i, 2) > 0 Then                        'if there is a probability of iteration, then
                            If Rnd <= Partitioned_DSM(j, i, 2) Then                 'if this iteration is required, then
                                W(j) = W(j) + (Partitioned_DSM(j, i, 3) * LC(j))  'add rework, diminished by learning curve
                                If W(j) > 1 Then W(j) = 0.9             'but keep work from expanding beyond original scope
                                For k = j + 1 To elementNum                      'loop through column below newly reworked activity
                                    If Partitioned_DSM(k, j, 2) > 0 Then            'if there is a probability of second-order rework, then
                                        If Rnd <= Partitioned_DSM(k, j, 2) Then     'if this rework is required, then
                                            If W(k) = 1 Then W(k) = 2   'signify that activity has not yet been worked
                                            W(k) = W(k) + (Partitioned_DSM(k, j, 3) * LC(k)) 'add rework, diminished by learning curve
                                            If W(k) >= 2 Then W(k) = 1  'if downstream activity has not been worked, no rework
                                            If W(k) > 1 Then W(k) = 0.9 'keep work from expanding beyond original scope
                                        End If
                                    End If
                                Next k
                            End If
                        End If
                    Next j
                End If
            Next i
            finish_run = True                                           'pass is now finished…
            For i = 1 To elementNum
                If W(i) <> 0 Then                                       '…unless any activity has more work to do
                    finish_run = False
                    Exit For
                End If
            Next i
            
            If (r = 1) And (Single_Run_Data) Then                                   'if desired, place single run data
                For i = 1 To elementNum
                    Worksheets("Single Run Data").Cells(4, 6 + t).Value = t
                    Worksheets("Single Run Data").Cells(5, 6 + t).Value = t * delta_t
                    Worksheets("Single Run Data").Cells(5 + i, 6 + t).Value = W(i)
                    'Worksheets("Single Run Data").Cells(106, 6 + t).Value = c
                    If WN(i) Then Worksheets("Single Run Data").Cells(107 + i, 6 + t) = elementNum - i + 1  'build Gantt chart
                Next i
                If r_Max = 1 Then Application.StatusBar = "    Time Step: " & t 'display time step # on status bar
            End If
            
            t = t + 1                                                   'increment time step
        Loop                                                            'loop for time step
        
        S = (t - 1) * delta_t                                           'determine schedule duration
        'CSP_Samples(1, r) = Int(c)                                     'put run result for cost into array (rounded to integer)
        CSP_Samples(2, r) = S                                           'put run result for schedule into array
        ReDim Preserve CSP_Samples(9, r + 1)                            'enlarge dynamic array to hold next run results
    
        If r_Max = 0 Then
            If r = r_Max Then More_Runs = False                         'if using max # runs, check for it
        End If
    Loop
    
    Application.StatusBar = False                                       'clear status bar
    For i = 1 To r - 1                                                    'put simulation results on spreadsheet
    Worksheets("SIM Results").Cells(i + 2, 2).Value = CSP_Samples(2, i)
    Next i
    Worksheets("SIM Results").Calculate                             'recalculate worksheet now
    If Single_Run_Data Then Worksheets("Single Run Data").Calculate     'recalculate SRD worksheet now
    Worksheets("SIM Results").Select
    Range(Cells(4, 3), Cells(15, 4)).Select
    Selection.ClearContents
    With Selection.Interior
        .ColorIndex = 2
        .Pattern = xlPatternNone
    End With
    
    Worksheets("SIM Results").DrawingObjects.Delete
    
    Application.Run "ATPVBAEN.XLA!Histogram", ActiveSheet.Range("$B$2:$B$102") _
        , ActiveSheet.Range("$C$4"), , False, False, True, True
            
    
' Replace the numbers in the Gantt chart with real activity numbers
If Single_Run_Data Then
    Worksheets("Single Run Data").Select
    For i = 1 To elementNum
        For j = 7 To 256
            If IsEmpty(Cells(i + 107, j)) = False Then
                Cells(i + 107, j) = Cells(i + 107, 5)
            End If
        Next j
    Next i
End If

Cells(1, 1).Select

Worksheets("SIM Results").Select
Cells(1, 1).Select

End Sub

Sub Banding()                       'finds the most upstream set of activities that can be worked concurrently in the time step
       
    Dim in_band As Boolean
    
    
    For i = 1 To elementNum
        WN(i) = False               'initialize all activities to do NO work during this time step
    Next i
    j = elementNum + 1                       'keeps from looking for full band when no activities left
    
    For i = 1 To elementNum                  'find first activity that can do work during the current time step
        If W(i) > 0 Then
            WN(i) = True
            j = i + 1               'sets j to the following activity
            Exit For                'leave loop once the first activity is found
        End If
    Next i
    
   ' band_complete = False            'all activities for band have not been found
    
    Do While j <= elementNum                   'begin to identify remaining activities in the band
        If W(j) > 0 Then                      'if next activity needs work
            in_band = True
             For k = i To j - 1
                If (Partitioned_DSM(j, k, 2) > 0) And (W(k) > 0) Then  'if dependent on an upstream activity needing work
                    in_band = False           'then the complete band has been found (??? could be changed!!!)
                    Exit For
                End If
            Next k                            'keep checking vs. activities in band
            If in_band = True Then
            WN(j) = True                      'if complete band not yet found…
            End If
        End If
        j = j + 1
    Loop                                      'see if next activity can be added to the band

End Sub

Function max(x, y)                         'returns the greater of the two values
    If x > y Then
        max = x
    Else
        max = y
    End If
End Function

Sub Act_Resequencing()                                  'resequences ActC and ActS
    'Dim TempActC() As Single
    Dim TempActS() As Single
    
    'ReDim TempActC(elementNum)
    ReDim TempActS(elementNum)
    For i = 1 To elementNum
        'TempActC(i) = ActC(i)
        TempActS(i) = ActS(i)
    Next i
    For i = 1 To elementNum
        If Act_Seq(i) <> i Then
            'TempActC(i) = ActC(Act_Seq(i))
            TempActS(i) = ActS(Act_Seq(i))
        End If
    Next i
    For i = 1 To elementNum
        'ActC(i) = TempActC(i)
        ActS(i) = TempActS(i)
    Next i
End Sub

' Random Number Generator for a Triangular Distribution
Function Sample_TriPDF(a, b, c)       'returns a random sample from a TriPDF
    Dim y As Single
        
    y = Rnd                                                     'choose a random number in [0,1)
    Sample_TriPDF = a + Sqr(y * (b - a) * (c - a))              'find appropriate point along base of TriPDF
    If Sample_TriPDF > b Then                                   'if point is greater than MLV, then...
        Sample_TriPDF = c - Sqr((1 - y) * (c - a) * (c - b))    'use a different formula
    End If
End Function
