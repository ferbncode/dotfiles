from datetime import datetime

def get_date_str():
    date_str = datetime.now().strftime('%A, %d %b %Y %H:%M:%S')
    return date_str

if __name__== '__main__':
    print(get_date_str())
