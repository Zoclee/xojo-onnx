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
