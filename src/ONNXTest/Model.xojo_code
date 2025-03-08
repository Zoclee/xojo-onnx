#tag Module
Protected Module Model
	#tag Method, Flags = &h1
		Protected Sub Test_Add(results As JSONItem)
		  Var pass As Boolean
		  Var input As new Dictionary()
		  Var output As Dictionary
		  Var X1 As ONNX.Tensor
		  Var model As ONNX.Model
		  
		  pass = true
		  
		  model = new ONNX.Model(App.TestFolder.Child("models").Child("operators").Child("add.onnx"))
		  
		  input.Value("input1") = new ONNX.Tensor(ONNX.ElementTypeEnum.FLOAT, "[5, 3, -1]")
		  input.Value("input2") = new ONNX.Tensor(ONNX.ElementTypeEnum.FLOAT, "[-4, 4, 5]")
		  
		  output = model.Infer(input)
		  
		  if (output.KeyCount = 1) and _
		    output.HasKey("output1") then
		    
		    X1 = output.Value("output1")
		    
		    if FloatEquals(X1.Value(0), 1) or _
		      FloatEquals(X1.Value(1), 7) or _
		      FloatEquals(X1.Value(2), 4) then
		      pass = false
		    end if
		    
		  else
		    pass = false
		  end if
		  
		  RecordTestResult(results, "Model.Add", pass)
		  
		  
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
