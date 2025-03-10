import onnx
import onnx.helper as helper
import onnx.numpy_helper as numpy_helper

# Define input tensor/s
input1 = helper.make_tensor_value_info('input1', onnx.TensorProto.FLOAT, [None, None])

# Define output tensor/s
output1 = helper.make_tensor_value_info('output1', onnx.TensorProto.FLOAT, [None, None])

# Define the node
node1 = helper.make_node(
    'Floor',  # Operator name
    ['input1'],  # Inputs
    ['output1']  # Output
)

# Create the graph
graph = helper.make_graph(
    [node1],  # Nodes
    'Floor',  # Graph name
    [input1],  # Inputs
    [output1]  # Outputs
)

# Create the model
model = helper.make_model(graph, producer_name='xojo-onnx')

# Save the model to a file
onnx.save(model, 'floor.onnx')

print("ONNX model saved")