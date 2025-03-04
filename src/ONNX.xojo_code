#tag Module
Protected Module ONNX
	#tag Constant, Name = E, Type = Double, Dynamic = False, Default = \"2.7182818284590452354", Scope = Public
	#tag EndConstant


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
		  Reciprocal
		  Relu
		  Sigmoid
		  Sign
		  Sin
		  Sinh
		  Softmax
		  Sqrt
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
