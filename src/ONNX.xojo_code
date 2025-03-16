#tag Module
Protected Module ONNX
	#tag Method, Flags = &h1
		Protected Function SaturateUInt8(value As Single) As UInt8
		  Var roundedValue As Single
		  Var result As UInt8
		  
		  roundedValue = Round(value)
		  
		  if Abs(value - roundedValue) = 0.5 then
		    If roundedValue Mod 2 <> 0 Then
		      roundedValue = roundedValue - 1 ' Move to the lower even integer
		    End If
		  end if
		  
		  if roundedValue >= 255 then
		    result = 255
		  else
		    result = roundedValue
		  end if
		  
		  return result
		  
		End Function
	#tag EndMethod


	#tag Constant, Name = E, Type = Double, Dynamic = False, Default = \"2.7182818284590452354", Scope = Public
	#tag EndConstant


	#tag Enum, Name = AttributeTypeEnum, Type = Integer, Flags = &h0
		FLOAT = 1
		  INT = 2
		  STRING = 3
		  TENSOR = 4
		  GRAPH = 5
		  FLOATS = 6
		  INTS = 7
		  STRINGS = 8
		  TENSORS = 9
		GRAPHS = 10
	#tag EndEnum

	#tag Enum, Name = ElementTypeEnum, Type = Integer, Flags = &h0
		FLOAT=1
		  UINT8 = 2
		  INT8 = 3
		  UINT16 = 4
		  INT16 =5
		  INT32 = 6
		  INT64 = 7
		  STRING = 8
		  BOOL = 9
		  FLOAT16 = 10
		  DOUBLE = 11
		  UINT32 = 12
		  UINT64 = 13
		  COMPLEX64 = 14
		  COMPLEX128 = 15
		  BFLOAT16 = 16
		  FLOAT8E4M3FN = 17
		  FLOAT8E4M3FNUZ = 18
		  FLOAT8E5M2 = 19
		  FLOAT8E5M2FNUZ = 20
		  UINT4 = 21
		  INT4 = 22
		FLOAT4E2M1 = 23
	#tag EndEnum

	#tag Enum, Name = OperatorEnum, Type = Integer, Flags = &h0
		Abs
		  Acos
		  Acosh
		  Add
		  Asin
		  Asinh
		  Atan
		  Atanh
		  Ceil
		  Constant
		  Cos
		  Cosh
		  Exp
		  Floor
		  Greater
		  GreaterOrEqual
		  Less
		  LessOrEqual
		  Log
		  LogicalAnd
		  LogicalNot
		  LogicalOr
		  MatMul
		  Max
		  Min
		  Mul
		  Neg
		  Pow
		  QLinearConv
		  QuantizeLinear
		  Reciprocal
		  Relu
		  Sigmoid
		  Sign
		  Sin
		  Sinh
		  Softmax
		  Sqrt
		  Subtract
		  Tan
		Tanh
	#tag EndEnum


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
