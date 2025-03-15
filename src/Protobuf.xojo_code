#tag Module
Protected Module Protobuf
	#tag Method, Flags = &h21
		Private Function CamelCase(s As String) As String
		  Var result As String
		  Var i As Integer
		  Var prevCh As String
		  Var ch As String
		  
		  prevCh = s.Left(1)
		  result = prevCh
		  
		  i = 1
		  while i < s.Length
		    ch = s.Middle(i, 1)
		    
		    if ch <> "_" then
		      if prevCh = "_" then
		        result = result + ch.Uppercase()
		      else
		        result = result + ch
		      end if
		    end if
		    
		    i = i + 1
		    prevCh = ch
		  wend
		  
		  return result
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Decode(schema As JSONItem, messageName As String, buffer As String) As JSONItem
		  Var pos As UInt64
		  Var messageJSON As JSONItem
		  
		  pos = 0 
		  messageJSON = Decode_message(schema, messageName, buffer, pos, buffer.Length)
		  
		  return messageJSON
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function DecodeFile(schema As JSONItem, messageName As String, f As FolderItem) As JSONItem
		  Var buffer As String
		  Var bin As BinaryStream
		  
		  bin = BinaryStream.Open(f)
		  buffer = bin.Read(bin.Length)
		  bin.Close
		  
		  return Decode(schema, messageName, buffer)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function Decode_bytes(stream As MemoryBlock, ByRef pos As UInt64, size As UInt64) As MemoryBlock
		  Static mb As MemoryBlock
		  
		  mb = stream.MidB(pos, size)
		  pos = pos + size
		  
		  return mb
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function Decode_float(stream As MemoryBlock, ByRef pos As UInt64) As Single
		  Var value As Single
		  
		  value = stream.SingleValue(pos)
		  pos = pos + 4
		  
		  return value
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function Decode_int32(stream As MemoryBlock, ByRef pos As UInt64) As Int32
		  Static mb As new MemoryBlock(8)
		  
		  mb.LittleEndian = false
		  mb.UInt64Value(0) = Decode_varint(stream, pos)
		  
		  return mb.Int64Value(0)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function Decode_int64(stream As MemoryBlock, ByRef pos As UInt64) As Int64
		  Static mb As new MemoryBlock(8)
		  
		  mb.LittleEndian = false
		  mb.UInt64Value(0) = Decode_varint(stream, pos)
		  
		  return mb.Int64Value(0)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function Decode_message(schema As JSONItem, messageName As String, stream As MemoryBlock, ByRef pos As UInt64, endPos As UInt64, parentMessage As JSONItem = nil) As JSONItem
		  Var messageJSON As New JSONItem("{}")
		  Var message As JSONItem
		  Var tag As UInt64
		  Var field As JSONItem
		  Var fieldNumber As UInt64
		  Var wireType As UInt64
		  Var propName As String
		  Var propNameCC As String
		  Var enumItem As JSONItem
		  Var enumIndex As Int32
		  Var size As UInt64
		  Var startPos As UInt64
		  Var i As UInt64
		  Var packed As Boolean
		  Var mb As MemoryBlock
		  
		  //if messageName = "TensorProto" then
		  //break
		  //end if
		  
		  message = schema.Child("messages").Lookup(messageName, nil)
		  if (message = nil) and parentMessage <> nil then
		    message = parentMessage.Child("messages").Lookup(messageName, nil)
		  end if
		  
		  if message <> nil then
		    
		    while pos < endPos
		      
		      tag = Decode_varint(stream, pos)
		      wireType = tag and &b111
		      fieldNumber = ShiftRight(tag, 3)
		      
		      field = message.Child("items").Lookup(Str(fieldNumber), nil)
		      propName = field.Value("name")
		      propNameCC = CamelCase(propName)
		      
		      packed = true
		      if field.HasKey("options") then
		        packed = field.Child("options").Lookup("packed", true)
		      end if
		      
		      if field <> nil then
		        
		        select case wireType
		          
		          // ===== VARINT ==================================================
		          
		        case 0 // VARINT: int32, int64, uint32, uint64, sint32, sint64, bool, enum
		          
		          select case field.Value("type")
		            
		          case "int32"
		            if field.Lookup("repeated", false) then
		              if not messageJSON.HasKey(propNameCC) then
		                messageJSON.Value(propNameCC) = new JSONItem("[]")
		              end if
		              messageJSON.Child(propNameCC).Add Decode_int32(stream, pos)
		            else
		              messageJSON.Value(propNameCC) = Decode_int32(stream, pos)
		            end if
		            
		          case "int64"
		            if field.Lookup("repeated", false) then
		              if not messageJSON.HasKey(propNameCC) then
		                messageJSON.Value(propNameCC) = new JSONItem("[]")
		              end if
		              messageJSON.Child(propNameCC).Add Decode_int64(stream, pos)
		            else
		              messageJSON.Value(propNameCC) = Decode_int64(stream, pos)
		            end if
		            
		          case "uint32"
		            break
		            
		          case "uint64"
		            break
		            
		          case "sint32"
		            break
		            
		          case "sint64"
		            break
		            
		          case "bool"
		            break
		            
		          case else
		            
		            // enum
		            
		            enumItem = schema.Child("enums").Lookup(field.Value("type"), nil)
		            if enumItem = nil then
		              enumItem = message.Child("enums").Lookup(field.Value("type"), nil)
		            end if
		            
		            if enumItem <> nil then
		              
		              enumIndex = Decode_int32(stream, pos)
		              
		              if enumItem.Child("items").HasKey(Str(enumIndex)) then
		                messageJSON.Value(propNameCC) = enumItem.Child("items").Child(Str(enumIndex)).Value("name")
		              else
		                messageJSON.Value(propNameCC) = enumIndex
		              end if
		            else
		              break // ERROR: Unknown enum
		            end if
		            
		          end select
		          
		          // ===== I64 ==================================================
		          
		        case 1 // I64: fixed64, sfixed64, double
		          break
		          
		          // ===== LEN ==================================================
		          
		        case 2 // LEN: string, bytes, embedded messages, packed repeated fields
		          
		          select case field.Value("type")
		            
		          case "bytes"
		            size = Decode_varint(stream, pos)
		            mb = Decode_bytes(stream, pos, size)
		            messageJSON.Value(propNameCC) = EncodeBase64(mb, 0)
		            
		          case "float"
		            if not messageJSON.HasKey(propNameCC) then
		              messageJSON.Value(propNameCC) = new JSONItem("[]")
		            end if
		            
		            if packed then
		              
		              size = Decode_varint(stream, pos)
		              startPos = pos
		              i = 0
		              while (pos - startPos) < size
		                messageJSON.Child(propNameCC).Add Decode_float(stream, pos)
		                i = i + 1
		              wend
		              
		            else
		              break // TODO: test this
		              messageJSON.Child(propNameCC).Add Decode_float(stream, pos)
		            end if
		            
		            
		          case "int32"
		            if not messageJSON.HasKey(propNameCC) then
		              messageJSON.Value(propNameCC) = new JSONItem("[]")
		            end if
		            
		            if packed then
		              
		              size = Decode_varint(stream, pos)
		              startPos = pos
		              i = 0
		              while (pos - startPos) < size
		                messageJSON.Child(propNameCC).Add Decode_int32(stream, pos)
		                i = i + 1
		              wend
		              
		            else
		              break // TODO: test this
		              messageJSON.Child(propNameCC).Add Decode_int32(stream, pos)
		            end if
		            
		          case "string"
		            if field.Lookup("repeated", false) then
		              if not messageJSON.HasKey(propNameCC) then
		                messageJSON.Value(propNameCC) = new JSONItem("[]")
		              end if
		              messageJSON.Child(propNameCC).Add Decode_string(stream, pos)
		            else
		              messageJSON.Value(propNameCC) = Decode_string(stream, pos)
		            end if
		            
		          case else
		            
		            if message.Child("messages").HasKey(field.Value("type")) then
		              
		              size = Decode_varint(stream, pos)
		              
		              if field.Lookup("repeated", false) then
		                if not messageJSON.HasKey(propNameCC) then
		                  messageJSON.Value(propNameCC) = new JSONItem("[]")
		                end if
		                messageJSON.Child(propNameCC).Add Decode_message(schema, field.Value("type"), stream, pos, pos + size, message)
		              else
		                messageJSON.Value(propNameCC) = Decode_message(schema, field.Value("type"), stream, pos, pos + size, message)
		              end if
		              
		            elseif schema.Child("messages").HasKey(field.Value("type")) then
		              
		              size = Decode_varint(stream, pos)
		              
		              if field.Lookup("repeated", false) then
		                if not messageJSON.HasKey(propNameCC) then
		                  messageJSON.Value(propNameCC) = new JSONItem("[]")
		                end if
		                messageJSON.Child(propNameCC).Add Decode_message(schema, field.Value("type"), stream, pos, pos + size)
		              else
		                messageJSON.Value(propNameCC) = Decode_message(schema, field.Value("type"), stream, pos, pos + size)
		              end if
		              
		            else
		              break
		            end if
		            
		          end select
		          
		          // ===== SGROUP ==================================================
		          
		        case 3 // SGROUP: group start (deprecated)
		          break
		          
		          // ===== EGROUP ==================================================
		          
		        case 4 // EGROUP: group end (deprecated)
		          break
		          
		          // ===== I32 ==================================================
		          
		        case 5 // I32: fixed32, sfixed32, float
		          
		          select case field.Value("type")
		            
		          case "float"
		            if field.Lookup("repeated", false) then
		              break
		            else
		              messageJSON.Value(propNameCC) = Decode_float(stream, pos)
		            end if
		            
		          case else
		            break
		            
		          end select
		          
		        end select
		        
		      else
		        break // ERROR: invalid field number
		        
		      end if
		      
		    wend
		    
		    
		  else
		    break // ERROR: message not found
		  end if
		  
		  return messageJSON
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function Decode_string(stream As MemoryBlock, ByRef pos As UInt64) As String
		  Var size As UInt64
		  Var s As String
		  
		  size = Decode_varint(stream, pos)
		  s = stream.StringValue(pos, size, Encodings.UTF8)
		  pos = pos + size
		  
		  return s
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function Decode_varint(stream As MemoryBlock, ByRef pos As UInt64) As UInt64
		  Var tmpByte As UInt8
		  Var binStr As String
		  Var lowBits As UInt8
		  
		  // TODO: optimize this method
		  
		  binStr = ""
		  do
		    tmpByte = stream.UInt8Value(pos)
		    lowBits = (tmpByte and &b01111111)
		    binStr = lowBits.ToBinary(7) + binStr
		    pos = pos + 1
		  loop until (tmpByte and &b10000000) = 0
		  
		  binStr = "&b" + binStr
		  
		  return binStr.ToInteger
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function ExtractTokens(source As String) As String()
		  Var tokens() As String
		  Var i As Integer
		  Var sourceUbound  As Integer
		  Var ch As String
		  Var nextCh As String
		  Var inString As Boolean
		  Var nextToken As String
		  Var stringQuote As String
		  Static reservedSymbols As New Dictionary("=":1, ";":1, "{":1, "}":1, ".":1, ",":1, "[":1, "]":1)
		  
		  i = 0
		  nextToken = ""
		  inString = false
		  sourceUbound = source.Length -1
		  
		  while (i <= sourceUbound)
		    
		    ch = source.Middle(i, 1)
		    nextCh = ""
		    if i < sourceUbound then
		      nextCh = source.Middle(i + 1, 1)
		    end if
		    
		    if inString then
		      
		      if ch = stringQuote then
		        nextToken = nextToken + """"
		        tokens.Add nextToken
		        inString = false
		        nextToken = ""
		      else
		        nextToken = nextToken + ch
		      end if
		      
		    elseif (Asc(ch) = 10) then
		      
		      // line feed (new line)
		      
		      if nextToken <> "" then
		        tokens.Add nextToken
		        nextToken = ""
		      end if
		      
		    elseif (Asc(ch) <= 32) then
		      
		      // white space and control characters
		      
		      if nextToken <> "" then
		        tokens.Add nextToken
		        nextToken = ""
		      end if
		      
		    elseif (ch = """") or (ch = "'") then
		      
		      // start of string
		      
		      if nextToken <> "" then
		        tokens.Add nextToken
		      end if
		      nextToken = """"
		      inString = true
		      stringQuote = ch
		      
		    elseif (ch = "/") and (nextCh = "/") then
		      
		      // line comment
		      
		      if nextToken <> "" then
		        tokens.Add nextToken
		      end if
		      nextToken = ""
		      
		      do
		        i = i + 1
		      loop until (i > sourceUbound) or (Asc(source.Middle(i, 1)) = 10)
		      
		      'elseif (ch = "/") and (nextCh = "*") then
		      '
		      '// block comment
		      '
		      'nextToken = StoreToken(nextToken, tokens)
		      'do
		      'i = i + 1
		      'ch = source.Middle(i, 2)
		      'column = column + 1
		      'if Asc(ch) = 13 then
		      'line = line + 1
		      'column = 0
		      'end if
		      'loop until (i > sourceUbound) or (ch = "*/")
		      'i = i + 1
		      
		    elseif reservedSymbols.HasKey(ch) then
		      
		      // reserved symbol
		      
		      if nextToken <> "" then
		        tokens.Add nextToken
		        nextToken = ""
		      end if
		      tokens.Add Ch
		      
		    else
		      
		      // any other character
		      
		      nextToken = nextToken + ch
		      
		    end if
		    
		    i = i + 1
		  wend
		  
		  if nextToken <> "" then
		    tokens.Add nextToken
		  end if
		  
		  return tokens
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function Match_boolLit(tokens() As String, ByRef tokenIndex As Integer, ByRef ast As String) As Boolean
		  // boolLit = "true" | "false"
		  
		  Var success As Boolean
		  Var currentIndex As Integer
		  
		  currentIndex = tokenIndex
		  success = false
		  
		  if tokens(tokenIndex) = "true" then
		    tokenIndex = tokenIndex + 1
		    ast = "true"
		  elseif tokens(tokenIndex) = "false" then
		    tokenIndex = tokenIndex + 1
		    ast = "false"
		  end if
		  
		  if not success then
		    tokenIndex = currentIndex
		    ast = ""
		  end if
		  
		  return success
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function Match_constant(tokens() As String, ByRef tokenIndex As Integer, ByRef ast As String) As Boolean
		  // constant = fullIdent | ( [ "-" | "+" ] intLit ) | ( [ "-" | "+" ] floatLit ) |
		  //               strLit | boolLit | MessageValue
		  
		  Var success As Boolean
		  Var currentIndex As Integer
		  
		  currentIndex = tokenIndex
		  success = false
		  
		  if (tokens(tokenIndex) = "-") or (tokens(tokenIndex) = "+") then
		    break // TODO: intLit or floatLit
		    
		  elseif Match_intLit(tokens, tokenIndex, ast) then
		    success = true
		    
		  elseif Match_floatLit(tokens, tokenIndex, ast) then
		    success = true
		    
		  elseif Match_strLit(tokens, tokenIndex, ast) then
		    success = true
		    
		  elseif Match_boolLit(tokens, tokenIndex, ast) then
		    success = true
		    
		  elseif Match_fullIdent(tokens, tokenIndex, ast) then
		    success = true
		    
		  else
		    
		    break // TODO: MessageValue
		    
		  end if
		  
		  if not success then
		    tokenIndex = currentIndex
		    ast = ""
		  end if
		  
		  return success
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function Match_decimalLit(tokens() As String, ByRef tokenIndex As Integer, ByRef ast As String) As Boolean
		  // decimalLit = ( "1" ... "9" ) { decimalDigit }
		  // decimalDigit = "0" ... "9"
		  
		  Var success As Boolean
		  Var currentIndex As Integer
		  Var ch As String
		  Var i As Integer
		  
		  currentIndex = tokenIndex
		  success = true
		  
		  ast = tokens(tokenIndex)
		  tokenIndex = tokenIndex + 1
		  
		  ch = ast.Middle(0, 1)
		  if (ch < "1") or (ch > "9") then
		    success = false
		  end if
		  
		  i = 1
		  while (i < ast.Length) and success
		    ch = ast.Middle(i, 1)
		    if (ch < "0") or (ch > "9") then
		      success = false
		    end if
		    i = i + 1
		  wend
		  
		  if not success then
		    tokenIndex = currentIndex
		    ast = ""
		  end if
		  
		  return success
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function Match_emptyStatement(tokens() As String, ByRef tokenIndex As Integer, ByRef ast As String) As Boolean
		  // emptyStatement = ";"
		  
		  Var success As Boolean
		  Var currentIndex As Integer
		  
		  currentIndex = tokenIndex
		  success = false
		  
		  if tokens(tokenIndex) = ";" then
		    tokenIndex = tokenIndex + 1
		    success = true
		  end if
		  
		  if not success then
		    tokenIndex = currentIndex
		    ast = ""
		  end if
		  
		  return success
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function Match_enum(tokens() As String, ByRef tokenIndex As Integer, ByRef ast As String) As Boolean
		  // enum = "enum" enumName enumBody
		  
		  Var success As Boolean
		  Var currentIndex As Integer
		  Var enumName As String
		  Var enumBody As String
		  
		  currentIndex = tokenIndex
		  success = false
		  
		  if tokens(tokenIndex) = "enum" then
		    tokenIndex = tokenIndex + 1
		    
		    if Match_ident(tokens, tokenIndex, enumName) then
		      if Match_enumBody(tokens, tokenIndex, enumBody) then
		        success = true
		      else
		        break // ERROR: invalid enum body
		      end if
		    else
		      break // ERROR: invalid enum name
		    end if
		    
		  end if
		  
		  if success then
		    ast = "{""type"":""enum"",""name"":""" + enumName + """,""items"":" + enumBody + "}"
		  else
		    tokenIndex = currentIndex
		    ast = ""
		  end if
		  
		  return success
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function Match_enumBody(tokens() As String, ByRef tokenIndex As Integer, ByRef ast As String) As Boolean
		  // enumBody = "{" { option | enumField | emptyStatement | reserved } "}"
		  
		  Var success As Boolean
		  Var currentIndex As Integer
		  Var item As JSONItem
		  Var i As Integer
		  Var enumValues() As String
		  Var tmpAst As String
		  Var astArr() As String
		  
		  currentIndex = tokenIndex
		  success = false
		  
		  if tokens(tokenIndex) = "{" then
		    tokenIndex = tokenIndex + 1
		    
		    success = true
		    while success and (tokens(tokenIndex) <> "}")
		      
		      if Match_option(tokens, tokenIndex, tmpAst) then
		        break
		        
		      elseif Match_enumField(tokens, tokenIndex, tmpAst) then
		        enumValues.Add tmpAst
		        
		      elseif Match_emptyStatement(tokens, tokenIndex, tmpAst) then
		        break
		        
		      elseif Match_reserved(tokens, tokenIndex, tmpAst) then
		        break
		        
		      else
		        success = false
		      end if
		      
		    wend
		    
		    tokenIndex = tokenIndex + 1 // closing curly bracket
		    
		  end if
		  
		  if success then
		    
		    astArr.Add "{"
		    i = 0 
		    while i < enumValues.Count
		      item = new JSONItem(enumValues(i))
		      if i > 0 then
		        astArr.Add ","""
		      else
		        astArr.Add """"
		      end if
		      astArr.Add Str(item.Value("value"))
		      astArr.Add """:"
		      astArr.Add enumValues(i)
		      i = i + 1
		    wend
		    astArr.Add "}"
		    ast = Join(astArr, "")
		  else
		    tokenIndex = currentIndex
		    ast = ""
		  end if
		  
		  return success
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function Match_enumField(tokens() As String, ByRef tokenIndex As Integer, ByRef ast As String) As Boolean
		  // enumField = ident "=" [ "-" ] intLit [ "[" enumValueOption { ","  enumValueOption } "]" ] ";"
		  // enumValueOption = optionName "=" constant
		  
		  Var success As Boolean
		  Var currentIndex As Integer
		  Var enumName As String
		  Var enumValue As String
		  Var astArr() As String
		  
		  currentIndex = tokenIndex
		  success = false
		  
		  if Match_ident(tokens, tokenIndex, enumName) then
		    
		    if tokens(tokenIndex) = "=" then
		      tokenIndex = tokenIndex + 1
		      
		      if tokens(tokenIndex) = "-" then
		        break
		      end if
		      
		      if Match_intLit(tokens, tokenIndex, enumValue) then
		        
		        if tokens(tokenIndex) = "[" then
		          break
		        end if
		        
		        if tokens(tokenIndex) = ";" then
		          tokenIndex = tokenIndex + 1
		          success = true
		        end if
		        
		      end if
		      
		      
		    end if
		    
		  end if
		  
		  if success then
		    astArr.Add "{""name"":"""
		    astArr.Add enumName
		    astArr.Add """,""value"":"
		    astArr.Add enumValue
		    astArr.Add "}"
		    ast = Join(astArr, "")
		  else
		    tokenIndex = currentIndex
		    ast = ""
		  end if
		  
		  return success
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function Match_field(tokens() As String, ByRef tokenIndex As Integer, ByRef ast As String) As Boolean
		  // field = [ "repeated" ] type fieldName "=" fieldNumber [ "[" fieldOptions "]" ] ";"
		  // fieldName = ident
		  // fieldNumber = intLit
		  
		  Var success As Boolean
		  Var currentIndex As Integer
		  Var fieldType As String
		  Var fieldName As String
		  Var fieldNumber As String
		  Var repeated As Boolean
		  Var astArr() As String
		  Var fieldOptions As String
		  
		  currentIndex = tokenIndex
		  success = false
		  
		  if tokens(tokenIndex) = "repeated" then
		    tokenIndex = tokenIndex + 1
		    repeated = true
		  end if
		  
		  if Match_type(tokens, tokenIndex, fieldType) then
		    if Match_ident(tokens, tokenIndex, fieldName) then
		      if tokens(tokenIndex) = "=" then
		        tokenIndex = tokenIndex + 1
		        
		        if Match_intLit(tokens, tokenIndex, fieldNumber) then
		          
		          success = true
		          if tokens(tokenIndex) = "[" then
		            tokenIndex = tokenIndex + 1
		            if Match_fieldOptions(tokens, tokenIndex, fieldOptions) then
		              if tokens(tokenIndex) = "]" then
		                tokenIndex = tokenIndex + 1
		              else
		                success = false
		              end if
		            else
		              success = false
		            end if
		          end if
		          
		          if success then
		            if tokens(tokenIndex) = ";" then
		              tokenIndex = tokenIndex + 1
		            else
		              success = false
		              break // ERROR: expected ;
		            end if
		          end if
		          
		        else
		          break // ERROR: expected integer literal
		        end if
		        
		      else
		        break // ERROR: expected =
		      end if
		      
		    else
		      break // ERROR: invalid field name
		    end
		  end if
		  
		  if success then
		    astArr.Add "{""type"":"""
		    astArr.Add fieldType
		    astArr.Add """"
		    
		    if repeated then
		      astArr.Add ",""repeated"":true"
		    end if
		    
		    if fieldOptions <> "" then
		      astArr.Add ",""options"":"
		      astArr.Add fieldOptions
		    end if
		    
		    astArr.Add ",""name"":"""
		    astArr.Add fieldName
		    astArr.Add """,""number"":"
		    astArr.Add fieldNumber
		    astArr.Add "}"
		    
		    ast = join(astArr, "")
		  else
		    tokenIndex = currentIndex
		    ast = ""
		  end if
		  
		  return success
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function Match_fieldOption(tokens() As String, ByRef tokenIndex As Integer, ByRef ast As String) As Boolean
		  // fieldOption = optionName "=" constant
		  
		  Var success As Boolean
		  Var currentIndex As Integer
		  Var optionName As String
		  Var optionValue As String
		  
		  currentIndex = tokenIndex
		  success = false
		  
		  if Match_optionName(tokens, tokenIndex, optionName) then
		    
		    if tokens(tokenIndex) = "=" then
		      tokenIndex = tokenIndex + 1
		      
		      if Match_constant(tokens, tokenIndex, optionValue) then
		        success = true
		      end if
		      
		    end if
		    
		  end if
		  
		  if success then
		    ast = "{""" + optionName + """:" + optionValue + "}"
		  else
		    tokenIndex = currentIndex
		    ast = ""
		  end if
		  
		  return success
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function Match_fieldOptions(tokens() As String, ByRef tokenIndex As Integer, ByRef ast As String) As Boolean
		  // fieldOptions = fieldOption { ","  fieldOption }
		  
		  Var success As Boolean
		  Var currentIndex As Integer
		  Var tmpAst As String
		  Var options() As String
		  Var astArr() As String
		  Var i As Integer
		  Var item As JSONItem
		  
		  currentIndex = tokenIndex
		  success = false
		  
		  if Match_fieldOption(tokens, tokenIndex, tmpAst) then
		    options.Add tmpAst
		    
		    success = true
		    while (tokens(tokenIndex) = ",") and success
		      tokenIndex = tokenIndex + 1
		      
		      if Match_fieldOption(tokens, tokenIndex, tmpAst) then
		        options.Add tmpAst
		      else
		        success = false
		      end if
		    wend
		    
		  end if
		  
		  if success then
		    astArr.Add "{"
		    i = 0
		    while i < options.Count
		      item = new JSONItem(options(i))
		      if i > 0 then
		        astArr.Add ","
		      end if
		      astArr.Add """"
		      astArr.Add item.KeyAt(0)
		      astArr.Add """:"
		      if item.Value(item.KeyAt(0)).Type = Variant.TypeBoolean then
		        astArr.Add Lowercase(item.Value(item.KeyAt(0)))
		      else
		        astArr.Add item.Value(item.KeyAt(0))
		      end if
		      
		      i = i + 1
		    wend
		    astArr.Add "}"
		    
		    ast = Join(astArr, "")
		    
		  else
		    tokenIndex = currentIndex
		    ast = ""
		  end if
		  
		  return success
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function Match_floatLit(tokens() As String, ByRef tokenIndex As Integer, ByRef ast As String) As Boolean
		  // floatLit = ( decimals "." [ decimals ] [ exponent ] | decimals exponent | "."decimals [ exponent ] ) | "inf" | "nan"
		  // decimals  = decimalDigit { decimalDigit }
		  // exponent  = ( "e" | "E" ) [ "+" | "-" ] decimals
		  
		  
		  Var success As Boolean
		  Var currentIndex As Integer
		  
		  currentIndex = tokenIndex
		  success = false
		  
		  // break // TODO
		  
		  if not success then
		    tokenIndex = currentIndex
		    ast = ""
		  end if
		  
		  return success
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function Match_fullIdent(tokens() As String, ByRef tokenIndex As Integer, ByRef ast As String) As Boolean
		  // fullIdent = ident { "." ident }
		  
		  Var success As Boolean
		  Var currentIndex As Integer
		  Var identities() As String
		  Var ident As String
		  Var done As Boolean
		  
		  currentIndex = tokenIndex
		  success = false
		  
		  if Match_ident(tokens, tokenIndex, ident) then
		    
		    identities.Add(ident)
		    
		    success = true
		    done = false
		    do 
		      if tokens(tokenIndex) = "." then
		        tokenIndex = tokenIndex + 1
		        if Match_ident(tokens, tokenIndex, ident) then
		          identities.Add(ident)
		        else
		          success = false
		        end if
		        
		      else
		        done = true
		      end if
		      
		    loop until done or not success
		    
		  else
		    break // ERROR: Expected identity
		  end if
		  
		  if success then
		    ast = Join(identities, ".")
		  else
		    tokenIndex = currentIndex
		    ast = ""
		  end if
		  
		  return success
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function Match_hexLit(tokens() As String, ByRef tokenIndex As Integer, ByRef ast As String) As Boolean
		  // hexLit = "0" ( "x" | "X" ) hexDigit { hexDigit }
		  // hexDigit = "0" ... "9" | "A" ... "F" | "a" ... "f"
		  
		  Var success As Boolean
		  Var currentIndex As Integer
		  Var ch As String
		  Var i As Integer
		  
		  currentIndex = tokenIndex
		  success = false
		  
		  if tokens(tokenIndex).Middle(0, 2) = "0x" then
		    
		    success = true
		    
		    ast = tokens(tokenIndex).Right(tokens(tokenIndex).Length - 2)
		    tokenIndex = tokenIndex + 1
		    
		    i = 0
		    while (i < ast.Length) and success
		      ch = ast.Middle(i, 1).Lowercase()
		      if not (((ch >= "0") and (ch <= "9")) or ((ch >= "a") and (ch <= "f"))) then
		        success = false
		      end if
		      i = i + 1
		    wend
		    
		  end if
		  
		  if success then
		    ast = Str(Integer.FromHex(ast))
		  else
		    tokenIndex = currentIndex
		    ast = ""
		  end if
		  
		  return success
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function Match_ident(tokens() As String, ByRef tokenIndex As Integer, ByRef ast As String) As Boolean
		  // ident = letter { letter | decimalDigit | "_" }
		  // letter = "A" ... "Z" | "a" ... "z"
		  // decimalDigit = "0" ... "9"
		  
		  Var success As Boolean
		  Var currentIndex As Integer
		  Var ch As String
		  Var i As Integer
		  
		  currentIndex = tokenIndex
		  success = true
		  
		  ast = tokens(tokenIndex)
		  tokenIndex = tokenIndex + 1
		  i = 0
		  while (i < ast.Length) and success
		    ch = ast.Middle(i, 1).Lowercase()
		    if not ( (ch >= "a") and (ch <= "z") or _
		      (ch >= "0") and (ch <= "9") or _
		      (ch = "_") ) then
		      success = false
		    end if
		    i = i + 1
		  wend
		  
		  if not success then
		    tokenIndex = currentIndex
		    ast = ""
		  end if
		  
		  return success
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function Match_identType(tokens() As String, ByRef tokenIndex As Integer, ByRef ast As String) As Boolean
		  // identType = [ "." ] { ident "." } ident
		  
		  // Used for:
		  // messageType = [ "." ] { ident "." } messageName
		  // enumType = [ "." ] { ident "." } enumName
		  
		  // TODO: split into different enums, and do lookup checks on message names and enum names
		  
		  Var success As Boolean
		  Var currentIndex As Integer
		  Var astArr() As String
		  Var tmpAst As String
		  
		  currentIndex = tokenIndex
		  success = false
		  
		  if tokens(tokenIndex) = "." then
		    astArr.Append(".")
		    tokenIndex = tokenIndex + 1
		  end if
		  
		  success = true
		  do
		    if Match_ident(tokens, tokenIndex, tmpAst) then
		      astArr.Add tmpAst
		    else
		      success = false
		    end if
		    if success and (tokens(tokenIndex) = ".") then
		      astArr.Add tmpAst
		      tokenIndex = tokenIndex + 1
		    end if
		  loop until (astArr(astArr.Ubound) <> ".") or not success
		  
		  if success then
		    ast = Join(astArr, "")
		  else
		    tokenIndex = currentIndex
		    ast = ""
		  end if
		  
		  return success
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function Match_import(tokens() As String, ByRef tokenIndex As Integer, ByRef ast As String) As Boolean
		  // import = "import" [ "weak" | "public" ] strLit ";"
		  
		  Var success As Boolean
		  Var currentIndex As Integer
		  
		  currentIndex = tokenIndex
		  success = false
		  
		  if tokens(tokenIndex) = "import" then
		    tokenIndex = tokenIndex + 1
		    break
		  end if
		  
		  if not success then
		    tokenIndex = currentIndex
		    ast = ""
		  end if
		  
		  return success
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function Match_intLit(tokens() As String, ByRef tokenIndex As Integer, ByRef ast As String) As Boolean
		  // intLit = decimalLit | octalLit | hexLit
		  
		  Var success As Boolean
		  Var currentIndex As Integer
		  
		  currentIndex = tokenIndex
		  success = false
		  
		  if match_decimalLit(tokens, tokenIndex, ast) then
		    success = true
		    
		  elseif match_octalLit(tokens, tokenIndex, ast) then
		    success = true
		    
		  elseif match_hexLit(tokens, tokenIndex, ast) then
		    success = true
		    
		  end if
		  
		  if not success then
		    tokenIndex = currentIndex
		    ast = ""
		  end if
		  
		  return success
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function Match_mapField(tokens() As String, ByRef tokenIndex As Integer, ByRef ast As String) As Boolean
		  // mapField = "map" "<" keyType "," type ">" mapName "=" fieldNumber [ "[" fieldOptions "]" ] ";"
		  // keyType = "int32" | "int64" | "uint32" | "uint64" | "sint32" | "sint64" | "fixed32" | "fixed64" | "sfixed32" | "sfixed64" | "bool" | "string"
		  
		  Var success As Boolean
		  Var currentIndex As Integer
		  
		  currentIndex = tokenIndex
		  success = false
		  
		  if tokens(tokenIndex) = "map" then
		    tokenIndex = tokenIndex + 1
		    break
		  end if
		  
		  //break  // TODO
		  
		  if not success then
		    tokenIndex = currentIndex
		    ast = ""
		  end if
		  
		  return success
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function Match_message(tokens() As String, ByRef tokenIndex As Integer, ByRef ast As String) As Boolean
		  // message = "message" messageName messageBody
		  
		  Var success As Boolean
		  Var currentIndex As Integer
		  Var msgName As String
		  Var msgBody As String
		  
		  currentIndex = tokenIndex
		  success = false
		  
		  if tokens(tokenIndex) = "message" then
		    tokenIndex = tokenIndex + 1
		    
		    if Match_ident(tokens, tokenIndex, msgName) then
		      if Match_messageBody(tokens, tokenIndex, msgBody) then
		        success = true
		      else
		        break // ERROR: invalid message body
		      end if
		    else
		      break // ERROR: invalid message name
		    end if
		    
		  end if
		  
		  if success then
		    ast = "{""type"":""messsage"",""name"":""" + msgName + """" + msgBody + "}"
		  else
		    tokenIndex = currentIndex
		    ast = ""
		  end if
		  
		  return success
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function Match_messageBody(tokens() As String, ByRef tokenIndex As Integer, ByRef ast As String) As Boolean
		  // messageBody = "{" { field | enum | message | option | oneof | mapField | reserved | emptyStatement } "}"
		  
		  Var success As Boolean
		  Var currentIndex As Integer
		  Var propertyAst As String
		  Var properties() As String
		  Var enumAst As String
		  Var enums() As String
		  Var reserveAst As String
		  Var reserves() As String
		  Var messageAst As String
		  Var messages() As String
		  Var oneOfAst As String
		  Var oneOfs() As String
		  Var done As Boolean
		  Var item As JSONItem
		  Var i As Integer
		  Var j As Integer
		  Var astArr() As String
		  Var fieldItem As JSONItem
		  
		  currentIndex = tokenIndex
		  success = false
		  
		  if tokens(tokenIndex) = "{" then
		    tokenIndex = tokenIndex + 1
		    
		    success = true
		    done = false
		    while success and not done and (tokenIndex < tokens.Count) 
		      
		      if tokens(tokenIndex) = "}" then
		        tokenIndex = tokenIndex + 1
		        done = true
		        
		      elseif match_enum(tokens, tokenIndex, enumAst) then
		        enums.Add enumAst
		        
		      elseif match_message(tokens, tokenIndex, messageAst) then
		        messages.Add messageAst
		        
		      elseif match_option(tokens, tokenIndex, propertyAst) then
		        properties.Add propertyAst
		        
		      elseif match_oneof(tokens, tokenIndex, oneOfAst) then
		        oneOfs.Add oneOfAst
		        
		      elseif match_mapField(tokens, tokenIndex, propertyAst) then
		        properties.Add propertyAst
		        
		      elseif match_reserved(tokens, tokenIndex, reserveAst) then
		        reserves.Add reserveAst
		        
		      elseif match_emptyStatement(tokens, tokenIndex, propertyAst) then
		        // nothing to do
		        
		      elseif match_field(tokens, tokenIndex, propertyAst) then
		        properties.Add propertyAst
		        
		      else
		        success = false
		        break // ERROR: invalid message property
		      end if
		      
		    wend
		    
		  end if
		  
		  if success then
		    
		    if reserves.Count > 0 then
		      astArr.Add ",""reserve"":["
		      astArr.Add Join(reserves, ",")
		      astArr.Add "]"
		    end if
		    
		    astArr.Add ",""enums"":{"
		    i = 0 
		    while i < enums.Count
		      item = new JSONItem(enums(i))
		      astArr.Add """"
		      astArr.Add item.Value("name")
		      astArr.Add """:"
		      astArr.Add enums(i)
		      i = i + 1
		      if i < enums.Count then
		        astArr.Add ","
		      end if
		    wend
		    astArr.Add "}"
		    
		    // messages
		    
		    astArr.Add ",""messages"":{"
		    i = 0 
		    while i < messages.Count
		      item = new JSONItem(messages(i))
		      astArr.Add """"
		      astArr.Add item.Value("name")
		      astArr.Add """:"
		      astArr.Add messages(i)
		      i = i + 1
		      if i < messages.Count then
		        astArr.Add ","
		      end if
		    wend
		    astArr.Add "}"
		    
		    astArr.Add ",""items"":{"
		    
		    // properties
		    
		    i = 0 
		    while i < properties.Count
		      item = new JSONItem(properties(i))
		      astArr.Add """"
		      astArr.Add item.Value("number")
		      astArr.Add """:"
		      astArr.Add properties(i)
		      i = i + 1
		      if i < properties.Count then
		        astArr.Add ","
		      end if
		    wend
		    
		    // oneOfs
		    
		    if (properties.Count > 0) and (oneOfs.Count > 0) then
		      astArr.Add ","
		    end if
		    
		    i = 0 
		    while i < oneOfs.Count
		      
		      item = new JSONItem(oneOfs(i))
		      
		      j = 0
		      while j < item.Count
		        
		        if (j = 0) and (i > 0) then
		          astArr.Add ","
		        end if
		        
		        fieldItem = item.ChildAt(j)
		        
		        astArr.Add """"
		        astArr.Add fieldItem.Value("number")
		        astArr.Add """:"
		        astArr.Add fieldItem.ToString()
		        j = j + 1
		        
		        if j < item.Count then
		          astArr.Add ","
		        end if
		        
		      wend
		      
		      i = i + 1
		      
		    wend
		    
		    astArr.Add "}"
		    
		    
		    ast = Join(astArr, "")
		  else
		    tokenIndex = currentIndex
		    ast = ""
		  end if
		  
		  return success
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function Match_octalLit(tokens() As String, ByRef tokenIndex As Integer, ByRef ast As String) As Boolean
		  // octalLit   = "0" { octalDigit }
		  // octalDigit   = "0" ... "7"
		  
		  Var success As Boolean
		  Var currentIndex As Integer
		  Var ch As String
		  Var i As Integer
		  
		  currentIndex = tokenIndex
		  success = true
		  
		  ast = tokens(tokenIndex)
		  tokenIndex = tokenIndex + 1
		  
		  ch = ast.Middle(0, 1)
		  if (ch <> "0") then
		    success = false
		  end if
		  
		  i = 1
		  while (i < ast.Length) and success
		    ch = ast.Middle(i, 1)
		    if (ch < "0") or (ch > "7") then
		      success = false
		    end if
		    i = i + 1
		  wend
		  
		  if success then
		    ast = Str(Integer.FromOctal(ast))
		  else
		    tokenIndex = currentIndex
		    ast = ""
		  end if
		  
		  return success
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function Match_oneOf(tokens() As String, ByRef tokenIndex As Integer, ByRef ast As String) As Boolean
		  // oneof = "oneof" oneofName "{" { option | oneofField } "}"
		  // oneofName = ident
		  
		  Var success As Boolean
		  Var currentIndex As Integer
		  Var oneOfName As String
		  Var fields() As String
		  Var fieldAst As String
		  Var fieldItem As JSONItem
		  
		  currentIndex = tokenIndex
		  success = false
		  
		  if tokens(tokenIndex) = "oneof" then
		    tokenIndex = tokenIndex + 1
		    
		    if Match_ident(tokens, tokenIndex, oneOfName) then
		      
		      if tokens(tokenIndex) = "{" then
		        tokenIndex = tokenIndex + 1
		        
		        success = true
		        while (tokens(tokenIndex) <> "}") and success
		          
		          if Match_option(tokens, tokenIndex, fieldAst) then
		            break
		            fieldItem = new JSONItem(fieldAst)
		            fieldItem.Value("oneof") = oneOfName
		            fields.Append fieldItem.ToString()
		            
		          elseif Match_oneOfField(tokens, tokenIndex, fieldAst) then
		            fieldItem = new JSONItem(fieldAst)
		            fieldItem.Value("oneof") = oneOfName
		            fields.Append fieldItem.ToString()
		            
		          else
		            break // ERROR: expected option or oneofField
		            success = false
		          end if
		          
		        wend
		        
		        if success then
		          tokenIndex = tokenIndex + 1
		        end if
		        
		      else
		        break // ERROR: expected closing curly bracket
		      end if
		      
		    else
		      break // ERROR: expected oneof name identifier
		    end if
		    
		  end if
		  
		  if success then
		    ast = "[" + Join(fields, ",") + "]"
		  else
		    tokenIndex = currentIndex
		    ast = ""
		  end if
		  
		  return success
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function Match_oneOfField(tokens() As String, ByRef tokenIndex As Integer, ByRef ast As String) As Boolean
		  // oneofField = type fieldName "=" fieldNumber [ "[" fieldOptions "]" ] ";"
		  // fieldName = ident
		  // fieldNumber = intLit
		  
		  Var success As Boolean
		  Var currentIndex As Integer
		  Var fieldType As String
		  Var fieldName As String
		  Var fieldNumber As String
		  Var astArr() As String
		  Var fieldOptions As String
		  
		  currentIndex = tokenIndex
		  success = false
		  
		  if Match_type(tokens, tokenIndex, fieldType) then
		    if Match_ident(tokens, tokenIndex, fieldName) then
		      if tokens(tokenIndex) = "=" then
		        tokenIndex = tokenIndex + 1
		        
		        if Match_intLit(tokens, tokenIndex, fieldNumber) then
		          
		          success = true
		          if tokens(tokenIndex) = "[" then
		            tokenIndex = tokenIndex + 1
		            if Match_fieldOptions(tokens, tokenIndex, fieldOptions) then
		              if tokens(tokenIndex) = "]" then
		                tokenIndex = tokenIndex + 1
		              else
		                success = false
		              end if
		            else
		              success = false
		            end if
		          end if
		          
		          if success then
		            if tokens(tokenIndex) = ";" then
		              tokenIndex = tokenIndex + 1
		            else
		              success = false
		              break // ERROR: expected ;
		            end if
		          end if
		          
		        else
		          break // ERROR: expected integer literal
		        end if
		        
		      else
		        break // ERROR: expected =
		      end if
		      
		    else
		      break // ERROR: invalid field name
		    end
		  end if
		  
		  if success then
		    astArr.Add "{""type"":"""
		    astArr.Add fieldType
		    astArr.Add """"
		    
		    if fieldOptions <> "" then
		      astArr.Add ",""options"":"
		      astArr.Add fieldOptions
		    end if
		    
		    astArr.Add ",""name"":"""
		    astArr.Add fieldName
		    astArr.Add """,""number"":"
		    astArr.Add fieldNumber
		    astArr.Add "}"
		    
		    ast = join(astArr, "")
		  else
		    tokenIndex = currentIndex
		    ast = ""
		  end if
		  
		  return success
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function Match_option(tokens() As String, ByRef tokenIndex As Integer, ByRef ast As String) As Boolean
		  // option = "option" optionName  "=" constant ";"
		  // optionName = optionNamePart { "." optionNamePart }
		  // optionNamePart = { ident | "(" ["."] fullIdent ")" }
		  
		  Var success As Boolean
		  Var currentIndex As Integer
		  Var optionName As String
		  Var optionValue As String
		  Var astArr() As String
		  
		  currentIndex = tokenIndex
		  success = false
		  
		  if tokens(tokenIndex) = "option" then
		    tokenIndex = tokenIndex + 1
		    
		    if Match_optionName(tokens, tokenIndex, optionName) then
		      
		      if tokens(tokenIndex) = "=" then
		        tokenIndex = tokenIndex + 1
		        
		        if Match_constant(tokens, tokenIndex, optionValue) then
		          success = true
		        else
		          break // ERROR: invalid option value
		        end if
		        
		      else
		        break // ERROR: expected =
		      end if
		      
		    else
		      break // ERROR: invalid option name
		    end if
		    
		  end if
		  
		  if success then
		    astArr.Add "{""name"":"""
		    astArr.Add optionName
		    astArr.Add """,""value"":"""
		    astArr.Add optionValue
		    astArr.Add """}"
		    ast = Join(astArr, "")
		  else
		    tokenIndex = currentIndex
		    ast = ""
		  end if
		  
		  return success
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function Match_optionName(tokens() As String, ByRef tokenIndex As Integer, ByRef ast As String) As Boolean
		  // optionName = optionNamePart { "." optionNamePart }
		  
		  Var success As Boolean
		  Var currentIndex As Integer
		  Var parts() As String
		  Var tmpAst As String
		  
		  currentIndex = tokenIndex
		  success = false
		  
		  if Match_optionNamePart(tokens, tokenIndex, tmpAst) then
		    parts.Add tmpAst
		    
		    success = true
		    while (tokens(tokenIndex) = ".") and success
		      tokenIndex = tokenIndex + 1
		      if Match_optionNamePart(tokens, tokenIndex, tmpAst) then
		        parts.Add tmpAst
		      else
		        success = false
		      end if
		      break
		    wend
		    
		  end if
		  
		  if success then
		    ast = Join(parts, ".")
		  else
		    tokenIndex = currentIndex
		    ast = ""
		  end if
		  
		  return success
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function Match_optionNamePart(tokens() As String, ByRef tokenIndex As Integer, ByRef ast As String) As Boolean
		  // optionNamePart = { ident | "(" ["."] fullIdent ")" }
		  
		  // TODO: shouldn't the curly brackets be normal brackets???
		  // since a repeat of identidentident would not make sense
		  
		  Var success As Boolean
		  Var currentIndex As Integer
		  
		  currentIndex = tokenIndex
		  success = false
		  
		  if Match_ident(tokens, tokenIndex, ast) then
		    success = true
		  elseif tokens(tokenIndex) = "(" then
		    tokenIndex = tokenIndex + 1
		    break // TODO.. complete parsing
		  end if
		  
		  if not success then
		    tokenIndex = currentIndex
		    ast = ""
		  end if
		  
		  return success
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function Match_package(tokens() As String, ByRef tokenIndex As Integer, ByRef ast As String) As Boolean
		  // package = "package" fullIdent ";"
		  
		  Var success As Boolean
		  Var currentIndex As Integer
		  
		  currentIndex = tokenIndex
		  success = false
		  
		  if tokens(tokenIndex) = "package" then
		    tokenIndex = tokenIndex + 1
		    
		    if Match_fullIdent(tokens, tokenIndex, ast) then
		      
		      if tokens(tokenIndex) = ";" then
		        tokenIndex = tokenIndex + 1
		        success = true
		      end if
		      
		    end if
		    
		  end if
		  
		  if not success then
		    tokenIndex = currentIndex
		    ast = ""
		  end if
		  
		  return success
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function Match_proto(tokens() As String, ByRef tokenIndex As Integer, ByRef ast As String) As Boolean
		  // proto = syntax { import | package | option | topLevelDef | emptyStatement }
		  
		  Var success As Boolean
		  Var currentIndex As Integer
		  Var syntaxAst As String
		  Var messageAst As String
		  Var messages() As JSONItem
		  Var enums() As JSONItem
		  Var options() As JSONItem
		  Var packageAst As String
		  Var i As Integer
		  Var item As JSONItem
		  Var astArr() As String
		  Var tmpAst As String
		  
		  currentIndex = tokenIndex
		  success = false
		  
		  if Match_syntax(tokens, tokenIndex, syntaxAst) then
		    
		    success = true
		    while success and (tokenIndex < tokens.Count) 
		      
		      if match_import(tokens, tokenIndex, messageAst) then
		        break // messages.Add messageAst
		        
		      elseif match_package(tokens, tokenIndex, tmpAst) then
		        packageAst = tmpAst
		        
		      elseif match_option(tokens, tokenIndex, tmpAst) then
		        item = new JSONItem(tmpAst)
		        options.Add item
		        
		      elseif match_topLevelDef(tokens, tokenIndex, messageAst) then
		        item = new JSONItem(messageAst)
		        
		        if item.Value("type") = "enum" then
		          enums.Add item
		        else
		          messages.Add item
		        end if
		        
		      elseif match_emptyStatement(tokens, tokenIndex, messageAst) then
		        // do nothing
		        
		      else
		        success = false
		        break // ERROR: invalid statement
		      end if
		      
		    wend
		    
		  else
		    break // ERROR: invalid syntax
		  end if
		  
		  if success then
		    astArr.Add "{""syntax"":"""
		    astArr.Add syntaxAst
		    astArr.Add """"
		    
		    if packageAst <> "" then
		      astArr.Add ",""package"":"""
		      astArr.Add packageAst
		      astArr.Add """"
		    end if
		    
		    // options
		    
		    astArr.Add ",""options"":{" 
		    i = 0 
		    while i < options.Count
		      if i > 0 then
		        astArr.Add ","
		      end if
		      item = options(i)
		      astArr.Add """"
		      astArr.Add item.Value("name")
		      astArr.Add """:"""
		      astArr.Add item.Value("value")
		      astArr.Add """"
		      i = i + 1
		    wend
		    astArr.Add "}"
		    ast = Join(astArr, "")
		    
		    // enums
		    
		    astArr.Add ",""enums"":{" 
		    i = 0 
		    while i < enums.Count
		      if i > 0 then
		        astArr.Add ","
		      end if
		      item = enums(i)
		      astArr.Add """"
		      astArr.Add item.Value("name")
		      astArr.Add """:"
		      astArr.Add item.ToString()
		      i = i + 1
		    wend
		    astArr.Add "}"
		    ast = Join(astArr, "")
		    
		    // messages
		    
		    astArr.Add ",""messages"":{" 
		    i = 0 
		    while i < messages.Count
		      if i > 0 then
		        astArr.Add ","
		      end if
		      item = messages(i)
		      astArr.Add """"
		      astArr.Add item.Value("name")
		      astArr.Add """:"
		      astArr.Add item.ToString()
		      i = i + 1
		    wend
		    astArr.Add "}"
		    
		    astArr.Add "}"
		    
		    ast = Join(astArr, "")
		    
		  else
		    tokenIndex = currentIndex
		    ast = ""
		  end if
		  
		  return success
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function Match_range(tokens() As String, ByRef tokenIndex As Integer, ByRef ast As String) As Boolean
		  // range =  intLit [ "to" ( intLit | "max" ) ]
		  
		  Var success As Boolean
		  Var currentIndex As Integer
		  Var fromAst As String
		  Var toAst As String
		  
		  currentIndex = tokenIndex
		  success = false
		  
		  if Match_intLit(tokens, tokenIndex, fromAst) then 
		    
		    if tokens(tokenIndex) = "to" then
		      tokenIndex = tokenIndex + 1
		      
		      if Match_intLit(tokens, tokenIndex, toAst) then
		        success = true
		      elseif tokens(tokenIndex) = "max" then
		        toAst = """max"""
		        tokenIndex = tokenIndex + 1
		        success = true
		      end if
		      
		    else
		      success = true
		    end if
		    
		  end if
		  
		  if success then
		    if toAst <> "" then
		      ast = "[" + fromAst + "," + toAst + "]"
		    else
		      ast = fromAst
		    end if
		  else
		    tokenIndex = currentIndex
		    ast = ""
		  end if
		  
		  return success
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function Match_ranges(tokens() As String, ByRef tokenIndex As Integer, ByRef ast As String) As Boolean
		  // ranges = range { "," range }
		  
		  Var success As Boolean
		  Var currentIndex As Integer
		  Var ranges() As String
		  Var tmpAst As String
		  
		  currentIndex = tokenIndex
		  success = false
		  
		  if Match_range(tokens, tokenIndex, tmpAst) then
		    
		    ranges.Add tmpAst
		    
		    success = true
		    while (tokens(tokenIndex) = ",") and success
		      tokenIndex = tokenIndex + 1
		      
		      if Match_range(tokens, tokenIndex, tmpAst) then
		        ranges.Add tmpAst
		      else
		        success = false
		      end if
		      
		    wend
		    
		  end if
		  
		  if success then
		    ast = Join(ranges, ",")
		  else
		    tokenIndex = currentIndex
		    ast = ""
		  end if
		  
		  return success
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function Match_reserved(tokens() As String, ByRef tokenIndex As Integer, ByRef ast As String) As Boolean
		  // reserved = "reserved" ( ranges | strFieldNames ) ";"
		  
		  Var success As Boolean
		  Var currentIndex As Integer
		  
		  currentIndex = tokenIndex
		  success = false
		  
		  if tokens(tokenIndex) = "reserved" then
		    tokenIndex = tokenIndex + 1
		    
		    if Match_ranges(tokens, tokenIndex, ast) then
		      success = true
		    elseif Match_strFieldNames(tokens, tokenIndex, ast) then
		      success = true
		    else
		      break // ERROR: Expected range or fieldname
		    end if
		    
		    if success then
		      if tokens(tokenIndex) = ";" then
		        tokenIndex = tokenIndex + 1
		      else
		        success = false
		      end if
		    end if
		    
		  end if
		  
		  if not success then
		    tokenIndex = currentIndex
		    ast = ""
		  end if
		  
		  return success
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function Match_service(tokens() As String, ByRef tokenIndex As Integer, ByRef ast As String) As Boolean
		  // service = "service" serviceName "{" { option | rpc | emptyStatement } "}"
		  
		  Var success As Boolean
		  Var currentIndex As Integer
		  
		  currentIndex = tokenIndex
		  success = false
		  
		  if tokens(tokenIndex) = "service" then
		    tokenIndex = tokenIndex + 1
		    break
		  end if
		  
		  if not success then
		    tokenIndex = currentIndex
		    ast = ""
		  end if
		  
		  return success
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function Match_strFieldNames(tokens() As String, ByRef tokenIndex As Integer, ByRef ast As String) As Boolean
		  // strFieldNames = strFieldName { "," strFieldName }
		  // strFieldName = "'" fieldName "'" | '"' fieldName '"'
		  
		  Var success As Boolean
		  Var currentIndex As Integer
		  Var fieldNames() As String
		  
		  currentIndex = tokenIndex
		  success = false
		  
		  if (tokens(tokenIndex).Left(1) = """") and (tokens(tokenIndex).Right(1) = """") then
		    
		    fieldNames.Add tokens(tokenIndex)
		    tokenIndex = tokenIndex + 1
		    
		    success = true
		    while (tokens(tokenIndex) = ",") and success
		      tokenIndex = tokenIndex + 1
		      
		      if (tokens(tokenIndex).Left(1) = """") and (tokens(tokenIndex).Right(1) = """") then
		        fieldNames.Add tokens(tokenIndex)
		        tokenIndex = tokenIndex + 1
		      else
		        success = false
		      end if
		      
		    wend
		    
		  end if
		  
		  if success then
		    ast = Join(fieldNames, ",")
		  else
		    tokenIndex = currentIndex
		    ast = ""
		  end if
		  
		  return success
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function Match_strLit(tokens() As String, ByRef tokenIndex As Integer, ByRef ast As String) As Boolean
		  // strLit = strLitSingle { strLitSingle }
		  // strLitSingle = ( "'" { charValue } "'" ) |  ( '"' { charValue } '"' )
		  // charValue = hexEscape | octEscape | charEscape | unicodeEscape | unicodeLongEscape | /[^\0\n\\]/
		  // hexEscape = '\' ( "x" | "X" ) hexDigit [ hexDigit ]
		  // octEscape = '\' octalDigit [ octalDigit [ octalDigit ] ]
		  // charEscape = '\' ( "a" | "b" | "f" | "n" | "r" | "t" | "v" | '\' | "'" | '"' )
		  // unicodeEscape = '\' "u" hexDigit hexDigit hexDigit hexDigit
		  // unicodeLongEscape = '\' "U" ( "000" hexDigit hexDigit hexDigit hexDigit hexDigit |
		  //                 "0010" hexDigit hexDigit hexDigit hexDigit
		  
		  Var success As Boolean
		  Var currentIndex As Integer
		  
		  currentIndex = tokenIndex
		  success = false
		  
		  // break // TODO
		  
		  if not success then
		    tokenIndex = currentIndex
		    ast = ""
		  end if
		  
		  return success
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function Match_syntax(tokens() As String, ByRef tokenIndex As Integer, ByRef ast As String) As Boolean
		  // syntax = "syntax" "=" ("'" "proto3" "'" | '"' "proto3" '"') ";"
		  
		  Var success As Boolean
		  Var currentIndex As Integer
		  
		  currentIndex = tokenIndex
		  success = false
		  
		  if tokens(tokenIndex) = "syntax" then
		    tokenIndex = tokenIndex + 1
		    
		    if tokens(tokenIndex) = "=" then
		      tokenIndex = tokenIndex + 1
		      
		      if (tokens(tokenIndex) = """proto3""") or (tokens(tokenIndex) = "'proto3'") then
		        tokenIndex = tokenIndex + 1
		        ast = "proto3"
		        
		        if tokens(tokenIndex) = ";" then
		          tokenIndex = tokenIndex + 1
		          success = true
		        else
		          break // ERROR: expected ;
		        end if 
		        
		      else
		        break // ERROR: expected proto3
		      end if
		      
		    else
		      break // ERROR: expected =
		    end if
		    
		  end if
		  
		  if not success then
		    tokenIndex = currentIndex
		    ast = ""
		  end if
		  
		  return success
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function Match_topLevelDef(tokens() As String, ByRef tokenIndex As Integer, ByRef ast As String) As Boolean
		  // topLevelDef = message | enum | service
		  
		  Var success As Boolean
		  Var currentIndex As Integer
		  
		  currentIndex = tokenIndex
		  success = false
		  
		  if match_message(tokens, tokenIndex, ast) then
		    success = true
		    
		  elseif match_enum(tokens, tokenIndex, ast) then
		    success = true
		    
		  elseif match_option(tokens, tokenIndex, ast) then
		    success = true
		    
		  end if
		  
		  if not success then
		    tokenIndex = currentIndex
		    ast = ""
		  end if
		  
		  return success
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function Match_type(tokens() As String, ByRef tokenIndex As Integer, ByRef ast As String) As Boolean
		  // type = "double" | "float" | "int32" | "int64" | "uint32" | "uint64"
		  //         | "sint32" | "sint64" | "fixed32" | "fixed64" | "sfixed32" | "sfixed64"
		  //         | "bool" | "string" | "bytes" | messageType | identType
		  // Revised from:
		  //         | "bool" | "string" | "bytes" | messageType | enumType
		  
		  Var success As Boolean
		  Var currentIndex As Integer
		  
		  currentIndex = tokenIndex
		  success = false
		  
		  ast = tokens(tokenIndex)
		  
		  select case ast
		    
		  case "double", "float", "int32", "int64", "uint32", "uint64", _
		    "sint32", "sint64", "fixed32", "fixed64", "sfixed32", "sfixed64", _
		    "bool", "string", "bytes"
		    
		    tokenIndex = tokenIndex + 1
		    success = true
		    
		  case else
		    
		    // identType
		    
		    success = Match_identType(tokens, tokenIndex, ast)
		    
		  end select
		  
		  if not success then
		    tokenIndex = currentIndex
		    ast = ""
		  end if
		  
		  return success
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function SchemaToJSON(schema As String) As JSONItem
		  Var tokens() As String
		  Var tokenIndex As Integer
		  Var schemaAst As String
		  Var schemaItem As JSONItem
		  
		  tokens = ExtractTokens(schema)
		  
		  tokenIndex = 0
		  if Match_proto(tokens, tokenIndex, schemaAst) then
		    schemaItem = new JSONItem(schemaAst)
		  else
		    break // ERROR: invalid proto schema
		  end if
		  
		  return schemaItem
		  
		End Function
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
