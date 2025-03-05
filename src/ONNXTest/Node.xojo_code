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
