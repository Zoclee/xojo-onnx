import onnx
import onnx.helper as helper
import onnx.numpy_helper as numpy_helper

# Define input tensor/s
input1 = helper.make_tensor_value_info('input1', onnx.TensorProto.FLOAT, [None, None])
scale = helper.make_tensor_value_info('scale', onnx.TensorProto.FLOAT, [])
zero_point = helper.make_tensor_value_info('zero_point', onnx.TensorProto.UINT8, [])

# Define output tensor/s
output1 = helper.make_tensor_value_info('output1', onnx.TensorProto.UINT8, [None, None])

# Define the node
node1 = helper.make_node(
    'QuantizeLinear',  # Operator name
    ['input1', 'scale', 'zero_point'],  # Inputs
    ['output1']  # Output
)

# Create the graph
graph = helper.make_graph(
    [node1],  # Nodes
    'QuantizeLinear',  # Graph name
    [input1, scale, zero_point],  # Inputs
    [output1]  # Outputs
)

# Create the model
model = helper.make_model(graph, producer_name='xojo-onnx')

# Save the model to a file
onnx.save(model, 'quantizelinear.onnx')

print("ONNX model saved")