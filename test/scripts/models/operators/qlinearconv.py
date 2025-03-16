import onnx
import onnx.helper as helper
import onnx.numpy_helper as numpy_helper

# Define input tensor/s
x = helper.make_tensor_value_info('x', onnx.TensorProto.UINT8, [None, None, None, None])
w = helper.make_tensor_value_info('w', onnx.TensorProto.UINT8, [None, None, None, None])
x_scale = helper.make_tensor_value_info('x_scale', onnx.TensorProto.FLOAT, [])
x_zero_point = helper.make_tensor_value_info('x_zero_point', onnx.TensorProto.UINT8, [])
w_scale = helper.make_tensor_value_info('w_scale', onnx.TensorProto.FLOAT, [])
w_zero_point = helper.make_tensor_value_info('w_zero_point', onnx.TensorProto.UINT8, [])
y_scale = helper.make_tensor_value_info('y_scale', onnx.TensorProto.FLOAT, [])
y_zero_point = helper.make_tensor_value_info('y_zero_point', onnx.TensorProto.UINT8, [])

# Define output tensor/s
y = helper.make_tensor_value_info('y', onnx.TensorProto.UINT8, [None, None, None, None])

# Define the node
node1 = helper.make_node(
    'QLinearConv',  # Operator name
    ['x', 'x_scale', 'x_zero_point', 'w', 'w_scale', 'w_zero_point', 'y_scale', 'y_zero_point'],  # Inputs
    ['y']  # Output
)

# Create the graph
graph = helper.make_graph(
    [node1],  # Nodes
    'QLinearConv',  # Graph name
    [x, x_scale, x_zero_point, w, w_scale, w_zero_point, y_scale, y_zero_point],  # Inputs
    [y]  # Outputs
)

# Create the model
model = helper.make_model(graph, producer_name='xojo-onnx')

# Save the model to a file
onnx.save(model, 'qlinearconv.onnx')

print("ONNX model saved")