using bloomberg
go


 insert into bloomberg.dbo.BlpFieldMapping ([productType], [blpField], [blpFieldType], [blpFTPCategory], [blpCName], [datamartField], [datamartFieldType], [iorder], [blpNeed], [isKey], [DBNeed], [OtherDBNeed], [NullNoUpdate]) Values (    'FutureOptionProduct',  'PRODUCT_ID',  'String',  '',  '產品代碼',   'ProductID',  'String',  1,  'N',  'Y',  'Y',  'N',  'N' )
 insert into bloomberg.dbo.BlpFieldMapping ([productType], [blpField], [blpFieldType], [blpFTPCategory], [blpCName], [datamartField], [datamartFieldType], [iorder], [blpNeed], [isKey], [DBNeed], [OtherDBNeed], [NullNoUpdate]) Values (    'FutureOptionProduct',  'PRODUCT_TYPE',  'String',  '',  '產品類別',   'ProductType',  'String',  2,  'N',  'Y',  'Y',  'N',  'N' )
 insert into bloomberg.dbo.BlpFieldMapping ([productType], [blpField], [blpFieldType], [blpFTPCategory], [blpCName], [datamartField], [datamartFieldType], [iorder], [blpNeed], [isKey], [DBNeed], [OtherDBNeed], [NullNoUpdate]) Values (    'FutureOptionProduct',  'CONTRACT_TYPE',  'String',  '',  '合約類別',   'ContractType',  'String',  3,  'N',  'Y',  'Y',  'N',  'N' )
 insert into bloomberg.dbo.BlpFieldMapping ([productType], [blpField], [blpFieldType], [blpFTPCategory], [blpCName], [datamartField], [datamartFieldType], [iorder], [blpNeed], [isKey], [DBNeed], [OtherDBNeed], [NullNoUpdate]) Values (    'FutureOptionProduct',  'LAST_UPDATE',  'Datetime',  '',  '最後更新日',   'LastUpdate',  'Datetime',  4,  'N',  'N',  'Y',  'N',  'N' )
 insert into bloomberg.dbo.BlpFieldMapping ([productType], [blpField], [blpFieldType], [blpFTPCategory], [blpCName], [datamartField], [datamartFieldType], [iorder], [blpNeed], [isKey], [DBNeed], [OtherDBNeed], [NullNoUpdate]) Values (    'FutureOptionProduct',  'COUNTRY',  'String',  'SECMASTER',  '國家別',   'Country',  'String',  5,  'Y',  'N',  'Y',  'N',  'N' )
 insert into bloomberg.dbo.BlpFieldMapping ([productType], [blpField], [blpFieldType], [blpFTPCategory], [blpCName], [datamartField], [datamartFieldType], [iorder], [blpNeed], [isKey], [DBNeed], [OtherDBNeed], [NullNoUpdate]) Values (    'FutureOptionProduct',  'EXCH_CODE',  'String',  'SECMASTER',  '交易所別',   'ExchCode',  'String',  6,  'Y',  'N',  'Y',  'N',  'N' )
 insert into bloomberg.dbo.BlpFieldMapping ([productType], [blpField], [blpFieldType], [blpFTPCategory], [blpCName], [datamartField], [datamartFieldType], [iorder], [blpNeed], [isKey], [DBNeed], [OtherDBNeed], [NullNoUpdate]) Values (    'FutureOptionProduct',  'FUT_EXCH_NAME_LONG',  'String',  'SECMASTER',  '合約長名',   'ExchName',  'String',  7,  'Y',  'N',  'Y',  'N',  'N' )
 insert into bloomberg.dbo.BlpFieldMapping ([productType], [blpField], [blpFieldType], [blpFTPCategory], [blpCName], [datamartField], [datamartFieldType], [iorder], [blpNeed], [isKey], [DBNeed], [OtherDBNeed], [NullNoUpdate]) Values (    'FutureOptionProduct',  'UNDL_SPOT_TICKER',  'String',  'SECMASTER',  'Ticker',   'UnderlySpotTicker',  'String',  8,  'Y',  'N',  'Y',  'N',  'N' )
 insert into bloomberg.dbo.BlpFieldMapping ([productType], [blpField], [blpFieldType], [blpFTPCategory], [blpCName], [datamartField], [datamartFieldType], [iorder], [blpNeed], [isKey], [DBNeed], [OtherDBNeed], [NullNoUpdate]) Values (    'FutureOptionProduct',  'CRNCY',  'String',  'SECMASTER',  '幣別',   'Curncy',  'String',  9,  'Y',  'N',  'Y',  'N',  'N' )
 insert into bloomberg.dbo.BlpFieldMapping ([productType], [blpField], [blpFieldType], [blpFTPCategory], [blpCName], [datamartField], [datamartFieldType], [iorder], [blpNeed], [isKey], [DBNeed], [OtherDBNeed], [NullNoUpdate]) Values (    'FutureOptionProduct',  'FUT_CONT_SiZE',  'String',  'SECMASTER',  '履約價',   'ContSize',  'Number',  10,  'Y',  'N',  'Y',  'N',  'N' )
 insert into bloomberg.dbo.BlpFieldMapping ([productType], [blpField], [blpFieldType], [blpFTPCategory], [blpCName], [datamartField], [datamartFieldType], [iorder], [blpNeed], [isKey], [DBNeed], [OtherDBNeed], [NullNoUpdate]) Values (    'FutureOptionProduct',  'CONTRACT_VALUE',  'String',  'SECMASTER',  '合約價格',   'ContValue',  'Number',  11,  'Y',  'N',  'Y',  'N',  'N' )
 insert into bloomberg.dbo.BlpFieldMapping ([productType], [blpField], [blpFieldType], [blpFTPCategory], [blpCName], [datamartField], [datamartFieldType], [iorder], [blpNeed], [isKey], [DBNeed], [OtherDBNeed], [NullNoUpdate]) Values (    'FutureOptionProduct',  'LAST_UPDATE_DT',  'Date',  'SECMASTER',  '最後更新日',   'LastPriceDate',  'Date',  12,  'Y',  'N',  'Y',  'N',  'N' )
 insert into bloomberg.dbo.BlpFieldMapping ([productType], [blpField], [blpFieldType], [blpFTPCategory], [blpCName], [datamartField], [datamartFieldType], [iorder], [blpNeed], [isKey], [DBNeed], [OtherDBNeed], [NullNoUpdate]) Values (    'FutureOptionProduct',  'FUT_NORM_PX',  'Number',  'SECMASTER',  '最後收盤價',   'LastPrice',  'Number',  13,  'Y',  'N',  'Y',  'N',  'N' )
 insert into bloomberg.dbo.BlpFieldMapping ([productType], [blpField], [blpFieldType], [blpFTPCategory], [blpCName], [datamartField], [datamartFieldType], [iorder], [blpNeed], [isKey], [DBNeed], [OtherDBNeed], [NullNoUpdate]) Values (    'FutureOptionProduct',  'QT_SPEC',  'String',  'SECMASTER',  'Quote Specifications',   'QuoteSpec',  'String',  14,  'Y',  'N',  'Y',  'N',  'N' )
 insert into bloomberg.dbo.BlpFieldMapping ([productType], [blpField], [blpFieldType], [blpFTPCategory], [blpCName], [datamartField], [datamartFieldType], [iorder], [blpNeed], [isKey], [DBNeed], [OtherDBNeed], [NullNoUpdate]) Values (    'FutureOptionProduct',  'FUTURE_QUOTE_UNITS',  'String',  'SECMASTER',  '成交單位數',   'QuoteUnits',  'String',  15,  'Y',  'N',  'Y',  'N',  'N' )
 insert into bloomberg.dbo.BlpFieldMapping ([productType], [blpField], [blpFieldType], [blpFTPCategory], [blpCName], [datamartField], [datamartFieldType], [iorder], [blpNeed], [isKey], [DBNeed], [OtherDBNeed], [NullNoUpdate]) Values (    'FutureOptionProduct',  'FUT_VAL_PT',  'String',  'SECMASTER',  '每點跳動價值',   'vpoint',  'Number',  16,  'Y',  'N',  'Y',  'N',  'N' )
 insert into bloomberg.dbo.BlpFieldMapping ([productType], [blpField], [blpFieldType], [blpFTPCategory], [blpCName], [datamartField], [datamartFieldType], [iorder], [blpNeed], [isKey], [DBNeed], [OtherDBNeed], [NullNoUpdate]) Values (    'FutureOptionProduct',  'FUT_TICK_SIZE',  'String',  'SECMASTER',  '跳動點數',   'TickSize',  'Number',  17,  'Y',  'N',  'Y',  'N',  'N' )
 insert into bloomberg.dbo.BlpFieldMapping ([productType], [blpField], [blpFieldType], [blpFTPCategory], [blpCName], [datamartField], [datamartFieldType], [iorder], [blpNeed], [isKey], [DBNeed], [OtherDBNeed], [NullNoUpdate]) Values (    'FutureOptionProduct',  'FUT_TICK_VAL',  'String',  'SECMASTER',  '每點價值',   'TickValue',  'Number',  18,  'Y',  'N',  'Y',  'N',  'N' )
 insert into bloomberg.dbo.BlpFieldMapping ([productType], [blpField], [blpFieldType], [blpFTPCategory], [blpCName], [datamartField], [datamartFieldType], [iorder], [blpNeed], [isKey], [DBNeed], [OtherDBNeed], [NullNoUpdate]) Values (    'FutureOptionProduct',  'FUT_TRADING_UNITS',  'String',  'SECMASTER',  '成交量',   'TradingUnits',  'String',  19,  'Y',  'N',  'Y',  'N',  'N' )
 insert into bloomberg.dbo.BlpFieldMapping ([productType], [blpField], [blpFieldType], [blpFTPCategory], [blpCName], [datamartField], [datamartFieldType], [iorder], [blpNeed], [isKey], [DBNeed], [OtherDBNeed], [NullNoUpdate]) Values (    'FutureOptionProduct',  'ID_MIC_PRIM_EXCH',  'String',  'SECMASTER',  '主要交易所MIC代碼',   'ID_MIC_PRIM_EXCH',  'String',  20,  'Y',  'N',  'Y',  'N',  'N' )
 insert into bloomberg.dbo.BlpFieldMapping ([productType], [blpField], [blpFieldType], [blpFTPCategory], [blpCName], [datamartField], [datamartFieldType], [iorder], [blpNeed], [isKey], [DBNeed], [OtherDBNeed], [NullNoUpdate]) Values (    'FutureOptionProduct',  'FUT_INIT_SPEC_ML',  'Number',  'SECMASTER',  '避險者初始保證金',   'FUT_INIT_SPEC_ML',  'Number',  21,  'Y',  'N',  'Y',  'N',  'N' )
 insert into bloomberg.dbo.BlpFieldMapping ([productType], [blpField], [blpFieldType], [blpFTPCategory], [blpCName], [datamartField], [datamartFieldType], [iorder], [blpNeed], [isKey], [DBNeed], [OtherDBNeed], [NullNoUpdate]) Values (    'FutureOptionProduct',  'FUT_SEC_SPEC_ML',  'Number',  'SECMASTER',  '避險者維持保證金',   'FUT_SEC_SPEC_ML',  'Number',  22,  'Y',  'N',  'Y',  'N',  'N' )
 insert into bloomberg.dbo.BlpFieldMapping ([productType], [blpField], [blpFieldType], [blpFTPCategory], [blpCName], [datamartField], [datamartFieldType], [iorder], [blpNeed], [isKey], [DBNeed], [OtherDBNeed], [NullNoUpdate]) Values (    'FuturesContractDetail',  'PRODUCT_ID',  'String',  '',  ''NULL'',   'ProductID',  'String',  1,  'N',  'Y',  'Y',  'N',  'N' )
 insert into bloomberg.dbo.BlpFieldMapping ([productType], [blpField], [blpFieldType], [blpFTPCategory], [blpCName], [datamartField], [datamartFieldType], [iorder], [blpNeed], [isKey], [DBNeed], [OtherDBNeed], [NullNoUpdate]) Values (    'FuturesContractDetail',  'PRODUCT_TYPE',  'String',  '',  ''NULL'',   'ProductType',  'String',  2,  'N',  'Y',  'Y',  'N',  'N' )
 insert into bloomberg.dbo.BlpFieldMapping ([productType], [blpField], [blpFieldType], [blpFTPCategory], [blpCName], [datamartField], [datamartFieldType], [iorder], [blpNeed], [isKey], [DBNeed], [OtherDBNeed], [NullNoUpdate]) Values (    'FuturesContractDetail',  'CONTRACT_ID',  'String',  '',  ''NULL'',   'ContractID',  'String',  3,  'N',  'Y',  'Y',  'N',  'N' )
 insert into bloomberg.dbo.BlpFieldMapping ([productType], [blpField], [blpFieldType], [blpFTPCategory], [blpCName], [datamartField], [datamartFieldType], [iorder], [blpNeed], [isKey], [DBNeed], [OtherDBNeed], [NullNoUpdate]) Values (    'FuturesContractDetail',  'FUHWA_CODE',  'String',  '',  ''NULL'',   'FuhwaCode',  'String',  4,  'N',  'N',  'Y',  'N',  'N' )
 insert into bloomberg.dbo.BlpFieldMapping ([productType], [blpField], [blpFieldType], [blpFTPCategory], [blpCName], [datamartField], [datamartFieldType], [iorder], [blpNeed], [isKey], [DBNeed], [OtherDBNeed], [NullNoUpdate]) Values (    'FuturesContractDetail',  'FLAGS',  'String',  '',  ''NULL'',   'Flags',  'String',  5,  'N',  'N',  'Y',  'N',  'N' )
 insert into bloomberg.dbo.BlpFieldMapping ([productType], [blpField], [blpFieldType], [blpFTPCategory], [blpCName], [datamartField], [datamartFieldType], [iorder], [blpNeed], [isKey], [DBNeed], [OtherDBNeed], [NullNoUpdate]) Values (    'FuturesContractDetail',  'SHORT_NAME',  'String',  'SECMASTER',  ''NULL'',   'shortName',  'String',  6,  'Y',  'N',  'Y',  'N',  'N' )
 insert into bloomberg.dbo.BlpFieldMapping ([productType], [blpField], [blpFieldType], [blpFTPCategory], [blpCName], [datamartField], [datamartFieldType], [iorder], [blpNeed], [isKey], [DBNeed], [OtherDBNeed], [NullNoUpdate]) Values (    'FuturesContractDetail',  'FUT_LAST_TRADE_DT',  'Date',  'SECMASTER',  ''NULL'',   'LastTradeDay',  'Date',  7,  'Y',  'N',  'Y',  'N',  'N' )
 insert into bloomberg.dbo.BlpFieldMapping ([productType], [blpField], [blpFieldType], [blpFTPCategory], [blpCName], [datamartField], [datamartFieldType], [iorder], [blpNeed], [isKey], [DBNeed], [OtherDBNeed], [NullNoUpdate]) Values (    'FuturesContractDetail',  'FUT_DLV_DT_LAST',  'Date',  'SECMASTER',  ''NULL'',   'MatureDay',  'Date',  8,  'Y',  'N',  'Y',  'N',  'N' )
 insert into bloomberg.dbo.BlpFieldMapping ([productType], [blpField], [blpFieldType], [blpFTPCategory], [blpCName], [datamartField], [datamartFieldType], [iorder], [blpNeed], [isKey], [DBNeed], [OtherDBNeed], [NullNoUpdate]) Values (    'FuturesContractDetail',  'UNDL_SPOT_TICKER',  'String',  'SECMASTER',  ''NULL'',   'UnderlySpotTicker',  'String',  9,  'Y',  'N',  'Y',  'N',  'N' )
 insert into bloomberg.dbo.BlpFieldMapping ([productType], [blpField], [blpFieldType], [blpFTPCategory], [blpCName], [datamartField], [datamartFieldType], [iorder], [blpNeed], [isKey], [DBNeed], [OtherDBNeed], [NullNoUpdate]) Values (    'FuturesContractDetail',  'FUT_CONTRACT_DT_M',  'String',  '',  ''NULL'',   'ContractMonth',  'String',  10,  'N',  'N',  'Y',  'N',  'N' )
 insert into bloomberg.dbo.BlpFieldMapping ([productType], [blpField], [blpFieldType], [blpFTPCategory], [blpCName], [datamartField], [datamartFieldType], [iorder], [blpNeed], [isKey], [DBNeed], [OtherDBNeed], [NullNoUpdate]) Values (    'FuturesContractDetail',  'FUT_CONTRACT_DT',  'String',  'SECMASTER',  ''NULL'',   'ContractYear',  'String',  11,  'Y',  'N',  'Y',  'N',  'N' )
 insert into bloomberg.dbo.BlpFieldMapping ([productType], [blpField], [blpFieldType], [blpFTPCategory], [blpCName], [datamartField], [datamartFieldType], [iorder], [blpNeed], [isKey], [DBNeed], [OtherDBNeed], [NullNoUpdate]) Values (    'FuturesContractDetail',  'LAST_UPDATE',  'Datetime',  '',  ''NULL'',   'lastUpdate',  'Datetime',  12,  'N',  'N',  'Y',  'N',  'N' )
 insert into bloomberg.dbo.BlpFieldMapping ([productType], [blpField], [blpFieldType], [blpFTPCategory], [blpCName], [datamartField], [datamartFieldType], [iorder], [blpNeed], [isKey], [DBNeed], [OtherDBNeed], [NullNoUpdate]) Values (    'FuturesContractList',  'FUT_CHAIN',  'String',  'SECMASTER',  '合約清單',   ''NULL'',  ''NULL'',  1,  'Y',  'N',  'N',  'N',  'N' )
 insert into bloomberg.dbo.BlpFieldMapping ([productType], [blpField], [blpFieldType], [blpFTPCategory], [blpCName], [datamartField], [datamartFieldType], [iorder], [blpNeed], [isKey], [DBNeed], [OtherDBNeed], [NullNoUpdate]) Values (    'FuturesContractList',  'PRODUCTID',  'String',  '',  '商品代碼',   'productid',  'String',  2,  'N',  'Y',  'Y',  'N',  'N' )
 insert into bloomberg.dbo.BlpFieldMapping ([productType], [blpField], [blpFieldType], [blpFTPCategory], [blpCName], [datamartField], [datamartFieldType], [iorder], [blpNeed], [isKey], [DBNeed], [OtherDBNeed], [NullNoUpdate]) Values (    'FuturesContractList',  'PRODUCTTYPE',  'String',  '',  '商品類型(Iindex,Comdty)',   'productType',  'String',  3,  'N',  'Y',  'Y',  'N',  'N' )
 insert into bloomberg.dbo.BlpFieldMapping ([productType], [blpField], [blpFieldType], [blpFTPCategory], [blpCName], [datamartField], [datamartFieldType], [iorder], [blpNeed], [isKey], [DBNeed], [OtherDBNeed], [NullNoUpdate]) Values (    'FuturesContractList',  'CONTRACTID',  'String',  '',  '合約代碼',   'contractid',  'String',  4,  'N',  'Y',  'Y',  'N',  'N' )
 insert into bloomberg.dbo.BlpFieldMapping ([productType], [blpField], [blpFieldType], [blpFTPCategory], [blpCName], [datamartField], [datamartFieldType], [iorder], [blpNeed], [isKey], [DBNeed], [OtherDBNeed], [NullNoUpdate]) Values (    'FuturesContractPrice',  'PRODUCT_ID',  'String',  '',  ''NULL'',   'ProductID',  'String',  1,  'N',  'Y',  'Y',  'N',  'N' )
 insert into bloomberg.dbo.BlpFieldMapping ([productType], [blpField], [blpFieldType], [blpFTPCategory], [blpCName], [datamartField], [datamartFieldType], [iorder], [blpNeed], [isKey], [DBNeed], [OtherDBNeed], [NullNoUpdate]) Values (    'FuturesContractPrice',  'PRODUCT_TYPE',  'String',  '',  ''NULL'',   'ProductType',  'String',  2,  'N',  'Y',  'Y',  'N',  'N' )
 insert into bloomberg.dbo.BlpFieldMapping ([productType], [blpField], [blpFieldType], [blpFTPCategory], [blpCName], [datamartField], [datamartFieldType], [iorder], [blpNeed], [isKey], [DBNeed], [OtherDBNeed], [NullNoUpdate]) Values (    'FuturesContractPrice',  'CONTRACTID',  'String',  '',  ''NULL'',   'ContractID',  'String',  3,  'N',  'Y',  'Y',  'N',  'N' )
 insert into bloomberg.dbo.BlpFieldMapping ([productType], [blpField], [blpFieldType], [blpFTPCategory], [blpCName], [datamartField], [datamartFieldType], [iorder], [blpNeed], [isKey], [DBNeed], [OtherDBNeed], [NullNoUpdate]) Values (    'FuturesContractPrice',  'PX_YEST_DT',  'Date',  'CLOSINGVALUES',  ''NULL'',   'ddate',  'Date',  4,  'Y',  'Y',  'Y',  'N',  'N' )
 insert into bloomberg.dbo.BlpFieldMapping ([productType], [blpField], [blpFieldType], [blpFTPCategory], [blpCName], [datamartField], [datamartFieldType], [iorder], [blpNeed], [isKey], [DBNeed], [OtherDBNeed], [NullNoUpdate]) Values (    'FuturesContractPrice',  'PX_YEST_CLOSE',  'Number',  'CLOSINGVALUES',  ''NULL'',   'lastPrice',  'Number',  6,  'Y',  'N',  'Y',  'N',  'N' )
 insert into bloomberg.dbo.BlpFieldMapping ([productType], [blpField], [blpFieldType], [blpFTPCategory], [blpCName], [datamartField], [datamartFieldType], [iorder], [blpNeed], [isKey], [DBNeed], [OtherDBNeed], [NullNoUpdate]) Values (    'FuturesContractPrice',  'PX_YEST_HIGH',  'Number',  'CLOSINGVALUES',  ''NULL'',   'highPrice',  'Number',  7,  'Y',  'N',  'Y',  'N',  'N' )
 insert into bloomberg.dbo.BlpFieldMapping ([productType], [blpField], [blpFieldType], [blpFTPCategory], [blpCName], [datamartField], [datamartFieldType], [iorder], [blpNeed], [isKey], [DBNeed], [OtherDBNeed], [NullNoUpdate]) Values (    'FuturesContractPrice',  'PX_YEST_LOW',  'Number',  'CLOSINGVALUES',  ''NULL'',   'lowPrice',  'Number',  8,  'Y',  'N',  'Y',  'N',  'N' )
 insert into bloomberg.dbo.BlpFieldMapping ([productType], [blpField], [blpFieldType], [blpFTPCategory], [blpCName], [datamartField], [datamartFieldType], [iorder], [blpNeed], [isKey], [DBNeed], [OtherDBNeed], [NullNoUpdate]) Values (    'FuturesContractPrice',  'PX_VOLUME_1D',  'Number',  'CLOSINGVALUES',  ''NULL'',   'lastVolume',  'Number',  9,  'Y',  'N',  'Y',  'N',  'N' )
 insert into bloomberg.dbo.BlpFieldMapping ([productType], [blpField], [blpFieldType], [blpFTPCategory], [blpCName], [datamartField], [datamartFieldType], [iorder], [blpNeed], [isKey], [DBNeed], [OtherDBNeed], [NullNoUpdate]) Values (    'FuturesContractPrice',  'OPEN_INT',  'Number',  'CLOSINGVALUES',  ''NULL'',   'openPrice',  'Number',  10,  'Y',  'N',  'Y',  'N',  'N' )
 insert into bloomberg.dbo.BlpFieldMapping ([productType], [blpField], [blpFieldType], [blpFTPCategory], [blpCName], [datamartField], [datamartFieldType], [iorder], [blpNeed], [isKey], [DBNeed], [OtherDBNeed], [NullNoUpdate]) Values (    'FuturesContractPrice',  'FUT_AGGTE_OPEN_INT',  'Number',  'CLOSINGVALUES',  ''NULL'',   'change1D',  'Number',  11,  'Y',  'N',  'Y',  'N',  'N' )
 insert into bloomberg.dbo.BlpFieldMapping ([productType], [blpField], [blpFieldType], [blpFTPCategory], [blpCName], [datamartField], [datamartFieldType], [iorder], [blpNeed], [isKey], [DBNeed], [OtherDBNeed], [NullNoUpdate]) Values (    'FuturesContractPriceHis',  'PRODUCT_ID',  'String',  '',  '產品代碼',   'ProductID',  'String',  1,  'N',  'Y',  'Y',  'N',  'N' )
 insert into bloomberg.dbo.BlpFieldMapping ([productType], [blpField], [blpFieldType], [blpFTPCategory], [blpCName], [datamartField], [datamartFieldType], [iorder], [blpNeed], [isKey], [DBNeed], [OtherDBNeed], [NullNoUpdate]) Values (    'FuturesContractPriceHis',  'PRODUCT_TYPE',  'String',  '',  '產品類別',   'ProductType',  'String',  2,  'N',  'Y',  'Y',  'N',  'N' )
 insert into bloomberg.dbo.BlpFieldMapping ([productType], [blpField], [blpFieldType], [blpFTPCategory], [blpCName], [datamartField], [datamartFieldType], [iorder], [blpNeed], [isKey], [DBNeed], [OtherDBNeed], [NullNoUpdate]) Values (    'FuturesContractPriceHis',  'CONTRACTID',  'String',  '',  '合約代碼',   'ContractID',  'String',  3,  'N',  'Y',  'Y',  'N',  'N' )
 insert into bloomberg.dbo.BlpFieldMapping ([productType], [blpField], [blpFieldType], [blpFTPCategory], [blpCName], [datamartField], [datamartFieldType], [iorder], [blpNeed], [isKey], [DBNeed], [OtherDBNeed], [NullNoUpdate]) Values (    'FuturesContractPriceHis',  'DATE',  'Date',  '',  '日期',   'ddate',  'Date',  4,  'N',  'Y',  'Y',  'N',  'N' )
 insert into bloomberg.dbo.BlpFieldMapping ([productType], [blpField], [blpFieldType], [blpFTPCategory], [blpCName], [datamartField], [datamartFieldType], [iorder], [blpNeed], [isKey], [DBNeed], [OtherDBNeed], [NullNoUpdate]) Values (    'FuturesContractPriceHis',  'PX_LAST',  'Number',  'CLOSINGVALUES',  '最後收盤價',   'lastPrice',  'Number',  6,  'Y',  'N',  'Y',  'N',  'N' )
 insert into bloomberg.dbo.BlpFieldMapping ([productType], [blpField], [blpFieldType], [blpFTPCategory], [blpCName], [datamartField], [datamartFieldType], [iorder], [blpNeed], [isKey], [DBNeed], [OtherDBNeed], [NullNoUpdate]) Values (    'FuturesContractPriceHis',  'PX_HIGH',  'Number',  'CLOSINGVALUES',  '最高價',   'highPrice',  'Number',  7,  'Y',  'N',  'Y',  'N',  'N' )
 insert into bloomberg.dbo.BlpFieldMapping ([productType], [blpField], [blpFieldType], [blpFTPCategory], [blpCName], [datamartField], [datamartFieldType], [iorder], [blpNeed], [isKey], [DBNeed], [OtherDBNeed], [NullNoUpdate]) Values (    'FuturesContractPriceHis',  'PX_LOW',  'Number',  'CLOSINGVALUES',  '最低價',   'lowPrice',  'Number',  8,  'Y',  'N',  'Y',  'N',  'N' )
 insert into bloomberg.dbo.BlpFieldMapping ([productType], [blpField], [blpFieldType], [blpFTPCategory], [blpCName], [datamartField], [datamartFieldType], [iorder], [blpNeed], [isKey], [DBNeed], [OtherDBNeed], [NullNoUpdate]) Values (    'FuturesContractPriceHis',  'PX_VOLUME',  'Number',  'CLOSINGVALUES',  '成交量',   'lastVolume',  'Number',  9,  'Y',  'N',  'Y',  'N',  'N' )
 insert into bloomberg.dbo.BlpFieldMapping ([productType], [blpField], [blpFieldType], [blpFTPCategory], [blpCName], [datamartField], [datamartFieldType], [iorder], [blpNeed], [isKey], [DBNeed], [OtherDBNeed], [NullNoUpdate]) Values (    'FuturesContractPriceHis',  'OPEN_INT',  'Number',  'CLOSINGVALUES',  '開盤價',   'openPrice',  'Number',  10,  'Y',  'N',  'Y',  'N',  'N' )
 insert into bloomberg.dbo.BlpFieldMapping ([productType], [blpField], [blpFieldType], [blpFTPCategory], [blpCName], [datamartField], [datamartFieldType], [iorder], [blpNeed], [isKey], [DBNeed], [OtherDBNeed], [NullNoUpdate]) Values (    'FuturesContractPriceHis',  'FUT_AGGTE_OPEN_INT',  'Number',  'CLOSINGVALUES',  'Aggregate Open Interest',   'change1D',  'Number',  11,  'Y',  'N',  'Y',  'N',  'N' )
