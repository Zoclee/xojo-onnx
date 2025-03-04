#tag Class
Protected Class Node
	#tag Method, Flags = &h0
		Sub Constructor(initOperator As ONNX.OperatorEnum, initInputs() As String, initOutputs() As String)
		  Var i As Integer
		  
		  mOperator = initOperator
		  
		  Redim mInputs(-1)
		  i = 0
		  while i < initInputs.Count
		    mInputs.Add initInputs(i)
		    i = i + 1
		  wend
		  
		  Redim mOutputs(-1)
		  i = 0
		  while i < initOutputs.Count
		    mOutputs.Add initOutputs(i)
		    i = i + 1
		  wend
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Evaluate(data As Dictionary)
		  select case mOperator
		    
		  case ONNX.OperatorEnum.Abs
		    Evaluate_Abs(data)
		    
		  case ONNX.OperatorEnum.Acos
		    Evaluate_Acos(data)
		    
		  case ONNX.OperatorEnum.Acosh
		    Evaluate_Acosh(data)
		    
		  case ONNX.OperatorEnum.Add
		    Evaluate_Add(data)
		    
		  case ONNX.OperatorEnum.Asin
		    Evaluate_Asin(data)
		    
		  case ONNX.OperatorEnum.Asinh
		    Evaluate_Asinh(data)
		    
		  case ONNX.OperatorEnum.Atan
		    Evaluate_Atan(data)
		    
		  case ONNX.OperatorEnum.Atanh
		    Evaluate_Atanh(data)
		    
		  case ONNX.OperatorEnum.Ceil
		    Evaluate_Ceil(data)
		    
		  case ONNX.OperatorEnum.Cos
		    Evaluate_Cos(data)
		    
		  case ONNX.OperatorEnum.Cosh
		    Evaluate_Cosh(data)
		    
		  case ONNX.OperatorEnum.Exp
		    Evaluate_Exp(data)
		    
		  case ONNX.OperatorEnum.Floor
		    Evaluate_Floor(data)
		    
		  case ONNX.OperatorEnum.Greater
		    Evaluate_Greater(data)
		    
		  case ONNX.OperatorEnum.Less
		    Evaluate_Less(data)
		    
		  case ONNX.OperatorEnum.LessOrEqual
		    Evaluate_LessOrEqual(data)
		    
		  case ONNX.OperatorEnum.Log
		    Evaluate_Log(data)
		    
		  case ONNX.OperatorEnum.LogicalAnd
		    Evaluate_LogicalAnd(data)
		    
		  case ONNX.OperatorEnum.LogicalNot
		    Evaluate_LogicalNot(data)
		    
		  case ONNX.OperatorEnum.LogicalOr
		    Evaluate_LogicalOr(data)
		    
		  case ONNX.OperatorEnum.MatMul
		    Evaluate_Matmul(data)
		    
		  case ONNX.OperatorEnum.Max
		    Evaluate_Max(data)
		    
		  case ONNX.OperatorEnum.Min
		    Evaluate_Min(data)
		    
		  case ONNX.OperatorEnum.Mul
		    Evaluate_Mul(data)
		    
		  case ONNX.OperatorEnum.Neg
		    Evaluate_Neg(data)
		    
		  case ONNX.OperatorEnum.Pow
		    Evaluate_Pow(data)
		    
		  case ONNX.OperatorEnum.Reciprocal
		    Evaluate_Reciprocal(data)
		    
		  case ONNX.OperatorEnum.Relu
		    Evaluate_Relu(data)
		    
		  case ONNX.OperatorEnum.Sigmoid
		    Evaluate_Sigmoid(data)
		    
		  case ONNX.OperatorEnum.Sign
		    Evaluate_Sign(data)
		    
		  case ONNX.OperatorEnum.Sin
		    Evaluate_Sin(data)
		    
		  case ONNX.OperatorEnum.Sinh
		    Evaluate_Sinh(data)
		    
		  case ONNX.OperatorEnum.Softmax
		    Evaluate_Softmax(data)
		    
		  case ONNX.OperatorEnum.Tanh
		    Evaluate_Tanh(data)
		    
		  case else 
		    break // TODO: implement operator
		    
		  end select
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub Evaluate_Abs(data As Dictionary)
		  Var a As ONNX.Tensor
		  
		  a = data.Value(mInputs(0))
		  
		  data.Value(mOutputs(0)) = a.Abs()
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub Evaluate_Acos(data As Dictionary)
		  Var a As ONNX.Tensor
		  
		  a = data.Value(mInputs(0))
		  
		  data.Value(mOutputs(0)) = a.Acos()
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub Evaluate_Acosh(data As Dictionary)
		  Var a As ONNX.Tensor
		  
		  a = data.Value(mInputs(0))
		  
		  data.Value(mOutputs(0)) = a.Acosh()
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub Evaluate_Add(data As Dictionary)
		  Var a As ONNX.Tensor
		  Var b As ONNX.Tensor
		  
		  a = data.Value(mInputs(0))
		  b = data.Value(mInputs(1))
		  
		  data.Value(mOutputs(0)) = a.Add(b)
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub Evaluate_Asin(data As Dictionary)
		  Var a As ONNX.Tensor
		  
		  a = data.Value(mInputs(0))
		  
		  data.Value(mOutputs(0)) = a.Asin()
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub Evaluate_Asinh(data As Dictionary)
		  Var a As ONNX.Tensor
		  
		  a = data.Value(mInputs(0))
		  
		  data.Value(mOutputs(0)) = a.Asinh()
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub Evaluate_Atan(data As Dictionary)
		  Var a As ONNX.Tensor
		  
		  a = data.Value(mInputs(0))
		  
		  data.Value(mOutputs(0)) = a.Atan()
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub Evaluate_Atanh(data As Dictionary)
		  Var a As ONNX.Tensor
		  
		  a = data.Value(mInputs(0))
		  
		  data.Value(mOutputs(0)) = a.Atan()
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub Evaluate_Ceil(data As Dictionary)
		  Var a As ONNX.Tensor
		  
		  a = data.Value(mInputs(0))
		  
		  data.Value(mOutputs(0)) = a.Ceil()
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub Evaluate_Cos(data As Dictionary)
		  Var a As ONNX.Tensor
		  
		  a = data.Value(mInputs(0))
		  
		  data.Value(mOutputs(0)) = a.Cos()
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub Evaluate_Cosh(data As Dictionary)
		  Var a As ONNX.Tensor
		  
		  a = data.Value(mInputs(0))
		  
		  data.Value(mOutputs(0)) = a.Cosh()
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub Evaluate_Exp(data As Dictionary)
		  Var a As ONNX.Tensor
		  
		  a = data.Value(mInputs(0))
		  
		  data.Value(mOutputs(0)) = a.Exp()
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub Evaluate_Floor(data As Dictionary)
		  Var a As ONNX.Tensor
		  
		  a = data.Value(mInputs(0))
		  
		  data.Value(mOutputs(0)) = a.Floor()
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub Evaluate_Greater(data As Dictionary)
		  Var a As ONNX.Tensor
		  Var b As ONNX.Tensor
		  
		  a = data.Value(mInputs(0))
		  b = data.Value(mInputs(1))
		  
		  data.Value(mOutputs(0)) = a.Greater(b)
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub Evaluate_GreaterOrEqual(data As Dictionary)
		  Var a As ONNX.Tensor
		  Var b As ONNX.Tensor
		  
		  a = data.Value(mInputs(0))
		  b = data.Value(mInputs(1))
		  
		  data.Value(mOutputs(0)) = a.GreaterOrEqual(b)
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub Evaluate_Less(data As Dictionary)
		  Var a As ONNX.Tensor
		  Var b As ONNX.Tensor
		  
		  a = data.Value(mInputs(0))
		  b = data.Value(mInputs(1))
		  
		  data.Value(mOutputs(0)) = a.Less(b)
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub Evaluate_LessOrEqual(data As Dictionary)
		  Var a As ONNX.Tensor
		  Var b As ONNX.Tensor
		  
		  a = data.Value(mInputs(0))
		  b = data.Value(mInputs(1))
		  
		  data.Value(mOutputs(0)) = a.LessOrEqual(b)
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub Evaluate_Log(data As Dictionary)
		  Var a As ONNX.Tensor
		  
		  a = data.Value(mInputs(0))
		  
		  data.Value(mOutputs(0)) = a.Log()
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub Evaluate_LogicalAnd(data As Dictionary)
		  Var a As ONNX.Tensor
		  Var b As ONNX.Tensor
		  
		  a = data.Value(mInputs(0))
		  b = data.Value(mInputs(1))
		  
		  data.Value(mOutputs(0)) = a.LogicalAnd(b)
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub Evaluate_LogicalNot(data As Dictionary)
		  Var a As ONNX.Tensor
		  
		  a = data.Value(mInputs(0))
		  
		  data.Value(mOutputs(0)) = a.LogicalNot()
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub Evaluate_LogicalOr(data As Dictionary)
		  Var a As ONNX.Tensor
		  Var b As ONNX.Tensor
		  
		  a = data.Value(mInputs(0))
		  b = data.Value(mInputs(1))
		  
		  data.Value(mOutputs(0)) = a.LogicalOr(b)
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub Evaluate_MatMul(data As Dictionary)
		  Var a As ONNX.Tensor
		  Var b As ONNX.Tensor
		  
		  a = data.Value(mInputs(0))
		  b = data.Value(mInputs(1))
		  
		  data.Value(mOutputs(0)) = a.MatMul(b)
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub Evaluate_Max(data As Dictionary)
		  Var a As ONNX.Tensor
		  Var b As ONNX.Tensor
		  
		  a = data.Value(mInputs(0))
		  b = data.Value(mInputs(1))
		  
		  data.Value(mOutputs(0)) = a.Max(b)
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub Evaluate_Min(data As Dictionary)
		  Var a As ONNX.Tensor
		  Var b As ONNX.Tensor
		  
		  a = data.Value(mInputs(0))
		  b = data.Value(mInputs(1))
		  
		  data.Value(mOutputs(0)) = a.Min(b)
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub Evaluate_Mul(data As Dictionary)
		  Var a As ONNX.Tensor
		  Var b As ONNX.Tensor
		  
		  a = data.Value(mInputs(0))
		  b = data.Value(mInputs(1))
		  
		  data.Value(mOutputs(0)) = a.Mul(b)
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub Evaluate_Neg(data As Dictionary)
		  Var a As ONNX.Tensor
		  
		  a = data.Value(mInputs(0))
		  
		  data.Value(mOutputs(0)) = a.Neg()
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub Evaluate_Pow(data As Dictionary)
		  Var a As ONNX.Tensor
		  Var b As ONNX.Tensor
		  
		  a = data.Value(mInputs(0))
		  b = data.Value(mInputs(1))
		  
		  data.Value(mOutputs(0)) = a.Pow(b)
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub Evaluate_Reciprocal(data As Dictionary)
		  Var a As ONNX.Tensor
		  
		  a = data.Value(mInputs(0))
		  
		  data.Value(mOutputs(0)) = a.Reciprocal()
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub Evaluate_Relu(data As Dictionary)
		  Var a As ONNX.Tensor
		  
		  a = data.Value(mInputs(0))
		  
		  data.Value(mOutputs(0)) = a.Relu()
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub Evaluate_Sigmoid(data As Dictionary)
		  Var a As ONNX.Tensor
		  
		  a = data.Value(mInputs(0))
		  
		  data.Value(mOutputs(0)) = a.Sigmoid()
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub Evaluate_Sign(data As Dictionary)
		  Var a As ONNX.Tensor
		  
		  a = data.Value(mInputs(0))
		  
		  data.Value(mOutputs(0)) = a.Sign()
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub Evaluate_Sin(data As Dictionary)
		  Var a As ONNX.Tensor
		  
		  a = data.Value(mInputs(0))
		  
		  data.Value(mOutputs(0)) = a.Sin()
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub Evaluate_Sinh(data As Dictionary)
		  Var a As ONNX.Tensor
		  
		  a = data.Value(mInputs(0))
		  
		  data.Value(mOutputs(0)) = a.Sinh()
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub Evaluate_Softmax(data As Dictionary)
		  Var a As ONNX.Tensor
		  Var axis As Integer = -1
		  
		  break // TODO: get axis attribute
		  
		  a = data.Value(mInputs(0))
		  
		  data.Value(mOutputs(0)) = a.Softmax(axis)
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub Evaluate_Tanh(data As Dictionary)
		  Var a As ONNX.Tensor
		  
		  a = data.Value(mInputs(0))
		  
		  data.Value(mOutputs(0)) = a.Tanh()
		  
		  
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h21
		Private mInputs() As String
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mOperator As ONNX.OperatorEnum
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mOutputs() As String
	#tag EndProperty


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
End Class
#tag EndClass
