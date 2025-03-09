#tag Class
Protected Class Model
	#tag Method, Flags = &h0
		Sub Constructor(onnxFile As FolderItem)
		  Open(onnxFile)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor(initGraph As ONNX.Graph)
		  mGraph = initGraph
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Infer(input As Dictionary) As Dictionary
		  Var output As new Dictionary()
		  
		  output = mGraph.Evaluate(input)
		  
		  return output
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Open(onnxFile As FolderItem)
		  Var modelItem As JSONItem
		  Var graphItem As JSONItem
		  Var schema As new JSONItem(ONNX_SCHEMA)
		  Var nodes() As ONNX.Node
		  Var nodeInputs() As String
		  Var nodeOutputs() As String
		  Var operator As ONNX.OperatorEnum
		  Var graphInputs() As ONNX.Tensor
		  Var graphOutputs() As ONNX.Tensor
		  Var nodeItem As JSONItem
		  Var node As ONNX.Node
		  Var i As Integer
		  Var j As Integer
		  Var tensorItem As JSONItem
		  Var tensor As ONNX.Tensor
		  
		  modelItem = Protobuf.DecodeFile(schema, "ModelProto", onnxFile)
		  graphItem = modelItem.Child("graph")
		  
		  i = 0
		  while i < graphItem.Child("node").Count
		    
		    nodeItem = graphItem.Child("node").ChildAt(i)
		    
		    select case nodeItem.Value("opType")
		    case "Abs"
		      operator = OperatorEnum.Abs
		    case "Acos"
		      operator = OperatorEnum.Acos
		    case "Acosh"
		      operator = OperatorEnum.Acosh
		    case "Add"
		      operator = OperatorEnum.Add
		    case "Asin"
		      operator = OperatorEnum.Asin
		    case else
		      break // unknown operator
		    end select
		    
		    Redim nodeInputs(-1)
		    j = 0
		    while j < nodeItem.Child("input").Count
		      nodeInputs.Add nodeItem.Child("input").ValueAt(j)
		      j = j + 1
		    wend 
		    
		    Redim nodeOutputs(-1)
		    j = 0
		    while j < nodeItem.Child("output").Count
		      nodeOutputs.Add nodeItem.Child("output").ValueAt(j)
		      j = j + 1
		    wend 
		    
		    node = new ONNX.Node(operator, nodeInputs, nodeOutputs)
		    nodes.Add node
		    i = i + 1
		  wend 
		  
		  i = 0
		  while i < graphItem.Child("input").Count
		    tensorItem = graphItem.Child("input").ChildAt(i)
		    tensor = new ONNX.Tensor( _
		    tensorItem.Value("name"), _
		    tensorItem.Child("type").Child("tensorType").Value("elemType"), _
		    Array(-1, -1) )
		    
		    graphInputs.Add tensor
		    
		    i = i + 1 
		  wend
		  
		  i = 0
		  while i < graphItem.Child("output").Count
		    tensorItem = graphItem.Child("output").ChildAt(i)
		    tensor = new ONNX.Tensor( _
		    tensorItem.Value("name"), _
		    tensorItem.Child("type").Child("tensorType").Value("elemType"), _
		    Array(-1, -1) )
		    
		    graphOutputs.Add tensor
		    
		    i = i + 1 
		  wend
		  
		  mGraph = new ONNX.Graph(nodes, graphItem.Value("name"), graphInputs, graphOutputs)
		  
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h21
		Private mGraph As ONNX.Graph
	#tag EndProperty


	#tag Constant, Name = ONNX_SCHEMA, Type = String, Dynamic = False, Default = \"{\"syntax\":\"proto3\"\x2C\"package\":\"onnx\"\x2C\"options\":{\"optimize_for\":\"LITE_RUNTIME\"}\x2C\"enums\":{\"Version\":{\"type\":\"enum\"\x2C\"name\":\"Version\"\x2C\"items\":{\"0\":{\"name\":\"_START_VERSION\"\x2C\"value\":0}\x2C\"1\":{\"name\":\"IR_VERSION_2017_10_10\"\x2C\"value\":1}\x2C\"2\":{\"name\":\"IR_VERSION_2017_10_30\"\x2C\"value\":2}\x2C\"3\":{\"name\":\"IR_VERSION_2017_11_3\"\x2C\"value\":3}\x2C\"4\":{\"name\":\"IR_VERSION_2019_1_22\"\x2C\"value\":4}\x2C\"5\":{\"name\":\"IR_VERSION_2019_3_18\"\x2C\"value\":5}\x2C\"6\":{\"name\":\"IR_VERSION_2019_9_19\"\x2C\"value\":6}\x2C\"7\":{\"name\":\"IR_VERSION_2020_5_8\"\x2C\"value\":7}\x2C\"8\":{\"name\":\"IR_VERSION_2021_7_30\"\x2C\"value\":8}\x2C\"9\":{\"name\":\"IR_VERSION\"\x2C\"value\":9}}}\x2C\"OperatorStatus\":{\"type\":\"enum\"\x2C\"name\":\"OperatorStatus\"\x2C\"items\":{\"0\":{\"name\":\"EXPERIMENTAL\"\x2C\"value\":0}\x2C\"1\":{\"name\":\"STABLE\"\x2C\"value\":1}}}}\x2C\"messages\":{\"AttributeProto\":{\"type\":\"messsage\"\x2C\"name\":\"AttributeProto\"\x2C\"reserve\":[12\x2C[16\x2C19]\x2C\"v\"]\x2C\"enums\":{\"AttributeType\":{\"type\":\"enum\"\x2C\"name\":\"AttributeType\"\x2C\"items\":{\"0\":{\"name\":\"UNDEFINED\"\x2C\"value\":0}\x2C\"1\":{\"name\":\"FLOAT\"\x2C\"value\":1}\x2C\"2\":{\"name\":\"INT\"\x2C\"value\":2}\x2C\"3\":{\"name\":\"STRING\"\x2C\"value\":3}\x2C\"4\":{\"name\":\"TENSOR\"\x2C\"value\":4}\x2C\"5\":{\"name\":\"GRAPH\"\x2C\"value\":5}\x2C\"11\":{\"name\":\"SPARSE_TENSOR\"\x2C\"value\":11}\x2C\"13\":{\"name\":\"TYPE_PROTO\"\x2C\"value\":13}\x2C\"6\":{\"name\":\"FLOATS\"\x2C\"value\":6}\x2C\"7\":{\"name\":\"INTS\"\x2C\"value\":7}\x2C\"8\":{\"name\":\"STRINGS\"\x2C\"value\":8}\x2C\"9\":{\"name\":\"TENSORS\"\x2C\"value\":9}\x2C\"10\":{\"name\":\"GRAPHS\"\x2C\"value\":10}\x2C\"12\":{\"name\":\"SPARSE_TENSORS\"\x2C\"value\":12}\x2C\"14\":{\"name\":\"TYPE_PROTOS\"\x2C\"value\":14}}}}\x2C\"messages\":{}\x2C\"items\":{\"1\":{\"type\":\"string\"\x2C\"name\":\"name\"\x2C\"number\":1}\x2C\"21\":{\"type\":\"string\"\x2C\"name\":\"ref_attr_name\"\x2C\"number\":21}\x2C\"13\":{\"type\":\"string\"\x2C\"name\":\"doc_string\"\x2C\"number\":13}\x2C\"20\":{\"type\":\"AttributeType\"\x2C\"name\":\"type\"\x2C\"number\":20}\x2C\"2\":{\"type\":\"float\"\x2C\"name\":\"f\"\x2C\"number\":2}\x2C\"3\":{\"type\":\"int64\"\x2C\"name\":\"i\"\x2C\"number\":3}\x2C\"4\":{\"type\":\"bytes\"\x2C\"name\":\"s\"\x2C\"number\":4}\x2C\"5\":{\"type\":\"TensorProto\"\x2C\"name\":\"t\"\x2C\"number\":5}\x2C\"6\":{\"type\":\"GraphProto\"\x2C\"name\":\"g\"\x2C\"number\":6}\x2C\"22\":{\"type\":\"SparseTensorProto\"\x2C\"name\":\"sparse_tensor\"\x2C\"number\":22}\x2C\"14\":{\"type\":\"TypeProto\"\x2C\"name\":\"tp\"\x2C\"number\":14}\x2C\"7\":{\"type\":\"float\"\x2C\"repeated\":true\x2C\"name\":\"floats\"\x2C\"number\":7}\x2C\"8\":{\"type\":\"int64\"\x2C\"repeated\":true\x2C\"name\":\"ints\"\x2C\"number\":8}\x2C\"9\":{\"type\":\"bytes\"\x2C\"repeated\":true\x2C\"name\":\"strings\"\x2C\"number\":9}\x2C\"10\":{\"type\":\"TensorProto\"\x2C\"repeated\":true\x2C\"name\":\"tensors\"\x2C\"number\":10}\x2C\"11\":{\"type\":\"GraphProto\"\x2C\"repeated\":true\x2C\"name\":\"graphs\"\x2C\"number\":11}\x2C\"23\":{\"type\":\"SparseTensorProto\"\x2C\"repeated\":true\x2C\"name\":\"sparse_tensors\"\x2C\"number\":23}\x2C\"15\":{\"type\":\"TypeProto\"\x2C\"repeated\":true\x2C\"name\":\"type_protos\"\x2C\"number\":15}}}\x2C\"ValueInfoProto\":{\"type\":\"messsage\"\x2C\"name\":\"ValueInfoProto\"\x2C\"enums\":{}\x2C\"messages\":{}\x2C\"items\":{\"1\":{\"type\":\"string\"\x2C\"name\":\"name\"\x2C\"number\":1}\x2C\"2\":{\"type\":\"TypeProto\"\x2C\"name\":\"type\"\x2C\"number\":2}\x2C\"3\":{\"type\":\"string\"\x2C\"name\":\"doc_string\"\x2C\"number\":3}}}\x2C\"NodeProto\":{\"type\":\"messsage\"\x2C\"name\":\"NodeProto\"\x2C\"enums\":{}\x2C\"messages\":{}\x2C\"items\":{\"1\":{\"type\":\"string\"\x2C\"repeated\":true\x2C\"name\":\"input\"\x2C\"number\":1}\x2C\"2\":{\"type\":\"string\"\x2C\"repeated\":true\x2C\"name\":\"output\"\x2C\"number\":2}\x2C\"3\":{\"type\":\"string\"\x2C\"name\":\"name\"\x2C\"number\":3}\x2C\"4\":{\"type\":\"string\"\x2C\"name\":\"op_type\"\x2C\"number\":4}\x2C\"7\":{\"type\":\"string\"\x2C\"name\":\"domain\"\x2C\"number\":7}\x2C\"5\":{\"type\":\"AttributeProto\"\x2C\"repeated\":true\x2C\"name\":\"attribute\"\x2C\"number\":5}\x2C\"6\":{\"type\":\"string\"\x2C\"name\":\"doc_string\"\x2C\"number\":6}}}\x2C\"TrainingInfoProto\":{\"type\":\"messsage\"\x2C\"name\":\"TrainingInfoProto\"\x2C\"enums\":{}\x2C\"messages\":{}\x2C\"items\":{\"1\":{\"type\":\"GraphProto\"\x2C\"name\":\"initialization\"\x2C\"number\":1}\x2C\"2\":{\"type\":\"GraphProto\"\x2C\"name\":\"algorithm\"\x2C\"number\":2}\x2C\"3\":{\"type\":\"StringStringEntryProto\"\x2C\"repeated\":true\x2C\"name\":\"initialization_binding\"\x2C\"number\":3}\x2C\"4\":{\"type\":\"StringStringEntryProto\"\x2C\"repeated\":true\x2C\"name\":\"update_binding\"\x2C\"number\":4}}}\x2C\"ModelProto\":{\"type\":\"messsage\"\x2C\"name\":\"ModelProto\"\x2C\"enums\":{}\x2C\"messages\":{}\x2C\"items\":{\"1\":{\"type\":\"int64\"\x2C\"name\":\"ir_version\"\x2C\"number\":1}\x2C\"8\":{\"type\":\"OperatorSetIdProto\"\x2C\"repeated\":true\x2C\"name\":\"opset_import\"\x2C\"number\":8}\x2C\"2\":{\"type\":\"string\"\x2C\"name\":\"producer_name\"\x2C\"number\":2}\x2C\"3\":{\"type\":\"string\"\x2C\"name\":\"producer_version\"\x2C\"number\":3}\x2C\"4\":{\"type\":\"string\"\x2C\"name\":\"domain\"\x2C\"number\":4}\x2C\"5\":{\"type\":\"int64\"\x2C\"name\":\"model_version\"\x2C\"number\":5}\x2C\"6\":{\"type\":\"string\"\x2C\"name\":\"doc_string\"\x2C\"number\":6}\x2C\"7\":{\"type\":\"GraphProto\"\x2C\"name\":\"graph\"\x2C\"number\":7}\x2C\"14\":{\"type\":\"StringStringEntryProto\"\x2C\"repeated\":true\x2C\"name\":\"metadata_props\"\x2C\"number\":14}\x2C\"20\":{\"type\":\"TrainingInfoProto\"\x2C\"repeated\":true\x2C\"name\":\"training_info\"\x2C\"number\":20}\x2C\"25\":{\"type\":\"FunctionProto\"\x2C\"repeated\":true\x2C\"name\":\"functions\"\x2C\"number\":25}}}\x2C\"StringStringEntryProto\":{\"type\":\"messsage\"\x2C\"name\":\"StringStringEntryProto\"\x2C\"enums\":{}\x2C\"messages\":{}\x2C\"items\":{\"1\":{\"type\":\"string\"\x2C\"name\":\"key\"\x2C\"number\":1}\x2C\"2\":{\"type\":\"string\"\x2C\"name\":\"value\"\x2C\"number\":2}}}\x2C\"TensorAnnotation\":{\"type\":\"messsage\"\x2C\"name\":\"TensorAnnotation\"\x2C\"enums\":{}\x2C\"messages\":{}\x2C\"items\":{\"1\":{\"type\":\"string\"\x2C\"name\":\"tensor_name\"\x2C\"number\":1}\x2C\"2\":{\"type\":\"StringStringEntryProto\"\x2C\"repeated\":true\x2C\"name\":\"quant_parameter_tensor_names\"\x2C\"number\":2}}}\x2C\"GraphProto\":{\"type\":\"messsage\"\x2C\"name\":\"GraphProto\"\x2C\"reserve\":[3\x2C4\x2C[6\x2C9]\x2C\"ir_version\"\x2C\"producer_version\"\x2C\"producer_tag\"\x2C\"domain\"]\x2C\"enums\":{}\x2C\"messages\":{}\x2C\"items\":{\"1\":{\"type\":\"NodeProto\"\x2C\"repeated\":true\x2C\"name\":\"node\"\x2C\"number\":1}\x2C\"2\":{\"type\":\"string\"\x2C\"name\":\"name\"\x2C\"number\":2}\x2C\"5\":{\"type\":\"TensorProto\"\x2C\"repeated\":true\x2C\"name\":\"initializer\"\x2C\"number\":5}\x2C\"15\":{\"type\":\"SparseTensorProto\"\x2C\"repeated\":true\x2C\"name\":\"sparse_initializer\"\x2C\"number\":15}\x2C\"10\":{\"type\":\"string\"\x2C\"name\":\"doc_string\"\x2C\"number\":10}\x2C\"11\":{\"type\":\"ValueInfoProto\"\x2C\"repeated\":true\x2C\"name\":\"input\"\x2C\"number\":11}\x2C\"12\":{\"type\":\"ValueInfoProto\"\x2C\"repeated\":true\x2C\"name\":\"output\"\x2C\"number\":12}\x2C\"13\":{\"type\":\"ValueInfoProto\"\x2C\"repeated\":true\x2C\"name\":\"value_info\"\x2C\"number\":13}\x2C\"14\":{\"type\":\"TensorAnnotation\"\x2C\"repeated\":true\x2C\"name\":\"quantization_annotation\"\x2C\"number\":14}}}\x2C\"TensorProto\":{\"type\":\"messsage\"\x2C\"name\":\"TensorProto\"\x2C\"enums\":{\"DataType\":{\"type\":\"enum\"\x2C\"name\":\"DataType\"\x2C\"items\":{\"0\":{\"name\":\"UNDEFINED\"\x2C\"value\":0}\x2C\"1\":{\"name\":\"FLOAT\"\x2C\"value\":1}\x2C\"2\":{\"name\":\"UINT8\"\x2C\"value\":2}\x2C\"3\":{\"name\":\"INT8\"\x2C\"value\":3}\x2C\"4\":{\"name\":\"UINT16\"\x2C\"value\":4}\x2C\"5\":{\"name\":\"INT16\"\x2C\"value\":5}\x2C\"6\":{\"name\":\"INT32\"\x2C\"value\":6}\x2C\"7\":{\"name\":\"INT64\"\x2C\"value\":7}\x2C\"8\":{\"name\":\"STRING\"\x2C\"value\":8}\x2C\"9\":{\"name\":\"BOOL\"\x2C\"value\":9}\x2C\"10\":{\"name\":\"FLOAT16\"\x2C\"value\":10}\x2C\"11\":{\"name\":\"DOUBLE\"\x2C\"value\":11}\x2C\"12\":{\"name\":\"UINT32\"\x2C\"value\":12}\x2C\"13\":{\"name\":\"UINT64\"\x2C\"value\":13}\x2C\"14\":{\"name\":\"COMPLEX64\"\x2C\"value\":14}\x2C\"15\":{\"name\":\"COMPLEX128\"\x2C\"value\":15}\x2C\"16\":{\"name\":\"BFLOAT16\"\x2C\"value\":16}\x2C\"17\":{\"name\":\"FLOAT8E4M3FN\"\x2C\"value\":17}\x2C\"18\":{\"name\":\"FLOAT8E4M3FNUZ\"\x2C\"value\":18}\x2C\"19\":{\"name\":\"FLOAT8E5M2\"\x2C\"value\":19}\x2C\"20\":{\"name\":\"FLOAT8E5M2FNUZ\"\x2C\"value\":20}\x2C\"21\":{\"name\":\"UINT4\"\x2C\"value\":21}\x2C\"22\":{\"name\":\"INT4\"\x2C\"value\":22}}}\x2C\"DataLocation\":{\"type\":\"enum\"\x2C\"name\":\"DataLocation\"\x2C\"items\":{\"0\":{\"name\":\"DEFAULT\"\x2C\"value\":0}\x2C\"1\":{\"name\":\"EXTERNAL\"\x2C\"value\":1}}}}\x2C\"messages\":{\"Segment\":{\"type\":\"messsage\"\x2C\"name\":\"Segment\"\x2C\"enums\":{}\x2C\"messages\":{}\x2C\"items\":{\"1\":{\"type\":\"int64\"\x2C\"name\":\"begin\"\x2C\"number\":1}\x2C\"2\":{\"type\":\"int64\"\x2C\"name\":\"end\"\x2C\"number\":2}}}}\x2C\"items\":{\"1\":{\"type\":\"int64\"\x2C\"repeated\":true\x2C\"name\":\"dims\"\x2C\"number\":1}\x2C\"2\":{\"type\":\"int32\"\x2C\"name\":\"data_type\"\x2C\"number\":2}\x2C\"3\":{\"type\":\"Segment\"\x2C\"name\":\"segment\"\x2C\"number\":3}\x2C\"4\":{\"type\":\"float\"\x2C\"repeated\":true\x2C\"options\":{\"packed\":true}\x2C\"name\":\"float_data\"\x2C\"number\":4}\x2C\"5\":{\"type\":\"int32\"\x2C\"repeated\":true\x2C\"options\":{\"packed\":true}\x2C\"name\":\"int32_data\"\x2C\"number\":5}\x2C\"6\":{\"type\":\"bytes\"\x2C\"repeated\":true\x2C\"name\":\"string_data\"\x2C\"number\":6}\x2C\"7\":{\"type\":\"int64\"\x2C\"repeated\":true\x2C\"options\":{\"packed\":true}\x2C\"name\":\"int64_data\"\x2C\"number\":7}\x2C\"8\":{\"type\":\"string\"\x2C\"name\":\"name\"\x2C\"number\":8}\x2C\"12\":{\"type\":\"string\"\x2C\"name\":\"doc_string\"\x2C\"number\":12}\x2C\"9\":{\"type\":\"bytes\"\x2C\"name\":\"raw_data\"\x2C\"number\":9}\x2C\"13\":{\"type\":\"StringStringEntryProto\"\x2C\"repeated\":true\x2C\"name\":\"external_data\"\x2C\"number\":13}\x2C\"14\":{\"type\":\"DataLocation\"\x2C\"name\":\"data_location\"\x2C\"number\":14}\x2C\"10\":{\"type\":\"double\"\x2C\"repeated\":true\x2C\"options\":{\"packed\":true}\x2C\"name\":\"double_data\"\x2C\"number\":10}\x2C\"11\":{\"type\":\"uint64\"\x2C\"repeated\":true\x2C\"options\":{\"packed\":true}\x2C\"name\":\"uint64_data\"\x2C\"number\":11}}}\x2C\"SparseTensorProto\":{\"type\":\"messsage\"\x2C\"name\":\"SparseTensorProto\"\x2C\"enums\":{}\x2C\"messages\":{}\x2C\"items\":{\"1\":{\"type\":\"TensorProto\"\x2C\"name\":\"values\"\x2C\"number\":1}\x2C\"2\":{\"type\":\"TensorProto\"\x2C\"name\":\"indices\"\x2C\"number\":2}\x2C\"3\":{\"type\":\"int64\"\x2C\"repeated\":true\x2C\"name\":\"dims\"\x2C\"number\":3}}}\x2C\"TensorShapeProto\":{\"type\":\"messsage\"\x2C\"name\":\"TensorShapeProto\"\x2C\"enums\":{}\x2C\"messages\":{\"Dimension\":{\"type\":\"messsage\"\x2C\"name\":\"Dimension\"\x2C\"enums\":{}\x2C\"messages\":{}\x2C\"items\":{\"3\":{\"type\":\"string\"\x2C\"name\":\"denotation\"\x2C\"number\":3}\x2C\"1\":{\"type\":\"int64\"\x2C\"name\":\"dim_value\"\x2C\"number\":1\x2C\"oneof\":\"value\"}\x2C\"2\":{\"type\":\"string\"\x2C\"name\":\"dim_param\"\x2C\"number\":2\x2C\"oneof\":\"value\"}}}}\x2C\"items\":{\"1\":{\"type\":\"Dimension\"\x2C\"repeated\":true\x2C\"name\":\"dim\"\x2C\"number\":1}}}\x2C\"TypeProto\":{\"type\":\"messsage\"\x2C\"name\":\"TypeProto\"\x2C\"enums\":{}\x2C\"messages\":{\"Tensor\":{\"type\":\"messsage\"\x2C\"name\":\"Tensor\"\x2C\"enums\":{}\x2C\"messages\":{}\x2C\"items\":{\"1\":{\"type\":\"int32\"\x2C\"name\":\"elem_type\"\x2C\"number\":1}\x2C\"2\":{\"type\":\"TensorShapeProto\"\x2C\"name\":\"shape\"\x2C\"number\":2}}}\x2C\"Sequence\":{\"type\":\"messsage\"\x2C\"name\":\"Sequence\"\x2C\"enums\":{}\x2C\"messages\":{}\x2C\"items\":{\"1\":{\"type\":\"TypeProto\"\x2C\"name\":\"elem_type\"\x2C\"number\":1}}}\x2C\"Map\":{\"type\":\"messsage\"\x2C\"name\":\"Map\"\x2C\"enums\":{}\x2C\"messages\":{}\x2C\"items\":{\"1\":{\"type\":\"int32\"\x2C\"name\":\"key_type\"\x2C\"number\":1}\x2C\"2\":{\"type\":\"TypeProto\"\x2C\"name\":\"value_type\"\x2C\"number\":2}}}\x2C\"Optional\":{\"type\":\"messsage\"\x2C\"name\":\"Optional\"\x2C\"enums\":{}\x2C\"messages\":{}\x2C\"items\":{\"1\":{\"type\":\"TypeProto\"\x2C\"name\":\"elem_type\"\x2C\"number\":1}}}\x2C\"SparseTensor\":{\"type\":\"messsage\"\x2C\"name\":\"SparseTensor\"\x2C\"enums\":{}\x2C\"messages\":{}\x2C\"items\":{\"1\":{\"type\":\"int32\"\x2C\"name\":\"elem_type\"\x2C\"number\":1}\x2C\"2\":{\"type\":\"TensorShapeProto\"\x2C\"name\":\"shape\"\x2C\"number\":2}}}}\x2C\"items\":{\"6\":{\"type\":\"string\"\x2C\"name\":\"denotation\"\x2C\"number\":6}\x2C\"1\":{\"type\":\"Tensor\"\x2C\"name\":\"tensor_type\"\x2C\"number\":1\x2C\"oneof\":\"value\"}\x2C\"4\":{\"type\":\"Sequence\"\x2C\"name\":\"sequence_type\"\x2C\"number\":4\x2C\"oneof\":\"value\"}\x2C\"5\":{\"type\":\"Map\"\x2C\"name\":\"map_type\"\x2C\"number\":5\x2C\"oneof\":\"value\"}\x2C\"9\":{\"type\":\"Optional\"\x2C\"name\":\"optional_type\"\x2C\"number\":9\x2C\"oneof\":\"value\"}\x2C\"8\":{\"type\":\"SparseTensor\"\x2C\"name\":\"sparse_tensor_type\"\x2C\"number\":8\x2C\"oneof\":\"value\"}}}\x2C\"OperatorSetIdProto\":{\"type\":\"messsage\"\x2C\"name\":\"OperatorSetIdProto\"\x2C\"enums\":{}\x2C\"messages\":{}\x2C\"items\":{\"1\":{\"type\":\"string\"\x2C\"name\":\"domain\"\x2C\"number\":1}\x2C\"2\":{\"type\":\"int64\"\x2C\"name\":\"version\"\x2C\"number\":2}}}\x2C\"FunctionProto\":{\"type\":\"messsage\"\x2C\"name\":\"FunctionProto\"\x2C\"reserve\":[2\x2C\"since_version\"\x2C3\x2C\"status\"]\x2C\"enums\":{}\x2C\"messages\":{}\x2C\"items\":{\"1\":{\"type\":\"string\"\x2C\"name\":\"name\"\x2C\"number\":1}\x2C\"4\":{\"type\":\"string\"\x2C\"repeated\":true\x2C\"name\":\"input\"\x2C\"number\":4}\x2C\"5\":{\"type\":\"string\"\x2C\"repeated\":true\x2C\"name\":\"output\"\x2C\"number\":5}\x2C\"6\":{\"type\":\"string\"\x2C\"repeated\":true\x2C\"name\":\"attribute\"\x2C\"number\":6}\x2C\"11\":{\"type\":\"AttributeProto\"\x2C\"repeated\":true\x2C\"name\":\"attribute_proto\"\x2C\"number\":11}\x2C\"7\":{\"type\":\"NodeProto\"\x2C\"repeated\":true\x2C\"name\":\"node\"\x2C\"number\":7}\x2C\"8\":{\"type\":\"string\"\x2C\"name\":\"doc_string\"\x2C\"number\":8}\x2C\"9\":{\"type\":\"OperatorSetIdProto\"\x2C\"repeated\":true\x2C\"name\":\"opset_import\"\x2C\"number\":9}\x2C\"10\":{\"type\":\"string\"\x2C\"name\":\"domain\"\x2C\"number\":10}}}}}", Scope = Protected
	#tag EndConstant


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
