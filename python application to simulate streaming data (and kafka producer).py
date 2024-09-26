import sys
import time
import signal
import json
import argparse
import logging
from kafka import KafkaProducer

# Set up logging
logging.basicConfig(level=logging.INFO, format='%(asctime)s - %(levelname)s - %(message)s')

def main(kafka_topic, lines_per_batch, filelist, sleep_time):
    # Create a Kafka producer
    producer = KafkaProducer(bootstrap_servers='localhost:9092')

    def signal_handler(signal, frame):
        logging.info('You pressed Ctrl+C!')
        producer.close()
        sys.exit(0)

    signal.signal(signal.SIGINT, signal_handler)
    logging.info('Press Ctrl+C to stop the streaming')

    while True:
        for filename in filelist:
            try:
                with open(filename, 'r') as infile:
                    while True:
                        lines = infile.readlines(lines_per_batch)
                        if not lines:
                            break
                        for line in lines:
                            try:
                                # Parse JSON data
                                data = json.loads(line.strip())
                                # Convert JSON object back to string for Kafka
                                json_str = json.dumps(data)
                                # Send the JSON string as a message to Kafka
                                producer.send(kafka_topic, json_str.encode('utf-8'))
                                producer.flush()  # Ensure the message is sent
                                logging.info("Sent JSON data to %s", kafka_topic)
                            except json.JSONDecodeError:
                                logging.error("Failed to decode JSON from line: %s", line)
                        time.sleep(sleep_time)  # Pause before sending the next batch
            except FileNotFoundError:
                logging.error("File not found: %s", filename)
            except IOError as e:
                logging.error("I/O error occurred while handling file %s: %s", filename, e)

if __name__ == "__main__":
    parser = argparse.ArgumentParser(description='Stream JSON data to a Kafka topic.')
    parser.add_argument('kafka_topic', help='Kafka topic name')
    parser.add_argument('lines_per_batch', type=int, help='Number of lines to read at a time')
    parser.add_argument('files', nargs='+', help='List of files to stream data from')
    parser.add_argument('--sleep', type=float, default=5, help='Time interval between sending data (in seconds)')

    args = parser.parse_args()

    main(args.kafka_topic, args.lines_per_batch, args.files, args.sleep)
