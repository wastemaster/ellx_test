from slugify import slugify

items = """Channel
Region
Division
Headquarter
Category
Package Segment
Year
Year month
Sales Headquarters Code
Sales Division
District headquarters code
District headquarters
CCBJI channel Lv.1 code
CCBJI Channel Lv.1
CCBJI channel Lv.2 code
CCBJI Channel Lv.2
CCBJI channel Lv.3 code
CCBJI Channel Lv.3
Product code
Product
BAPC
NSR
GP
CCEJ brand code
CCEJ brand
CCEJ subbrand code
CCEJ subbrand
CCEJ package code
CCEJ package
Category code
Category
Subcategory code
Subcategory
DDIS Beverage Product Group Code
DDIS Beverage Product Group
DDIS container type code
DDIS container type
DDIS package code
DDIS package
DDIS service type code
DDIS service type
Product name"""

fields = []
for item in items.split('\n'):
    fields.append(slugify(item, separator="_", replacements=[['.', '']]))

print('length=', len(fields))
# print(fields)
for field in fields:
    print('{} String,'.format(field))

for field in fields:
    print('{},'.format(field))
