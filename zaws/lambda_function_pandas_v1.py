import json
import pandas as pd
import boto3
import os
import io

def read_pandas_csv(bucket, key):
    s3 = boto3.client("s3")
    
    file = s3.get_object(Bucket=bucket, Key=key)
    data_df = pd.read_csv(io.BytesIO(file['Body'].read()))
    return data_df

def lambda_handler(event, context):
    # TODO implement
    
    print(event)
    
    if isinstance(event, str):
        event = json.loads(event)

    bucket_name = os.environ["BUCKET_COVID"]
    key_name = os.environ["KEY_COVID"]
    
    df_covid = read_pandas_csv(bucket_name, key_name)
    
    print("El tamanio total es", len(df_covid))
    
    parametros = json.loads(event["body"])
    pais = parametros["country"]
    fecha = parametros["date"]
    
    print("Pais", parametros["country"], " Fecha: ", parametros["date"])
    
    df_peru = df_covid[(df_covid["country"]== pais)]
    
    print(len(df_peru))
    
    resultado = df_peru[(df_peru["date"]== fecha )]
    
    print("con Fecha", len(resultado))
    
    casos_confirmados = resultado["confirmed"].iloc[0]
    casos_recuperados = resultado["recovered"].iloc[0]
    casos_fallecidos = resultado["deaths"].iloc[0]
    
    mensaje = {"confirmados": str(casos_confirmados), 
                "recuperados": str(casos_recuperados) 
    }
    
    
    print(resultado)

    return {
        'statusCode': 200,
        'body': json.dumps(mensaje)
    }
