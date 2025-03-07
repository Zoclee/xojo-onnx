#tag Module
Protected Module Node
	#tag Method, Flags = &h1
		Protected Sub Test_Evaluate_Abs(results As JSONItem)
		  Var pass As Boolean
		  Var node As ONNX.Node
		  Var X As ONNX.Tensor
		  Var data As new Dictionary()
		  
		  pass = true
		  
		  data.Value("A") = new ONNX.Tensor(ONNX.ElementTypeEnum.FLOAT, "[[1, -2, 3], [-4, 0, 6]]")
		  node = new ONNX.Node(ONNX.OperatorEnum.Abs, array("A"), array("X"))
		  node.Evaluate(data)
		  
		  X = data.Value("X")
		  
		  if FloatEquals(X.Value(0, 0), 1) or _
		    FloatEquals(X.Value(0, 1), 2) or _
		    FloatEquals(X.Value(0, 2), 3) or _
		    FloatEquals(X.Value(1, 0), 4) or _
		    FloatEquals(X.Value(1, 1), 0) or _
		    FloatEquals(X.Value(1, 2), 6) then
		    pass = false
		  end if
		  
		  RecordTestResult(results, "Node.Evaluate_Abs", pass)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub Test_Evaluate_Acos(results As JSONItem)
		  Var pass As Boolean
		  Var node As ONNX.Node
		  Var X As ONNX.Tensor
		  Var data As new Dictionary()
		  
		  pass = true
		  
		  data.Value("A") = new ONNX.Tensor(ONNX.ElementTypeEnum.FLOAT, "[[0.34, 0.72], [-0.92, 0.21]]")
		  node = new ONNX.Node(ONNX.OperatorEnum.Acos, array("A"), array("X"))
		  node.Evaluate(data)
		  
		  X = data.Value("X")
		  
		  if FloatEquals(X.Value(0, 0), 1.22387943) or _
		    FloatEquals(X.Value(0, 1), 0.76699401) or _
		    FloatEquals(X.Value(1, 0), 2.73887681) or _
		    FloatEquals(X.Value(1, 1), 1.35922137) then
		    pass = false
		  end if
		  
		  RecordTestResult(results, "Node.Evaluate_Acos", pass)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub Test_Evaluate_Acosh(results As JSONItem)
		  Var pass As Boolean
		  Var node As ONNX.Node
		  Var X As ONNX.Tensor
		  Var data As new Dictionary()
		  
		  pass = true
		  
		  data.Value("A") = new ONNX.Tensor(ONNX.ElementTypeEnum.FLOAT, "[[1.0, 5.2, 3.87]]")
		  node = new ONNX.Node(ONNX.OperatorEnum.Acosh, array("A"), array("X"))
		  node.Evaluate(data)
		  
		  X = data.Value("X")
		  
		  if FloatEquals(X.Value(0, 0), 0.0) or _
		    FloatEquals(X.Value(0, 1), 2.332429323319) or _
		    FloatEquals(X.Value(0, 2), 2.029275144348) then
		    pass = false
		  end if
		  
		  RecordTestResult(results, "Node.Evaluate_Acosh", pass)
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub Test_Evaluate_Add(results As JSONItem)
		  Var pass As Boolean
		  Var node As ONNX.Node
		  Var X As ONNX.Tensor
		  Var data As new Dictionary()
		  
		  pass = true
		  
		  data.Value("A") = new ONNX.Tensor(ONNX.ElementTypeEnum.FLOAT, "[[1, 2, 3], [4, 5, 6]]")
		  data.Value("B") = new ONNX.Tensor(ONNX.ElementTypeEnum.FLOAT, "[[2, 3, 7], [3, 8, 2]]")
		  node = new ONNX.Node(ONNX.OperatorEnum.Add, array("A", "B"), array("X"))
		  node.Evaluate(data)
		  
		  X = data.Value("X")
		  
		  if FloatEquals(X.Value(0, 0), 3) or _
		    FloatEquals(X.Value(0, 1), 5) or _
		    FloatEquals(X.Value(0, 2), 10) or _
		    FloatEquals(X.Value(1, 0), 7) or _
		    FloatEquals(X.Value(1, 1), 13) or _
		    FloatEquals(X.Value(1, 2), 8) then
		    pass = false
		  end if
		  
		  RecordTestResult(results, "Node.Evaluate_Add", pass)
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub Test_Evaluate_Asin(results As JSONItem)
		  Var pass As Boolean
		  Var node As ONNX.Node
		  Var X As ONNX.Tensor
		  Var data As new Dictionary()
		  
		  pass = true
		  
		  data.Value("A") = new ONNX.Tensor(ONNX.ElementTypeEnum.FLOAT, "[[0.34, 0.72], [-0.92, 0.21]]")
		  node = new ONNX.Node(ONNX.OperatorEnum.Asin, array("A"), array("X"))
		  node.Evaluate(data)
		  
		  X = data.Value("X")
		  
		  if FloatEquals(X.Value(0, 0), 0.3469169) or _
		    FloatEquals(X.Value(0, 1), 0.80380232) or _
		    FloatEquals(X.Value(1, 0), -1.16808049) or _
		    FloatEquals(X.Value(1, 1), 0.21157496) then
		    pass = false
		  end if
		  
		  RecordTestResult(results, "Node.Evaluate_Asin", pass)
		  
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub Test_Evaluate_Asinh(results As JSONItem)
		  Var pass As Boolean
		  Var node As ONNX.Node
		  Var X As ONNX.Tensor
		  Var data As new Dictionary()
		  
		  pass = true
		  
		  data.Value("A") = new ONNX.Tensor(ONNX.ElementTypeEnum.FLOAT, "[[0.34, 0.72], [-0.92, 0.21]]")
		  node = new ONNX.Node(ONNX.OperatorEnum.Asinh, array("A"), array("X"))
		  node.Evaluate(data)
		  
		  X = data.Value("X")
		  
		  if FloatEquals(X.Value(0, 0), 0.333768351646) or _
		    FloatEquals(X.Value(0, 1), 0.668974226754) or _
		    FloatEquals(X.Value(1, 0), -0.823659090432) or _
		    FloatEquals(X.Value(1, 1), 0.208486350074) then
		    pass = false
		  end if
		  
		  RecordTestResult(results, "Node.Evaluate_Asinh", pass)
		  
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub Test_Evaluate_Atan(results As JSONItem)
		  Var pass As Boolean
		  Var node As ONNX.Node
		  Var X As ONNX.Tensor
		  Var data As new Dictionary()
		  
		  pass = true
		  
		  data.Value("A") = new ONNX.Tensor(ONNX.ElementTypeEnum.FLOAT, "[[0.34, 0.72], [-0.92, 0.21]]")
		  node = new ONNX.Node(ONNX.OperatorEnum.Atan, array("A"), array("X"))
		  node.Evaluate(data)
		  
		  X = data.Value("X")
		  
		  if FloatEquals(X.Value(0, 0), 0.32773851) or _
		    FloatEquals(X.Value(0, 1), 0.62402305) or _
		    FloatEquals(X.Value(1, 0), -0.74375558) or _
		    FloatEquals(X.Value(1, 1), 0.20699219) then
		    pass = false
		  end if
		  
		  RecordTestResult(results, "Node.Evaluate_Atan", pass)
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub Test_Evaluate_Atanh(results As JSONItem)
		  Var pass As Boolean
		  Var node As ONNX.Node
		  Var X As ONNX.Tensor
		  Var data As new Dictionary()
		  
		  pass = true
		  
		  data.Value("A") = new ONNX.Tensor(ONNX.ElementTypeEnum.FLOAT, "[[0.34, 0.72], [-0.92, 0.21]]")
		  node = new ONNX.Node(ONNX.OperatorEnum.Atanh, array("A"), array("X"))
		  node.Evaluate(data)
		  
		  X = data.Value("X")
		  
		  if FloatEquals(X.Value(0, 0), 0.354092528962) or _
		    FloatEquals(X.Value(0, 1), 0.907644983319) or _
		    FloatEquals(X.Value(1, 0), -1.589026915174) or _
		    FloatEquals(X.Value(1, 1), 0.213171346565) then
		    pass = false
		  end if
		  
		  RecordTestResult(results, "Node.Evaluate_Atanh", pass)
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub Test_Evaluate_Ceil(results As JSONItem)
		  Var pass As Boolean
		  Var node As ONNX.Node
		  Var X As ONNX.Tensor
		  Var data As new Dictionary()
		  
		  pass = true
		  
		  data.Value("A") = new ONNX.Tensor(ONNX.ElementTypeEnum.FLOAT, "[[0.34, 0.72], [-0.92, 0.21]]")
		  node = new ONNX.Node(ONNX.OperatorEnum.Ceil, array("A"), array("X"))
		  node.Evaluate(data)
		  
		  X = data.Value("X")
		  
		  if FloatEquals(X.Value(0, 0), 1.0) or _
		    FloatEquals(X.Value(0, 1), 1.0) or _
		    FloatEquals(X.Value(1, 0), 0.0) or _
		    FloatEquals(X.Value(1, 1), 1.0) then
		    pass = false
		  end if
		  
		  RecordTestResult(results, "Node.Evaluate_Ceil", pass)
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub Test_Evaluate_Cos(results As JSONItem)
		  Var pass As Boolean
		  Var node As ONNX.Node
		  Var X As ONNX.Tensor
		  Var data As new Dictionary()
		  
		  pass = true
		  
		  data.Value("A") = new ONNX.Tensor(ONNX.ElementTypeEnum.FLOAT, "[[3.34, 4.72], [-1.92, 9.21]]")
		  node = new ONNX.Node(ONNX.OperatorEnum.Cos, array("A"), array("X"))
		  node.Evaluate(data)
		  
		  X = data.Value("X")
		  
		  if FloatEquals(X.Value(0, 0), -0.98038174613) or _
		    FloatEquals(X.Value(0, 1), 0.00761094613) or _
		    FloatEquals(X.Value(1, 0), -0.34214965115) or _
		    FloatEquals(X.Value(1, 1), -0.97702374162) then
		    pass = false
		  end if
		  
		  RecordTestResult(results, "Node.Evaluate_Cos", pass)
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub Test_Evaluate_Cosh(results As JSONItem)
		  Var pass As Boolean
		  Var node As ONNX.Node
		  Var X As ONNX.Tensor
		  Var data As new Dictionary()
		  
		  pass = true
		  
		  data.Value("A") = new ONNX.Tensor(ONNX.ElementTypeEnum.FLOAT, "[[0.5, 1.0, -2.0]]")
		  node = new ONNX.Node(ONNX.OperatorEnum.Cosh, array("A"), array("X"))
		  node.Evaluate(data)
		  
		  X = data.Value("X")
		  
		  if FloatEquals(X.Value(0, 0), 1.127626) or _
		    FloatEquals(X.Value(0, 1), 1.5430806) or _
		    FloatEquals(X.Value(0, 2), 3.762196) then
		    pass = false
		  end if
		  
		  RecordTestResult(results, "Node.Evaluate_Cosh", pass)
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub Test_Evaluate_Exp(results As JSONItem)
		  Var pass As Boolean
		  Var node As ONNX.Node
		  Var X As ONNX.Tensor
		  Var data As new Dictionary()
		  
		  pass = true
		  
		  data.Value("A") = new ONNX.Tensor(ONNX.ElementTypeEnum.FLOAT, "[[0.34, 0.72], [-0.92, 0.21]]")
		  node = new ONNX.Node(ONNX.OperatorEnum.Exp, array("A"), array("X"))
		  node.Evaluate(data)
		  
		  X = data.Value("X")
		  
		  if FloatEquals(X.Value(0, 0), 1.404947590564) or _
		    FloatEquals(X.Value(0, 1), 2.054433210644) or _
		    FloatEquals(X.Value(1, 0), 0.398519041085) or _
		    FloatEquals(X.Value(1, 1), 1.233678059957) then
		    pass = false
		  end if
		  
		  RecordTestResult(results, "Node.Evaluate_Exp", pass)
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub Test_Evaluate_Floor(results As JSONItem)
		  Var pass As Boolean
		  Var node As ONNX.Node
		  Var X As ONNX.Tensor
		  Var data As new Dictionary()
		  
		  pass = true
		  
		  data.Value("A") = new ONNX.Tensor(ONNX.ElementTypeEnum.FLOAT, "[[0.34, 0.72], [-0.92, 0.99]]")
		  node = new ONNX.Node(ONNX.OperatorEnum.Floor, array("A"), array("X"))
		  node.Evaluate(data)
		  
		  X = data.Value("X")
		  
		  if FloatEquals(X.Value(0, 0), 0.0) or _
		    FloatEquals(X.Value(0, 1), 0.0) or _
		    FloatEquals(X.Value(1, 0), -1.0) or _
		    FloatEquals(X.Value(1, 1), 0.0) then
		    pass = false
		  end if
		  
		  RecordTestResult(results, "Node.Evaluate_Floor", pass)
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub Test_Evaluate_Greater(results As JSONItem)
		  Var pass As Boolean
		  Var node As ONNX.Node
		  Var X As ONNX.Tensor
		  Var data As new Dictionary()
		  
		  pass = true
		  
		  data.Value("A") = new ONNX.Tensor(ONNX.ElementTypeEnum.FLOAT, "[[1, 2, 3], [2, 8, 4]]")
		  data.Value("B") = new ONNX.Tensor(ONNX.ElementTypeEnum.FLOAT, "[[4, 2, 4], [7, 5, 3]]")
		  node = new ONNX.Node(ONNX.OperatorEnum.Greater, array("A", "B"), array("X"))
		  node.Evaluate(data)
		  
		  X = data.Value("X")
		  
		  if (X.ElementType <> ONNX.ElementTypeEnum.BOOL) or _
		    (X.Shape(0) <> 2) or _
		    (X.Shape(1) <> 3) or _
		    (X.Value(0, 0) <> false) or _
		    (X.Value(0, 1) <> false) or _
		    (X.Value(0, 2) <> false) or _
		    (X.Value(1, 0) <> false) or _
		    (X.Value(1, 1) <> true) or _
		    (X.Value(1, 2) <> true) then
		    pass = false
		  end if
		  
		  RecordTestResult(results, "Node.Evaluate_Greater", pass)
		  
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub Test_Evaluate_GreaterOrEqual(results As JSONItem)
		  Var pass As Boolean
		  Var node As ONNX.Node
		  Var X As ONNX.Tensor
		  Var data As new Dictionary()
		  
		  pass = true
		  
		  data.Value("A") = new ONNX.Tensor(ONNX.ElementTypeEnum.FLOAT, "[[1, 2, 3], [2, 8, 4]]")
		  data.Value("B") = new ONNX.Tensor(ONNX.ElementTypeEnum.FLOAT, "[[4, 2, 4], [7, 5, 3]]")
		  node = new ONNX.Node(ONNX.OperatorEnum.GreaterOrEqual, array("A", "B"), array("X"))
		  node.Evaluate(data)
		  
		  X = data.Value("X")
		  
		  if (X.ElementType <> ONNX.ElementTypeEnum.BOOL) or _
		    (X.Shape(0) <> 2) or _
		    (X.Shape(1) <> 3) or _
		    (X.Value(0, 0) <> false) or _
		    (X.Value(0, 1) <> true) or _
		    (X.Value(0, 2) <> false) or _
		    (X.Value(1, 0) <> false) or _
		    (X.Value(1, 1) <> true) or _
		    (X.Value(1, 2) <> true) then
		    pass = false
		  end if
		  
		  RecordTestResult(results, "Node.Evaluate_GreaterOrEqual", pass)
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub Test_Evaluate_Less(results As JSONItem)
		  Var pass As Boolean
		  Var node As ONNX.Node
		  Var X As ONNX.Tensor
		  Var data As new Dictionary()
		  
		  pass = true
		  
		  data.Value("A") = new ONNX.Tensor(ONNX.ElementTypeEnum.FLOAT, "[[1, 2, 3], [2, 8, 4]]")
		  data.Value("B") = new ONNX.Tensor(ONNX.ElementTypeEnum.FLOAT, "[[4, 2, 4], [7, 5, 3]]")
		  node = new ONNX.Node(ONNX.OperatorEnum.Less, array("A", "B"), array("X"))
		  node.Evaluate(data)
		  
		  X = data.Value("X")
		  
		  if (X.ElementType <> ONNX.ElementTypeEnum.BOOL) or _
		    (X.Shape(0) <> 2) or _
		    (X.Shape(1) <> 3) or _
		    (X.Value(0, 0) <> true) or _
		    (X.Value(0, 1) <> false) or _
		    (X.Value(0, 2) <> true) or _
		    (X.Value(1, 0) <> true) or _
		    (X.Value(1, 1) <> false) or _
		    (X.Value(1, 2) <> false) then
		    pass = false
		  end if
		  
		  RecordTestResult(results, "Node.Evaluate_Less", pass)
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub Test_Evaluate_LessOrEqual(results As JSONItem)
		  Var pass As Boolean
		  Var node As ONNX.Node
		  Var X As ONNX.Tensor
		  Var data As new Dictionary()
		  
		  pass = true
		  
		  data.Value("A") = new ONNX.Tensor(ONNX.ElementTypeEnum.FLOAT, "[[1, 2, 3], [2, 8, 4]]")
		  data.Value("B") = new ONNX.Tensor(ONNX.ElementTypeEnum.FLOAT, "[[4, 2, 4], [7, 5, 3]]")
		  node = new ONNX.Node(ONNX.OperatorEnum.LessOrEqual, array("A", "B"), array("X"))
		  node.Evaluate(data)
		  
		  X = data.Value("X")
		  
		  if (X.ElementType <> ONNX.ElementTypeEnum.BOOL) or _
		    (X.Shape(0) <> 2) or _
		    (X.Shape(1) <> 3) or _
		    (X.Value(0, 0) <> true) or _
		    (X.Value(0, 1) <> true) or _
		    (X.Value(0, 2) <> true) or _
		    (X.Value(1, 0) <> true) or _
		    (X.Value(1, 1) <> false) or _
		    (X.Value(1, 2) <> false) then
		    pass = false
		  end if
		  
		  RecordTestResult(results, "Node.Evaluate_LessOrEqual", pass)
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub Test_Evaluate_Log(results As JSONItem)
		  Var pass As Boolean
		  Var node As ONNX.Node
		  Var X As ONNX.Tensor
		  Var data As new Dictionary()
		  
		  pass = true
		  
		  data.Value("A") = new ONNX.Tensor(ONNX.ElementTypeEnum.FLOAT, "[[3.34, 4.72], [1.92, 9.21]]")
		  node = new ONNX.Node(ONNX.OperatorEnum.Log, array("A"), array("X"))
		  node.Evaluate(data)
		  
		  X = data.Value("X")
		  
		  if FloatEquals(X.Value(0, 0), 1.20597080699) or _
		    FloatEquals(X.Value(0, 1), 1.5518087996) or _
		    FloatEquals(X.Value(1, 0), 0.65232518604) or _
		    FloatEquals(X.Value(1, 1), 2.22028985027) then
		    pass = false
		  end if
		  
		  RecordTestResult(results, "Node.Evaluate_Log", pass)
		  
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub Test_Evaluate_LogicalAnd(results As JSONItem)
		  Var pass As Boolean
		  Var node As ONNX.Node
		  Var X As ONNX.Tensor
		  Var data As new Dictionary()
		  
		  pass = true
		  
		  data.Value("A") = new ONNX.Tensor(ONNX.ElementTypeEnum.BOOL, "[[true, false], [true, false]]")
		  data.Value("B") = new ONNX.Tensor(ONNX.ElementTypeEnum.BOOL, "[[true, true], [false, false]]")
		  node = new ONNX.Node(ONNX.OperatorEnum.LogicalAnd, array("A", "B"), array("X"))
		  node.Evaluate(data)
		  
		  X = data.Value("X")
		  
		  if (X.ElementType <> ONNX.ElementTypeEnum.BOOL) or _
		    (X.Value(0, 0) <> true) or _
		    (X.Value(0, 1) <> false) or _
		    (X.Value(1, 0) <> false) or _
		    (X.Value(1, 1) <> false) then
		    pass = false
		  end if
		  
		  RecordTestResult(results, "Node.Evaluate_LogicalAnd", pass)
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub Test_Evaluate_LogicalNot(results As JSONItem)
		  Var pass As Boolean
		  Var node As ONNX.Node
		  Var X As ONNX.Tensor
		  Var data As new Dictionary()
		  
		  pass = true
		  
		  data.Value("A") = new ONNX.Tensor(ONNX.ElementTypeEnum.BOOL, "[[true, false], [false, true]]")
		  node = new ONNX.Node(ONNX.OperatorEnum.LogicalNot, array("A"), array("X"))
		  node.Evaluate(data)
		  
		  X = data.Value("X")
		  
		  if (X.ElementType <> ONNX.ElementTypeEnum.BOOL) or _
		    (X.Value(0, 0) <> false) or _
		    (X.Value(0, 1) <> true) or _
		    (X.Value(1, 0) <> true) or _
		    (X.Value(1, 1) <> false) then
		    pass = false
		  end if
		  
		  RecordTestResult(results, "Node.Evaluate_LogicalNot", pass)
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub Test_Evaluate_LogicalOr(results As JSONItem)
		  Var pass As Boolean
		  Var node As ONNX.Node
		  Var X As ONNX.Tensor
		  Var data As new Dictionary()
		  
		  pass = true
		  
		  data.Value("A") = new ONNX.Tensor(ONNX.ElementTypeEnum.BOOL, "[[true, false], [false, true]]")
		  data.Value("B") = new ONNX.Tensor(ONNX.ElementTypeEnum.BOOL, "[[false, true], [false, false]]")
		  node = new ONNX.Node(ONNX.OperatorEnum.LogicalOr, array("A", "B"), array("X"))
		  node.Evaluate(data)
		  
		  X = data.Value("X")
		  
		  if (X.ElementType <> ONNX.ElementTypeEnum.BOOL) or _
		    (X.Value(0, 0) <> true) or _
		    (X.Value(0, 1) <> true) or _
		    (X.Value(1, 0) <> false) or _
		    (X.Value(1, 1) <> true) then
		    pass = false
		  end if
		  
		  RecordTestResult(results, "Node.Evaluate_LogicalOr", pass)
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub Test_Evaluate_MatMul(results As JSONItem)
		  Var pass As Boolean
		  Var node As ONNX.Node
		  Var X As ONNX.Tensor
		  Var data As new Dictionary()
		  
		  pass = true
		  
		  data.Value("A") = new ONNX.Tensor(ONNX.ElementTypeEnum.FLOAT, "[[2, 3], [4, 1], [5, 2]]")
		  data.Value("B") = new ONNX.Tensor(ONNX.ElementTypeEnum.FLOAT, "[[5, 2, 1], [1, 7, 3]]")
		  node = new ONNX.Node(ONNX.OperatorEnum.MatMul, array("A", "B"), array("X"))
		  node.Evaluate(data)
		  
		  X = data.Value("X")
		  
		  if (X.Shape(0) <> 3) or _
		    (X.Shape(1) <> 3) or _
		    FloatEquals(X.Value(0, 0), 13) or _
		    FloatEquals(X.Value(0, 1), 25) or _
		    FloatEquals(X.Value(0, 2), 11) or _
		    FloatEquals(X.Value(1, 0), 21) or _
		    FloatEquals(X.Value(1, 1), 15) or _
		    FloatEquals(X.Value(1, 2), 7) or _
		    FloatEquals(X.Value(2, 0), 27) or _
		    FloatEquals(X.Value(2, 1), 24) or _
		    FloatEquals(X.Value(2, 2), 11) then
		    pass = false
		  end if
		  
		  RecordTestResult(results, "Node.Evaluate_MatMul", pass)
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub Test_Evaluate_Max(results As JSONItem)
		  Var pass As Boolean
		  Var node As ONNX.Node
		  Var X As ONNX.Tensor
		  Var data As new Dictionary()
		  
		  pass = true
		  
		  data.Value("A") = new ONNX.Tensor(ONNX.ElementTypeEnum.FLOAT, "[[1, 2, 3], [2, 8, 4]]")
		  data.Value("B") = new ONNX.Tensor(ONNX.ElementTypeEnum.FLOAT, "[[4, 2, 4], [7, 5, 3]]")
		  node = new ONNX.Node(ONNX.OperatorEnum.Max, array("A", "B"), array("X"))
		  node.Evaluate(data)
		  
		  X = data.Value("X")
		  
		  if FloatEquals(X.Value(0, 0), 4) or _
		    FloatEquals(X.Value(0, 1), 2) or _
		    FloatEquals(X.Value(0, 2), 4) or _
		    FloatEquals(X.Value(1, 0), 7) or _
		    FloatEquals(X.Value(1, 1), 8) or _
		    FloatEquals(X.Value(1, 2), 4) then
		    pass = false
		  end if
		  
		  RecordTestResult(results, "Node.Evaluate_Max", pass)
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub Test_Evaluate_Min(results As JSONItem)
		  Var pass As Boolean
		  Var node As ONNX.Node
		  Var X As ONNX.Tensor
		  Var data As new Dictionary()
		  
		  pass = true
		  
		  data.Value("A") = new ONNX.Tensor(ONNX.ElementTypeEnum.FLOAT, "[[1, 2, 3], [2, 8, 4]]")
		  data.Value("B") = new ONNX.Tensor(ONNX.ElementTypeEnum.FLOAT, "[[4, 2, 4], [7, 5, 3]]")
		  node = new ONNX.Node(ONNX.OperatorEnum.Min, array("A", "B"), array("X"))
		  node.Evaluate(data)
		  
		  X = data.Value("X")
		  
		  if FloatEquals(X.Value(0, 0), 1) or _
		    FloatEquals(X.Value(0, 1), 2) or _
		    FloatEquals(X.Value(0, 2), 3) or _
		    FloatEquals(X.Value(1, 0), 2) or _
		    FloatEquals(X.Value(1, 1), 5) or _
		    FloatEquals(X.Value(1, 2), 3) then
		    pass = false
		  end if
		  
		  RecordTestResult(results, "Node.Evaluate_Min", pass)
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub Test_Evaluate_Mul(results As JSONItem)
		  Var pass As Boolean
		  Var node As ONNX.Node
		  Var X As ONNX.Tensor
		  Var data As new Dictionary()
		  
		  pass = true
		  
		  data.Value("A") = new ONNX.Tensor(ONNX.ElementTypeEnum.FLOAT, "[[1, 2, 3], [4, 5, 6]]")
		  data.Value("B") = new ONNX.Tensor(ONNX.ElementTypeEnum.FLOAT, "[[2, 3, 7], [3, 8, 2]]")
		  node = new ONNX.Node(ONNX.OperatorEnum.Mul, array("A", "B"), array("X"))
		  node.Evaluate(data)
		  
		  X = data.Value("X")
		  
		  if FloatEquals(X.Value(0, 0), 2) or _
		    FloatEquals(X.Value(0, 1), 6) or _
		    FloatEquals(X.Value(0, 2), 21) or _
		    FloatEquals(X.Value(1, 0), 12) or _
		    FloatEquals(X.Value(1, 1), 40) or _
		    FloatEquals(X.Value(1, 2), 12) then
		    pass = false
		  end if
		  
		  RecordTestResult(results, "Node.Evaluate_Mul", pass)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub Test_Evaluate_Neg(results As JSONItem)
		  Var pass As Boolean
		  Var node As ONNX.Node
		  Var X As ONNX.Tensor
		  Var data As new Dictionary()
		  
		  pass = true
		  
		  data.Value("A") = new ONNX.Tensor(ONNX.ElementTypeEnum.FLOAT, "[[3.34, 4.72], [-1.92, 9.21]]")
		  node = new ONNX.Node(ONNX.OperatorEnum.Neg, array("A"), array("X"))
		  node.Evaluate(data)
		  
		  X = data.Value("X")
		  
		  if FloatEquals(X.Value(0, 0), -3.34) or _
		    FloatEquals(X.Value(0, 1), -4.72) or _
		    FloatEquals(X.Value(1, 0), 1.92) or _
		    FloatEquals(X.Value(1, 1), -9.21) then
		    pass = false
		  end if
		  
		  RecordTestResult(results, "Node.Evaluate_Neg", pass)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub Test_Evaluate_Pow(results As JSONItem)
		  Var pass As Boolean
		  Var node As ONNX.Node
		  Var X As ONNX.Tensor
		  Var data As new Dictionary()
		  
		  pass = true
		  
		  data.Value("A") = new ONNX.Tensor(ONNX.ElementTypeEnum.FLOAT, "[[1, 2, 3], [2, 8, 4]]")
		  data.Value("B") = new ONNX.Tensor(ONNX.ElementTypeEnum.FLOAT, "[[4, 2, 4], [7, 5, 3]]")
		  node = new ONNX.Node(ONNX.OperatorEnum.Pow, array("A", "B"), array("X"))
		  node.Evaluate(data)
		  
		  X = data.Value("X")
		  
		  if FloatEquals(X.Value(0, 0), 1) or _
		    FloatEquals(X.Value(0, 1), 4) or _
		    FloatEquals(X.Value(0, 2), 81) or _
		    FloatEquals(X.Value(1, 0), 128) or _
		    FloatEquals(X.Value(1, 1), 32768) or _
		    FloatEquals(X.Value(1, 2), 64) then
		    pass = false
		  end if
		  
		  RecordTestResult(results, "Node.Evaluate_Pow", pass)
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub Test_Evaluate_Reciprocal(results As JSONItem)
		  Var pass As Boolean
		  Var node As ONNX.Node
		  Var X As ONNX.Tensor
		  Var data As new Dictionary()
		  
		  pass = true
		  
		  data.Value("A") = new ONNX.Tensor(ONNX.ElementTypeEnum.FLOAT, "[[3.34, 4.72], [-1.92, 9.21]]")
		  node = new ONNX.Node(ONNX.OperatorEnum.Reciprocal, array("A"), array("X"))
		  node.Evaluate(data)
		  
		  X = data.Value("X")
		  
		  if FloatEquals(X.Value(0, 0), 0.29940120) or _
		    FloatEquals(X.Value(0, 1), 0.21186441) or _
		    FloatEquals(X.Value(1, 0), -0.52083333) or _
		    FloatEquals(X.Value(1, 1), 0.10857763) then
		    pass = false
		  end if
		  
		  RecordTestResult(results, "Node.Evaluate_Reciprocal", pass)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub Test_Evaluate_Relu(results As JSONItem)
		  Var pass As Boolean
		  Var node As ONNX.Node
		  Var X As ONNX.Tensor
		  Var data As new Dictionary()
		  
		  pass = true
		  
		  data.Value("A") = new ONNX.Tensor(ONNX.ElementTypeEnum.FLOAT, "[[1, -2, 3], [-4, 0, 6]]")
		  node = new ONNX.Node(ONNX.OperatorEnum.Relu, array("A"), array("X"))
		  node.Evaluate(data)
		  
		  X = data.Value("X")
		  
		  if FloatEquals(X.Value(0, 0), 1) or _ 
		    FloatEquals(X.Value(0, 1), 0) or _
		    FloatEquals(X.Value(0, 2), 3) or _
		    FloatEquals(X.Value(1, 0), 0) or _
		    FloatEquals(X.Value(1, 1), 0) or _
		    FloatEquals(X.Value(1, 2), 6) then
		    pass = false
		  end if
		  
		  RecordTestResult(results, "Node.Evaluate_Relu", pass)
		  
		  
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
