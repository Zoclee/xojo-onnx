#tag Class
Protected Class Tensor
	#tag Method, Flags = &h0
		Function Abs() As ONNX.Tensor
		  Var result as Tensor
		  Var resultData As MemoryBlock
		  Var pos As UInt64
		  
		  select case mElementType
		    
		    // ***** FLOAT *****************************************
		    
		  case ONNX.ElementTypeEnum.FLOAT 
		    
		    resultData = new MemoryBlock(mData.Size)
		    pos = 0
		    while pos < mData.Size
		      resultData.SingleValue(pos) = Abs(mData.SingleValue(pos))
		      pos = pos + mElementSize
		    wend
		    
		    result = new Tensor(mElementType, mShape, resultData)
		    
		  case else
		    break
		    
		  end select
		  
		  
		  return result
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Acos() As ONNX.Tensor
		  Var result as Tensor
		  Var resultData As MemoryBlock
		  Var pos As UInt64
		  
		  select case mElementType
		    
		    // ***** FLOAT *****************************************
		    
		  case ONNX.ElementTypeEnum.FLOAT 
		    
		    resultData = new MemoryBlock(mData.Size)
		    pos = 0
		    while pos < mData.Size
		      resultData.SingleValue(pos) = Acos(mData.SingleValue(pos))
		      pos = pos + mElementSize
		    wend
		    
		    result = new Tensor(mElementType, mShape, resultData)
		    
		  case else
		    break
		    
		  end select
		  
		  return result
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Acosh() As ONNX.Tensor
		  Var result as Tensor
		  Var resultData As MemoryBlock
		  Var pos As UInt64
		  Var tmpSingle As Single
		  
		  select case mElementType
		    
		    // ***** FLOAT *****************************************
		    
		  case ONNX.ElementTypeEnum.FLOAT 
		    
		    resultData = new MemoryBlock(mData.Size)
		    pos = 0
		    while pos < mData.Size
		      tmpSingle = mData.SingleValue(pos)
		      tmpSingle = tmpSingle + Sqrt(tmpSingle * tmpSingle - 1)
		      resultData.SingleValue(pos) = Log(tmpSingle) / Log(ONNX.E)
		      pos = pos + mElementSize
		    wend
		    
		    result = new Tensor(mElementType, mShape, resultData)
		    
		  case else
		    break
		    
		  end select
		  
		  return result
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Add(t As ONNX.Tensor) As ONNX.Tensor
		  Var result as Tensor
		  Var resultData As MemoryBlock
		  Var pos As UInt64
		  Var tData As MemoryBlock
		  
		  select case mElementType
		    
		    // ***** FLOAT *****************************************
		    
		  case ONNX.ElementTypeEnum.FLOAT
		    
		    tData = t.Data
		    resultData = new MemoryBlock(mData.Size)
		    pos = 0
		    while pos < mData.Size
		      resultData.SingleValue(pos) = mData.SingleValue(pos) + tData.SingleValue(pos)
		      pos = pos + mElementSize
		    wend
		    
		    result = new Tensor(mElementType, mShape, resultData)
		    
		  case else
		    break
		    
		  end select
		  
		  return result
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Asin() As ONNX.Tensor
		  Var result as Tensor
		  Var resultData As MemoryBlock
		  Var pos As UInt64
		  
		  select case mElementType
		    
		    // ***** FLOAT *****************************************
		    
		  case ONNX.ElementTypeEnum.FLOAT 
		    
		    resultData = new MemoryBlock(mData.Size)
		    pos = 0
		    while pos < mData.Size
		      resultData.SingleValue(pos) = Asin(mData.SingleValue(pos))
		      pos = pos + mElementSize
		    wend
		    
		    result = new Tensor(mElementType, mShape, resultData)
		    
		  case else
		    break
		    
		  end select
		  
		  return result
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Asinh() As ONNX.Tensor
		  Var result as Tensor
		  Var resultData As MemoryBlock
		  Var pos As UInt64
		  Var tmpSingle As Single
		  
		  select case mElementType
		    
		    // ***** FLOAT *****************************************
		    
		  case ONNX.ElementTypeEnum.FLOAT 
		    
		    resultData = new MemoryBlock(mData.Size)
		    pos = 0
		    while pos < mData.Size
		      tmpSingle = mData.SingleValue(pos)
		      tmpSingle = tmpSingle + Sqrt(tmpSingle * tmpSingle + 1)
		      resultData.SingleValue(pos) = Log(tmpSingle) / Log(ONNX.E)
		      pos = pos + mElementSize
		    wend
		    
		    result = new Tensor(mElementType, mShape, resultData)
		    
		  case else
		    break
		    
		  end select
		  
		  return result
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Atan() As ONNX.Tensor
		  Var result as Tensor
		  Var resultData As MemoryBlock
		  Var pos As UInt64
		  
		  select case mElementType
		    
		    // ***** FLOAT *****************************************
		    
		  case ONNX.ElementTypeEnum.FLOAT 
		    
		    resultData = new MemoryBlock(mData.Size)
		    pos = 0
		    while pos < mData.Size
		      resultData.SingleValue(pos) = Atan(mData.SingleValue(pos))
		      pos = pos + mElementSize
		    wend
		    
		    result = new Tensor(mElementType, mShape, resultData)
		    
		  case else
		    break
		    
		  end select
		  
		  return result
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Atanh() As ONNX.Tensor
		  Var result as Tensor
		  Var resultData As MemoryBlock
		  Var pos As UInt64
		  Var tmpSingle As Single
		  
		  select case mElementType
		    
		    // ***** FLOAT *****************************************
		    
		  case ONNX.ElementTypeEnum.FLOAT 
		    
		    resultData = new MemoryBlock(mData.Size)
		    pos = 0
		    while pos < mData.Size
		      tmpSingle = mData.SingleValue(pos)
		      tmpSingle = (1 + tmpSingle) / (1 - tmpSingle)
		      resultData.SingleValue(pos) = (Log(tmpSingle) / Log(ONNX.E)) / 2
		      pos = pos + mElementSize
		    wend
		    
		    result = new Tensor(mElementType, mShape, resultData)
		    
		  case else
		    break
		    
		  end select
		  
		  return result
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Ceil() As ONNX.Tensor
		  Var result as Tensor
		  Var resultData As MemoryBlock
		  Var pos As UInt64
		  
		  select case mElementType
		    
		    // ***** FLOAT *****************************************
		    
		  case ONNX.ElementTypeEnum.FLOAT 
		    
		    resultData = new MemoryBlock(mData.Size)
		    pos = 0
		    while pos < mData.Size
		      resultData.SingleValue(pos) = Ceil(mData.SingleValue(pos))
		      pos = pos + mElementSize
		    wend
		    
		    result = new Tensor(mElementType, mShape, resultData)
		    
		  case else
		    break
		    
		  end select
		  
		  
		  return result
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor(initElementType As ONNX.ElementTypeEnum, initShape() As Integer, initData As MemoryBlock)
		  Var i As Integer
		  
		  mName = ""
		  mElementType = initElementType
		  SetElementSize()
		  
		  Redim mShape(-1)
		  i = 0
		  while i < initShape.Count
		    mShape.Add initShape(i)
		    i = i + 1
		  wend
		  
		  mData = initData
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor(initElementType As ONNX.ElementTypeEnum, initData As String)
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
		    
		  case ONNX.ElementTypeEnum.BOOL
		    pos = 0
		    i = 0
		    while i < mShape(0)
		      row = item.Child(i)
		      j = 0
		      while j < mShape(1)
		        if row.ValueAt(j) then
		          mData.UInt8Value(pos) = 1
		        else
		          mData.UInt8Value(pos) = 0
		        end if
		        pos = pos + mElementSize
		        j = j + 1 
		      wend
		      i = i + 1
		    wend
		    
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

	#tag Method, Flags = &h0
		Function Cos() As ONNX.Tensor
		  Var result as Tensor
		  Var resultData As MemoryBlock
		  Var pos As UInt64
		  
		  select case mElementType
		    
		    // ***** FLOAT *****************************************
		    
		  case ONNX.ElementTypeEnum.FLOAT 
		    
		    resultData = new MemoryBlock(mData.Size)
		    pos = 0
		    while pos < mData.Size
		      resultData.SingleValue(pos) = Cos(mData.SingleValue(pos))
		      pos = pos + mElementSize
		    wend
		    
		    result = new Tensor(mElementType, mShape, resultData)
		    
		  case else
		    break
		    
		  end select
		  
		  
		  return result
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Cosh() As ONNX.Tensor
		  Var result as Tensor
		  Var resultData As MemoryBlock
		  Var pos As UInt64
		  Var tmpSingle As Single
		  
		  select case mElementType
		    
		    // ***** FLOAT *****************************************
		    
		  case ONNX.ElementTypeEnum.FLOAT 
		    
		    resultData = new MemoryBlock(mData.Size)
		    pos = 0
		    while pos < mData.Size
		      tmpSingle = mData.SingleValue(pos)
		      resultData.SingleValue(pos) = (Pow(ONNX.E, tmpSingle) + Pow(ONNX.E, -tmpSingle)) / 2
		      pos = pos + mElementSize
		    wend
		    
		    result = new Tensor(mElementType, mShape, resultData)
		    
		  case else
		    break
		    
		  end select
		  
		  return result
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ElementCount() As Integer
		  Var i As Integer
		  Var count As Integer
		  
		  count = 1
		  i = 0
		  while i < mShape.Count
		    count = count * mShape(i)
		    i = i + 1
		  wend
		  
		  return count
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Exp() As ONNX.Tensor
		  Var result as Tensor
		  Var resultData As MemoryBlock
		  Var pos As UInt64
		  
		  select case mElementType
		    
		    // ***** FLOAT *****************************************
		    
		  case ONNX.ElementTypeEnum.FLOAT 
		    
		    resultData = new MemoryBlock(mData.Size)
		    pos = 0
		    while pos < mData.Size
		      resultData.SingleValue(pos) = Exp(mData.SingleValue(pos)) 
		      pos = pos + mElementSize
		    wend
		    
		    result = new Tensor(mElementType, mShape, resultData)
		    
		  case else
		    break
		    
		  end select
		  
		  
		  return result
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Floor() As ONNX.Tensor
		  Var result as Tensor
		  Var resultData As MemoryBlock
		  Var pos As UInt64
		  
		  select case mElementType
		    
		    // ***** FLOAT *****************************************
		    
		  case ONNX.ElementTypeEnum.FLOAT 
		    
		    resultData = new MemoryBlock(mData.Size)
		    pos = 0
		    while pos < mData.Size
		      resultData.SingleValue(pos) = Floor(mData.SingleValue(pos))
		      pos = pos + mElementSize
		    wend
		    
		    result = new Tensor(mElementType, mShape, resultData)
		    
		  case else
		    break
		    
		  end select
		  
		  
		  return result
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Greater(t As ONNX.Tensor) As ONNX.Tensor
		  Var result as Tensor
		  Var resultData As MemoryBlock
		  Var pos As UInt64
		  Var targetPos As UInt64
		  Var tData As MemoryBlock
		  
		  select case mElementType
		    
		    // ***** FLOAT *****************************************
		    
		  case ONNX.ElementTypeEnum.FLOAT 
		    
		    tData = t.Data
		    resultData = new MemoryBlock(ElementCount)
		    targetPos = 0
		    pos = 0
		    while pos < mData.Size
		      if mData.SingleValue(pos) > tData.SingleValue(pos) then
		        resultData.UInt8Value(targetPos) = 1
		      else
		        resultData.UInt8Value(targetPos) = 0
		      end if
		      pos = pos + mElementSize
		      targetPos = targetPos + 1
		    wend
		    
		    result = new Tensor(ONNX.ElementTypeEnum.BOOL, mShape, resultData)
		    
		  case else
		    break
		    
		  end select
		  
		  return result
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GreaterOrEqual(t As ONNX.Tensor) As ONNX.Tensor
		  Var result as Tensor
		  Var resultData As MemoryBlock
		  Var pos As UInt64
		  Var targetPos As UInt64
		  Var tData As MemoryBlock
		  
		  select case mElementType
		    
		    // ***** FLOAT *****************************************
		    
		  case ONNX.ElementTypeEnum.FLOAT 
		    
		    tData = t.Data
		    resultData = new MemoryBlock(ElementCount)
		    targetPos = 0
		    pos = 0
		    while pos < mData.Size
		      if mData.SingleValue(pos) >= tData.SingleValue(pos) then
		        resultData.UInt8Value(targetPos) = 1
		      else
		        resultData.UInt8Value(targetPos) = 0
		      end if
		      pos = pos + mElementSize
		      targetPos = targetPos + 1
		    wend
		    
		    result = new Tensor(ONNX.ElementTypeEnum.BOOL, mShape, resultData)
		    
		  case else
		    break
		    
		  end select
		  
		  return result
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Less(t As ONNX.Tensor) As ONNX.Tensor
		  Var result as Tensor
		  Var resultData As MemoryBlock
		  Var pos As UInt64
		  Var targetPos As UInt64
		  Var tData As MemoryBlock
		  
		  select case mElementType
		    
		    // ***** FLOAT *****************************************
		    
		  case ONNX.ElementTypeEnum.FLOAT 
		    
		    tData = t.Data
		    resultData = new MemoryBlock(ElementCount)
		    targetPos = 0
		    pos = 0
		    while pos < mData.Size
		      if mData.SingleValue(pos) < tData.SingleValue(pos) then
		        resultData.UInt8Value(targetPos) = 1
		      else
		        resultData.UInt8Value(targetPos) = 0
		      end if
		      pos = pos + mElementSize
		      targetPos = targetPos + 1
		    wend
		    
		    result = new Tensor(ONNX.ElementTypeEnum.BOOL, mShape, resultData)
		    
		  case else
		    break
		    
		  end select
		  
		  return result
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function LessOrEqual(t As ONNX.Tensor) As ONNX.Tensor
		  Var result as Tensor
		  Var resultData As MemoryBlock
		  Var pos As UInt64
		  Var targetPos As UInt64
		  Var tData As MemoryBlock
		  
		  select case mElementType
		    
		    // ***** FLOAT *****************************************
		    
		  case ONNX.ElementTypeEnum.FLOAT 
		    
		    tData = t.Data
		    resultData = new MemoryBlock(ElementCount)
		    targetPos = 0
		    pos = 0
		    while pos < mData.Size
		      if mData.SingleValue(pos) <= tData.SingleValue(pos) then
		        resultData.UInt8Value(targetPos) = 1
		      else
		        resultData.UInt8Value(targetPos) = 0
		      end if
		      pos = pos + mElementSize
		      targetPos = targetPos + 1
		    wend
		    
		    result = new Tensor(ONNX.ElementTypeEnum.BOOL, mShape, resultData)
		    
		  case else
		    break
		    
		  end select
		  
		  return result
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Log() As ONNX.Tensor
		  Var result as Tensor
		  Var resultData As MemoryBlock
		  Var pos As UInt64
		  
		  select case mElementType
		    
		    // ***** FLOAT *****************************************
		    
		  case ONNX.ElementTypeEnum.FLOAT 
		    
		    resultData = new MemoryBlock(mData.Size)
		    pos = 0
		    while pos < mData.Size
		      resultData.SingleValue(pos) = Log(mData.SingleValue(pos))
		      pos = pos + mElementSize
		    wend
		    
		    result = new Tensor(mElementType, mShape, resultData)
		    
		  case else
		    break
		    
		  end select
		  
		  
		  return result
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function LogicalAnd(t As ONNX.Tensor) As ONNX.Tensor
		  Var result as Tensor
		  Var resultData As MemoryBlock
		  Var pos As UInt64
		  Var tData As MemoryBlock
		  
		  select case mElementType
		    
		    // ***** BOOL *****************************************
		    
		  case ONNX.ElementTypeEnum.BOOL 
		    
		    tData = t.Data
		    resultData = new MemoryBlock(mData.Size)
		    pos = 0
		    while pos < mData.Size
		      if (mData.UInt8Value(pos) <> 0) and (tData.UInt8Value(pos) <> 0) then
		        resultData.UInt8Value(pos) = 1
		      else
		        resultData.UInt8Value(pos) = 0
		      end if
		      pos = pos + mElementSize
		    wend
		    
		    result = new Tensor(mElementType, mShape, resultData)
		    
		  case else
		    break
		    
		  end select
		  
		  return result
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function LogicalNot() As ONNX.Tensor
		  Var result as Tensor
		  Var resultData As MemoryBlock
		  Var pos As UInt64
		  
		  select case mElementType
		    
		    // ***** BOOL *****************************************
		    
		  case ONNX.ElementTypeEnum.BOOL 
		    
		    resultData = new MemoryBlock(mData.Size)
		    pos = 0
		    while pos < mData.Size
		      resultData.UInt8Value(pos) = (mData.UInt8Value(pos) + 1) mod 2
		      pos = pos + mElementSize
		    wend
		    
		    result = new Tensor(mElementType, mShape, resultData)
		    
		  case else
		    break
		    
		  end select
		  
		  return result
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function LogicalOr(t As ONNX.Tensor) As ONNX.Tensor
		  Var result as Tensor
		  Var resultData As MemoryBlock
		  Var pos As UInt64
		  Var tData As MemoryBlock
		  
		  select case mElementType
		    
		    // ***** BOOL *****************************************
		    
		  case ONNX.ElementTypeEnum.BOOL 
		    
		    tData = t.Data
		    resultData = new MemoryBlock(mData.Size)
		    pos = 0
		    while pos < mData.Size
		      if (mData.UInt8Value(pos) = 1) or (tData.UInt8Value(pos) = 1) then
		        resultData.UInt8Value(pos) = 1
		      else
		        resultData.UInt8Value(pos) = 0
		      end if
		      pos = pos + mElementSize
		    wend
		    
		    result = new Tensor(mElementType, mShape, resultData)
		    
		  case else
		    break
		    
		  end select
		  
		  return result
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function MatMul(t As ONNX.Tensor) As ONNX.Tensor
		  Var result as Tensor
		  Var resultData As MemoryBlock
		  Var i As UInt64
		  Var j As UInt64
		  Var k As UInt64
		  Var tData As MemoryBlock
		  Var dot As Single
		  
		  select case mElementType
		    
		    // ***** FLOAT *****************************************
		    
		  case ONNX.ElementTypeEnum.FLOAT 
		    
		    tData = t.Data
		    resultData = new MemoryBlock(mShape(0) * t.Shape(1) * mElementSize) // rows * t.cols * elementSize
		    
		    i = 0
		    while i < mShape(0) // rows
		      dot = 0
		      j = 0
		      while j < t.Shape(1) // t.cols
		        
		        dot = 0
		        k = 0
		        while (k < mShape(1)) // cols
		          dot = dot + Value(i, k) * t.Value(k, j)
		          k = k + 1
		        wend
		        
		        resultData.SingleValue((i * mShape(0) + j) * mElementSize) = dot
		        
		        j = j + 1
		      wend
		      
		      i = i + 1
		    wend
		    
		    result = new Tensor(mElementType, array(mShape(0), t.Shape(1)), resultData)
		    
		  case else
		    break
		    
		  end select
		  
		  
		  return result
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Max(t As ONNX.Tensor) As ONNX.Tensor
		  Var result as Tensor
		  Var resultData As MemoryBlock
		  Var pos As UInt64
		  Var tData As MemoryBlock
		  
		  select case mElementType
		    
		    // ***** FLOAT *****************************************
		    
		  case ONNX.ElementTypeEnum.FLOAT
		    
		    tData = t.Data
		    resultData = new MemoryBlock(mData.Size)
		    pos = 0
		    while pos < mData.Size
		      if mData.SingleValue(pos) > tData.SingleValue(pos) then
		        resultData.SingleValue(pos) = mData.SingleValue(pos)
		      else
		        resultData.SingleValue(pos) = tData.SingleValue(pos)
		      end if
		      pos = pos + mElementSize
		    wend
		    
		    result = new Tensor(mElementType, mShape, resultData)
		    
		  case else
		    break
		    
		  end select
		  
		  return result
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Min(t As ONNX.Tensor) As ONNX.Tensor
		  Var result as Tensor
		  Var resultData As MemoryBlock
		  Var pos As UInt64
		  Var tData As MemoryBlock
		  
		  select case mElementType
		    
		    // ***** FLOAT *****************************************
		    
		  case ONNX.ElementTypeEnum.FLOAT
		    
		    tData = t.Data
		    resultData = new MemoryBlock(mData.Size)
		    pos = 0
		    while pos < mData.Size
		      if mData.SingleValue(pos) < tData.SingleValue(pos) then
		        resultData.SingleValue(pos) = mData.SingleValue(pos)
		      else
		        resultData.SingleValue(pos) = tData.SingleValue(pos)
		      end if
		      pos = pos + mElementSize
		    wend
		    
		    result = new Tensor(mElementType, mShape, resultData)
		    
		  case else
		    break
		    
		  end select
		  
		  return result
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Mul(t As ONNX.Tensor) As ONNX.Tensor
		  Var result as Tensor
		  Var resultData As MemoryBlock
		  Var pos As UInt64
		  Var tData As MemoryBlock
		  
		  select case mElementType
		    
		    // ***** FLOAT *****************************************
		    
		  case ONNX.ElementTypeEnum.FLOAT
		    
		    tData = t.Data
		    resultData = new MemoryBlock(mData.Size)
		    pos = 0
		    while pos < mData.Size
		      resultData.SingleValue(pos) = mData.SingleValue(pos) * tData.SingleValue(pos)
		      pos = pos + mElementSize
		    wend
		    
		    result = new Tensor(mElementType, mShape, resultData)
		    
		  case else
		    break
		    
		  end select
		  
		  return result
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Neg() As ONNX.Tensor
		  Var result as Tensor
		  Var resultData As MemoryBlock
		  Var pos As UInt64
		  
		  select case mElementType
		    
		    // ***** FLOAT *****************************************
		    
		  case ONNX.ElementTypeEnum.FLOAT 
		    
		    resultData = new MemoryBlock(mData.Size)
		    pos = 0
		    while pos < mData.Size
		      resultData.SingleValue(pos) = -mData.SingleValue(pos)
		      pos = pos + mElementSize
		    wend
		    
		    result = new Tensor(mElementType, mShape, resultData)
		    
		  case else
		    break
		    
		  end select
		  
		  
		  return result
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Pow(t As ONNX.Tensor) As ONNX.Tensor
		  Var result as Tensor
		  Var resultData As MemoryBlock
		  Var pos As UInt64
		  Var tData As MemoryBlock
		  
		  select case mElementType
		    
		    // ***** FLOAT *****************************************
		    
		  case ONNX.ElementTypeEnum.FLOAT
		    
		    tData = t.Data
		    resultData = new MemoryBlock(mData.Size)
		    pos = 0
		    while pos < mData.Size
		      resultData.SingleValue(pos) = Pow(mData.SingleValue(pos), tData.SingleValue(pos))
		      pos = pos + mElementSize
		    wend
		    
		    result = new Tensor(mElementType, mShape, resultData)
		    
		  case else
		    break
		    
		  end select
		  
		  return result
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Relu() As ONNX.Tensor
		  Var result as Tensor
		  Var resultData As MemoryBlock
		  Var pos As UInt64
		  Var tmpSingle As Single
		  
		  select case mElementType
		    
		    // ***** FLOAT *****************************************
		    
		  case ONNX.ElementTypeEnum.FLOAT 
		    
		    resultData = new MemoryBlock(mData.Size)
		    pos = 0
		    while pos < mData.Size
		      tmpSingle = mData.SingleValue(pos)
		      if tmpSingle < 0 then
		        resultData.SingleValue(pos) = 0
		      else
		        resultData.SingleValue(pos) = tmpSingle
		      end if
		      pos = pos + mElementSize
		    wend
		    
		    result = new Tensor(mElementType, mShape, resultData)
		    
		  case else
		    break
		    
		  end select
		  
		  
		  return result
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub SetElementSize()
		  select case mElementType
		    
		  case ONNX.ElementTypeEnum.BOOL
		    mElementSize = 1
		    
		  case ONNX.ElementTypeEnum.FLOAT
		    mElementSize = 4
		    
		  case else
		    break // TODO: define element size
		    
		  end select
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Shape(index As Integer) As Integer
		  return mShape(index)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Sigmoid() As ONNX.Tensor
		  Var result as Tensor
		  Var resultData As MemoryBlock
		  Var pos As UInt64
		  Var tmpSingle As Single
		  
		  select case mElementType
		    
		    // ***** FLOAT *****************************************
		    
		  case ONNX.ElementTypeEnum.FLOAT 
		    
		    resultData = new MemoryBlock(mData.Size)
		    pos = 0
		    while pos < mData.Size
		      tmpSingle = mData.SingleValue(pos)
		      resultData.SingleValue(pos) = 1 / (1 + Pow(ONNX.E, -mData.SingleValue(pos)))
		      pos = pos + mElementSize
		    wend
		    
		    result = new Tensor(mElementType, mShape, resultData)
		    
		  case else
		    break
		    
		  end select
		  
		  
		  return result
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Softmax(axis As Integer) As Tensor
		  Var result as Tensor
		  Var resultData As MemoryBlock
		  Var pos As UInt64
		  Var tmpSingle As Single
		  Var singleTotal As Single
		  Var col as UInt64
		  Var row As UInt64
		  
		  select case mElementType
		    
		    // ***** FLOAT *****************************************
		    
		  case ElementTypeEnum.FLOAT
		    
		    resultData = new MemoryBlock(mData.Size)
		    
		    // TODO: implement support for tensors of ranks higher than 2
		    
		    if (axis = 0) then
		      
		      col = 0
		      while col < mShape(1)
		        
		        singleTotal = 0
		        
		        row = 0
		        while row < mShape(0)
		          pos = (row * mShape(1) + col) * mElementSize
		          tmpSingle = mData.SingleValue(pos)
		          singleTotal = singleTotal + Pow(ONNX.E, tmpSingle)
		          row = row + 1
		        wend
		        
		        row = 0
		        while row < mShape(0)
		          pos = (row * mShape(1) + col) * mElementSize
		          resultData.SingleValue(pos) = Pow(ONNX.E, mData.SingleValue(pos)) / singleTotal
		          row = row + 1
		        wend
		        
		        col = col + 1
		      wend
		      
		    elseif (axis = 1) or (axis = -1) then
		      
		      row = 0
		      while row < mShape(0)
		        
		        singleTotal = 0
		        
		        col = 0
		        while col < mShape(1)
		          pos = (row * mShape(1) + col) * mElementSize
		          tmpSingle = mData.SingleValue(pos)
		          singleTotal = singleTotal + Pow(ONNX.E, tmpSingle)
		          col = col + 1
		        wend
		        
		        col = 0
		        while col < mShape(1)
		          pos = (row * mShape(1) + col) * mElementSize
		          resultData.SingleValue(pos) = Pow(ONNX.E, mData.SingleValue(pos)) / singleTotal
		          col = col + 1
		        wend
		        
		        row = row + 1
		      wend
		      
		    else
		      
		      break // TODO: higher tensor ranks
		      
		    end if
		    
		    result = new Tensor(mElementType, mShape, resultData)
		    
		  case else
		    break
		    
		  end select
		  
		  return result
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Tanh() As ONNX.Tensor
		  Var result as Tensor
		  Var resultData As MemoryBlock
		  Var pos As UInt64
		  Var tmpSingle As Single
		  
		  select case mElementType
		    
		    // ***** FLOAT *****************************************
		    
		  case ONNX.ElementTypeEnum.FLOAT 
		    
		    resultData = new MemoryBlock(mData.Size)
		    pos = 0
		    while pos < mData.Size
		      tmpSingle = mData.SingleValue(pos)
		      resultData.SingleValue(pos) = (Pow(ONNX.E, tmpSingle) - Pow(ONNX.E, -tmpSingle)) / (Pow(ONNX.E, tmpSingle) + Pow(ONNX.E, -tmpSingle))
		      pos = pos + mElementSize
		    wend
		    
		    result = new Tensor(mElementType, mShape, resultData)
		    
		  case else
		    break
		    
		  end select
		  
		  
		  return result
		  
		End Function
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

	#tag Method, Flags = &h0
		Function Value(row As Integer, column As Integer) As Variant
		  var result As Variant
		  
		  select case mElementType 
		    
		  case ONNX.ElementTypeEnum.BOOL
		    if mData.UInt8Value((row * mShape(1) + column) * mElementSize) = 0 then
		      result = false
		    else
		      result = true
		    end if
		    
		  case ONNX.ElementTypeEnum.FLOAT
		    result = mData.SingleValue((row * mShape(1) + column) * mElementSize)
		    
		  else
		    break
		    
		  end select
		  
		  return result
		  
		End Function
	#tag EndMethod


	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return mData
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mData = value
			End Set
		#tag EndSetter
		Data As MemoryBlock
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return mElementType
			  
			End Get
		#tag EndGetter
		ElementType As ONNX.ElementTypeEnum
	#tag EndComputedProperty

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
		#tag ViewProperty
			Name="ElementType"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="ONNX.ElementTypeEnum"
			EditorType="Enum"
			#tag EnumValues
				"1 - FLOAT"
				"2 - UINT8"
				"3 - INT8"
				"4 - UINT16"
				"5 - INT16"
				"6 - INT32"
				"7 - INT64"
				"8 - STRING"
				"9 - BOOL"
				"10 - FLOAT16"
				"11 - DOUBLE"
				"12 - UINT32"
				"13 - UINT64"
				"14 - COMPLEX64"
				"15 - COMPLEX128"
				"16 - BFLOAT16"
				"17 - FLOAT8E4M3FN"
				"18 - FLOAT8E4M3FNUZ"
				"19 - FLOAT8E5M2"
				"20 - FLOAT8E5M2FNUZ"
				"21 - UINT4"
				"22 - INT4"
				"23 - FLOAT4E2M1"
			#tag EndEnumValues
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
