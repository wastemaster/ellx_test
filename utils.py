import pandas as pd
from openpyxl import load_workbook
import csv
import uuid


class Parser():
    xls_filename = None
    xls_sheet = None
    range = None
    workbook = None
    worksheet = None

    def __init__(self, xls_filename, xls_sheet):
        self.xls_filename = xls_filename
        self.xls_sheet = xls_sheet
        self.workbook = load_workbook(
            filename=xls_filename,
            data_only=True,
            read_only=True)
        self.worksheet = self.workbook[xls_sheet]

    def save_csv(self, range, csv_filename):
        # Read the cell values into a list of lists
        data_rows = []
        for row in self.worksheet[range]:
            data_cols = []
            for cell in row:
                data_cols.append(cell.value)
            data_rows.append(data_cols)
        # Transform into dataframe
        df = pd.DataFrame(data_rows)

        # add UUID
        df['uuid'] = df.apply(lambda _: uuid.uuid4(), axis=1)

        # division_channels has nans where we want ints
        if 'division_channels' in csv_filename:
            # fill int with 0
            df = df.fillna({0: 0, 2: 0}).astype({0: int, 2: int})
            # fill str with spaces
            df = df.fillna({1: ''})

        print('shape=', df.shape)

        # replace messy newlines
        df = df.replace('\n',' ', regex=True)

        # create dataframe and export it as csv
        df.to_csv(csv_filename,
                  index=False,
                  quoting=csv.QUOTE_NONNUMERIC,
                  header=False,
                  line_terminator='\r\n')
