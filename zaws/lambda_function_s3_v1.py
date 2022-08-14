import json

def lambda_handler(event, context):
    # TODO implement
    
    
    print("Esto es una prueba para el Cloudwatch")
    
    if isinstance(event, str):
        event = json.loads(event)
        
    bucket_name = event["Records"][0]["s3"]["bucket"]["name"]
    file_name = event["Records"][0]["s3"]["object"]["key"]
    size = event["Records"][0]["s3"]["object"]["size"]
    
    print(event)
    
    mensaje = f"Esto es una prueba de Trigger de S3 \n el nombre del bucket: {bucket_name}, el archivo cargado es {file_name}, y tiene el tamanio de {size}"
    
    print(mensaje)
    
    return {
        'statusCode': 200,
        'body': json.dumps(mensaje)
    }
