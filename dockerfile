# Build with: docker build -t ollama-llama3.2 .
# Run with: docker run -d --gpus=all -p 11434:11434 --name ollama-llama ollama-llama3.2
# Tag with: docker tag ollama-llama3.2 kraussian/ollama-llama3.2:latest
# Push with: docker push kraussian/ollama-llama3.2:latest
# Test with:
#curl -X POST http://localhost:11434/api/chat -H "Content-Type: application/json" -d '{
#    "model": "llama3.2",
#    "messages": [{"role": "user", "content": "Hello, how are you?"}],
#    "stream": false
#}'

# Download latest ollama image
FROM ollama/ollama:latest

# Copy pre-downloaded models from the local directory
COPY ./models /root/.ollama/models

# Set working directory (optional)
WORKDIR /app

# Expose the port (if needed)
EXPOSE 11434

# Start the Ollama server
ENTRYPOINT ["ollama"]
CMD ["serve"]
