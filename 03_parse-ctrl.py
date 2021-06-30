import os
from utils import Parser


CTRL_SHEET = 'Ctrl'
WORKDIR = os.path.dirname(os.path.realpath(__file__))
XLS_FILE = os.path.join(WORKDIR, 'source/test.xlsx')
CVS_DIR = os.path.join(WORKDIR, 'csv')

# create parser
parser = Parser(XLS_FILE, CTRL_SHEET)

# dump channels
channels_fn = '{}/{}.csv'.format(CVS_DIR, 'channels')
range = 'Q5:S27'
parser.save_csv(range, channels_fn)

# dump division_channels
division_channels_fn = '{}/{}.csv'.format(CVS_DIR, 'division_channels')
range = 'H5:O988'
parser.save_csv(range, division_channels_fn)
