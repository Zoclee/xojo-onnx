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
		    
		  case ONNX.OperatorEnum.Add
		    Evaluate_Add(data)
		    
		  case ONNX.OperatorEnum.MatMul
		    Evaluate_MatMul(data)
		    
		  case ONNX.OperatorEnum.Relu
		    Evaluate_Relu(data)
		    
		  case ONNX.OperatorEnum.Sigmoid
		    Evaluate_Sigmoid(data)
		    
		  case ONNX.OperatorEnum.Softmax
		    Evaluate_Softmax(data)
		    
		  case ONNX.OperatorEnum.Tanh
		    Evaluate_tanh(data)
		    
		  case else 
		    break // TODO: implement operator
		    
		  end select
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
		Private Sub Evaluate_matMul(data As Dictionary)
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
		  
		  data.Value(mOutputs(0)) = a.Softmax()
		  
		  
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
