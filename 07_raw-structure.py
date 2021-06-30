import os
import pandas as pd


RAW_SHEET = 'Raw'
WORKDIR = os.path.dirname(os.path.realpath(__file__))
XLS_FILE = os.path.join(WORKDIR, 'source/test.xlsx')
CVS_DIR = os.path.join(WORKDIR, 'csv')

# range = 'B5:AQ121570'

df = pd.read_excel(
    XLS_FILE,
    sheet_name=RAW_SHEET,
    index_col=0,
    nrows=100,
    engine='openpyxl',
    skiprows=3)

print(df)
print(df.shape)

for line in df.columns:
    print(line)
