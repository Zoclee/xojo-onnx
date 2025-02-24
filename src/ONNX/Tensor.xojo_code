#tag Class
Protected Class Tensor
	#tag Method, Flags = &h0
		Sub Constructor(initData As String, initElementType As ONNX.ElementTypeEnum)
		  Var item As JSONItem
		  Var i As Integer
		  Var j As Integer
		  Var pos As Integer
		  Var row As JSONItem
		  
		  mName = ""
		  mElementType = initElementType
		  SetElementSize()
		  
		  item = new JSONItem(initData)
		  Redim mShape(-1)
		  mShape.Add item.Count // rows
		  mShape.Add item.Child(0).Count // columns
		  
		  mData = new MemoryBlock(mShape(0) * mShape(1) * mElementSize)
		  
		  // initialize data
		  
		  select case mElementType
		    
		  case ONNX.ElementTypeEnum.FLOAT
		    pos = 0
		    i = 0
		    while i < mShape(0)
		      row = item.Child(i)
		      j = 0
		      while j < mShape(1)
		        mData.SingleValue(pos) = row.Value(j)
		        pos = pos + mElementSize
		        j = j + 1 
		      wend
		      i = i + 1
		    wend
		    
		  case else
		    break // TODO: initialize data
		    
		  end select
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor(initName As String, initElementType As ONNX.ElementTypeEnum, initShape() As Integer)
		  Var i As Integer
		  
		  mName = initName
		  mElementType = initElementType
		  SetElementSize()
		  
		  Redim mShape(-1)
		  i = 0
		  while i < initShape.Count
		    mShape.Add initShape(i)
		    i = i + 1
		  wend
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub SetElementSize()
		  select case mElementType
		    
		  case ONNX.ElementTypeEnum.FLOAT
		    mElementSize = 4
		    
		  case else
		    break // TODO: define element size
		    
		  end select
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ToString() As String
		  Var s() As String
		  Var rowStr() As String
		  Var i As UInt64
		  Var j As UInt64
		  Var pos As UInt64
		  
		  select case mElementType
		    
		    // ***** FLOAT *****************************************
		    
		  case ONNX.ElementTypeEnum.FLOAT
		    pos = 0
		    
		    i = 0
		    while i < mShape(0) // rows
		      
		      Redim rowStr(-1)
		      j = 0
		      while j < mShape(1) // columns
		        rowStr.Append Str(mData.SingleValue(pos), "-############0.0#######")
		        pos = pos + mElementSize
		        j = j + 1
		      wend
		      s.Append "[" + Join(rowStr, ",") + "]"
		      
		      i = i + 1
		    wend
		    
		  case else
		    break
		    
		  end select
		  
		  return "[" + Join(s, ",") + "]"
		End Function
	#tag EndMethod


	#tag Property, Flags = &h21
		Private mData As MemoryBlock
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mElementSize As UInt64
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mElementType As ONNX.ElementTypeEnum
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mName As String
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mShape() As Integer
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return mName
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mName = value
			End Set
		#tag EndSetter
		Name As String
	#tag EndComputedProperty


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
