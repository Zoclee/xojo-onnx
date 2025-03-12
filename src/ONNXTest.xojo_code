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
		  
		  results.Value("starttime") = System.Microseconds()
		  results.Value("endtime") = 0
		  results.Value("endtime") = 0
		  results.Value("tests") = 0
		  results.Value("pass") = 0
		  results.Value("fail") = 0
		  results.Value("success") = true
		  results.Value("log") = new JSONItem("[]")
		  
		  TestTensor(results)
		  TestNode(results)
		  TestGraph(results)
		  TestModel(results)
		  
		  results.Value("endtime") = System.Microseconds()
		  
		  return results
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub TestGraph(results As JSONItem)
		  Graph.Test_Evaluate1Node(results)
		  Graph.Test_Evaluate2Nodes(results)
		  Graph.Test_Evaluate2Outputs(results)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub TestModel(results As JSONItem)
		  Model.Test_Operator_Abs(results)
		  Model.Test_Operator_Acos(results)
		  Model.Test_Operator_Acosh(results)
		  Model.Test_Operator_Add(results)
		  Model.Test_Operator_Asin(results)
		  Model.Test_Operator_Asinh(results)
		  Model.Test_Operator_Atan(results)
		  Model.Test_Operator_Atanh(results)
		  Model.Test_Operator_Ceil(results)
		  Model.Test_Operator_Cos(results)
		  Model.Test_Operator_Cosh(results)
		  Model.Test_Operator_Exp(results)
		  Model.Test_Operator_Floor(results)
		  Model.Test_Operator_Greater(results)
		  Model.Test_Operator_GreaterOrEqual(results)
		  Model.Test_Operator_Less(results)
		  Model.Test_Operator_LessOrEqual(results)
		  Model.Test_Operator_Log(results)
		  Model.Test_Operator_LogicalAnd(results)
		  Model.Test_Operator_LogicalNot(results)
		  Model.Test_Operator_LogicalOr(results)
		  Model.Test_Operator_MatMul(results)
		  Model.Test_Operator_Max(results)
		  Model.Test_Operator_Min(results)
		  Model.Test_Operator_Mul(results)
		  Model.Test_Operator_Neg(results)
		  Model.Test_Operator_Pow(results)
		  Model.Test_Operator_Reciprocal(results)
		  Model.Test_Operator_Relu(results)
		  Model.Test_Operator_Sigmoid(results)
		  Model.Test_Operator_Sign(results)
		  Model.Test_Operator_Sin(results)
		  Model.Test_Operator_Sinh(results)
		  Model.Test_Operator_Softmax(results)
		  Model.Test_Operator_Sqrt(results)
		  Model.Test_Operator_Subtract(results)
		  Model.Test_Operator_Tan(results)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub TestNode(results As JSONItem)
		  Node.Test_Evaluate_Abs(results)
		  Node.Test_Evaluate_Acos(results)
		  Node.Test_Evaluate_Acosh(results)
		  Node.Test_Evaluate_Add(results)
		  Node.Test_Evaluate_Asin(results)
		  Node.Test_Evaluate_Asinh(results)
		  Node.Test_Evaluate_Atan(results)
		  Node.Test_Evaluate_Atanh(results)
		  Node.Test_Evaluate_Ceil(results)
		  Node.Test_Evaluate_Cos(results)
		  Node.Test_Evaluate_Cosh(results)
		  Node.Test_Evaluate_Exp(results)
		  Node.Test_Evaluate_Floor(results)
		  Node.Test_Evaluate_Greater(results)
		  Node.Test_Evaluate_GreaterOrEqual(results)
		  Node.Test_Evaluate_Less(results)
		  Node.Test_Evaluate_LessOrEqual(results)
		  Node.Test_Evaluate_Log(results)
		  Node.Test_Evaluate_LogicalAnd(results)
		  Node.Test_Evaluate_LogicalNot(results)
		  Node.Test_Evaluate_LogicalOr(results)
		  Node.Test_Evaluate_MatMul(results)
		  Node.Test_Evaluate_Max(results)
		  Node.Test_Evaluate_Min(results)
		  Node.Test_Evaluate_Mul(results)
		  Node.Test_Evaluate_Neg(results)
		  Node.Test_Evaluate_Pow(results)
		  Node.Test_Evaluate_Reciprocal(results)
		  Node.Test_Evaluate_Relu(results)
		  Node.Test_Evaluate_Sigmoid(results)
		  Node.Test_Evaluate_Sign(results)
		  Node.Test_Evaluate_Sin(results)
		  Node.Test_Evaluate_Sinh(results)
		  Node.Test_Evaluate_Softmax(results)
		  Node.Test_Evaluate_Sqrt(results)
		  Node.Test_Evaluate_Subtract(results)
		  Node.Test_Evaluate_Tan(results)
		  Node.Test_Evaluate_Tanh(results)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub TestTensor(results As JSONItem)
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
