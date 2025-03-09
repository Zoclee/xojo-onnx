#tag Module
Protected Module Model
	#tag Method, Flags = &h1
		Protected Sub Test_Operator_Abs(results As JSONItem)
		  Var pass As Boolean
		  Var input As new Dictionary()
		  Var output As Dictionary
		  Var X1 As ONNX.Tensor
		  Var model As ONNX.Model
		  
		  pass = true
		  
		  model = new ONNX.Model(App.TestFolder.Child("models").Child("operators").Child("abs.onnx"))
		  
		  input.Value("input1") = new ONNX.Tensor(ONNX.ElementTypeEnum.FLOAT, "[[-3.2, 4.5], [0.0, -1.8]]")
		  
		  output = model.Infer(input)
		  
		  if (output.KeyCount = 1) and _
		    output.HasKey("output1") then
		    
		    X1 = output.Value("output1")
		    if FloatEquals(X1.Value(0, 0), 3.2) or _
		      FloatEquals(X1.Value(0, 1), 4.5) or _
		      FloatEquals(X1.Value(1, 0), 0.0) or _
		      FloatEquals(X1.Value(1, 1), 1.8) then
		      pass = false
		    end if
		    
		  else
		    pass = false
		  end if
		  
		  RecordTestResult(results, "Model.Operator_Abs", pass)
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub Test_Operator_Acos(results As JSONItem)
		  Var pass As Boolean
		  Var input As new Dictionary()
		  Var output As Dictionary
		  Var X1 As ONNX.Tensor
		  Var model As ONNX.Model
		  
		  pass = true
		  
		  model = new ONNX.Model(App.TestFolder.Child("models").Child("operators").Child("acos.onnx"))
		  
		  input.Value("input1") = new ONNX.Tensor(ONNX.ElementTypeEnum.FLOAT, "[[1.0, 0.5], [0.0, -0.5]]")
		  
		  output = model.Infer(input)
		  
		  if (output.KeyCount = 1) and _
		    output.HasKey("output1") then
		    
		    X1 = output.Value("output1")
		    if FloatEquals(X1.Value(0, 0), 0.0) or _
		      FloatEquals(X1.Value(0, 1), 1.04719755) or _
		      FloatEquals(X1.Value(1, 0), 1.57079633) or _
		      FloatEquals(X1.Value(1, 1), 2.09439510) then
		      pass = false
		    end if
		    
		  else
		    pass = false
		  end if
		  
		  RecordTestResult(results, "Model.Operator_Acos", pass)
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub Test_Operator_Acosh(results As JSONItem)
		  Var pass As Boolean
		  Var input As new Dictionary()
		  Var output As Dictionary
		  Var X1 As ONNX.Tensor
		  Var model As ONNX.Model
		  
		  pass = true
		  
		  model = new ONNX.Model(App.TestFolder.Child("models").Child("operators").Child("acosh.onnx"))
		  
		  input.Value("input1") = new ONNX.Tensor(ONNX.ElementTypeEnum.FLOAT, "[[1.0, 0.5], [0.0, -0.5]]")
		  
		  output = model.Infer(input)
		  
		  if (output.KeyCount = 1) and _
		    output.HasKey("output1") then
		    
		    X1 = output.Value("output1")
		    if FloatEquals(X1.Value(0, 0), 0.0) or _
		      FloatEquals(X1.Value(0, 1), 1.04719755) or _
		      FloatEquals(X1.Value(1, 0), 1.57079633) or _
		      FloatEquals(X1.Value(1, 1), 2.09439510) then
		      pass = false
		    end if
		    
		  else
		    pass = false
		  end if
		  
		  RecordTestResult(results, "Model.Operator_Acosh", pass)
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub Test_Operator_Add(results As JSONItem)
		  Var pass As Boolean
		  Var input As new Dictionary()
		  Var output As Dictionary
		  Var X1 As ONNX.Tensor
		  Var model As ONNX.Model
		  
		  pass = true
		  
		  model = new ONNX.Model(App.TestFolder.Child("models").Child("operators").Child("add.onnx"))
		  
		  input.Value("input1") = new ONNX.Tensor(ONNX.ElementTypeEnum.FLOAT, "[[0.42, 0.87], [0.15, 0.93]]")
		  input.Value("input2") = new ONNX.Tensor(ONNX.ElementTypeEnum.FLOAT, "[[0.38, 0.29], [0.76, 0.51]]")
		  
		  output = model.Infer(input)
		  
		  if (output.KeyCount = 1) and _
		    output.HasKey("output1") then
		    
		    X1 = output.Value("output1")
		    
		    if FloatEquals(X1.Value(0, 0), 0.80) or _
		      FloatEquals(X1.Value(0, 1), 1.16) or _
		      FloatEquals(X1.Value(1, 0), 0.91) or _
		      FloatEquals(X1.Value(1, 1), 1.44) then
		      pass = false
		    end if
		    
		  else
		    pass = false
		  end if
		  
		  RecordTestResult(results, "Model.Operator_Add", pass)
		  
		  
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
