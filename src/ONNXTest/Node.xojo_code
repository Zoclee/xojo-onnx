#tag Module
Protected Module Node
	#tag Method, Flags = &h1
		Protected Sub Test_Evaluate_Abs(results As JSONItem)
		  Var pass As Boolean
		  Var node As ONNX.Node
		  Var A As ONNX.Tensor
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
