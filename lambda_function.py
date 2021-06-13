import boto3
import json

def lambda_handler(event, context):

    client = boto3.client('s3')
    buckets = client.list_buckets()
    
    list_response = []
    
    if buckets is not None:
        
        list_buckets = buckets['Buckets']
        
        for bucket in list_buckets:
            name = bucket['Name']
            print(name)
            list_response.append(name)

    response = {
        'statusCode': 200,
        'buckets': json.dumps(list_response)
    }
    
    print(response)
    return response