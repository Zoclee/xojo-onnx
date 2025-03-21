#tag Module
Protected Module Tensor
	#tag Method, Flags = &h1
		Protected Sub Test_Abs(results As JSONItem)
		  Var pass As Boolean
		  Var t1 As ONNX.Tensor
		  Var t2 As ONNX.Tensor
		  
		  pass = true
		  
		  // test 1
		  
		  t1 = new ONNX.Tensor(ONNX.ElementTypeEnum.FLOAT, "[[1, -2, 3], [-4, 0, 6]]")
		  t2 = t1.Abs()
		  
		  if FloatNotEquals(t2.Value(0, 0), 1) or _
		    FloatNotEquals(t2.Value(0, 1), 2) or _
		    FloatNotEquals(t2.Value(0, 2), 3) or _
		    FloatNotEquals(t2.Value(1, 0), 4) or _
		    FloatNotEquals(t2.Value(1, 1), 0) or _
		    FloatNotEquals(t2.Value(1, 2), 6) then
		    pass = false
		  end if
		  
		  RecordTestResult(results, "Tensor.Abs", pass)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub Test_Acos(results As JSONItem)
		  Var pass As Boolean
		  Var t1 As ONNX.Tensor
		  Var t2 As ONNX.Tensor
		  
		  pass = true
		  
		  // test 1
		  
		  t1 = new ONNX.Tensor(ONNX.ElementTypeEnum.FLOAT, "[[0.34, 0.72], [-0.92, 0.21]]")
		  t2 = t1.Acos()
		  
		  if FloatNotEquals(t2.Value(0, 0), 1.22387943) or _
		    FloatNotEquals(t2.Value(0, 1), 0.76699401) or _
		    FloatNotEquals(t2.Value(1, 0), 2.73887681) or _
		    FloatNotEquals(t2.Value(1, 1), 1.35922137) then
		    pass = false
		  end if
		  
		  RecordTestResult(results, "Tensor.Acos", pass)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub Test_Acosh(results As JSONItem)
		  Var pass As Boolean
		  Var t1 As ONNX.Tensor
		  Var t2 As ONNX.Tensor
		  
		  pass = true
		  
		  // test 1
		  
		  t1 = new ONNX.Tensor(ONNX.ElementTypeEnum.FLOAT, "[[1.0, 5.2, 3.87]]")
		  t2 = t1.Acosh()
		  
		  if FloatNotEquals(t2.Value(0, 0), 0.0) or _
		    FloatNotEquals(t2.Value(0, 1), 2.332429323319) or _
		    FloatNotEquals(t2.Value(0, 2), 2.029275144348) then
		    pass = false
		  end if
		  
		  RecordTestResult(results, "Tensor.Acosh", pass)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub Test_Add(results As JSONItem)
		  Var pass As Boolean
		  Var t1 As ONNX.Tensor
		  Var t2 As ONNX.Tensor
		  Var t3 As ONNX.Tensor
		  
		  pass = true
		  
		  // test 1
		  
		  t1 = new ONNX.Tensor(ONNX.ElementTypeEnum.FLOAT, "[1, 2, 3]")
		  t2 = new ONNX.Tensor(ONNX.ElementTypeEnum.FLOAT, "[2, 3, 7]")
		  t3 = t1.Add(t2)
		  if FloatNotEquals(t3.Value(0), 3) or _
		    FloatNotEquals(t3.Value(1), 5) or _
		    FloatNotEquals(t3.Value(2), 10) then
		    pass = false
		  end if
		  
		  // test 2
		  
		  if pass then
		    
		    t1 = new ONNX.Tensor(ONNX.ElementTypeEnum.FLOAT, "[[1, 2, 3], [4, 5, 6]]")
		    t2 = new ONNX.Tensor(ONNX.ElementTypeEnum.FLOAT, "[[2, 3, 7], [3, 8, 2]]")
		    t3 = t1.Add(t2)
		    
		    if FloatNotEquals(t3.Value(0, 0), 3) or _
		      FloatNotEquals(t3.Value(0, 1), 5) or _
		      FloatNotEquals(t3.Value(0, 2), 10) or _
		      FloatNotEquals(t3.Value(1, 0), 7) or _
		      FloatNotEquals(t3.Value(1, 1), 13) or _
		      FloatNotEquals(t3.Value(1, 2), 8) then
		      pass = false
		    end if
		    
		  end if
		  
		  RecordTestResult(results, "Tensor.Add", pass)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub Test_Asin(results As JSONItem)
		  Var pass As Boolean
		  Var t1 As ONNX.Tensor
		  Var t2 As ONNX.Tensor
		  
		  pass = true
		  
		  // test 1
		  
		  t1 = new ONNX.Tensor(ONNX.ElementTypeEnum.FLOAT, "[[0.34, 0.72], [-0.92, 0.21]]")
		  t2 = t1.Asin()
		  
		  if FloatNotEquals(t2.Value(0, 0), 0.3469169) or _
		    FloatNotEquals(t2.Value(0, 1), 0.80380232) or _
		    FloatNotEquals(t2.Value(1, 0), -1.16808049) or _
		    FloatNotEquals(t2.Value(1, 1), 0.21157496) then
		    pass = false
		  end if
		  
		  RecordTestResult(results, "Tensor.Asin", pass)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub Test_Asinh(results As JSONItem)
		  Var pass As Boolean
		  Var t1 As ONNX.Tensor
		  Var t2 As ONNX.Tensor
		  
		  pass = true
		  
		  // test 1
		  
		  t1 = new ONNX.Tensor(ONNX.ElementTypeEnum.FLOAT, "[[0.34, 0.72], [-0.92, 0.21]]")
		  t2 = t1.Asinh()
		  
		  if FloatNotEquals(t2.Value(0, 0), 0.333768351646) or _
		    FloatNotEquals(t2.Value(0, 1), 0.668974226754) or _
		    FloatNotEquals(t2.Value(1, 0), -0.823659090432) or _
		    FloatNotEquals(t2.Value(1, 1), 0.208486350074) then
		    pass = false
		  end if
		  
		  RecordTestResult(results, "Tensor.Asinh", pass)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub Test_Atan(results As JSONItem)
		  Var pass As Boolean
		  Var t1 As ONNX.Tensor
		  Var t2 As ONNX.Tensor
		  
		  pass = true
		  
		  // test 1
		  
		  t1 = new ONNX.Tensor(ONNX.ElementTypeEnum.FLOAT, "[[0.34, 0.72], [-0.92, 0.21]]")
		  t2 = t1.Atan()
		  
		  if FloatNotEquals(t2.Value(0, 0), 0.32773851) or _
		    FloatNotEquals(t2.Value(0, 1), 0.62402305) or _
		    FloatNotEquals(t2.Value(1, 0), -0.74375558) or _
		    FloatNotEquals(t2.Value(1, 1), 0.20699219) then
		    pass = false
		  end if
		  
		  RecordTestResult(results, "Tensor.Atan", pass)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub Test_Atanh(results As JSONItem)
		  Var pass As Boolean
		  Var t1 As ONNX.Tensor
		  Var t2 As ONNX.Tensor
		  
		  pass = true
		  
		  // test 1
		  
		  t1 = new ONNX.Tensor(ONNX.ElementTypeEnum.FLOAT, "[[0.34, 0.72], [-0.92, 0.21]]")
		  t2 = t1.Atanh()
		  
		  if FloatNotEquals(t2.Value(0, 0), 0.354092528962) or _
		    FloatNotEquals(t2.Value(0, 1), 0.907644983319) or _
		    FloatNotEquals(t2.Value(1, 0), -1.589026915174) or _
		    FloatNotEquals(t2.Value(1, 1), 0.213171346565) then
		    pass = false
		  end if
		  
		  RecordTestResult(results, "Tensor.Atanh", pass)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub Test_Ceil(results As JSONItem)
		  Var pass As Boolean
		  Var t1 As ONNX.Tensor
		  Var t2 As ONNX.Tensor
		  
		  pass = true
		  
		  // test 1
		  
		  t1 = new ONNX.Tensor(ONNX.ElementTypeEnum.FLOAT, "[[0.34, 0.72], [-0.92, 0.21]]")
		  t2 = t1.Ceil()
		  
		  if FloatNotEquals(t2.Value(0, 0), 1.0) or _
		    FloatNotEquals(t2.Value(0, 1), 1.0) or _
		    FloatNotEquals(t2.Value(1, 0), 0.0) or _
		    FloatNotEquals(t2.Value(1, 1), 1.0) then
		    pass = false
		  end if
		  
		  RecordTestResult(results, "Tensor.Ceil", pass)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub Test_Cos(results As JSONItem)
		  Var pass As Boolean
		  Var t1 As ONNX.Tensor
		  Var t2 As ONNX.Tensor
		  
		  pass = true
		  
		  // test 1
		  
		  t1 = new ONNX.Tensor(ONNX.ElementTypeEnum.FLOAT, "[[3.34, 4.72], [-1.92, 9.21]]")
		  t2 = t1.Cos()
		  
		  if FloatNotEquals(t2.Value(0, 0), -0.98038174613) or _
		    FloatNotEquals(t2.Value(0, 1), 0.00761094613) or _
		    FloatNotEquals(t2.Value(1, 0), -0.34214965115) or _
		    FloatNotEquals(t2.Value(1, 1), -0.97702374162) then
		    pass = false
		  end if
		  
		  RecordTestResult(results, "Tensor.Cos", pass)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub Test_Cosh(results As JSONItem)
		  Var pass As Boolean
		  Var t1 As ONNX.Tensor
		  Var t2 As ONNX.Tensor
		  
		  pass = true
		  
		  // test 1
		  
		  t1 = new ONNX.Tensor(ONNX.ElementTypeEnum.FLOAT, "[[0.5, 1.0, -2.0]]")
		  t2 = t1.Cosh()
		  
		  if FloatNotEquals(t2.Value(0, 0), 1.127626) or _
		    FloatNotEquals(t2.Value(0, 1), 1.5430806) or _
		    FloatNotEquals(t2.Value(0, 2), 3.762196) then
		    pass = false
		  end if
		  
		  RecordTestResult(results, "Tensor.Cosh", pass)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub Test_Exp(results As JSONItem)
		  Var pass As Boolean
		  Var t1 As ONNX.Tensor
		  Var t2 As ONNX.Tensor
		  
		  pass = true
		  
		  // test 1
		  
		  t1 = new ONNX.Tensor(ONNX.ElementTypeEnum.FLOAT, "[[0.34, 0.72], [-0.92, 0.21]]")
		  t2 = t1.Exp()
		  
		  if FloatNotEquals(t2.Value(0, 0), 1.404947590564) or _
		    FloatNotEquals(t2.Value(0, 1), 2.054433210644) or _
		    FloatNotEquals(t2.Value(1, 0), 0.398519041085) or _
		    FloatNotEquals(t2.Value(1, 1), 1.233678059957) then
		    pass = false
		  end if
		  
		  RecordTestResult(results, "Tensor.Exp", pass)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub Test_Floor(results As JSONItem)
		  Var pass As Boolean
		  Var t1 As ONNX.Tensor
		  Var t2 As ONNX.Tensor
		  
		  pass = true
		  
		  // test 1
		  
		  t1 = new ONNX.Tensor(ONNX.ElementTypeEnum.FLOAT, "[[0.34, 0.72], [-0.92, 0.99]]")
		  t2 = t1.Floor()
		  
		  if FloatNotEquals(t2.Value(0, 0), 0.0) or _
		    FloatNotEquals(t2.Value(0, 1), 0.0) or _
		    FloatNotEquals(t2.Value(1, 0), -1.0) or _
		    FloatNotEquals(t2.Value(1, 1), 0.0) then
		    pass = false
		  end if
		  
		  RecordTestResult(results, "Tensor.Floor", pass)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub Test_Greater(results As JSONItem)
		  Var pass As Boolean
		  Var t1 As ONNX.Tensor
		  Var t2 As ONNX.Tensor
		  Var t3 As ONNX.Tensor
		  
		  pass = true
		  
		  // test 1
		  
		  t1 = new ONNX.Tensor(ONNX.ElementTypeEnum.FLOAT, "[[1, 2, 3], [2, 8, 4]]")
		  t2 = new ONNX.Tensor(ONNX.ElementTypeEnum.FLOAT, "[[4, 2, 4], [7, 5, 3]]")
		  t3 = t1.Greater(t2)
		  
		  
		  if (t3.ElementType <> ONNX.ElementTypeEnum.BOOL) or _
		    (t3.Shape(0) <> 2) or _
		    (t3.Shape(1) <> 3) or _
		    (t3.Value(0, 0) <> false) or _
		    (t3.Value(0, 1) <> false) or _
		    (t3.Value(0, 2) <> false) or _
		    (t3.Value(1, 0) <> false) or _
		    (t3.Value(1, 1) <> true) or _
		    (t3.Value(1, 2) <> true) then
		    pass = false
		  end if
		  
		  RecordTestResult(results, "Tensor.Greater", pass)
		  
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub Test_GreaterOrEqual(results As JSONItem)
		  Var pass As Boolean
		  Var t1 As ONNX.Tensor
		  Var t2 As ONNX.Tensor
		  Var t3 As ONNX.Tensor
		  
		  pass = true
		  
		  // test 1
		  
		  t1 = new ONNX.Tensor(ONNX.ElementTypeEnum.FLOAT, "[[1, 2, 3], [2, 8, 4]]")
		  t2 = new ONNX.Tensor(ONNX.ElementTypeEnum.FLOAT, "[[4, 2, 4], [7, 5, 3]]")
		  t3 = t1.GreaterOrEqual(t2)
		  
		  
		  if (t3.ElementType <> ONNX.ElementTypeEnum.BOOL) or _
		    (t3.Shape(0) <> 2) or _
		    (t3.Shape(1) <> 3) or _
		    (t3.Value(0, 0) <> false) or _
		    (t3.Value(0, 1) <> true) or _
		    (t3.Value(0, 2) <> false) or _
		    (t3.Value(1, 0) <> false) or _
		    (t3.Value(1, 1) <> true) or _
		    (t3.Value(1, 2) <> true) then
		    pass = false
		  end if
		  
		  RecordTestResult(results, "Tensor.GreaterOrEqual", pass)
		  
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub Test_Less(results As JSONItem)
		  Var pass As Boolean
		  Var t1 As ONNX.Tensor
		  Var t2 As ONNX.Tensor
		  Var t3 As ONNX.Tensor
		  
		  pass = true
		  
		  // test 1
		  
		  t1 = new ONNX.Tensor(ONNX.ElementTypeEnum.FLOAT, "[[1, 2, 3], [2, 8, 4]]")
		  t2 = new ONNX.Tensor(ONNX.ElementTypeEnum.FLOAT, "[[4, 2, 4], [7, 5, 3]]")
		  t3 = t1.Less(t2)
		  
		  
		  if (t3.ElementType <> ONNX.ElementTypeEnum.BOOL) or _
		    (t3.Shape(0) <> 2) or _
		    (t3.Shape(1) <> 3) or _
		    (t3.Value(0, 0) <> true) or _
		    (t3.Value(0, 1) <> false) or _
		    (t3.Value(0, 2) <> true) or _
		    (t3.Value(1, 0) <> true) or _
		    (t3.Value(1, 1) <> false) or _
		    (t3.Value(1, 2) <> false) then
		    pass = false
		  end if
		  
		  RecordTestResult(results, "Tensor.Less", pass)
		  
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub Test_LessOrEqual(results As JSONItem)
		  Var pass As Boolean
		  Var t1 As ONNX.Tensor
		  Var t2 As ONNX.Tensor
		  Var t3 As ONNX.Tensor
		  
		  pass = true
		  
		  // test 1
		  
		  t1 = new ONNX.Tensor(ONNX.ElementTypeEnum.FLOAT, "[[1, 2, 3], [2, 8, 4]]")
		  t2 = new ONNX.Tensor(ONNX.ElementTypeEnum.FLOAT, "[[4, 2, 4], [7, 5, 3]]")
		  t3 = t1.LessOrEqual(t2)
		  
		  
		  if (t3.ElementType <> ONNX.ElementTypeEnum.BOOL) or _
		    (t3.Shape(0) <> 2) or _
		    (t3.Shape(1) <> 3) or _
		    (t3.Value(0, 0) <> true) or _
		    (t3.Value(0, 1) <> true) or _
		    (t3.Value(0, 2) <> true) or _
		    (t3.Value(1, 0) <> true) or _
		    (t3.Value(1, 1) <> false) or _
		    (t3.Value(1, 2) <> false) then
		    pass = false
		  end if
		  
		  RecordTestResult(results, "Tensor.LessOrEqual", pass)
		  
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub Test_Log(results As JSONItem)
		  Var pass As Boolean
		  Var t1 As ONNX.Tensor
		  Var t2 As ONNX.Tensor
		  
		  pass = true
		  
		  // test 1
		  
		  t1 = new ONNX.Tensor(ONNX.ElementTypeEnum.FLOAT, "[[3.34, 4.72], [1.92, 9.21]]")
		  t2 = t1.Log()
		  
		  if FloatNotEquals(t2.Value(0, 0), 1.20597080699) or _
		    FloatNotEquals(t2.Value(0, 1), 1.5518087996) or _
		    FloatNotEquals(t2.Value(1, 0), 0.65232518604) or _
		    FloatNotEquals(t2.Value(1, 1), 2.22028985027) then
		    pass = false
		  end if
		  
		  RecordTestResult(results, "Tensor.Log", pass)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub Test_LogicalAnd(results As JSONItem)
		  Var pass As Boolean
		  Var t1 As ONNX.Tensor
		  Var t2 As ONNX.Tensor
		  Var t3 As ONNX.Tensor
		  
		  pass = true
		  
		  // test 1
		  
		  t1 = new ONNX.Tensor(ONNX.ElementTypeEnum.BOOL, "[[true, false], [true, false]]")
		  t2 = new ONNX.Tensor(ONNX.ElementTypeEnum.BOOL, "[[true, true], [false, false]]")
		  t3 = t1.LogicalAnd(t2)
		  
		  if (t1.ElementType <> ONNX.ElementTypeEnum.BOOL) or _
		    (t2.ElementType <> ONNX.ElementTypeEnum.BOOL) or _
		    (t3.ElementType <> ONNX.ElementTypeEnum.BOOL) or _
		    (t3.Value(0, 0) <> true) or _
		    (t3.Value(0, 1) <> false) or _
		    (t3.Value(1, 0) <> false) or _
		    (t3.Value(1, 1) <> false) then
		    pass = false
		  end if
		  
		  RecordTestResult(results, "Tensor.LogicalAnd", pass)
		  
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub Test_LogicalNot(results As JSONItem)
		  Var pass As Boolean
		  Var t1 As ONNX.Tensor
		  Var t2 As ONNX.Tensor
		  
		  pass = true
		  
		  // test 1
		  
		  t1 = new ONNX.Tensor(ONNX.ElementTypeEnum.BOOL, "[[true, false], [false, true]]")
		  t2 = t1.LogicalNot()
		  
		  if (t1.ElementType <> ONNX.ElementTypeEnum.BOOL) or _
		    (t2.ElementType <> ONNX.ElementTypeEnum.BOOL) or _
		    (t2.Value(0, 0) <> false) or _
		    (t2.Value(0, 1) <> true) or _
		    (t2.Value(1, 0) <> true) or _
		    (t2.Value(1, 1) <> false) then
		    pass = false
		  end if
		  
		  RecordTestResult(results, "Tensor.LogicalNot", pass)
		  
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub Test_LogicalOr(results As JSONItem)
		  Var pass As Boolean
		  Var t1 As ONNX.Tensor
		  Var t2 As ONNX.Tensor
		  Var t3 As ONNX.Tensor
		  
		  pass = true
		  
		  // test 1
		  
		  t1 = new ONNX.Tensor(ONNX.ElementTypeEnum.BOOL, "[[true, false], [false, true]]")
		  t2 = new ONNX.Tensor(ONNX.ElementTypeEnum.BOOL, "[[false, true], [false, false]]")
		  t3 = t1.LogicalOr(t2)
		  
		  if (t1.ElementType <> ONNX.ElementTypeEnum.BOOL) or _
		    (t2.ElementType <> ONNX.ElementTypeEnum.BOOL) or _
		    (t3.ElementType <> ONNX.ElementTypeEnum.BOOL) or _
		    (t3.Value(0, 0) <> true) or _
		    (t3.Value(0, 1) <> true) or _
		    (t3.Value(1, 0) <> false) or _
		    (t3.Value(1, 1) <> true) then
		    pass = false
		  end if
		  
		  RecordTestResult(results, "Tensor.LogicalOr", pass)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub Test_MatMul(results As JSONItem)
		  Var pass As Boolean
		  Var t1 As ONNX.Tensor
		  Var t2 As ONNX.Tensor
		  Var t3 As ONNX.Tensor
		  
		  pass = true
		  
		  // test 1
		  
		  t1 = new ONNX.Tensor(ONNX.ElementTypeEnum.FLOAT, "[[2, 3], [4, 1], [5, 2]]")
		  t2 = new ONNX.Tensor(ONNX.ElementTypeEnum.FLOAT, "[[5, 2, 1], [1, 7, 3]]")
		  t3 = t1.MatMul(t2)
		  
		  if (t3.Shape(0) <> 3) or _
		    (t3.Shape(1) <> 3) or _
		    FloatNotEquals(t3.Value(0, 0), 13) or _
		    FloatNotEquals(t3.Value(0, 1), 25) or _
		    FloatNotEquals(t3.Value(0, 2), 11) or _
		    FloatNotEquals(t3.Value(1, 0), 21) or _
		    FloatNotEquals(t3.Value(1, 1), 15) or _
		    FloatNotEquals(t3.Value(1, 2), 7) or _
		    FloatNotEquals(t3.Value(2, 0), 27) or _
		    FloatNotEquals(t3.Value(2, 1), 24) or _
		    FloatNotEquals(t3.Value(2, 2), 11) then
		    pass = false
		  end if
		  
		  RecordTestResult(results, "Tensor.MatMul", pass)
		  
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub Test_Max(results As JSONItem)
		  Var pass As Boolean
		  Var t1 As ONNX.Tensor
		  Var t2 As ONNX.Tensor
		  Var t3 As ONNX.Tensor
		  
		  pass = true
		  
		  // test 1
		  
		  t1 = new ONNX.Tensor(ONNX.ElementTypeEnum.FLOAT, "[[1, 2, 3], [2, 8, 4]]")
		  t2 = new ONNX.Tensor(ONNX.ElementTypeEnum.FLOAT, "[[4, 2, 4], [7, 5, 3]]")
		  t3 = t1.Max(t2)
		  
		  if FloatNotEquals(t3.Value(0, 0), 4) or _
		    FloatNotEquals(t3.Value(0, 1), 2) or _
		    FloatNotEquals(t3.Value(0, 2), 4) or _
		    FloatNotEquals(t3.Value(1, 0), 7) or _
		    FloatNotEquals(t3.Value(1, 1), 8) or _
		    FloatNotEquals(t3.Value(1, 2), 4) then
		    pass = false
		  end if
		  
		  RecordTestResult(results, "Tensor.Max", pass)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub Test_Min(results As JSONItem)
		  Var pass As Boolean
		  Var t1 As ONNX.Tensor
		  Var t2 As ONNX.Tensor
		  Var t3 As ONNX.Tensor
		  
		  pass = true
		  
		  // test 1
		  
		  t1 = new ONNX.Tensor(ONNX.ElementTypeEnum.FLOAT, "[[1, 2, 3], [2, 8, 4]]")
		  t2 = new ONNX.Tensor(ONNX.ElementTypeEnum.FLOAT, "[[4, 2, 4], [7, 5, 3]]")
		  t3 = t1.Min(t2)
		  
		  if FloatNotEquals(t3.Value(0, 0), 1) or _
		    FloatNotEquals(t3.Value(0, 1), 2) or _
		    FloatNotEquals(t3.Value(0, 2), 3) or _
		    FloatNotEquals(t3.Value(1, 0), 2) or _
		    FloatNotEquals(t3.Value(1, 1), 5) or _
		    FloatNotEquals(t3.Value(1, 2), 3) then
		    pass = false
		  end if
		  
		  RecordTestResult(results, "Tensor.Min", pass)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub Test_Mul(results As JSONItem)
		  Var pass As Boolean
		  Var t1 As ONNX.Tensor
		  Var t2 As ONNX.Tensor
		  Var t3 As ONNX.Tensor
		  
		  pass = true
		  
		  // test 1
		  
		  t1 = new ONNX.Tensor(ONNX.ElementTypeEnum.FLOAT, "[[1, 2, 3], [4, 5, 6]]")
		  t2 = new ONNX.Tensor(ONNX.ElementTypeEnum.FLOAT, "[[2, 3, 7], [3, 8, 2]]")
		  t3 = t1.Mul(t2)
		  
		  if FloatNotEquals(t3.Value(0, 0), 2) or _
		    FloatNotEquals(t3.Value(0, 1), 6) or _
		    FloatNotEquals(t3.Value(0, 2), 21) or _
		    FloatNotEquals(t3.Value(1, 0), 12) or _
		    FloatNotEquals(t3.Value(1, 1), 40) or _
		    FloatNotEquals(t3.Value(1, 2), 12) then
		    pass = false
		  end if
		  
		  RecordTestResult(results, "Tensor.Mul", pass)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub Test_Neg(results As JSONItem)
		  Var pass As Boolean
		  Var t1 As ONNX.Tensor
		  Var t2 As ONNX.Tensor
		  
		  pass = true
		  
		  // test 1
		  
		  t1 = new ONNX.Tensor(ONNX.ElementTypeEnum.FLOAT, "[[3.34, 4.72], [-1.92, 9.21]]")
		  t2 = t1.Neg()
		  
		  if FloatNotEquals(t2.Value(0, 0), -3.34) or _
		    FloatNotEquals(t2.Value(0, 1), -4.72) or _
		    FloatNotEquals(t2.Value(1, 0), 1.92) or _
		    FloatNotEquals(t2.Value(1, 1), -9.21) then
		    pass = false
		  end if
		  
		  RecordTestResult(results, "Tensor.Neg", pass)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub Test_Pow(results As JSONItem)
		  Var pass As Boolean
		  Var t1 As ONNX.Tensor
		  Var t2 As ONNX.Tensor
		  Var t3 As ONNX.Tensor
		  
		  pass = true
		  
		  // test 1
		  
		  t1 = new ONNX.Tensor(ONNX.ElementTypeEnum.FLOAT, "[[1, 2, 3], [2, 8, 4]]")
		  t2 = new ONNX.Tensor(ONNX.ElementTypeEnum.FLOAT, "[[4, 2, 4], [7, 5, 3]]")
		  t3 = t1.Pow(t2)
		  
		  if FloatNotEquals(t3.Value(0, 0), 1) or _
		    FloatNotEquals(t3.Value(0, 1), 4) or _
		    FloatNotEquals(t3.Value(0, 2), 81) or _
		    FloatNotEquals(t3.Value(1, 0), 128) or _
		    FloatNotEquals(t3.Value(1, 1), 32768) or _
		    FloatNotEquals(t3.Value(1, 2), 64) then
		    pass = false
		  end if
		  
		  RecordTestResult(results, "Tensor.Pow", pass)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub Test_QLinearConv(results As JSONItem)
		  Var pass As Boolean
		  Var t1, t2, t3, t4, t5, t6, t7, t8, t9 As ONNX.Tensor
		  
		  pass = true
		  
		  // test 1
		  
		  t1 = new ONNX.Tensor(ONNX.ElementTypeEnum.UINT8, "[[10, 20], [30, 40]]")
		  t2 = new ONNX.Tensor(ONNX.ElementTypeEnum.UINT8, "[[1, 2], [3, 4]]")
		  t3 = new ONNX.Tensor(ONNX.ElementTypeEnum.FLOAT, "0.1")
		  t4 = new ONNX.Tensor(ONNX.ElementTypeEnum.UINT8, "128")
		  t5 = new ONNX.Tensor(ONNX.ElementTypeEnum.FLOAT, "0.2")
		  t6 = new ONNX.Tensor(ONNX.ElementTypeEnum.UINT8, "130")
		  t7 = new ONNX.Tensor(ONNX.ElementTypeEnum.FLOAT, "0.3")
		  t8 = new ONNX.Tensor(ONNX.ElementTypeEnum.UINT8, "140")
		  t9 = t1.QLinearConv(t3, t4, t2, t5, t6, t7, t8)
		  
		  if t9.ElementType <> ONNX.ElementTypeEnum.UINT8 or _
		    t9.Value(0, 0) <> 140 or _
		    t4.Value(0, 1) <> 141 or _
		    t4.Value(1, 0) <> 143 or _
		    t4.Value(1, 1) <> 146 then
		    pass = false
		  end if
		  
		  RecordTestResult(results, "Tensor.QLinearConv", pass)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub Test_QuantizeLinear(results As JSONItem)
		  Var pass As Boolean
		  Var t1 As ONNX.Tensor
		  Var t2 As ONNX.Tensor
		  Var t3 As ONNX.Tensor
		  Var t4 As ONNX.Tensor
		  
		  pass = true
		  
		  // test 1
		  
		  t1 = new ONNX.Tensor(ONNX.ElementTypeEnum.FLOAT, "[[2.5, 3.5], [4.5, 5.5]]")
		  t2 = new ONNX.Tensor(ONNX.ElementTypeEnum.FLOAT, "1.0")
		  t3 = new ONNX.Tensor(ONNX.ElementTypeEnum.UINT8, "0")
		  t4 = t1.QuantizeLinear(t2, t3)
		  
		  if t4.ElementType <> ONNX.ElementTypeEnum.UINT8 or _
		    t4.Value(0, 0) <> 2 or _
		    t4.Value(0, 1) <> 4 or _
		    t4.Value(1, 0) <> 4 or _
		    t4.Value(1, 1) <> 6 then
		    pass = false
		  end if
		  
		  RecordTestResult(results, "Tensor.QuantizeLinear", pass)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub Test_Reciprocal(results As JSONItem)
		  Var pass As Boolean
		  Var t1 As ONNX.Tensor
		  Var t2 As ONNX.Tensor
		  
		  pass = true
		  
		  // test 1
		  
		  t1 = new ONNX.Tensor(ONNX.ElementTypeEnum.FLOAT, "[[3.34, 4.72], [-1.92, 9.21]]")
		  t2 = t1.Reciprocal()
		  
		  if FloatNotEquals(t2.Value(0, 0), 0.29940120) or _
		    FloatNotEquals(t2.Value(0, 1), 0.21186441) or _
		    FloatNotEquals(t2.Value(1, 0), -0.52083333) or _
		    FloatNotEquals(t2.Value(1, 1), 0.10857763) then
		    pass = false
		  end if
		  
		  RecordTestResult(results, "Tensor.Reciprocal", pass)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub Test_Relu(results As JSONItem)
		  Var pass As Boolean
		  Var t1 As ONNX.Tensor
		  Var t2 As ONNX.Tensor
		  
		  pass = true
		  
		  // test 1
		  
		  t1 = new ONNX.Tensor(ONNX.ElementTypeEnum.FLOAT, "[[1, -2, 3], [-4, 0, 6]]")
		  t2 = t1.Relu()
		  
		  if FloatNotEquals(t2.Value(0, 0), 1) or _ 
		    FloatNotEquals(t2.Value(0, 1), 0) or _
		    FloatNotEquals(t2.Value(0, 2), 3) or _
		    FloatNotEquals(t2.Value(1, 0), 0) or _
		    FloatNotEquals(t2.Value(1, 1), 0) or _
		    FloatNotEquals(t2.Value(1, 2), 6) then
		    pass = false
		  end if
		  
		  RecordTestResult(results, "Tensor.Relu", pass)
		  
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub Test_Sigmoid(results As JSONItem)
		  Var pass As Boolean
		  Var t1 As ONNX.Tensor
		  Var t2 As ONNX.Tensor
		  
		  pass = true
		  
		  // test 1
		  
		  t1 = new ONNX.Tensor(ONNX.ElementTypeEnum.FLOAT, "[[0.5, 1.0, -2.0]]")
		  t2 = t1.Sigmoid()
		  
		  if FloatNotEquals(t2.Value(0, 0), 0.62245933120185) or _ 
		    FloatNotEquals(t2.Value(0, 1), 0.73105857863) or _
		    FloatNotEquals(t2.Value(0, 2), 0.11920292202212) then
		    pass = false
		  end if
		  
		  RecordTestResult(results, "Tensor.Sigmoid", pass)
		  
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub Test_Sign(results As JSONItem)
		  Var pass As Boolean
		  Var t1 As ONNX.Tensor
		  Var t2 As ONNX.Tensor
		  
		  pass = true
		  
		  // test 1
		  
		  t1 = new ONNX.Tensor(ONNX.ElementTypeEnum.FLOAT, "[[3.34, 4.72], [-1.92, 0]]")
		  t2 = t1.Sign()
		  
		  if FloatNotEquals(t2.Value(0, 0), 1.0) or _
		    FloatNotEquals(t2.Value(0, 1), 1.0) or _
		    FloatNotEquals(t2.Value(1, 0), -1.0) or _
		    FloatNotEquals(t2.Value(1, 1), 0.0) then
		    pass = false
		  end if
		  
		  RecordTestResult(results, "Tensor.Sign", pass)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub Test_Sin(results As JSONItem)
		  Var pass As Boolean
		  Var t1 As ONNX.Tensor
		  Var t2 As ONNX.Tensor
		  
		  pass = true
		  
		  // test 1
		  
		  t1 = new ONNX.Tensor(ONNX.ElementTypeEnum.FLOAT, "[[3.34, 4.72], [-1.92, 9.21]]")
		  t2 = t1.Sin()
		  
		  if FloatNotEquals(t2.Value(0, 0), -0.19710817293) or _
		    FloatNotEquals(t2.Value(0, 1), -0.99997103633) or _
		    FloatNotEquals(t2.Value(1, 0), -0.93964547368) or _
		    FloatNotEquals(t2.Value(1, 1), 0.21313049595) then
		    pass = false
		  end if
		  
		  RecordTestResult(results, "Tensor.Sin", pass)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub Test_Sinh(results As JSONItem)
		  Var pass As Boolean
		  Var t1 As ONNX.Tensor
		  Var t2 As ONNX.Tensor
		  
		  pass = true
		  
		  // test 1
		  
		  t1 = new ONNX.Tensor(ONNX.ElementTypeEnum.FLOAT, "[[0.5, 1.0, -2.0]]")
		  t2 = t1.Sinh()
		  
		  if FloatNotEquals(t2.Value(0, 0), 0.5210953) or _
		    FloatNotEquals(t2.Value(0, 1), 1.1752012) or _
		    FloatNotEquals(t2.Value(0, 2), -3.6268604) then
		    pass = false
		  end if
		  
		  RecordTestResult(results, "Tensor.Sinh", pass)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub Test_Softmax(results As JSONItem)
		  Var pass As Boolean
		  Var t1 As ONNX.Tensor
		  Var t2 As ONNX.Tensor
		  
		  pass = true
		  
		  // test 1
		  
		  t1 = new ONNX.Tensor(ONNX.ElementTypeEnum.FLOAT, "[[2.0, 1.0, 0.1]]")
		  t2 = t1.Softmax(-1)
		  
		  if FloatNotEquals(t2.Value(0, 0), 0.659001138) or _ 
		    FloatNotEquals(t2.Value(0, 1), 0.242432970) or _
		    FloatNotEquals(t2.Value(0, 2), 0.098565892) then
		    pass = false
		  end if
		  
		  // test 2
		  
		  if pass then
		    
		    t1 = new ONNX.Tensor(ONNX.ElementTypeEnum.FLOAT, "[[1,2],[4,3]]")
		    t2 = t1.Softmax(0)
		    
		    if FloatNotEquals(t2.Value(0, 0), 0.04742587357759476) or _ 
		      FloatNotEquals(t2.Value(0, 1), 0.2689414322376251) or _
		      FloatNotEquals(t2.Value(1, 0), 0.9525741338729858) or _
		      FloatNotEquals(t2.Value(1, 1), 0.7310585975646973) then
		      pass = false
		    end if
		    
		  end if
		  
		  // test 3
		  
		  if pass then
		    
		    t1 = new ONNX.Tensor(ONNX.ElementTypeEnum.FLOAT, "[[1,2],[4,3]]")
		    t2 = t1.Softmax(1)
		    
		    if FloatNotEquals(t2.Value(0, 0), 0.2689414322376251) or _ 
		      FloatNotEquals(t2.Value(0, 1), 0.7310585975646973) or _
		      FloatNotEquals(t2.Value(1, 0), 0.7310585975646973) or _
		      FloatNotEquals(t2.Value(1, 1), 0.2689414322376251) then
		      pass = false
		    end if
		    
		  end if
		  
		  RecordTestResult(results, "Tensor.Softmax", pass)
		  
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub Test_Sqrt(results As JSONItem)
		  Var pass As Boolean
		  Var t1 As ONNX.Tensor
		  Var t2 As ONNX.Tensor
		  
		  pass = true
		  
		  // test 1
		  
		  t1 = new ONNX.Tensor(ONNX.ElementTypeEnum.FLOAT, "[[3.34, 25.00], [36.00, 9.21]]")
		  t2 = t1.Sqrt()
		  
		  if FloatNotEquals(t2.Value(0, 0), 1.8275666882) or _
		    FloatNotEquals(t2.Value(0, 1), 5.0) or _
		    FloatNotEquals(t2.Value(1, 0), 6.0) or _
		    FloatNotEquals(t2.Value(1, 1), 3.0347981810) then
		    pass = false
		  end if
		  
		  RecordTestResult(results, "Tensor.Sqrt", pass)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub Test_Subtract(results As JSONItem)
		  Var pass As Boolean
		  Var t1 As ONNX.Tensor
		  Var t2 As ONNX.Tensor
		  Var t3 As ONNX.Tensor
		  
		  pass = true
		  
		  // test 1
		  
		  t1 = new ONNX.Tensor(ONNX.ElementTypeEnum.FLOAT, "[[1, 2, 3], [4, 5, 6]]")
		  t2 = new ONNX.Tensor(ONNX.ElementTypeEnum.FLOAT, "[[2, 3, 7], [3, 8, 2]]")
		  t3 = t1.Subtract(t2)
		  
		  if FloatNotEquals(t3.Value(0, 0), -1) or _
		    FloatNotEquals(t3.Value(0, 1), -1) or _
		    FloatNotEquals(t3.Value(0, 2), -4) or _
		    FloatNotEquals(t3.Value(1, 0), 1) or _
		    FloatNotEquals(t3.Value(1, 1), -3) or _
		    FloatNotEquals(t3.Value(1, 2), 4) then
		    pass = false
		  end if
		  
		  RecordTestResult(results, "Tensor.Subtract", pass)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub Test_Tan(results As JSONItem)
		  Var pass As Boolean
		  Var t1 As ONNX.Tensor
		  Var t2 As ONNX.Tensor
		  
		  pass = true
		  
		  // test 1
		  
		  t1 = new ONNX.Tensor(ONNX.ElementTypeEnum.FLOAT, "[[3.34, 4.72], [-1.92, 9.21]]")
		  t2 = t1.Tan()
		  
		  if FloatNotEquals(t2.Value(0, 0), 0.20105247135) or _
		    FloatNotEquals(t2.Value(0, 1), -131.389526367) or _
		    FloatNotEquals(t2.Value(1, 0), 2.74629966894) or _
		    FloatNotEquals(t2.Value(1, 1), -0.21814259662) then
		    pass = false
		  end if
		  
		  RecordTestResult(results, "Tensor.Tan", pass)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub Test_Tanh(results As JSONItem)
		  Var pass As Boolean
		  Var t1 As ONNX.Tensor
		  Var t2 As ONNX.Tensor
		  
		  pass = true
		  
		  // test 1
		  
		  t1 = new ONNX.Tensor(ONNX.ElementTypeEnum.FLOAT, "[[0.5, 1.0, -2.0]]")
		  t2 = t1.Tanh()
		  
		  if FloatNotEquals(t2.Value(0, 0), 0.46211716) or _ 
		    FloatNotEquals(t2.Value(0, 1), 0.76159416) or _
		    FloatNotEquals(t2.Value(0, 2), -0.96402758) then
		    pass = false
		  end if
		  
		  RecordTestResult(results, "Tensor.Tanh", pass)
		  
		  
		End Sub
	#tag EndMethod


	#tag ViewBehavior
		#tag ViewProperty
			Name="Name"
			Visible=true
			Group="ID"
			InitialValue=""
			Type="String"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Index"
			Visible=true
			Group="ID"
			InitialValue="-2147483648"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Super"
			Visible=true
			Group="ID"
			InitialValue=""
			Type="String"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Left"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Top"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
	#tag EndViewBehavior
End Module
#tag EndModule
