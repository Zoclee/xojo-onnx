#tag Module
Protected Module Graph
	#tag Method, Flags = &h1
		Protected Sub Test_Evaluate1Node(results As JSONItem)
		  Var pass As Boolean
		  Var I1 As ONNX.Tensor
		  Var I2 As ONNX.Tensor
		  Var O1 As ONNX.Tensor
		  Var N1 As ONNX.Node
		  Var graph As ONNX.Graph
		  Var inData As new Dictionary()
		  Var outData As Dictionary
		  Var X As ONNX.Tensor
		  
		  pass = true
		  
		  // O1 = (I1 + I2) * I3
		  
		  I1 = new ONNX.Tensor("I1", ONNX.ElementTypeEnum.FLOAT, Array(-1, -1))
		  I2 = new ONNX.Tensor("I2", ONNX.ElementTypeEnum.FLOAT, Array(-1, -1))
		  O1 = new ONNX.Tensor("O1", ONNX.ElementTypeEnum.FLOAT, Array(-1, -1))
		  N1 = new ONNX.Node(ONNX.OperatorEnum.Add, array("I1", "I2"), array("O1"))
		  
		  inData.Value("I1") = new ONNX.Tensor(ONNX.ElementTypeEnum.FLOAT, "[5, 3, -1]")
		  inData.Value("I2") = new ONNX.Tensor(ONNX.ElementTypeEnum.FLOAT, "[-4, 4, 5]")
		  
		  graph = new ONNX.Graph(array(N1), "Graph.InferSingleNode", array(I1, I2), array(O1))
		  
		  outData = graph.Evaluate(inData)
		  
		  X = outData.Value("O1")
		  
		  System.DebugLog X.ToString()
		  
		  if (outData.KeyCount <> 1) or _
		    not outData.HasKey("O1") or _ 
		    FloatEquals(X.Value(0), 1) or _
		    FloatEquals(X.Value(1), 7) or _
		    FloatEquals(X.Value(2), 4) then
		    pass = false
		  end if
		  
		  RecordTestResult(results, "Graph.Evaluate1Node", pass)
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub Test_Evaluate2Nodes(results As JSONItem)
		  Var pass As Boolean
		  Var I1, I2, I3 As ONNX.Tensor
		  Var O1 As ONNX.Tensor
		  Var N1, N2 As ONNX.Node
		  Var graph As ONNX.Graph
		  Var inData As new Dictionary()
		  Var outData As Dictionary
		  Var X As ONNX.Tensor
		  
		  pass = true
		  
		  // O1 = (I1 + I2) * I3
		  
		  I1 = new ONNX.Tensor("I1", ONNX.ElementTypeEnum.FLOAT, Array(-1, -1))
		  I2 = new ONNX.Tensor("I2", ONNX.ElementTypeEnum.FLOAT, Array(-1, -1))
		  I3 = new ONNX.Tensor("I3", ONNX.ElementTypeEnum.FLOAT, Array(-1, -1))
		  O1 = new ONNX.Tensor("O1", ONNX.ElementTypeEnum.FLOAT, Array(-1, -1))
		  N1 = new ONNX.Node(ONNX.OperatorEnum.Add, array("I1", "I2"), array("T1"))
		  N2 = new ONNX.Node(ONNX.OperatorEnum.Mul, array("T1", "I3"), array("O1"))
		  
		  inData.Value("I1") = new ONNX.Tensor(ONNX.ElementTypeEnum.FLOAT, "[5, 3, -1]")
		  inData.Value("I2") = new ONNX.Tensor(ONNX.ElementTypeEnum.FLOAT, "[-4, 4, 5]")
		  inData.Value("I3") = new ONNX.Tensor(ONNX.ElementTypeEnum.FLOAT, "[5, -2, 4]")
		  
		  graph = new ONNX.Graph(array(N1, N2), "Graph.InferSingleNode", array(I1, I2), array(O1))
		  
		  outData = graph.Evaluate(inData)
		  
		  X = outData.Value("O1")
		  
		  System.DebugLog X.ToString()
		  
		  if (outData.KeyCount <> 1) or _
		    not outData.HasKey("O1") or _ 
		    FloatEquals(X.Value(0), 5) or _
		    FloatEquals(X.Value(1), -14) or _
		    FloatEquals(X.Value(2), 16) then
		    pass = false
		  end if
		  
		  RecordTestResult(results, "Graph.Evaluate2Nodes", pass)
		  
		  
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
