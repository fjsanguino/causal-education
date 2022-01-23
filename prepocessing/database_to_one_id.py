'''
This file collapses different files as described in subsection 4.2.2: Achievements based on more general variables
The input are all tables with the format shown in Table 1 from the report
Output is a table that joins all other tables (static and dynamic tables)

'''


import pandas as pd
import math


#List of used dynamic variables
dynamic_variables = ['t724101', 't724102', 'e451010', 'e79201a_D', 'e79201c_D', 'e227400_D', 'e22740a', 'e22740b',
                     'e22740d', 'e22740e', 'e22740f', 'e22941a', 'e22941b', 'e22941c', 'e22941d', 'e22941e', 'e22941f',
                     'e22941g', 'e22941h', 'e22941i', 'e22940a', 'e22940b', 'e22940c', 'e22940d', 'ed0004g', 'ed0004j',
                     'ed0005a', 'ed0005b', 'ed0005c', 'ed0005d', 'ed0005e', 'ed0005f', 'ed0005i', 'ed0005j', 'ed0005k',
                     'ed0006a', 'ed0006b', 'ed0006c', 'ed0006d', 'ed0017d', 'ed0017e', 'ed0028g', 'ed0028j', 'ed0029a',
                     'ed0029b', 'ed0029c', 'ed0029d', 'ed0030a', 'ed0030b', 'ed0030c', 'ed0030d', 't31135a', 't31135c',
                     'td0032a', 'td0032b', 'td0032c', 'td0033a', 'td0033b', 'td0033c', 'td0033d', 'td0033e', 'td0034a',
                     'td0034b', 'td0034c', 'td0035a', 'td0035b', 'td0035c', 'td0036a', 'td0036b', 'td0036c', 't22550a',
                     't22550b', 't22550c', 't22550d', 't22550e', 't22550f', 't22550g', 't22550h', 't22550i', 'ed0009a',
                     'ed0009b', 'ed0009d', 'ed0009e', 'ed0009f', 'ed0009g', 'ed0017a', 'ed0017b', 'ed0017c', 'ed0033a',
                     'ed0033b', 'ed0033d', 'ed0033e', 'ed0033f', 'ed0033g', 'ed0001h_D', 'ed0003h', 'ed0025h_D',
                     'ed00027', 'e227400_g1D', 'ed0004f', 'ed0004i', 'ed0007a', 'ed0007b', 'ed0007c', 'ed0007d',
                     'ed0007e', 'ed0007f', 'ed0007g', 'ed0028f', 'ed0028i', 'ed0031a', 'ed0031b', 'ed0031c', 'ed0031d',
                     'ed0031e', 'ed0031f', 'ed0031g', 'ed0004a', 'ed0004b', 'ed0004c', 'ed0004d', 'ed0004e', 'ed0004h',
                     'ed0028a', 'ed0028b', 'ed0028c', 'ed0028d', 'ed0028e', 'ed0028h']
#List of used static variables
static_variables = ['t66404b', 't66005e', 't292301', 't292302', 't292303', 't292306', 'td1001a', 'td1001c', 'td1001d',
                    'td1001e', 't281600', 'td0002d', 'td0005b', 'td0006a', 'td0006b', 'td0006c', 'td0006d', 'td0006e',
                    'td0006f', 't30335d', 't30335e', 't30335f', 't66004a', 't66004b', 't66004c', 't66004d', 't66004e',
                    't66005a', 't66005b', 't66005c', 't66005d', 'e42570a', 'e42570b', 'e42570i', 'e42570c', 'e42570k',
                    'e42570d', 'e42570f', 'e42570j', 'e42570g', 'e42570h', 't66206a', 't66206b', 't66206c', 't66206d',
                    't66206e', 't66206f', 't66206g', 't66206h', 't66206i', 't66206j', 't66206k', 't66206l', 't66206m',
                    't66206n', 't66206o', 't66206p', 't66206q', 't66206r', 't66201a', 't66208a', 't66201b', 't66208b',
                    't66201c', 't66208c', 't66201d', 't66208d', 'e229820_D', 'e537050', 'e537123', 'e537140', 'ef0001a',
                    'ef0001b', 'ef0001d', 'ef0001e', 't731314', 't731353', 't731312', 't731362', 'p400090_g1D',
                    'p400070_g1D', 'p400500_g1', 'p407050_g1D', 'p413000_g1D', 'p414000_g1D', 'p412000', 'p41330b',
                    'p41330d', 'p281401', 'p32903c', 'p32903a', 'p32903d', 'p32903b', 'p320660', 'p261100', 'pd0200u',
                    'pd0300u', 'pd0400u', 'pd0100u', 'p327031', 'p514501', 't10111a', 't10111c', 't10112a', 't10112c',
                    't10113a', 't10113c', 't10114a', 't10114c', 't10115a', 't10115c', 't327092', 't327093', 't327096',
                    't327097', 't283621', 't283622', 't283623', 't284624', 't285627', 't284625', 't284626', 't285628',
                    't285629', 't28161a', 't28161b', 't28161d', 't32000f', 't514004', 't32304i', 't32304j', 't327031',
                    't327032', 't327033', 't327034', 't66800l', 't66800m', 't66800n', 't66800o', 't66800p', 't66800q',
                    't66800r', 't66800s', 't66800t', 't66800u', 't66800v', 't521051', 't517200', 't517201', 't517202',
                    't527004', 't527017', 't527019', 't527021', 't527028', 't527029', 't527032', 't527034', 't514003',
                    'p66802e_g1', 'p66802d_g1', 'p66802c_g1', 'p66802b_g1', 'p66802a_g1', 'p32830a', 'pb00040',
                    'pb00020', 'pb00030', 'pd0500g', 'p66802a', 'p66803b', 'p66803c', 'p66803d', 'p66803e', 'p66803f',
                    'p66803g', 'p66803h', 'p66803i', 'p66803j', 'e400000', 'p510002', 'p30300a', 'p512305', 'p512605',
                    'p34005a', 't27111s', 't67001a', 't67001b', 't67000a', 't67001c', 't67001d', 't67000b', 't67000c',
                    't67000d', 't67000e', 't67001e', 'tf00050', 't66502a', 't66502b', 't66502c', 't66502d', 't66502e',
                    't66502f', 't66502g', 't66502h', 't66502i', 't66502j', 't66502l', 't66402a', 't66403a', 't66404a',
                    't66402b', 't66403b', 't66402c', 't66403c', 't66404c', 't66402d', 't66403d', 't66404d', 'ed1008a',
                    'ed1008b', 'ed1008c', 'ed1008d', 'ed1008e', 'ed1011a', 'ed1011b', 'ed1011c', 'ed1011d', 'ed1011e',
                    'ed1011f', 'ed1011g', 'ed1011h', 'ed1011i', 'e536031', 'e536032', 'e536033', 'e536034', 'e536035',
                    'e536036', 'e536037', 'e536038', 'e536039', 'e536040', 'p31135a', 'p305350', 'p305600', 'p31135c',
                    'pd0300g', 'pd0600g', 'pd0100g', 'pd0200g', 'pf00020', 't31909d', 't30535a', 't30535b', 't320403',
                    't34006i', 't34006a', 't34006b', 't34006c', 't34006g', 't34006h', 't101000', 'e762110', 'e22280a',
                    'e22280b', 'e22280c', 'e22280d', 'e22280e', 'e22280f', 'e22280g', 'e22280h', 'e22280i', 'e22280j',
                    'e22280k', 'e22240a', 'e22240b', 'e22240c', 'e22240g', 'e22240h', 'e22240i', 'e22240m', 'e22240p',
                    'e22540b', 'e22540c', 'e22540d', 'e22540e', 'e22540f', 'e22540g', 'e22540h', 'e22540i', 'e22540j',
                    'e22540k', 'e22540m', 'p296402_g9']

#files to collapse
files = ['peducator_static', 'pparent_static', 'ptarget_static', 'dynamic']

for file in files:
    df = pd.read_csv(file + '.csv') #reads the file

    #Collapses based on different criteria for each file
    if file == 'peducator_static':
        groups = df.groupby(by=['ID_e'])
    if file == 'dynamic':
        groups = df.groupby(by=['ID_t', 'ID_cc', 'ID_cg', 'ID_cm', 'ID_e'])
    else:
        groups = df.groupby(by=['ID_t'])

    df_preprocessed = pd.DataFrame() #output data frame for each

    for i, (group) in enumerate(groups):
        #adds id variables to the columns and values
        if file == 'peducator_static':
            column_variables = ['ID_e']
            column_values = [group[0]]
        if file == 'dynamic':
            column_variables = ['ID_t', 'ID_cc', 'ID_cg', 'ID_cm', 'ID_e']
            column_values = [group[0][0], group[0][1], group[0][2], group[0][3], group[0][4]]
        else:
            column_variables = ['ID_t']
            column_values = [group[0]]


        group_df = group[1]
        if file == 'dynamic':
            columns = group_df.columns[8:]
        else:
            columns = group_df.columns[2:]

        #For every columns, check if its static or dynamic and collapses it accordingly (mean or two columns with wave 3 and 5 respectively)
        for column in columns:
            if column in static_variables:
                variable_series = group_df[column]
                column_variables.append(column)
                column_values.append(variable_series.loc[variable_series > 0].values.mean())
            elif column in dynamic_variables:
                interesting_waves = [3, 5]
                for wave in interesting_waves:
                    column_variables.append(column + '_w' + str(wave))
                    value = group_df.loc[group_df['wave'] == wave][column].values
                    if len(value) > 1:
                        value = value[0]
                    if math.isnan(value.mean()):
                        column_values.append(value.mean())
                    else:
                        column_values.append(float(value))

        df_preprocessed = df_preprocessed.append(pd.DataFrame([column_values], columns=column_variables))

    df_preprocessed.to_csv(file + 'to_one_id.csv')

#Joins all tables.
dynamic = pd.read_csv('dynamicto_one_id.csv')
pparent = pd.read_csv('pparent_staticto_one_id.csv')
ptarget = pd.read_csv('ptarget_staticto_one_id.csv')
peducator = pd.read_csv('peducator_staticto_one_id.csv.csv')

dynamic = dynamic.join(pparent, on='ID_t', how='inner')
dynamic = dynamic.join(ptarget, on='ID_t', how='inner')
dynamic = dynamic.join(peducator, on='ID_e', how='inner')

dynamic.to_csv('preprocessed_before_cat.csv')

exit(0)
