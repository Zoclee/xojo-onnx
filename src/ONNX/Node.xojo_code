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
		    Evaluate_abs(data)
		    
		  case ONNX.OperatorEnum.Acos
		    Evaluate_acos(data)
		    
		  case ONNX.OperatorEnum.Acosh
		    Evaluate_acosh(data)
		    
		  case ONNX.OperatorEnum.Add
		    Evaluate_add(data)
		    
		  case ONNX.OperatorEnum.Asin
		    Evaluate_asin(data)
		    
		  case ONNX.OperatorEnum.Asinh
		    Evaluate_asinh(data)
		    
		  case ONNX.OperatorEnum.Atan
		    Evaluate_atan(data)
		    
		  case ONNX.OperatorEnum.Atanh
		    Evaluate_atanh(data)
		    
		  case ONNX.OperatorEnum.Ceil
		    Evaluate_ceil(data)
		    
		  case ONNX.OperatorEnum.Cos
		    Evaluate_cos(data)
		    
		  case ONNX.OperatorEnum.Cosh
		    Evaluate_cosh(data)
		    
		  case ONNX.OperatorEnum.Exp
		    Evaluate_exp(data)
		    
		  case ONNX.OperatorEnum.MatMul
		    Evaluate_matmul(data)
		    
		  case ONNX.OperatorEnum.Relu
		    Evaluate_relu(data)
		    
		  case ONNX.OperatorEnum.Sigmoid
		    Evaluate_sigmoid(data)
		    
		  case ONNX.OperatorEnum.Softmax
		    Evaluate_softmax(data)
		    
		  case ONNX.OperatorEnum.Tanh
		    Evaluate_tanh(data)
		    
		  case else 
		    break // TODO: implement operator
		    
		  end select
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub Evaluate_abs(data As Dictionary)
		  Var a As ONNX.Tensor
		  
		  a = data.Value(mInputs(0))
		  
		  data.Value(mOutputs(0)) = a.Abs()
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub Evaluate_acos(data As Dictionary)
		  Var a As ONNX.Tensor
		  
		  a = data.Value(mInputs(0))
		  
		  data.Value(mOutputs(0)) = a.Acos()
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub Evaluate_acosh(data As Dictionary)
		  Var a As ONNX.Tensor
		  
		  a = data.Value(mInputs(0))
		  
		  data.Value(mOutputs(0)) = a.Acosh()
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub Evaluate_add(data As Dictionary)
		  Var a As ONNX.Tensor
		  Var b As ONNX.Tensor
		  
		  a = data.Value(mInputs(0))
		  b = data.Value(mInputs(1))
		  
		  data.Value(mOutputs(0)) = a.Add(b)
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub Evaluate_asin(data As Dictionary)
		  Var a As ONNX.Tensor
		  
		  a = data.Value(mInputs(0))
		  
		  data.Value(mOutputs(0)) = a.Asin()
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub Evaluate_asinh(data As Dictionary)
		  Var a As ONNX.Tensor
		  
		  a = data.Value(mInputs(0))
		  
		  data.Value(mOutputs(0)) = a.Asinh()
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub Evaluate_atan(data As Dictionary)
		  Var a As ONNX.Tensor
		  
		  a = data.Value(mInputs(0))
		  
		  data.Value(mOutputs(0)) = a.Atan()
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub Evaluate_atanh(data As Dictionary)
		  Var a As ONNX.Tensor
		  
		  a = data.Value(mInputs(0))
		  
		  data.Value(mOutputs(0)) = a.Atan()
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub Evaluate_ceil(data As Dictionary)
		  Var a As ONNX.Tensor
		  
		  a = data.Value(mInputs(0))
		  
		  data.Value(mOutputs(0)) = a.Ceil()
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub Evaluate_cos(data As Dictionary)
		  Var a As ONNX.Tensor
		  
		  a = data.Value(mInputs(0))
		  
		  data.Value(mOutputs(0)) = a.Cos()
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub Evaluate_cosh(data As Dictionary)
		  Var a As ONNX.Tensor
		  
		  a = data.Value(mInputs(0))
		  
		  data.Value(mOutputs(0)) = a.Cosh()
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub Evaluate_exp(data As Dictionary)
		  Var a As ONNX.Tensor
		  
		  a = data.Value(mInputs(0))
		  
		  data.Value(mOutputs(0)) = a.Exp()
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub Evaluate_matmul(data As Dictionary)
		  Var a As ONNX.Tensor
		  Var b As ONNX.Tensor
		  
		  a = data.Value(mInputs(0))
		  b = data.Value(mInputs(1))
		  
		  data.Value(mOutputs(0)) = a.MatMul(b)
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub Evaluate_relu(data As Dictionary)
		  Var a As ONNX.Tensor
		  
		  a = data.Value(mInputs(0))
		  
		  data.Value(mOutputs(0)) = a.Relu()
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub Evaluate_sigmoid(data As Dictionary)
		  Var a As ONNX.Tensor
		  
		  a = data.Value(mInputs(0))
		  
		  data.Value(mOutputs(0)) = a.Sigmoid()
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub Evaluate_softmax(data As Dictionary)
		  Var a As ONNX.Tensor
		  Var axis As Integer = -1
		  
		  break // TODO: get axis attribute
		  
		  a = data.Value(mInputs(0))
		  
		  data.Value(mOutputs(0)) = a.Softmax(axis)
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub Evaluate_tanh(data As Dictionary)
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
