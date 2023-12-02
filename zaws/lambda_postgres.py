import json
import psycopg2


def lambda_handler(event, context):
    # TODO implement
    connection = psycopg2.connect(
            user="postgres",
            password="xxxxx",
            host="database-1.cna3sxsxsxpn.us-east-1.rds.amazonaws.com",
            port="5432",
            database="postgres"
        )   

    query = """
        SELECT aws_s3.table_import_from_s3(
           'covidtable',
           '',
           '(FORMAT CSV, DELIMITER '','', HEADER)', 
           'chvasquez-lake-artifacts',
           'covid_19_data.csv', 
           'us-east-1', 
           '----', 
           '----',
           ''
        );
        """
    print(query)
    cursor = connection.cursor()
    cursor.execute(query)
    connection.commit()
    rows = cursor.fetchall()
    print(rows)
    cursor.close()
    connection.close()
        
    return {
        'statusCode': 200,
        'body': json.dumps('Hello from Lambda!')
    }
