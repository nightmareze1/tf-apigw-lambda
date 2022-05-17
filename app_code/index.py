import json
import boto3
from botocore.exceptions import ClientError

s3 = boto3.client('s3')

def lambda_handler(event, context):
    try:
      response = s3.get_object(
            Bucket='app-code-storage',
            Key='texto.txt',
      )
      hello = response['Body'].read()
      return {
            'statusCode': 200,
            'body': (hello).decode('utf-8'),
            'isBase64Encoded': True
      }
    except ClientError as e:
      print(e)
