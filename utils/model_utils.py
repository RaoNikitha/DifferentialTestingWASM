from tenacity import retry, wait_random_exponential, stop_after_attempt, before_sleep_log
import logging
from openai import OpenAI

logger = logging.getLogger()
logging.basicConfig(level=logging.INFO)

# Retry: Randomly wait up to 2^x * 1 seconds between each retry until the range reaches 60 seconds, then randomly up to 60 seconds afterwards 
# Stop after 2000 attempts
@retry(reraise=True, before_sleep=before_sleep_log(logger, logging.INFO),wait=wait_random_exponential(multiplier=1, max=60), stop=stop_after_attempt(2000))
def prompt_model(model, prompt):
    client = OpenAI()
    completion = client.chat.completions.create(
        model = model,
        messages = [
            {
                "role": "system", 
                "content": "You are an expert at web assembly (wasm)."},
            {
                "role": "user",
                "content": prompt
            }
        ]  
    )

    return completion.choices[0].message.content
