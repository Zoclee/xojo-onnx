#tag Module
Protected Module ONNXTest
	#tag Method, Flags = &h21
		Private Function FloatEquals(value As Single, comp As Single) As Boolean
		  return (Abs(value - comp) > 0.000001)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub RecordTestResult(results As JSONItem, testName As String, pass As Boolean)
		  results.Child("log").Add new JSONItem("{""test"":""" + testName + """,""success"":" + Str(pass).Lowercase() + "}")
		  results.Value("tests") = results.Value("tests") + 1
		  if pass then
		    results.Value("pass") = results.Value("pass") + 1
		  else
		    results.Value("fail") = results.Value("fail") + 1
		    results.Value("success") = false
		  end if
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function RunTests() As JSONItem
		  Var results As new JSONItem("{}")
		  
		  results.Value("tests") = 0
		  results.Value("pass") = 0
		  results.Value("fail") = 0
		  results.Value("success") = true
		  results.Value("log") = new JSONItem("[]")
		  
		  Test_Tensor_Abs(results)
		  Test_Tensor_Acos(results)
		  Test_Tensor_Acosh(results)
		  Test_Tensor_Add(results)
		  Test_Tensor_Asin(results)
		  Test_Tensor_Asinh(results)
		  Test_Tensor_Atan(results)
		  Test_Tensor_Atanh(results)
		  Test_Tensor_Ceil(results)
		  Test_Tensor_Cos(results)
		  Test_Tensor_Cosh(results)
		  Test_Tensor_Exp(results)
		  Test_Tensor_Floor(results)
		  Test_Tensor_Greater(results)
		  Test_Tensor_GreaterOrEqual(results)
		  Test_Tensor_Less(results)
		  Test_Tensor_LessOrEqual(results)
		  Test_Tensor_Log(results)
		  Test_Tensor_LogicalAnd(results)
		  Test_Tensor_LogicalNot(results)
		  Test_Tensor_LogicalOr(results)
		  Test_Tensor_MatMul(results)
		  Test_Tensor_Max(results)
		  Test_Tensor_Min(results)
		  Test_Tensor_Mul(results)
		  Test_Tensor_Neg(results)
		  Test_Tensor_Pow(results)
		  Test_Tensor_Reciprocal(results)
		  Test_Tensor_Relu(results)
		  Test_Tensor_Sigmoid(results)
		  Test_Tensor_Sign(results)
		  Test_Tensor_Sin(results)
		  Test_Tensor_Sinh(results)
		  Test_Tensor_Softmax(results)
		  Test_Tensor_Tanh(results)
		  
		  return results
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub Test_Tensor_Abs(results As JSONItem)
		  Var pass As Boolean
		  Var t1 As ONNX.Tensor
		  Var t2 As ONNX.Tensor
		  
		  pass = true
		  
		  // test 1
		  
		  t1 = new ONNX.Tensor(ONNX.ElementTypeEnum.FLOAT, "[[1, -2, 3], [-4, 0, 6]]")
		  t2 = t1.Abs()
		  
		  if FloatEquals(t2.Value(0, 0), 1) or _
		    FloatEquals(t2.Value(0, 1), 2) or _
		    FloatEquals(t2.Value(0, 2), 3) or _
		    FloatEquals(t2.Value(1, 0), 4) or _
		    FloatEquals(t2.Value(1, 1), 0) or _
		    FloatEquals(t2.Value(1, 2), 6) then
		    pass = false
		  end if
		  
		  RecordTestResult(results, "Tensor.Abs", pass)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub Test_Tensor_Acos(results As JSONItem)
		  Var pass As Boolean
		  Var t1 As ONNX.Tensor
		  Var t2 As ONNX.Tensor
		  
		  pass = true
		  
		  // test 1
		  
		  t1 = new ONNX.Tensor(ONNX.ElementTypeEnum.FLOAT, "[[0.34, 0.72], [-0.92, 0.21]]")
		  t2 = t1.Acos()
		  
		  if FloatEquals(t2.Value(0, 0), 1.22387943) or _
		    FloatEquals(t2.Value(0, 1), 0.76699401) or _
		    FloatEquals(t2.Value(1, 0), 2.73887681) or _
		    FloatEquals(t2.Value(1, 1), 1.35922137) then
		    pass = false
		  end if
		  
		  RecordTestResult(results, "Tensor.Acos", pass)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub Test_Tensor_Acosh(results As JSONItem)
		  Var pass As Boolean
		  Var t1 As ONNX.Tensor
		  Var t2 As ONNX.Tensor
		  
		  pass = true
		  
		  // test 1
		  
		  t1 = new ONNX.Tensor(ONNX.ElementTypeEnum.FLOAT, "[[1.0, 5.2, 3.87]]")
		  t2 = t1.Acosh()
		  
		  if FloatEquals(t2.Value(0, 0), 0.0) or _
		    FloatEquals(t2.Value(0, 1), 2.332429323319) or _
		    FloatEquals(t2.Value(0, 2), 2.029275144348) then
		    pass = false
		  end if
		  
		  RecordTestResult(results, "Tensor.Acosh", pass)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub Test_Tensor_Add(results As JSONItem)
		  Var pass As Boolean
		  Var t1 As ONNX.Tensor
		  Var t2 As ONNX.Tensor
		  Var t3 As ONNX.Tensor
		  
		  pass = true
		  
		  // test 1
		  
		  t1 = new ONNX.Tensor(ONNX.ElementTypeEnum.FLOAT, "[[1, 2, 3], [4, 5, 6]]")
		  t2 = new ONNX.Tensor(ONNX.ElementTypeEnum.FLOAT, "[[2, 3, 7], [3, 8, 2]]")
		  t3 = t1.Add(t2)
		  
		  if FloatEquals(t3.Value(0, 0), 3) or _
		    FloatEquals(t3.Value(0, 1), 5) or _
		    FloatEquals(t3.Value(0, 2), 10) or _
		    FloatEquals(t3.Value(1, 0), 7) or _
		    FloatEquals(t3.Value(1, 1), 13) or _
		    FloatEquals(t3.Value(1, 2), 8) then
		    pass = false
		  end if
		  
		  RecordTestResult(results, "Tensor.Add", pass)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub Test_Tensor_Asin(results As JSONItem)
		  Var pass As Boolean
		  Var t1 As ONNX.Tensor
		  Var t2 As ONNX.Tensor
		  
		  pass = true
		  
		  // test 1
		  
		  t1 = new ONNX.Tensor(ONNX.ElementTypeEnum.FLOAT, "[[0.34, 0.72], [-0.92, 0.21]]")
		  t2 = t1.Asin()
		  
		  if FloatEquals(t2.Value(0, 0), 0.3469169) or _
		    FloatEquals(t2.Value(0, 1), 0.80380232) or _
		    FloatEquals(t2.Value(1, 0), -1.16808049) or _
		    FloatEquals(t2.Value(1, 1), 0.21157496) then
		    pass = false
		  end if
		  
		  RecordTestResult(results, "Tensor.Asin", pass)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub Test_Tensor_Asinh(results As JSONItem)
		  Var pass As Boolean
		  Var t1 As ONNX.Tensor
		  Var t2 As ONNX.Tensor
		  
		  pass = true
		  
		  // test 1
		  
		  t1 = new ONNX.Tensor(ONNX.ElementTypeEnum.FLOAT, "[[0.34, 0.72], [-0.92, 0.21]]")
		  t2 = t1.Asinh()
		  
		  if FloatEquals(t2.Value(0, 0), 0.333768351646) or _
		    FloatEquals(t2.Value(0, 1), 0.668974226754) or _
		    FloatEquals(t2.Value(1, 0), -0.823659090432) or _
		    FloatEquals(t2.Value(1, 1), 0.208486350074) then
		    pass = false
		  end if
		  
		  RecordTestResult(results, "Tensor.Asinh", pass)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub Test_Tensor_Atan(results As JSONItem)
		  Var pass As Boolean
		  Var t1 As ONNX.Tensor
		  Var t2 As ONNX.Tensor
		  
		  pass = true
		  
		  // test 1
		  
		  t1 = new ONNX.Tensor(ONNX.ElementTypeEnum.FLOAT, "[[0.34, 0.72], [-0.92, 0.21]]")
		  t2 = t1.Atan()
		  
		  if FloatEquals(t2.Value(0, 0), 0.32773851) or _
		    FloatEquals(t2.Value(0, 1), 0.62402305) or _
		    FloatEquals(t2.Value(1, 0), -0.74375558) or _
		    FloatEquals(t2.Value(1, 1), 0.20699219) then
		    pass = false
		  end if
		  
		  RecordTestResult(results, "Tensor.Atan", pass)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub Test_Tensor_Atanh(results As JSONItem)
		  Var pass As Boolean
		  Var t1 As ONNX.Tensor
		  Var t2 As ONNX.Tensor
		  
		  pass = true
		  
		  // test 1
		  
		  t1 = new ONNX.Tensor(ONNX.ElementTypeEnum.FLOAT, "[[0.34, 0.72], [-0.92, 0.21]]")
		  t2 = t1.Atanh()
		  
		  if FloatEquals(t2.Value(0, 0), 0.354092528962) or _
		    FloatEquals(t2.Value(0, 1), 0.907644983319) or _
		    FloatEquals(t2.Value(1, 0), -1.589026915174) or _
		    FloatEquals(t2.Value(1, 1), 0.213171346565) then
		    pass = false
		  end if
		  
		  RecordTestResult(results, "Tensor.Atanh", pass)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub Test_Tensor_Ceil(results As JSONItem)
		  Var pass As Boolean
		  Var t1 As ONNX.Tensor
		  Var t2 As ONNX.Tensor
		  
		  pass = true
		  
		  // test 1
		  
		  t1 = new ONNX.Tensor(ONNX.ElementTypeEnum.FLOAT, "[[0.34, 0.72], [-0.92, 0.21]]")
		  t2 = t1.Ceil()
		  
		  if FloatEquals(t2.Value(0, 0), 1.0) or _
		    FloatEquals(t2.Value(0, 1), 1.0) or _
		    FloatEquals(t2.Value(1, 0), 0.0) or _
		    FloatEquals(t2.Value(1, 1), 1.0) then
		    pass = false
		  end if
		  
		  RecordTestResult(results, "Tensor.Ceil", pass)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub Test_Tensor_Cos(results As JSONItem)
		  Var pass As Boolean
		  Var t1 As ONNX.Tensor
		  Var t2 As ONNX.Tensor
		  
		  pass = true
		  
		  // test 1
		  
		  t1 = new ONNX.Tensor(ONNX.ElementTypeEnum.FLOAT, "[[3.34, 4.72], [-1.92, 9.21]]")
		  t2 = t1.Cos()
		  
		  if FloatEquals(t2.Value(0, 0), -0.98038174613) or _
		    FloatEquals(t2.Value(0, 1), 0.00761094613) or _
		    FloatEquals(t2.Value(1, 0), -0.34214965115) or _
		    FloatEquals(t2.Value(1, 1), -0.97702374162) then
		    pass = false
		  end if
		  
		  RecordTestResult(results, "Tensor.Cos", pass)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub Test_Tensor_Cosh(results As JSONItem)
		  Var pass As Boolean
		  Var t1 As ONNX.Tensor
		  Var t2 As ONNX.Tensor
		  
		  pass = true
		  
		  // test 1
		  
		  t1 = new ONNX.Tensor(ONNX.ElementTypeEnum.FLOAT, "[[0.5, 1.0, -2.0]]")
		  t2 = t1.Cosh()
		  
		  if FloatEquals(t2.Value(0, 0), 1.127626) or _
		    FloatEquals(t2.Value(0, 1), 1.5430806) or _
		    FloatEquals(t2.Value(0, 2), 3.762196) then
		    pass = false
		  end if
		  
		  RecordTestResult(results, "Tensor.Cosh", pass)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub Test_Tensor_Exp(results As JSONItem)
		  Var pass As Boolean
		  Var t1 As ONNX.Tensor
		  Var t2 As ONNX.Tensor
		  
		  pass = true
		  
		  // test 1
		  
		  t1 = new ONNX.Tensor(ONNX.ElementTypeEnum.FLOAT, "[[0.34, 0.72], [-0.92, 0.21]]")
		  t2 = t1.Exp()
		  
		  if FloatEquals(t2.Value(0, 0), 1.404947590564) or _
		    FloatEquals(t2.Value(0, 1), 2.054433210644) or _
		    FloatEquals(t2.Value(1, 0), 0.398519041085) or _
		    FloatEquals(t2.Value(1, 1), 1.233678059957) then
		    pass = false
		  end if
		  
		  RecordTestResult(results, "Tensor.Exp", pass)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub Test_Tensor_Floor(results As JSONItem)
		  Var pass As Boolean
		  Var t1 As ONNX.Tensor
		  Var t2 As ONNX.Tensor
		  
		  pass = true
		  
		  // test 1
		  
		  t1 = new ONNX.Tensor(ONNX.ElementTypeEnum.FLOAT, "[[0.34, 0.72], [-0.92, 0.99]]")
		  t2 = t1.Floor()
		  
		  if FloatEquals(t2.Value(0, 0), 0.0) or _
		    FloatEquals(t2.Value(0, 1), 0.0) or _
		    FloatEquals(t2.Value(1, 0), -1.0) or _
		    FloatEquals(t2.Value(1, 1), 0.0) then
		    pass = false
		  end if
		  
		  RecordTestResult(results, "Tensor.Floor", pass)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub Test_Tensor_Greater(results As JSONItem)
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

	#tag Method, Flags = &h21
		Private Sub Test_Tensor_GreaterOrEqual(results As JSONItem)
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

	#tag Method, Flags = &h21
		Private Sub Test_Tensor_Less(results As JSONItem)
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

	#tag Method, Flags = &h21
		Private Sub Test_Tensor_LessOrEqual(results As JSONItem)
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

	#tag Method, Flags = &h21
		Private Sub Test_Tensor_Log(results As JSONItem)
		  Var pass As Boolean
		  Var t1 As ONNX.Tensor
		  Var t2 As ONNX.Tensor
		  
		  pass = true
		  
		  // test 1
		  
		  t1 = new ONNX.Tensor(ONNX.ElementTypeEnum.FLOAT, "[[3.34, 4.72], [1.92, 9.21]]")
		  t2 = t1.Log()
		  
		  if FloatEquals(t2.Value(0, 0), 1.20597080699) or _
		    FloatEquals(t2.Value(0, 1), 1.5518087996) or _
		    FloatEquals(t2.Value(1, 0), 0.65232518604) or _
		    FloatEquals(t2.Value(1, 1), 2.22028985027) then
		    pass = false
		  end if
		  
		  RecordTestResult(results, "Tensor.Log", pass)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub Test_Tensor_LogicalAnd(results As JSONItem)
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

	#tag Method, Flags = &h21
		Private Sub Test_Tensor_LogicalNot(results As JSONItem)
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

	#tag Method, Flags = &h21
		Private Sub Test_Tensor_LogicalOr(results As JSONItem)
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

	#tag Method, Flags = &h21
		Private Sub Test_Tensor_MatMul(results As JSONItem)
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
		    FloatEquals(t3.Value(0, 0), 13) or _
		    FloatEquals(t3.Value(0, 1), 25) or _
		    FloatEquals(t3.Value(0, 2), 11) or _
		    FloatEquals(t3.Value(1, 0), 21) or _
		    FloatEquals(t3.Value(1, 1), 15) or _
		    FloatEquals(t3.Value(1, 2), 7) or _
		    FloatEquals(t3.Value(2, 0), 27) or _
		    FloatEquals(t3.Value(2, 1), 24) or _
		    FloatEquals(t3.Value(2, 2), 11) then
		    pass = false
		  end if
		  
		  RecordTestResult(results, "Tensor.MatMul", pass)
		  
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub Test_Tensor_Max(results As JSONItem)
		  Var pass As Boolean
		  Var t1 As ONNX.Tensor
		  Var t2 As ONNX.Tensor
		  Var t3 As ONNX.Tensor
		  
		  pass = true
		  
		  // test 1
		  
		  t1 = new ONNX.Tensor(ONNX.ElementTypeEnum.FLOAT, "[[1, 2, 3], [2, 8, 4]]")
		  t2 = new ONNX.Tensor(ONNX.ElementTypeEnum.FLOAT, "[[4, 2, 4], [7, 5, 3]]")
		  t3 = t1.Max(t2)
		  
		  if FloatEquals(t3.Value(0, 0), 4) or _
		    FloatEquals(t3.Value(0, 1), 2) or _
		    FloatEquals(t3.Value(0, 2), 4) or _
		    FloatEquals(t3.Value(1, 0), 7) or _
		    FloatEquals(t3.Value(1, 1), 8) or _
		    FloatEquals(t3.Value(1, 2), 4) then
		    pass = false
		  end if
		  
		  RecordTestResult(results, "Tensor.Max", pass)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub Test_Tensor_Min(results As JSONItem)
		  Var pass As Boolean
		  Var t1 As ONNX.Tensor
		  Var t2 As ONNX.Tensor
		  Var t3 As ONNX.Tensor
		  
		  pass = true
		  
		  // test 1
		  
		  t1 = new ONNX.Tensor(ONNX.ElementTypeEnum.FLOAT, "[[1, 2, 3], [2, 8, 4]]")
		  t2 = new ONNX.Tensor(ONNX.ElementTypeEnum.FLOAT, "[[4, 2, 4], [7, 5, 3]]")
		  t3 = t1.Min(t2)
		  
		  if FloatEquals(t3.Value(0, 0), 1) or _
		    FloatEquals(t3.Value(0, 1), 2) or _
		    FloatEquals(t3.Value(0, 2), 3) or _
		    FloatEquals(t3.Value(1, 0), 2) or _
		    FloatEquals(t3.Value(1, 1), 5) or _
		    FloatEquals(t3.Value(1, 2), 3) then
		    pass = false
		  end if
		  
		  RecordTestResult(results, "Tensor.Min", pass)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub Test_Tensor_Mul(results As JSONItem)
		  Var pass As Boolean
		  Var t1 As ONNX.Tensor
		  Var t2 As ONNX.Tensor
		  Var t3 As ONNX.Tensor
		  
		  pass = true
		  
		  // test 1
		  
		  t1 = new ONNX.Tensor(ONNX.ElementTypeEnum.FLOAT, "[[1, 2, 3], [4, 5, 6]]")
		  t2 = new ONNX.Tensor(ONNX.ElementTypeEnum.FLOAT, "[[2, 3, 7], [3, 8, 2]]")
		  t3 = t1.Mul(t2)
		  
		  if FloatEquals(t3.Value(0, 0), 2) or _
		    FloatEquals(t3.Value(0, 1), 6) or _
		    FloatEquals(t3.Value(0, 2), 21) or _
		    FloatEquals(t3.Value(1, 0), 12) or _
		    FloatEquals(t3.Value(1, 1), 40) or _
		    FloatEquals(t3.Value(1, 2), 12) then
		    pass = false
		  end if
		  
		  RecordTestResult(results, "Tensor.Mul", pass)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub Test_Tensor_Neg(results As JSONItem)
		  Var pass As Boolean
		  Var t1 As ONNX.Tensor
		  Var t2 As ONNX.Tensor
		  
		  pass = true
		  
		  // test 1
		  
		  t1 = new ONNX.Tensor(ONNX.ElementTypeEnum.FLOAT, "[[3.34, 4.72], [-1.92, 9.21]]")
		  t2 = t1.Neg()
		  
		  if FloatEquals(t2.Value(0, 0), -3.34) or _
		    FloatEquals(t2.Value(0, 1), -4.72) or _
		    FloatEquals(t2.Value(1, 0), 1.92) or _
		    FloatEquals(t2.Value(1, 1), -9.21) then
		    pass = false
		  end if
		  
		  RecordTestResult(results, "Tensor.Neg", pass)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub Test_Tensor_Pow(results As JSONItem)
		  Var pass As Boolean
		  Var t1 As ONNX.Tensor
		  Var t2 As ONNX.Tensor
		  Var t3 As ONNX.Tensor
		  
		  pass = true
		  
		  // test 1
		  
		  t1 = new ONNX.Tensor(ONNX.ElementTypeEnum.FLOAT, "[[1, 2, 3], [2, 8, 4]]")
		  t2 = new ONNX.Tensor(ONNX.ElementTypeEnum.FLOAT, "[[4, 2, 4], [7, 5, 3]]")
		  t3 = t1.Pow(t2)
		  
		  if FloatEquals(t3.Value(0, 0), 1) or _
		    FloatEquals(t3.Value(0, 1), 4) or _
		    FloatEquals(t3.Value(0, 2), 81) or _
		    FloatEquals(t3.Value(1, 0), 128) or _
		    FloatEquals(t3.Value(1, 1), 32768) or _
		    FloatEquals(t3.Value(1, 2), 64) then
		    pass = false
		  end if
		  
		  RecordTestResult(results, "Tensor.Pow", pass)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub Test_Tensor_Reciprocal(results As JSONItem)
		  Var pass As Boolean
		  Var t1 As ONNX.Tensor
		  Var t2 As ONNX.Tensor
		  
		  pass = true
		  
		  // test 1
		  
		  t1 = new ONNX.Tensor(ONNX.ElementTypeEnum.FLOAT, "[[3.34, 4.72], [-1.92, 9.21]]")
		  t2 = t1.Reciprocal()
		  
		  if FloatEquals(t2.Value(0, 0), 0.29940120) or _
		    FloatEquals(t2.Value(0, 1), 0.21186441) or _
		    FloatEquals(t2.Value(1, 0), -0.52083333) or _
		    FloatEquals(t2.Value(1, 1), 0.10857763) then
		    pass = false
		  end if
		  
		  RecordTestResult(results, "Tensor.Reciprocal", pass)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub Test_Tensor_Relu(results As JSONItem)
		  Var pass As Boolean
		  Var t1 As ONNX.Tensor
		  Var t2 As ONNX.Tensor
		  
		  pass = true
		  
		  // test 1
		  
		  t1 = new ONNX.Tensor(ONNX.ElementTypeEnum.FLOAT, "[[1, -2, 3], [-4, 0, 6]]")
		  t2 = t1.Relu()
		  
		  if FloatEquals(t2.Value(0, 0), 1) or _ 
		    FloatEquals(t2.Value(0, 1), 0) or _
		    FloatEquals(t2.Value(0, 2), 3) or _
		    FloatEquals(t2.Value(1, 0), 0) or _
		    FloatEquals(t2.Value(1, 1), 0) or _
		    FloatEquals(t2.Value(1, 2), 6) then
		    pass = false
		  end if
		  
		  RecordTestResult(results, "Tensor.Relu", pass)
		  
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub Test_Tensor_Sigmoid(results As JSONItem)
		  Var pass As Boolean
		  Var t1 As ONNX.Tensor
		  Var t2 As ONNX.Tensor
		  
		  pass = true
		  
		  // test 1
		  
		  t1 = new ONNX.Tensor(ONNX.ElementTypeEnum.FLOAT, "[[0.5, 1.0, -2.0]]")
		  t2 = t1.Sigmoid()
		  
		  if FloatEquals(t2.Value(0, 0), 0.62245933120185) or _ 
		    FloatEquals(t2.Value(0, 1), 0.73105857863) or _
		    FloatEquals(t2.Value(0, 2), 0.11920292202212) then
		    pass = false
		  end if
		  
		  RecordTestResult(results, "Tensor.Sigmoid", pass)
		  
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub Test_Tensor_Sign(results As JSONItem)
		  Var pass As Boolean
		  Var t1 As ONNX.Tensor
		  Var t2 As ONNX.Tensor
		  
		  pass = true
		  
		  // test 1
		  
		  t1 = new ONNX.Tensor(ONNX.ElementTypeEnum.FLOAT, "[[3.34, 4.72], [-1.92, 0]]")
		  t2 = t1.Sign()
		  
		  if FloatEquals(t2.Value(0, 0), 1.0) or _
		    FloatEquals(t2.Value(0, 1), 1.0) or _
		    FloatEquals(t2.Value(1, 0), -1.0) or _
		    FloatEquals(t2.Value(1, 1), 0.0) then
		    pass = false
		  end if
		  
		  RecordTestResult(results, "Tensor.Sign", pass)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub Test_Tensor_Sin(results As JSONItem)
		  Var pass As Boolean
		  Var t1 As ONNX.Tensor
		  Var t2 As ONNX.Tensor
		  
		  pass = true
		  
		  // test 1
		  
		  t1 = new ONNX.Tensor(ONNX.ElementTypeEnum.FLOAT, "[[3.34, 4.72], [-1.92, 9.21]]")
		  t2 = t1.Sin()
		  
		  if FloatEquals(t2.Value(0, 0), -0.19710817293) or _
		    FloatEquals(t2.Value(0, 1), -0.99997103633) or _
		    FloatEquals(t2.Value(1, 0), -0.93964547368) or _
		    FloatEquals(t2.Value(1, 1), 0.21313049595) then
		    pass = false
		  end if
		  
		  RecordTestResult(results, "Tensor.Sin", pass)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub Test_Tensor_Sinh(results As JSONItem)
		  Var pass As Boolean
		  Var t1 As ONNX.Tensor
		  Var t2 As ONNX.Tensor
		  
		  pass = true
		  
		  // test 1
		  
		  t1 = new ONNX.Tensor(ONNX.ElementTypeEnum.FLOAT, "[[0.5, 1.0, -2.0]]")
		  t2 = t1.Sinh()
		  
		  if FloatEquals(t2.Value(0, 0), 0.5210953) or _
		    FloatEquals(t2.Value(0, 1), 1.1752012) or _
		    FloatEquals(t2.Value(0, 2), -3.6268604) then
		    pass = false
		  end if
		  
		  RecordTestResult(results, "Tensor.Sinh", pass)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub Test_Tensor_Softmax(results As JSONItem)
		  Var pass As Boolean
		  Var t1 As ONNX.Tensor
		  Var t2 As ONNX.Tensor
		  
		  pass = true
		  
		  // test 1
		  
		  t1 = new ONNX.Tensor(ONNX.ElementTypeEnum.FLOAT, "[[2.0, 1.0, 0.1]]")
		  t2 = t1.Softmax(-1)
		  
		  if FloatEquals(t2.Value(0, 0), 0.659001138) or _ 
		    FloatEquals(t2.Value(0, 1), 0.242432970) or _
		    FloatEquals(t2.Value(0, 2), 0.098565892) then
		    pass = false
		  end if
		  
		  // test 2
		  
		  if pass then
		    
		    t1 = new ONNX.Tensor(ONNX.ElementTypeEnum.FLOAT, "[[1,2],[4,3]]")
		    t2 = t1.Softmax(0)
		    
		    if FloatEquals(t2.Value(0, 0), 0.04742587357759476) or _ 
		      FloatEquals(t2.Value(0, 1), 0.2689414322376251) or _
		      FloatEquals(t2.Value(1, 0), 0.9525741338729858) or _
		      FloatEquals(t2.Value(1, 1), 0.7310585975646973) then
		      pass = false
		    end if
		    
		  end if
		  
		  // test 3
		  
		  if pass then
		    
		    t1 = new ONNX.Tensor(ONNX.ElementTypeEnum.FLOAT, "[[1,2],[4,3]]")
		    t2 = t1.Softmax(1)
		    
		    if FloatEquals(t2.Value(0, 0), 0.2689414322376251) or _ 
		      FloatEquals(t2.Value(0, 1), 0.7310585975646973) or _
		      FloatEquals(t2.Value(1, 0), 0.7310585975646973) or _
		      FloatEquals(t2.Value(1, 1), 0.2689414322376251) then
		      pass = false
		    end if
		    
		  end if
		  
		  RecordTestResult(results, "Tensor.Softmax", pass)
		  
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub Test_Tensor_Tanh(results As JSONItem)
		  Var pass As Boolean
		  Var t1 As ONNX.Tensor
		  Var t2 As ONNX.Tensor
		  
		  pass = true
		  
		  // test 1
		  
		  t1 = new ONNX.Tensor(ONNX.ElementTypeEnum.FLOAT, "[[0.5, 1.0, -2.0]]")
		  t2 = t1.Tanh()
		  
		  if FloatEquals(t2.Value(0, 0), 0.46211716) or _ 
		    FloatEquals(t2.Value(0, 1), 0.76159416) or _
		    FloatEquals(t2.Value(0, 2), -0.96402758) then
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
