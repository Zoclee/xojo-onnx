#tag Module
Protected Module ONNXTest
	#tag Method, Flags = &h0
		Function RunTests() As JSONItem
		  Var results As new JSONItem("{}")
		  
		  results.Value("tests") = 0
		  results.Value("pass") = 0
		  results.Value("fail") = 0
		  results.Value("success") = true
		  results.Value("log") = new JSONItem("[]")
		  
		  Test_Tensor_Add(results)
		  
		  return results
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub Test_Tensor_Add(results As JSONItem)
		  Var pass As Boolean
		  
		  pass = false
		  
		  results.Child("log").Add new JSONItem("{""test"":""Tensor.Add"",""success"":" + Str(pass).Lowercase() + "}")
		  results.Value("tests") = results.Value("tests") + 1
		  if pass then
		    results.Value("pass") = results.Value("pass") + 1
		  else
		    results.Value("fail") = results.Value("fail") + 1
		    results.Value("success") = false
		  end if
		  
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
