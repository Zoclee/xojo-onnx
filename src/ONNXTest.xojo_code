#tag Module
Protected Module ONNXTest
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
		  
		  Test_Tensor_Add(results)
		  Test_Tensor_MatMul(results)
		  Test_Tensor_Relu(results)
		  Test_Tensor_Sigmoid(results)
		  
		  return results
		  
		End Function
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
		  
		  if (t3.Value(0, 0) <> 3) or _
		    (t3.Value(0, 1) <> 5) or _
		    (t3.Value(0, 2) <> 10) or _
		    (t3.Value(1, 0) <> 7) or _
		    (t3.Value(1, 1) <> 13) or _
		    (t3.Value(1, 2) <> 8) then
		    pass = false
		  end if
		  
		  //// test 2
		  //
		  //if pass then
		  //
		  //t1.Add(t2)
		  //
		  //if (t1.Value(0, 0) <> 3) or _
		  //(t1.Value(0, 1) <> 5) or _
		  //(t1.Value(0, 2) <> 10) or _
		  //(t1.Value(1, 0) <> 7) or _
		  //(t1.Value(1, 1) <> 13) or _
		  //(t1.Value(1, 2) <> 8) then
		  //pass = false
		  //end if
		  //
		  //end if
		  
		  RecordTestResult(results, "Tensor.Add", pass)
		  
		  
		  
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
		    (t3.Value(0, 0) <> 13) or _
		    (t3.Value(0, 1) <> 25) or _
		    (t3.Value(0, 2) <> 11) or _
		    (t3.Value(1, 0) <> 21) or _
		    (t3.Value(1, 1) <> 15) or _
		    (t3.Value(1, 2) <> 7) or _
		    (t3.Value(2, 0) <> 27) or _
		    (t3.Value(2, 1) <> 24) or _
		    (t3.Value(2, 2) <> 11) then
		    pass = false
		  end if
		  
		  RecordTestResult(results, "Tensor.MatMul", pass)
		  
		  
		  
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
		  
		  if (t2.Value(0, 0) <> 1) or _
		    (t2.Value(0, 1) <> 0) or _
		    (t2.Value(0, 2) <> 3) or _
		    (t2.Value(1, 0) <> 0) or _
		    (t2.Value(1, 1) <> 0) or _
		    (t2.Value(1, 2) <> 6) then
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
		  
		  if (Abs(t2.Value(0, 0) - 0.62245933120185) > 0.000001) or _
		    (Abs(t2.Value(0, 1) - 0.73105857863) > 0.000001) or _
		    (Abs(t2.Value(0, 2) - 0.11920292202212) > 0.000001) then
		    pass = false
		  end if
		  
		  RecordTestResult(results, "Tensor.Sigmoid", pass)
		  
		  
		  
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
