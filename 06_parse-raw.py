import os
from utils import Parser


RAW_SHEET = 'Raw'
WORKDIR = os.path.dirname(os.path.realpath(__file__))
XLS_FILE = os.path.join(WORKDIR, 'source/test.xlsx')
CVS_DIR = os.path.join(WORKDIR, 'csv')

# create parser
parser = Parser(XLS_FILE, RAW_SHEET)

# dump raw
raw_fn = '{}/{}.csv'.format(CVS_DIR, 'raw')
range = 'B5:AQ121570'
parser.save_csv(range, raw_fn)
