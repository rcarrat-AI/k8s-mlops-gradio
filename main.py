import requests
import tensorflow as tf
import gradio as gr

# load the model
mobile_net = tf.keras.applications.MobileNetV2()  

# Download human-readable labels for ImageNet.
response = requests.get("https://git.io/JJkYN")
labels = response.text.split("\n")

# Define a function classify_image(inp) that preprocesses input image, performs prediction using 
# inception_net, and returns a dictionary of class labels with corresponding probabilities.
def classify_image(input_images):
    input_images = input_images.reshape((-1, 224, 224, 3))
    input_images = tf.keras.applications.mobilenet_v2.preprocess_input(input_images)
    prediction = mobile_net.predict(input_images).flatten()
    return {labels[i]: float(prediction[i]) for i in range(1000)}

# Define a run function that sets up an image and label for classification using the gr.Interface.
def run():
  image = gr.Image(shape=(224, 224))
  label = gr.Label(num_top_classes=4)
  title = "Rcarrata's Image Classification Example"

  demo = gr.Interface(
      fn=classify_image, inputs=image, outputs=label, interpretation="default", title=title
  )

  demo.launch(server_name="0.0.0.0", server_port=7860)

if __name__ == "__main__":
    run()