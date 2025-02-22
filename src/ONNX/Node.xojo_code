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
