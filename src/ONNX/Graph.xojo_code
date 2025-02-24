#tag Class
Protected Class Graph
	#tag Method, Flags = &h0
		Sub Constructor(initNodes() As ONNX.Node, initName As String, initInputs() As ONNX.Tensor, initOutputs() As ONNX.Tensor)
		  Var i As Integer
		  
		  Redim mNodes(-1)
		  i = 0
		  while i < initNodes.Count
		    mNodes.Add initNodes(i)
		    i = i + 1
		  wend
		  
		  mName = initName
		  
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
		Function Evaluate(input As Dictionary) As Dictionary
		  Var output As new Dictionary()
		  Var data As new Dictionary()
		  Var i As Integer
		  
		  // set up data with input tensors
		  
		  i = 0
		  while i < input.KeyCount
		    data.Value(input.Key(i)) = input.Value(input.Key(i))
		    i = i + 1
		  wend
		  
		  i = 0
		  while i < mNodes.Count
		    mNodes(i).Evaluate(data)
		    i = i + 1
		  wend
		  
		  // extract output tensors from data
		  
		  i = 0
		  while i < mOutputs.Count
		    output.Value(mOutputs(i).Name) = data.Value(mOutputs(i).Name)
		    i = i + 1
		  wend
		  
		  return output
		End Function
	#tag EndMethod


	#tag Property, Flags = &h21
		Private mInputs() As ONNX.Tensor
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mName As String
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mNodes() As ONNX.Node
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mOutputs() As ONNX.Tensor
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
