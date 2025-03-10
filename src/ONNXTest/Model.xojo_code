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
		  
		  RecordTestResult(results, "Model: test/models/operators/abs.onnx", pass)
		  
		  
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
		  
		  RecordTestResult(results, "Model: test/models/operators/acos.onnx", pass)
		  
		  
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
		  
		  input.Value("input1") = new ONNX.Tensor(ONNX.ElementTypeEnum.FLOAT, "[[1.0, 1.5], [2.0, 3.0]]")
		  
		  output = model.Infer(input)
		  
		  if (output.KeyCount = 1) and _
		    output.HasKey("output1") then
		    
		    X1 = output.Value("output1")
		    if FloatEquals(X1.Value(0, 0), 0.0) or _
		      FloatEquals(X1.Value(0, 1), 0.96242365) or _
		      FloatEquals(X1.Value(1, 0), 1.31695790) or _
		      FloatEquals(X1.Value(1, 1), 1.76274717) then
		      pass = false
		    end if
		    
		  else
		    pass = false
		  end if
		  
		  RecordTestResult(results, "Model: test/models/operators/acosh.onnx", pass)
		  
		  
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
		  
		  RecordTestResult(results, "Model: test/models/operators/add.onnx", pass)
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub Test_Operator_Asin(results As JSONItem)
		  Var pass As Boolean
		  Var input As new Dictionary()
		  Var output As Dictionary
		  Var X1 As ONNX.Tensor
		  Var model As ONNX.Model
		  
		  pass = true
		  
		  model = new ONNX.Model(App.TestFolder.Child("models").Child("operators").Child("asin.onnx"))
		  
		  input.Value("input1") = new ONNX.Tensor(ONNX.ElementTypeEnum.FLOAT, "[[1.0, 0.5], [0.0, -0.5]]")
		  
		  output = model.Infer(input)
		  
		  if (output.KeyCount = 1) and _
		    output.HasKey("output1") then
		    
		    X1 = output.Value("output1")
		    if FloatEquals(X1.Value(0, 0), 1.57079633) or _
		      FloatEquals(X1.Value(0, 1), 0.52359878) or _
		      FloatEquals(X1.Value(1, 0), 0.0) or _
		      FloatEquals(X1.Value(1, 1), -0.52359878) then
		      pass = false
		    end if
		    
		  else
		    pass = false
		  end if
		  
		  RecordTestResult(results, "Model: test/models/operators/asin.onnx", pass)
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub Test_Operator_Asinh(results As JSONItem)
		  Var pass As Boolean
		  Var input As new Dictionary()
		  Var output As Dictionary
		  Var X1 As ONNX.Tensor
		  Var model As ONNX.Model
		  
		  pass = true
		  
		  model = new ONNX.Model(App.TestFolder.Child("models").Child("operators").Child("asinh.onnx"))
		  
		  input.Value("input1") = new ONNX.Tensor(ONNX.ElementTypeEnum.FLOAT, "[[1.0, 0.5], [0.0, -0.5]]")
		  
		  output = model.Infer(input)
		  
		  if (output.KeyCount = 1) and _
		    output.HasKey("output1") then
		    
		    X1 = output.Value("output1")
		    if FloatEquals(X1.Value(0, 0), 0.88137359) or _
		      FloatEquals(X1.Value(0, 1), 0.48121183) or _
		      FloatEquals(X1.Value(1, 0), 0.0) or _
		      FloatEquals(X1.Value(1, 1), -0.48121183) then
		      pass = false
		    end if
		    
		  else
		    pass = false
		  end if
		  
		  RecordTestResult(results, "Model: test/models/operators/asinh.onnx", pass)
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub Test_Operator_Atan(results As JSONItem)
		  Var pass As Boolean
		  Var input As new Dictionary()
		  Var output As Dictionary
		  Var X1 As ONNX.Tensor
		  Var model As ONNX.Model
		  
		  pass = true
		  
		  model = new ONNX.Model(App.TestFolder.Child("models").Child("operators").Child("atan.onnx"))
		  
		  input.Value("input1") = new ONNX.Tensor(ONNX.ElementTypeEnum.FLOAT, "[[1.0, 0.5], [0.0, -0.5]]")
		  
		  output = model.Infer(input)
		  
		  if (output.KeyCount = 1) and _
		    output.HasKey("output1") then
		    
		    X1 = output.Value("output1")
		    if FloatEquals(X1.Value(0, 0), 0.78539816) or _
		      FloatEquals(X1.Value(0, 1), 0.46364761) or _
		      FloatEquals(X1.Value(1, 0), 0.0) or _
		      FloatEquals(X1.Value(1, 1), -0.46364761) then
		      pass = false
		    end if
		    
		  else
		    pass = false
		  end if
		  
		  RecordTestResult(results, "Model: test/models/operators/atan.onnx", pass)
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub Test_Operator_Atanh(results As JSONItem)
		  Var pass As Boolean
		  Var input As new Dictionary()
		  Var output As Dictionary
		  Var X1 As ONNX.Tensor
		  Var model As ONNX.Model
		  
		  pass = true
		  
		  model = new ONNX.Model(App.TestFolder.Child("models").Child("operators").Child("atanh.onnx"))
		  
		  input.Value("input1") = new ONNX.Tensor(ONNX.ElementTypeEnum.FLOAT, "[[0.5, -0.5], [0.1, -0.1]]")
		  
		  output = model.Infer(input)
		  
		  if (output.KeyCount = 1) and _
		    output.HasKey("output1") then
		    
		    X1 = output.Value("output1")
		    if FloatEquals(X1.Value(0, 0), 0.54930614) or _
		      FloatEquals(X1.Value(0, 1), -0.54930614) or _
		      FloatEquals(X1.Value(1, 0), 0.10033535) or _
		      FloatEquals(X1.Value(1, 1), -0.10033535) then
		      pass = false
		    end if
		    
		  else
		    pass = false
		  end if
		  
		  RecordTestResult(results, "Model: test/models/operators/atanh.onnx", pass)
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub Test_Operator_Ceil(results As JSONItem)
		  Var pass As Boolean
		  Var input As new Dictionary()
		  Var output As Dictionary
		  Var X1 As ONNX.Tensor
		  Var model As ONNX.Model
		  
		  pass = true
		  
		  model = new ONNX.Model(App.TestFolder.Child("models").Child("operators").Child("ceil.onnx"))
		  
		  input.Value("input1") = new ONNX.Tensor(ONNX.ElementTypeEnum.FLOAT, "[[1.2, -0.7], [3.5, -2.3]]")
		  
		  output = model.Infer(input)
		  
		  if (output.KeyCount = 1) and _
		    output.HasKey("output1") then
		    
		    X1 = output.Value("output1")
		    if FloatEquals(X1.Value(0, 0), 2.0) or _
		      FloatEquals(X1.Value(0, 1), 0.0) or _
		      FloatEquals(X1.Value(1, 0), 4.0) or _
		      FloatEquals(X1.Value(1, 1), -2.0) then
		      pass = false
		    end if
		    
		  else
		    pass = false
		  end if
		  
		  RecordTestResult(results, "Model: test/models/operators/ceil.onnx", pass)
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub Test_Operator_Cos(results As JSONItem)
		  Var pass As Boolean
		  Var input As new Dictionary()
		  Var output As Dictionary
		  Var X1 As ONNX.Tensor
		  Var model As ONNX.Model
		  
		  pass = true
		  
		  model = new ONNX.Model(App.TestFolder.Child("models").Child("operators").Child("cos.onnx"))
		  
		  input.Value("input1") = new ONNX.Tensor(ONNX.ElementTypeEnum.FLOAT, "[[0.0, 1.0], [3.14159265, -1.0]]")
		  
		  output = model.Infer(input)
		  
		  if (output.KeyCount = 1) and _
		    output.HasKey("output1") then
		    
		    X1 = output.Value("output1")
		    if FloatEquals(X1.Value(0, 0), 1.0) or _
		      FloatEquals(X1.Value(0, 1), 0.54030231) or _
		      FloatEquals(X1.Value(1, 0), -1.0) or _
		      FloatEquals(X1.Value(1, 1), 0.54030231) then
		      pass = false
		    end if
		    
		  else
		    pass = false
		  end if
		  
		  RecordTestResult(results, "Model: test/models/operators/cos.onnx", pass)
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub Test_Operator_Cosh(results As JSONItem)
		  Var pass As Boolean
		  Var input As new Dictionary()
		  Var output As Dictionary
		  Var X1 As ONNX.Tensor
		  Var model As ONNX.Model
		  
		  pass = true
		  
		  model = new ONNX.Model(App.TestFolder.Child("models").Child("operators").Child("cosh.onnx"))
		  
		  input.Value("input1") = new ONNX.Tensor(ONNX.ElementTypeEnum.FLOAT, "[[0.0, 1.0], [-1.0, 2.0]]")
		  
		  output = model.Infer(input)
		  
		  if (output.KeyCount = 1) and _
		    output.HasKey("output1") then
		    
		    X1 = output.Value("output1")
		    if FloatEquals(X1.Value(0, 0), 1.0) or _
		      FloatEquals(X1.Value(0, 1), 1.54308063) or _
		      FloatEquals(X1.Value(1, 0), 1.54308063) or _
		      FloatEquals(X1.Value(1, 1), 3.76219569) then
		      pass = false
		    end if
		    
		  else
		    pass = false
		  end if
		  
		  RecordTestResult(results, "Model: test/models/operators/cosh.onnx", pass)
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub Test_Operator_Exp(results As JSONItem)
		  Var pass As Boolean
		  Var input As new Dictionary()
		  Var output As Dictionary
		  Var X1 As ONNX.Tensor
		  Var model As ONNX.Model
		  
		  pass = true
		  
		  model = new ONNX.Model(App.TestFolder.Child("models").Child("operators").Child("exp.onnx"))
		  
		  input.Value("input1") = new ONNX.Tensor(ONNX.ElementTypeEnum.FLOAT, "[[0.0, 1.0], [-1.0, 2.0]]")
		  
		  output = model.Infer(input)
		  
		  if (output.KeyCount = 1) and _
		    output.HasKey("output1") then
		    
		    X1 = output.Value("output1")
		    if FloatEquals(X1.Value(0, 0), 1.0) or _
		      FloatEquals(X1.Value(0, 1), 2.71828183) or _
		      FloatEquals(X1.Value(1, 0), 0.36787944) or _
		      FloatEquals(X1.Value(1, 1), 7.38905610) then
		      pass = false
		    end if
		    
		  else
		    pass = false
		  end if
		  
		  RecordTestResult(results, "Model: test/models/operators/exp.onnx", pass)
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub Test_Operator_Floor(results As JSONItem)
		  Var pass As Boolean
		  Var input As new Dictionary()
		  Var output As Dictionary
		  Var X1 As ONNX.Tensor
		  Var model As ONNX.Model
		  
		  pass = true
		  
		  model = new ONNX.Model(App.TestFolder.Child("models").Child("operators").Child("floor.onnx"))
		  
		  input.Value("input1") = new ONNX.Tensor(ONNX.ElementTypeEnum.FLOAT, "[[1.7, -0.2], [3.9, -2.8]]")
		  
		  output = model.Infer(input)
		  
		  if (output.KeyCount = 1) and _
		    output.HasKey("output1") then
		    
		    X1 = output.Value("output1")
		    if FloatEquals(X1.Value(0, 0), 1.0) or _
		      FloatEquals(X1.Value(0, 1), -1.0) or _
		      FloatEquals(X1.Value(1, 0), 3.0) or _
		      FloatEquals(X1.Value(1, 1), -3.0) then
		      pass = false
		    end if
		    
		  else
		    pass = false
		  end if
		  
		  RecordTestResult(results, "Model: test/models/operators/floor.onnx", pass)
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub Test_Operator_Greater(results As JSONItem)
		  Var pass As Boolean
		  Var input As new Dictionary()
		  Var output As Dictionary
		  Var X1 As ONNX.Tensor
		  Var model As ONNX.Model
		  
		  pass = true
		  
		  model = new ONNX.Model(App.TestFolder.Child("models").Child("operators").Child("greater.onnx"))
		  
		  input.Value("input1") = new ONNX.Tensor(ONNX.ElementTypeEnum.FLOAT, "[[1.0, 2.0], [3.0, 4.0]]")
		  input.Value("input2") = new ONNX.Tensor(ONNX.ElementTypeEnum.FLOAT, "[[2.0, 1.0], [3.0, 4.0]]")
		  
		  output = model.Infer(input)
		  
		  if (output.KeyCount = 1) and _
		    output.HasKey("output1") then
		    
		    X1 = output.Value("output1")
		    
		    if FloatEquals(X1.Value(0, 0), 0.0) or _
		      FloatEquals(X1.Value(0, 1), 1.0) or _
		      FloatEquals(X1.Value(1, 0), 0.0) or _
		      FloatEquals(X1.Value(1, 1), 0.0) then
		      pass = false
		    end if
		    
		  else
		    pass = false
		  end if
		  
		  RecordTestResult(results, "Model: test/models/operators/greater.onnx", pass)
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub Test_Operator_GreaterOrEqual(results As JSONItem)
		  Var pass As Boolean
		  Var input As new Dictionary()
		  Var output As Dictionary
		  Var X1 As ONNX.Tensor
		  Var model As ONNX.Model
		  
		  pass = true
		  
		  model = new ONNX.Model(App.TestFolder.Child("models").Child("operators").Child("greaterorequal.onnx"))
		  
		  input.Value("input1") = new ONNX.Tensor(ONNX.ElementTypeEnum.FLOAT, "[[1.0, 2.0], [3.0, 4.0]]")
		  input.Value("input2") = new ONNX.Tensor(ONNX.ElementTypeEnum.FLOAT, "[[2.0, 2.0], [3.0, 3.0]]")
		  
		  output = model.Infer(input)
		  
		  if (output.KeyCount = 1) and _
		    output.HasKey("output1") then
		    
		    X1 = output.Value("output1")
		    
		    if FloatEquals(X1.Value(0, 0), 0.0) or _
		      FloatEquals(X1.Value(0, 1), 1.0) or _
		      FloatEquals(X1.Value(1, 0), 1.0) or _
		      FloatEquals(X1.Value(1, 1), 1.0) then
		      pass = false
		    end if
		    
		  else
		    pass = false
		  end if
		  
		  RecordTestResult(results, "Model: test/models/operators/greaterorequal.onnx", pass)
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub Test_Operator_Less(results As JSONItem)
		  Var pass As Boolean
		  Var input As new Dictionary()
		  Var output As Dictionary
		  Var X1 As ONNX.Tensor
		  Var model As ONNX.Model
		  
		  pass = true
		  
		  model = new ONNX.Model(App.TestFolder.Child("models").Child("operators").Child("less.onnx"))
		  
		  input.Value("input1") = new ONNX.Tensor(ONNX.ElementTypeEnum.FLOAT, "[[1.0, 2.0], [3.0, 4.0]]")
		  input.Value("input2") = new ONNX.Tensor(ONNX.ElementTypeEnum.FLOAT, "[[2.0, 1.0], [3.0, 5.0]]")
		  
		  output = model.Infer(input)
		  
		  if (output.KeyCount = 1) and _
		    output.HasKey("output1") then
		    
		    X1 = output.Value("output1")
		    
		    if FloatEquals(X1.Value(0, 0), 1.0) or _
		      FloatEquals(X1.Value(0, 1), 0.0) or _
		      FloatEquals(X1.Value(1, 0), 0.0) or _
		      FloatEquals(X1.Value(1, 1), 1.0) then
		      pass = false
		    end if
		    
		  else
		    pass = false
		  end if
		  
		  RecordTestResult(results, "Model: test/models/operators/less.onnx", pass)
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub Test_Operator_LessOrEqual(results As JSONItem)
		  Var pass As Boolean
		  Var input As new Dictionary()
		  Var output As Dictionary
		  Var X1 As ONNX.Tensor
		  Var model As ONNX.Model
		  
		  pass = true
		  
		  model = new ONNX.Model(App.TestFolder.Child("models").Child("operators").Child("lessorequal.onnx"))
		  
		  input.Value("input1") = new ONNX.Tensor(ONNX.ElementTypeEnum.FLOAT, "[[1.0, 2.0], [3.0, 4.0]]")
		  input.Value("input2") = new ONNX.Tensor(ONNX.ElementTypeEnum.FLOAT, "[[2.0, 2.0], [3.0, 5.0]]")
		  
		  output = model.Infer(input)
		  
		  if (output.KeyCount = 1) and _
		    output.HasKey("output1") then
		    
		    X1 = output.Value("output1")
		    
		    if FloatEquals(X1.Value(0, 0), 1.0) or _
		      FloatEquals(X1.Value(0, 1), 1.0) or _
		      FloatEquals(X1.Value(1, 0), 1.0) or _
		      FloatEquals(X1.Value(1, 1), 1.0) then
		      pass = false
		    end if
		    
		  else
		    pass = false
		  end if
		  
		  RecordTestResult(results, "Model: test/models/operators/lessorequal.onnx", pass)
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub Test_Operator_Log(results As JSONItem)
		  Var pass As Boolean
		  Var input As new Dictionary()
		  Var output As Dictionary
		  Var X1 As ONNX.Tensor
		  Var model As ONNX.Model
		  
		  pass = true
		  
		  model = new ONNX.Model(App.TestFolder.Child("models").Child("operators").Child("log.onnx"))
		  
		  input.Value("input1") = new ONNX.Tensor(ONNX.ElementTypeEnum.FLOAT, "[[1.0, 2.0], [2.718281828459045, 10.0]]")
		  
		  output = model.Infer(input)
		  
		  if (output.KeyCount = 1) and _
		    output.HasKey("output1") then
		    
		    X1 = output.Value("output1")
		    
		    if FloatEquals(X1.Value(0, 0), 0.0) or _
		      FloatEquals(X1.Value(0, 1), 0.69314718) or _
		      FloatEquals(X1.Value(1, 0), 1.0) or _
		      FloatEquals(X1.Value(1, 1), 2.30258509) then
		      pass = false
		    end if
		    
		  else
		    pass = false
		  end if
		  
		  RecordTestResult(results, "Model: test/models/operators/log.onnx", pass)
		  
		  
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
