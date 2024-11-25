import requests
import json

#url = "http://localhost:11434/api/chat"
url = "http://64.247.196.88:11434/api/chat"
payload = {
    "model": "llama3.2",
    "messages": [{"role": "user", "content": "What are the best ways to overcome chronic depression?"}]
}
headers = {"Content-Type": "application/json"}

response = requests.post(url, json=payload, stream=True)

output = ""
for line in response.iter_lines():
    if line:  # Skip empty lines
        data = json.loads(line)
        if "message" in data and "content" in data["message"]:
            output += data["message"]["content"]

print("Assistant's Response:")
print(output)
