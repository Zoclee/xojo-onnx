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
		  
		  Tensor.Test_Abs(results)
		  Tensor.Test_Acos(results)
		  Tensor.Test_Acosh(results)
		  Tensor.Test_Add(results)
		  Tensor.Test_Asin(results)
		  Tensor.Test_Asinh(results)
		  Tensor.Test_Atan(results)
		  Tensor.Test_Atanh(results)
		  Tensor.Test_Ceil(results)
		  Tensor.Test_Cos(results)
		  Tensor.Test_Cosh(results)
		  Tensor.Test_Exp(results)
		  Tensor.Test_Floor(results)
		  Tensor.Test_Greater(results)
		  Tensor.Test_GreaterOrEqual(results)
		  Tensor.Test_Less(results)
		  Tensor.Test_LessOrEqual(results)
		  Tensor.Test_Log(results)
		  Tensor.Test_LogicalAnd(results)
		  Tensor.Test_LogicalNot(results)
		  Tensor.Test_LogicalOr(results)
		  Tensor.Test_MatMul(results)
		  Tensor.Test_Max(results)
		  Tensor.Test_Min(results)
		  Tensor.Test_Mul(results)
		  Tensor.Test_Neg(results)
		  Tensor.Test_Pow(results)
		  Tensor.Test_Reciprocal(results)
		  Tensor.Test_Relu(results)
		  Tensor.Test_Sigmoid(results)
		  Tensor.Test_Sign(results)
		  Tensor.Test_Sin(results)
		  Tensor.Test_Sinh(results)
		  Tensor.Test_Softmax(results)
		  Tensor.Test_Sqrt(results)
		  Tensor.Test_Subtract(results)
		  Tensor.Test_Tan(results)
		  Tensor.Test_Tanh(results)
		  
		  Node.Test_Evaluate_Abs(results)
		  Node.Test_Evaluate_Acos(results)
		  Node.Test_Evaluate_Acosh(results)
		  Node.Test_Evaluate_Add(results)
		  Node.Test_Evaluate_Asin(results)
		  
		  return results
		  
		End Function
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
