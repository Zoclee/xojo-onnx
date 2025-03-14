import onnx
import onnx.helper as helper
import onnx.numpy_helper as numpy_helper
import numpy as np

# Define input tensor/s
input1 = helper.make_tensor_value_info('input1', onnx.TensorProto.FLOAT, [None, None])

# Define output tensor/s
output1 = helper.make_tensor_value_info('output1', onnx.TensorProto.FLOAT, [None, None])

# Define constants
constant_1 = np.array([[1.0, 2.0], [3.0, 4.0]], dtype=np.float32) 
constant_1_tensor = numpy_helper.from_array(constant_1, name='constant1')

constant_node1 = helper.make_node(
    'Constant',  # Operator name
    inputs=[],   # No inputs
    outputs=['internal1'],  # Outputs the constant value
    value=constant_1_tensor
)

# Define the node
node1 = helper.make_node(
    'MatMul',  # Operator name
    ['input1', 'internal1'],  # Inputs
    ['output1']  # Output
)

# Create the graph
graph = helper.make_graph(
    [constant_node1, node1],  # Nodes
    'MatMul',  # Graph name
    [input1],  # Inputs
    [output1]  # Outputs
)

# Create the model
model = helper.make_model(graph, producer_name='xojo-onnx')

# Save the model to a file
onnx.save(model, 'matmul_constant.onnx')

print("ONNX model saved")