// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:HBit/providers/local_provider.dart';
import 'package:HBit/utils/sp_utils.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

class Tr {
  Tr(this.localeName);

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();
  static Locale locales;
  LocalProvider localProvider = new LocalProvider();

  static Future<Tr> load(Locale locale) {
    locales = locale;
    final String name =
        locale.countryCode.isEmpty ? locale.languageCode : locale.toString();
    final String localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      return Tr(localeName);
    });
  }

  static Tr of(BuildContext context) {
    return Localizations.of<Tr>(context, Tr);
  }

  //本demo只对四个文本进行了国际化,包括主界面标题...
  static Map<String, Map<String, String>> _localizedValues = {


    'CN': {
      'main home': '首页',
      'main otc': '法币',
      'main coin': '币币',
      'main contract': '合约',
      'main assets': '资产',
      'Welcome login': '欢迎登陆',
      'login account hint': '请输入手机号或邮箱',
      'login pwd hint': '请输入密码',
      'login register': '注册',
      'forget password': '忘记密码',
      'login': '登录',
      'login successful': '登录成功',
      'Next step': '下一步',
      'reset Password': '重置密码',
      'confirm Password': '请再次确认新密码',
      'Confirm': '确认',
      'Google verification code': '谷歌验证码',
      'enter Google verification code': '请输入谷歌验证码',
      'Password cannot be empty': '新密码不能为空',
      'confirm password hint': '确认密码不能为空',
      'password hint2': '两次输入的密码不一样，请重新输入',
      'Phone code hint': '手机验证码不能为空',
      'Email code hint': '邮箱验证码不能为空',
      'Google code hint': '谷歌验证码不能为空',
      'Password reset': '密码已重置',
      'have account': '已有账号',
      'Go to login': '去登录',
      'Welcome register': '欢迎注册',
      'phone registration': '手机注册',
      'email registration': '邮箱注册',
      'phone input hint': '请输入手机号',
      'code input hint': '请输入验证码',
      'registration confirm password': '请确定密码',
      'invitationCode input hint': '请输入邀请码',
      'terms hint': '我已阅读并同意使用ETF条款',
      'email input hint': '请输入邮箱',
      'registration success': '注册成功',
      'email code input hint': '请输入邮箱验证码',
      'phone code input hint': '请输入手机验证码',
      'send': '发送验证码',
      'Reacquire': '重新获取',
      'sent': '已发送',
      'mine': '我的',
      'Copy successfully': '复制成功',
      'Security center': '安全中心',
      'Authentication': '身份验证',
      'My assets': '我的资产',
      'Rate standard': '费率标准',
      'Promotion': '推广二维码',
      'Help center': '帮助中心',
      'version': '版本',
      'Latest version': '当前版本是最新',
      'sign out': '退出登录',
      'sign out hint': '是否确定退出？',
      'cancel': '取消',
      'determine': '确定',
      'mine hint':
          '请不要轻信任何“HBit代充值”服务或向恶意地址充值数字货币的要求，增强资产安全意识。HBit不承认任何因用户过失产生的财产损失。 ',
      'mine hint2':
          '数字货币是一种高风险的投资方式，请您理性判断投资能力、谨慎作出投资选择。HBit会甄选优质币种，但不对 投资行为承担担保、赔偿等责任。 ',
      'bind mailbox': '绑定邮箱',
      'enter email address': '请输入您要绑定的邮箱账号',
      'mailbox': '邮箱',
      'submit Binding': '提交绑定',
      'Binding submitte': '已提交绑定',
      'bind Google': '绑定谷歌验证器',
      'bind Google Hint':
          '为了保障您的账户安全，请将16位密钥记录在纸上并安全保存。 如手机丢失，你可以通过该密钥恢复你的谷歌验证。',
      'Key': '密钥',
      'copy': '复制',
      'bind Phone': '绑定手机',
      'phone Number': '手机号',
      'Mobile verification code': '手机验证码',
      'modify Login Password': '修改登录密码',
      'modify Login Password Hint': '为了您的资金安全，修改登录密码后24小时内不允许提币。',
      'original Login Password': '原登录密码',
      'Login Password hint': '6-32位，含一种以上字母/数字/符号组合',
      'New login password': '新登录密码',
      'Repeat password': '重复输入密码',
      'Confirm new password': '确认新密码',
      'submit': '提交',
      'oldpassword empty hint': '原密码不能为空',
      'Password changed': '密码已修改',
      'Change fund password': '修改资金密码',
      'password limit hint': '请输入6位数字',
      'New money password': '新资金密码',
      'Confirm money password': '确认资金密码',
      'moneypwd empty hint': '资金密码不能为空',
      'moneypwd empty hint2': '确认资金密码不能为空',
      'Successfully modified': '修改成功',
      'Follow': '关注我们',
      'WeChat': '微信',
      'We chat number': '微信号',
      'Weibo': '微博',
      'customer service': '客户服务',
      'market collaboration': '市场合作',
      'Community hint': '欢迎加入HBit官方社群',
      'Saved album': '已保存至相册',
      'Save failed': '保存失败',
      'Save hint': '长按或截图保存二维码',
      'ID card': '身份证',
      'passport': '护照',
      'China Mainland': '中国大陆',
      'area': '国家/地区',
      'input name hint2': '请输入名字',
      'name': '名字',
      'input name hint': '请输入姓氏',
      'Last name': '姓氏',
      'Authentication type': '认证类型',
      'input ID card': '请输入证件号',
      'ID number': '证件号码',
      'ID number hint': '证件号码15-18位数',
      'ID number hint2': '上传证件正面',
      'ID number hint3': '上传证件反面',
      'ID number hint4': '手持身份证及证明',
      'Upload request': '上传要求',
      'Upload hint': '*请上传清晰的证件照片，必须能看清证件号和姓名',
      'Upload hint2': '*仅支持PNG、JPG、JPEG格式，每张大小限制在2M 以内',
      'Upload hint3': '*手持证件照需要包含“HBit”和当日日期',
      'Upload hint4': '拍摄提示',
      'standard': '标准',
      'Upload hint5': '边框缺失',
      'Upload hint6': '照片模糊',
      'Upload hint7': '闪光强烈',
      'Mainland China users': '中国大陆用户',
      'other area': '其他国家或地区用户',
      'History login': '历史登录',
      'interview time': '访问时间',
      'equipment': '设备',
      'money password': '资金密码',
      'Set successfully': '设置成功',
      'Currency rate': '币币费率',
      'Contract rate': '合约费率',
      'Withdrawal fee': '提币手续费',
      'login password': '登录密码',
      'modify': '修改',
      'Cell phone': '手机',
      'Google authentication': '谷歌验证',
      'unbounded': '去绑定',
      'Bound': '已绑定',
      'Go to set': '去设置',
      'To modify': '去修改',
      'invite friends': '邀请好友',
      'invite hint': '邀请你加入HBit，长按识别二维码',
      'Save album': '保存相册',
      'Set code': '设置防钓鱼码',
      'Set code hint': '防钓鱼码可以防范假冒HBit网站和邮件。设置后HBit给您发 送邮件中包含此码，没有包含的作为诈骗邮件。',
      'Set code hint2': '请输入8-32位英文或数字',
      'Anti-phishing code': '防钓鱼码',
      'searche Currency': '请输入币种名称',
      'searche noCurrency': '没有相关币种',
      'searche announcement': '公告',
      'searche clearRecord': '清除历史记录',
      'searche noRecord': '暂无记录',
      'searche hot': '热门搜索',
      'searche Historical': '历史公告',
      'home Optional': '自选',
      'home contract': '合约',
      'home Coin': '币币',
      'home No data': '暂无数据',
      'home customer service': 'HBit在线客服',
      'home Sustainable': '永续',
      'home open': '开盘',
      'home name': '名称',
      'home Latest price': '最新价',
      'home change': '涨跌幅',
      'home 24volume': '24h成交量',
      'home 24amount': '24H额',
      'splash jump over': '跳过',
      'tradr Success': '成功',
      'tradr Current Order': '当前订单',
      'tradr Historical Orders': '历史订单',
      'tradr All': '全部',
      'tradr Sell': '卖出',
      'tradr Buy': '买入',
      'tradr Cancel Hint': '是否撤单',
      'tradr Cancel Success': '撤单成功',
      'kline depth': '深度',
      'kline VOL': '成交',
      'kline Max': '24H最高',
      'kline Min': '24H最低',
      'kline More': '更多',
      'kline Minute': '分钟',
      'kline Hour': '小时',
      'kline Day': '天',
      'kline Index': '指标',
      'kline Main': '主图',
      'kline Hide': '隐藏',
      'kline Side': '副图',
      'kline hold': '持仓',
      'home quit hint': '你确定要退出吗?',
      'home quit': '退出',
      'tradr ListCoin': '币币列表',
      'tradr time': '时间',
      'tradr Direction': '方向',
      'tradr Price': '价格',
      'tradr Quantity': '数量',
      'tradr BuyOrder': '买盘',
      'tradr SellOrder': '卖盘',
      'tradr Buy and Sell': '买卖盘',
      'tradr Limit Price': '限价',
      'tradr Market Price': '市价',
      'tradr best': '以当前最优价格交易',
      'tradr Available': '可用',
      'tradr Amount': '交易额',
      'tradr Price Hint': '请输入价格',
      'tradr Quantity Hint': '请输入数量',
      'tradr Pending': '挂单成功',
      'tradr No Entrust': '暂无委托',
      'tradr Current Entrust': '当前委托',
      'tradr AllEntrust': '全部委托',
      'tradr Revoke': '撤销',
      'tradr Actual Transaction': '实际成交',
      'tradr Entrust price': '委托价',
      'tradr Entrust Amounts': '委托量',
      'tradr Total Turnovers': '成交总额',
      'tradr Average price': '成交均价',
      'tradr Volume': '成交量',
      'tradr fee': '手续费',
      'tradr filter': '筛选',
      'tradr Reset': '重置',
      'asset Coin': '币币资产',
      'asset Contract': '合约资产',
      'asset Coin record': '币币财务记录',
      'asset Contract record': '合约财务记录',
      'asset Freeze': '冻结',
      'asset Converted amount': '折合金额',
      'asset Recharge': '充币',
      'asset Withdrawal': '提币',
      'asset Transfer': '划转',
      'asset To trade': '去交易',
      'asset Withdrawal Hint': '扫描二维码获取充币地址',
      'asset Copy address': '复制地址',
      'asset Tips': '温馨提示',
      'asset No More': '没有更多',
      'asset Choose': '请选择',
      'asset Billing Detail': '账单明细',
      'asset Address': '地址',
      'asset Chain name': '链名称',
      'asset Transaction ID': '交易ID',
      'asset Transaction hour': '交易时间',
      'asset Trading status': '交易状态',
      'asset Coin account': '币币账户',
      'asset Contract account': '合约账户',
      'asset TransferQuantity hint': '请输入划转数量',
      'asset No available': '无可用资金',
      'asset Confirm transfer': '确认划转',
      'asset QuantityEmpty hint': '划转数量不能为空',
      'asset Successful transfer': '划转成功',
      'asset Balance': '余额',
      'asset Current currency': '当前币种',
      'asset safety verification': '安全验证',
      'asset Successful withdrawal': '申请提现成功',
      'asset Search': '搜索',
      'asset Withdrawal Hint2': '请输入提币地址',
      'asset ALL': '全提',
      'asset Arrival quantity': '到账数量',
      'asset Carry on': '继续',
      'asset Withdrawal Max hint': '单次最大提币',
      'asset NoFundpwd': '您还没有设置资金密码，为了您的 账户安全，请前往设置。',
      'asset Set': '立即设置',
      'asset protection': '账号保护',
      'asset Withdrawal hint3': '24小时内无法提币',
      'asset Empty hint1': '提币地址不能为空',
      'asset Empty hint2': '提币数量不能为空',
      'asset Valuation coin': '币币资产估值',
      'asset Valuation coin contract': '合约资产估值',
      'asset Nonactivated': '未开通',
      'asset Activation': '激活合约交易账户',
      'asset Account Equity': '账户权益',
      'asset equity': '当前权益',
      'asset hold': '持仓（手）',
      'asset Hide': '隐藏小额币种',
      'asset 7 Day': '最近7天',
      'asset 7-1 month': '7天至1个月',
      'asset 7-3 month': '7天至3个月',
      'asset Date': '日期',
      'asset Transaction Type': '交易类型',
      'asset Choose type': '选择类型',
      'asset Currency': '币种',
      'asset Choose currency': '选择币种',
      'asset Transfer1': '由合约账户转入',
      'asset Transfer2': '转出至合约账户',
      'asset completed': '已完成',
      'asset hand': '手',
      'asset Remarks': '备注',
      'asset amount': '金额',
      'contract Transaction detail': '成交明细',
      'contract Close Bull': '平多',
      'contract UserEntrust': '用户委托',
      'contract Volume_Hand': '成交量(手)',
      'contract EntrustType': '委托类型',
      'contract TransactionTime': '成交时间',
      'contract TransactionPrice': '成交价',
      'contract HistoricalEntrust': '历史委托',
      'contract CurrentPlan': '当前计划',
      'contract HistoricalPlan': '历史计划',
      'contract OpenLong': '开多',
      'contract OpenShort': '开空',
      'contract CloseLong': '平多',
      'contract CloseShort': '平空',
      'contract Forced1': '强制减多',
      'contract Forced2': '强制减空',
      'contract PlanEntrust': '计划委托',
      'contract TriggerPrice': '触发价',
      'contract StrikePrice': '执行价',
      'contract BestPrice': '最优成交价',
      'contract Entrusting': '委托中',
      'contract Revoked': '已撤销',
      'contract DealDone': '已成交',
      'contract Profit2': '已实现盈亏',
      'contract NoProfit': '未实现盈亏',
      'contract Profit': '盈利',
      'contract Loss': '亏损',
      'contract Failure': '失败',
      'contract intend': '计划中',
      'contract ExecutionVolume': '执行量(张)',
      'contract ContractList': '合约列表',
      'contract CurrentPosition': '当前仓位',
      'contract LimitOpening': '限价开仓',
      'contract Strike Price': '执行价格',
      'contract RapidLiquidation': '闪电平仓',
      'contract MarketValue': '市值',
      'contract Margin': '保证金',
      'contract Buy open long': '买入开多',
      'contract Sell more': '卖出平多',
      'contract buy1': '买入平空',
      'contract sell1': '卖出开空',
      'contract buy2': '调整多头杠杆',
      'contract sell2': '调整空头杠杆',
      'contract EnterTriggerHint': '请输入触发价格',
      'contract EnterExecuteHint': '请输入执行价格',
      'contract EnterOrderNumberHint': '请输入下单手数',
      'contract MaxStopLossNumber': '止损数量最大',
      'contract ≤': '必须≤开仓均价',
      'contract ≥': '必须≥开仓均价',
      'contract StopLoss': '止损',
      'contract Close': '关闭',
      'contract CurrentPrice': '当前价格',
      'contract AverageOpenPrice': '开仓均价',
      'contract StopPrice': '止损价格',
      'contract StopNumber': '止损数量',
      'contract SingleLargest': '单笔最大',
      'contract MarketPrice': '当市场价格',
      'contract BestPriceHint': '将以最优成交价平仓,数量',
      'contract ExpectedReturn': '预计收益',
      'contract SelectMultiple': '选择倍数',
      'contract MaximumMultiple': '最高倍数',
      'contract OpeningPrice': '开仓价格',
      'contract SavePicture': '保存图片',
      'contract NotOpen': '暂未开放',
      'contract know': '知道了',
      'contract SavedSuccessfully': '保存成功',
      'contract MaximumProfit': '止盈数量最大',
      'contract latestPrice': '最新价格',
      'contract MaximumProfitPrice': '止盈价格',
      'contract MaximumProfitNumber': '止盈数量',
      'contract OpenLongSell': '多头仓位平仓',
      'contract CloseLongSell': '空头仓位平仓',
      'contract LimitClose': '限价平仓',
      'contract OptimalTransaction': '最优追价交易',
      'contract  CanSell': '可平',
      'contract Operation': '操作',
      'contract NoOrder': '暂无仓位订单',
      'contract Bull': '多',
      'contract Bear': '空',
      'contract RateOfReturn': '回报率',
      'contract ForecastStopPrice': '预估强平价',
      'contract NoEntrustOrders': '暂无委托订单',
      'contract NoOrders': '暂无计划订单',
      'contract positions': '仓位',
      'contract CurrentOrder': '当前跟单',
      'contract Entrust': '普通委托',
      'contract Open': '开仓',
      'contract close2': '平仓',
      'contract StoProfit': '止盈',
      'contract Market': '市场',
      'contract prompt': '提示',
      'contract understand more': '了解更多',
      'contract SpeedSell Hint21': '用户预先设置触发条件及其执行价格和数量，当市场最新成交价格达到出发条件时，系统将提前设置好执行价格和数量进行下单（即限价单）',
      'contract SpeedSell Hint20': '计划委托说明',
      'contract SpeedSell Hint19': '若市场波动剧烈，触发止盈/止损时，实际成交价可能与该时刻的价格存在差异。止盈/止损订单也存在无法成交或无法完全成交的可能。',
      'contract SpeedSell Hint18': '的形式将您此仓位设置的手数进行委托挂单',
      'contract SpeedSell Hint17': '建议您的执行价格',
      'contract SpeedSell Hint16': '当市场最新成交价格达到您设置的止盈/止损价格时，将会以',
      'contract SpeedSell Hint15': '委托成功，此次委托数量已影响您设置止盈止损委托的数量，请到当前计划中查看',
      'contract SpeedSell Hint14': '提示：计划委托不一定成功执行，可能会因为价格限制、仓位限制、保证金不足、仓位档次、网络问题、系统问题等而下单失败',
      'contract SpeedSell Hint13': '.若超出此范围，触发时委托可能执行失败。',
      'contract SpeedSell Hint12': '，建议您的执行价格',
      'contract SpeedSell Hint11': '您的触发价格为',
      'contract ConfirmOrder': '确认委托',
      'contract SpeedSell Hint10': '进行挂单，若超出此范围，触发时委托可能执行失败。',
      'contract SpeedSell Hint9': '进行挂单。点击确认此操作。',
      'contract SpeedSell Hint8': '时，您的委托将以',
      'contract SpeedSell Hint7': '该计划委托执行后，当市场价格到达',
      'contract SpeedSell Hint6': '，未了确保您的委托成功，请增加仓位保证金。',
      'contract SpeedSell Hint5': '<=仓位的预估强平价',
      'contract SpeedSell Hint55': '>=仓位的预估强平价',
      'contract SpeedSell Hint4': '您的止损委托价格',
      'contract SpeedSell Hint3': '若价格到达预估强平价时，会终止此次平仓，执行强平策略。',
      'contract SpeedSell Hint2': '系统选择最容易成交的价格挂单，若该委托没有成交或没有完全成交。会以最新的容易成交的价格继续挂单。',
      'contract SpeedSell Hint1': '闪电平仓说明',
      'choose Country': '选择国家',
      'choose Country Hint': '请输入国家',
      'Mining': '挖矿',
      'mining Lock': '锁仓挖矿',
      'mining List': '挖矿列表',
      'mining Available Balance': '可用余额',
      'mining Time': '挖矿时间',
      'mining Amount': '挖矿数量',
      'mining rate': '收益率',
      'mining Enter hint': '请输入资金密码',
      'mining Confirm Lock': '确认锁仓',
      'mining Rule Description': '规则说明',
      'mining Lockup': '锁仓',
      'mining Released': '已释放',
      'mining Lockup Time': '锁仓时间',
      'mining To': '至',
      'mining LockPeriod': '选择锁仓周期',
      'mining NotCurrently': '暂不支持该币种',
      'mining NotAmountHint': '请输入挖矿数量',
      'mining MinAmountHint': '不能小于最低数量',
      'enter name': '请输入名字',
      'a': '枚',
      'reward': '奖励',
      'Claim': '持币要求(最低)',
      'Lockup Day': '锁仓天数',
      'Certification again': '再次认证',
      'rules hint': '锁仓规则',
      'rules hint2': ' 1:锁仓挖矿为，7天，15天， 30天，60天，90天。',
      'rules hint3': ' 2:锁仓挖矿有相对应的持币要求以及相对应的奖励制度',
      'rules hint4': '3:锁仓挖矿奖励计算公式: (锁仓天数奖励) * (持币锁仓数量)1000*3%=30枚(锁仓币) ',
      'rules hint5': ' 4:为维持锁仓币的稀有性，我们利用锁仓功能鼓励长期持有锁仓币的用户，锁仓挖矿用户会比常规持有用户得到更多的奖励 ',
      'rules hint6': ' 注意事项: ',
      'rules hint7': ' 1:锁仓挖矿开始后无法强制结束',
      'rules hint8': ' 2:锁仓挖矿期间您的锁仓币币将在仓内，无法在币币账户馀额中显示，锁仓期限结束会跟随您的奖励一起返回币币账户馀额中',
      'rules hint9': ' 3:锁仓挖矿和其他活动要求锁仓天数不重複叠加',
      'rules hint10': ' HBit有对本规则的永久修改权，奖励调整权，以及最终解释权',

      'c2c Buy': '购买',
      'c2c Sell': '出售',
      'c2c Rate': '成交率',
      'c2c Limit': '限额',
      'c2c Undone': '未完成',
      'c2c Cancelled': '已取消',
      'c2c Price': '单价',
      'c2c TotalAmount': '总金额',
      'c2c Set': '法币交易设置',
      'c2c Management': '收款方式管理',
      'c2c Name': '姓名',
      'c2c BankCardNumber': '银行卡号',
      'c2c BankAccount': '开户银行',
      'c2c Branch': '开户支行',
      'c2c EnterNameHint': '请输入真实姓名',
      'c2c EnterNumberHint': '请输入银行卡号',
      'c2c EnterBankAccountHint': '请输入开户银行',
      'c2c BranchHint': '可选填',
      'c2c WeChatNickname': '微信昵称',
      'c2c WeChatAccount': '微信账号',
      'c2c CollectionCode': '收款码',
      'c2c Upload': '上传收款码',
      'c2c AlipayAccount': '支付宝账号',
      'c2c EnterAlipayAccountHint': '请输入支付宝账号',
      'c2c EnterWeChatNameHint': '请输入微信昵称',
      'c2c EnterWeChatHint': '请输入微信账号',
      'c2c Alipay': '支付宝',
      'c2c Bank': '银行卡',
      'c2c PaymentMethod': '支付方式',
      'c2c CancelOrder': '取消订单',
      'c2c CancelOrderHint': '3分钟内可自主',
      'c2c OrderNumber': '订单编号',
      'c2c RealNameInfo': '实名信息',
      'c2c OrderAmount': '订单金额',
      'c2c OrderTime': '下单时间',
      'c2c ConfirmSK': '确认收款',
      'c2c CompletedOrder': '已完成订单',
      'c2c PaymentConfirmed': '已确认付款',
      'c2c ConfirmSKHint': '如确认通过以下方式线下收到对方汇款，方可放币',
      'c2c CancelOrderHint2': '当天取消多次将冻结法币交易功能，是否确认取消订单',
      'c2c CancelOrderHint3': '再想想',
      'c2c CancelSuccess': '取消成功',
      'c2c ConfirmPayment': '确认付款',
      'c2c ConfirmPaymentHint': '如确认通过以下方式线下汇款给对方，方可付款',
      'c2c ConfirmPaymentHint2': '已付款，请放币',
      'c2c PaymentPaid': '待支付',
      'c2c AlreadyPaid': '已付款',
      'c2c Confirmed': '待确认',
      'c2c PaymentMethod2': '收款方式',
      'c2c PaymentBank': '收款银行',
      'c2c PaymentUser': '收款人',
      'c2c AffiliatedBranch': '隶属支行',
      'c2c ReceivingQRCode': '收款二维码',
      'c2c TradHint': '交易警惕',
      'c2c TradHint2': '非工作时间大于5万以上的跨行汇款，请分批支付(少于5W汇款可及时到账)',
      'c2c TradHint3': '请及时到账的支付方式，支付宝银行卡、2小时汇款等支付方式1小时内为到账，卖家有权退回款项',
      'Order detail': '订单详情',
      'c2c BuyQuantity': '可买数量',
      'c2c SellQuantity': '可卖数量',
      'c2c BuySuccessful': '购买成功',
      'c2c SellSuccessful': '出售成功',

      'ContractAgreementTitle': 'HBit永续合约用户使用协议',
      'ContractAgreementTitle2': '綜述',
     'ContractAgreement1': '1.1永续合约(“本服务”)是“HBit”推出的虚拟资产衍生品。由HBit负责产品的设计管理和交易平台的运营服务。 为使用HBit永续合约，您应当阅读并遵守《HBit永续合约用户使用协议》(“本协议”)。请您务必审慎阅读、充分理解各条款内容，并选择接受或不接受本协议。',
    'ContractAgreement2':'1.2 除非您已阅读并接受本协议所有条款，否则您无权使用HBit永续合约及其相应的服务。您接受本协议的行为，以及您使用本服务的行为即视为您已阅读并同意受本协议的约束。',
    'ContractAgreement3':'2. 使用本服务的资格',
    'ContractAgreement4':'2.1 您了解并确认：',
    'ContractAgreement5':'您已同意遵守“HBit服务条款”，同时您有资格并且不被禁止使用其中定义的“服务”;',
    'ContractAgreement6':'本协议与您所在国家或地区的法律没有冲突;',
    'ContractAgreement7':'您是存入本服务的虚拟资产的合法所有者，并保证这些虚拟资产的来源是合法的。',
    'ContractAgreement8':'2.2 您了解使用本服务的风险，包括但不限于：',
    'ContractAgreement9':'虚拟资产及其衍生品的高价格波动可能会在短时间内造成重大或全部损失；',
    'ContractAgreement10':'作为保证金存入的虚拟资产不足可能导致您的仓位立即被强制减仓，您可能会丢失所有存入本服务的虚拟资产；',
    'ContractAgreement11':'可能会发生技术异常，这可能会延迟或阻止您使用本服务；',
    'ContractAgreement12':'可能发生市场异常，这可能导致您的虚拟资产发生损失；',
    'ContractAgreement13':'为了保持市场的整体健康，HBit需要不时添加，删除或更改政策。此类行为可能有利于或损害像您一样的个人客户。',
    'ContractAgreement14':'3. 使用本服务',
    'ContractAgreement15':'3.1 本服务为您提供实时市场深度以及其他信息。您可以查看或下载信息以供自己分析。',
    'ContractAgreement16':'3.2 您可以通过网页，客户端，API 等方式下达交易委托。一旦所委托的交易成交后，您将无法取消或修改委托。',
    'ContractAgreement17':'3.3 当您下达开仓委托并且成交时，您将会建立相应的合约仓位。当您下达平仓委托并且成交时，将会从您所持有的仓位中扣减相应的持仓数量。本服务将实时为您提供有关您的仓位以及您的虚拟资产及其衍生产品的价值的信息。',
    'ContractAgreement18':'3.4 永续合约将于每新加坡时间07:00、15:00、23:00日3:00 & 15:00 (欧洲中部时间) / 4:00 & 16:00 (欧洲中部夏令时间) 进行资金费用结算，持有多仓和空仓的用户需要互相支付资金费用 (由本服务定义及计算，详情可参考“HBit永续合约简介”)。',
    'ContractAgreement19':'3.5 永续合约对您平仓形成的已实现盈亏采用实时结算方式，结算后的与已实现盈亏相同的数量的虚拟资产将存入至您的账户，并可以即时转出 (受到保证金要求和本服务的其他相关限制)。然后未实现盈亏将根据当前的最新的合理标记价格 (由本服务定义及计算，详情可参考“HBit永续合约简介”)与您当前持有的合约数量实时计算（未实现盈亏、已实现盈亏和分摊数量的定义和计算方法详见“HBit 永续合约简介”)。',
    'ContractAgreement20':'3.6 您使用本服务应该向HBit支付服务费用，有关服务费用的安排详见“HBit 永续合约简介”。',
    'ContractAgreement21':'4. 风控规则',
    'ContractAgreement22':'4.1 HBit永续合约采用多种制度以控制风险，包括并不限于：',
    'ContractAgreement23':'全仓维持保证金率制度',
    'ContractAgreement24':'协议平仓制度',
    'ContractAgreement25':'HBit 会根据市场情况不断完善风控规则。',
    'ContractAgreement26':'4.2 全仓维持保证金率制度。根据您在本服务中存入的虚拟资产，您可以开的仓位的大小是有限的。此外，为避免强制平仓，您的保证金率（由本服务定义和计算，请参阅“HBit永续合约简介”）需要高于维持保证金率，即维持您目前的仓位的最低保证金比率。本服务采用全仓维持保证金率制度，仓位越大，维持保证金比率就越高。有关详细信息，请参阅“HBit永续合约简介”。',
    'ContractAgreement27':'4.3 协议平仓制度。有关详细信息，请参阅“HBit永续合约简介”。',
    'ContractAgreement28':'5. 责任限制',
    'ContractAgreement29':'5.1 您承认您完全理解规则和政策。若您对规则和政策有误解，HBit对您的损失不承担任何责任。',
    'ContractAgreement30':'5.2您的交易信息只有在结算后才显示为准确的信息。结算之间所显示的信息仅供参考，不能保证为官方结果，如您使用此信息进行操作，有可能会造成损失。 HBit对您的上述损失不承担任何责任。',
    'ContractAgreement31':'5.3 为了遵守法律或法规的变化，或为了维护市场的整体健康，HBit将自行决定不时更改政策或实施紧急规则。此类更改或实施有可能导致您的帐户暂时无法访问本服务、或中断其他服务等。HBit对您的上述损失不承担任何责任。',
    'ContractAgreement32':'5.4 系统平台因下列状况无法正常运作，使您无法使用各项服务或不能正常委托时，HBit不承担损害赔偿责任，该状况包括但不限于：',
    'ContractAgreement33':'A．HBit平台公告之系统停机维护期间；',
    'ContractAgreement34':'B．电信设备出现故障不能进行数据传输的；',
    'ContractAgreement35':'C．因台风、地震、海啸、洪水、停电、战争、恐怖袭击等不可抗力之因素，造成 HBit平台系统障碍不能执行业务的；',
    'ContractAgreement36':'D．由于黑客攻击、计算机病毒侵入或发作、电信部门技术调整或故障、网站升级、银行方面的问题、因政府管制而造成的暂时性关闭等影响网络正常经营的原因而造成的服务中断或者延迟；',
    'ContractAgreement37':'E．因为行业现有技术力量无法预测或无法解决的技术问题而造成的损失；',
    'ContractAgreement38':'F．因第三方的过错或者延误而给您或者其他第三方造成的损失。',
    'ContractAgreement39':'5.5 由于系统故障，网络原因，DDos 等黑客攻击等不可归责于 HBit 的意外因素可能导致的异常成交，行情中断，以及其他可能的异常情况，HBit 有权根据实际情况取消交易或者回滚某一段时间的成交。HBit 对您的上述损失不承担任何责任。',
    'ContractAgreement40':'5.6 您了解技术问题可能会意外发生。对于技术问题造成的任何损失，HBit概不负责，包括但不限于：',
    'ContractAgreement41':'与本服务连接的失败、延迟、中断或其他故障。',
    'ContractAgreement42':'由于超载导致本服务停止、缓慢、无响应或其他故障。',
    'ContractAgreement43':'由于本服务无法通过互联网从第三方正确获取必要数据而导致的故障。',
    'ContractAgreement44':'5.7 HBit 严格禁止不公平的交易行为。如果您参与以下行为，HBit保留自行决定对您的帐户实施高管控制权的权利：',
    'ContractAgreement45':'参与价格操纵或任何其他恶意的市场行为；',
    'ContractAgreement46':'可能通过利用本服务的漏洞或其他不合理的手段损害其他用户或HBit；',
    'ContractAgreement47':'参与HBit认为对市场有害的任何其他活动。',
    'ContractAgreement48':'为了消除任何对市场整体健康的不利影响，HBit 保留采取以下措施的权利，包括但不限于关闭您的账户，限制、暂停和取消交易，回滚成交。',
    'ContractAgreement49':'HBit对因采取上述措施而给您带来的任何损失不承担责任。',
    'ContractAgreement50':'6. 赔偿责任',
    'ContractAgreement52':'6.1 您应该采取一切可能的措施保证 HBit 免受任何来自于您使用本服务或者其他与您的 HBit 账户相关的行为的损害，否则您应该对HBit承担赔偿责任。',
    'ContractAgreement53':'6.2 您在此确认并同意，对因您违反本协议的行为、您不正当使用HBit的服务的行为、您违反任何法律或侵犯任何第三方权利的行为、经您授权使用您的 HBit 账户或者登录 HBit网站、客户端、系统（包括用于提供任何 HBit服务的网络和服务器，且无论该等网站、客户端和系统是由 HBit运营，或者是为了 HBit而运营，或者为了为向您提供 HBit 服务而运营）的任何第三方的作为或者不作为而引起的任何索赔或者要求（包括合理的法律费用），您应该进行抗辩、赔偿，并尽一切努力使 HBit免受伤害。',
    'ContractAgreement54':'7. 其它',
    'ContractAgreement55':'7.1 本协议内容同时包括 HBit 的各项制度规范、其它本协议附件中的协议或规则、HBit可能不断发布的关于本服务的其他相关协议、规则等内容。上述内容一经正式发布，即为本协议不可分割的组成部分，您同样应当遵守。上述内容与本协议存在冲突的，以本协议为准。',
    'ContractAgreement56':'7.2 如有必要，HBit有权随时单方变更本协议的内容，且 HBit 无需事前通知您。如果 HBit 单方变更了本协议的内容，变更的内容将立即在 HBit的网站上公布，届时请及时查看上述网站上的最新信息。在上述变更公布后，如果您继续使用本服务，则视为您已经同意对本协议的变更。如果您不同意对本协议的变更，您应该停止使用本服务。',
    'ContractAgreement57':'7.3 您应该认真阅读本协议以及本协议第7.1条和7.2条所提到的任何构成本协议的内容的其他相关协议、规则等内容。如果对于上述内容您有任何疑问，请联系 HBit，HBit将提供合理和必要的说明。除非 HBit 有其他要求，否则您应该通过电子邮件的方式联系 HBit，并通过电子邮件的方式和 HBit 之间进行文件的传输（“正式沟通”）。您也可以非正式地通过电话联系 HBit（非正式沟通）。除非双方有任何其他约定，否则任何正式沟通都应该使用英语进行。如果任何英文版的沟通和非英文版的沟通不一致，则以英文版的沟通内容为准。如果任何正式沟通或者非正式沟通的内容与本协议的内容不一致，以本协议的内容为准。',
    'ContractAgreement58':'如果本协议的英文版内容与其他语言的翻译版本的内容存在冲突，以英文版的本协议内容为准。',
    'ContractAgreement59':'7.4 任何与本协议相关的事项，包括但不限于本协定的成立、生效、履行、变更、解释及纠纷解决，均适用开曼群岛地区法律。',
    'ContractAgreement60':'7.5 若您和 HBit之间发生任何纠纷或争议，首先应友好协商解决；协商不成功的，双方均同意将纠纷或争议提交开曼群岛地区有管辖权的法院解决。',
    'ContractAgreement61':'7.6 本协议所有条款的标题仅为阅读方便，本身并无实际涵义，不能作为本协议含义解释的依据。',
    'ContractAgreement62':'7.7 对于 HBit永续合约的参加者，本协议供参考，具有约束性。',
     'Upload successfully':'上传成功',
      'Upload failed':'上传失败',
      'Photo album':'相册',
      'Take pictures':'拍照',
      're-upload':'重新上传',
      'bindGoogle1':'操作步骤',
      'bindGoogle2':'1.登录安卓应用商店或利用手机浏览器搜索',
      'bindGoogle3':'谷歌验证器',
      'bindGoogle4':'2.请打开谷歌验证器软件，点击右上角',
      'bindGoogle5':'选择“手动输入验证码”',
      'bindGoogle6':'3.输入HBit账户或其他自定义名称，并粘贴上面的密钥“',
      'bindGoogle7':'”到“Authenticcator”中的密钥框内。',
      'bindGoogle8':'4.点击右上角“',
      'bindGoogle9':'“进行保存。',
      'bindGoogle10':'5.将您谷歌验证器App中生成的6位数验证码填到上方的验证框中，点击“',
      'c2c ContactTip': '为确保您的资金安全，请添加财务联系方式',
      'c2c ContactTip2': 'Line',
      'c2c ContactTip3': 'Telogram',
      'c2c ContactTip4': 'whatapp',
      'c2c OrderDetail': '订单详情',
      'Invitation code': '我的邀请码',
      'Invitation code Hint': '请输入邀请码',
      'IDCard photo': '身份证正面照',
      'IDCard photo2': '身份证反面照',
      'IDCard photoHint2': '手持身份证及声明',
      'upload passport': '上传证件内页照',
      'upload passport2': '上传手持证件照',
      'upload passport3': '手持证件及证明',
      'upload passport4': '上传要求',
      'upload passport5': '请上传清晰的证件照片，必须能看清证件号和姓名',
      'upload passport6': '仅支持PNG、JPG、JPEG格式，每张大小限制在2M 以内',
      'upload passport7': '手持证件照需要包含“HBit”和当日日期',
      'Certificate authentication': '证件认证',
      'bank Card Hint': '没有绑定该银行卡',


      'task title': '易米八一',
      'set title': '设置',
      'theme set': '主题设置',
      'language set': '语言设置'
    },
    'HK': {
      'main home': '首頁',
      'main coin': '幣幣',
      'main contract': '合約',
      'main assets': '資產',
      'Mobile verification code': '手機驗證碼',
      'Welcome login': '歡迎登陸',
      'login account hint': '請輸入手機號或郵箱',
      'login pwd hint': '請輸入密碼',
      'login register': '註冊',
      'forget password': '忘記密碼',
      'login': '登錄',
      'login successful': '登錄成功',
      'Next step': '下壹步',
      'reset Password': '重置密碼',
      'confirm Password': '請再次確認新密碼',
      'Confirm': '確認',
      'Google verification code': '谷歌驗證碼',
      'enter Google verification code': '請輸入谷歌驗證碼',
      'Password cannot be empty': '新密碼不能為空',
      'confirm password hint': '確認密碼不能為空',
      'password hint2': '兩次輸入的密碼不壹樣，請重新輸入',
      'Phone code hint': '手機驗證碼不能為空',
      'Email code hint': '郵箱驗證碼不能為空',
      'Google code hint': '谷歌驗證碼不能為空',
      'Password reset': '密碼已重置',
      'have account': '已有賬號',
      'Go to login': '去登錄',
      'Welcome register': '歡迎註冊',
      'phone registration': '手機註冊',
      'email registration': '郵箱註冊',
      'phone input hint': '請輸入手機號',
      'code input hint': '請輸入驗證碼',
      'registration confirm password': '請確定密碼',
      'invitationCode input hint': '請輸入邀請碼',
      'terms hint': '我已閱讀並同意使用HBit條款',
      'email input hint': '請輸入郵箱',
      'registration success': '註冊成功',
      'email code input hint': '請輸入郵箱驗證碼',
      'phone code input hint': '請輸入手機驗證碼',
      'send': '發送驗證碼',
      'Reacquire': '重新獲取',
      'sent': '已發送',
      'mine': '我的',
      'Copy successfully': '復制成功',
      'Security center': '安全中心',
      'Authentication': '身份驗證',
      'My assets': '我的資產',
      'Rate standard': '費率標準',
      'Promotion': '推廣二維碼',
      'Follow': '關註我們',
      'Help center': '幫助中心',
      'version': '版本',
      'Latest version': '當前版本是最新',
      'sign out': '退出登錄',
      'sign out hint': '是否確定退出？',
      'cancel': '取消',
      'determine': '確定',
      'mine hint':
          '請不要輕信任何“HBit代充值”服務或向惡意地址充值數字貨幣的要求，增強資產安全意識。HBit不承認任何因用戶過失產生的財產損失。 ',
      'mine hint2':
          '數字貨幣是壹種高風險的投資方式，請您理性判斷投資能力、謹慎作出投資選擇。HBit會甄選優質幣種，但不對 投資行為承擔擔保、賠償等責任。 ',
      'bind mailbox': '綁定郵箱',
      'enter email address': '請輸入您要綁定的郵箱賬號',
      'mailbox': '郵箱',
      'submit Binding': '提交綁定',
      'Binding submitte': '已提交綁定',
      'bind Google': '綁定谷歌驗證器',
      'bind Google Hint':
          '為了保障您的賬戶安全，請將16位密鑰記錄在紙上並安全保存。 如手機丟失，妳可以通過該密鑰恢復妳的谷歌驗證。',
      'Key': '密鑰',
      'copy': '復制',
      'bind Phone': '綁定手機',
      'phone Number': '手機號',
      'modify Login Password': '修改登錄密碼',
      'modify Login Password Hint': '為了您的資金安全，修改登錄密碼後24小時內不允許提幣。',
      'original Login Password': '原登錄密碼',
      'Login Password hint': '6-32位，含壹種以上字母/數字/符號組合',
      'New login password': '新登錄密碼',
      'Repeat password': '重復輸入密碼',
      'Confirm new password': '確認新密碼',
      'submit': '提交',
      'oldpassword empty hint': '原密碼不能為空',
      'Password changed': '密碼已修改',
      'Change fund password': '修改資金密碼',
      'password limit hint': '請輸入6位數字',
      'New money password': '新資金密碼',
      'Confirm money password': '確認資金密碼',
      'moneypwd empty hint': '資金密碼不能為空',
      'moneypwd empty hint2': '確認資金密碼不能為空',
      'Successfully modified': '修改成功',
      'WeChat': '微信',
      'We chat number': '微信號',
      'Weibo': '微博',
      'customer service': '客戶服務',
      'market collaboration': '市場合作',
      'Community hint': '歡迎加入HBit官方社群',
      'Saved album': '已保存至相冊',
      'Save failed': '保存失敗',
      'Save hint': '長按或截圖保存二維碼',
      'ID card': '身份證',
      'passport': '護照',
      'China Mainland': '中國大陸',
      'area': '國家/地區',
      'input name hint2': '請輸入名字',
      'name': '名字',
      'input name hint': '請輸入姓氏',
      'Last name': '姓氏',
      'Authentication type': '認證類型',
      'input ID card': '請輸入證件號',
      'ID number': '證件號碼',
      'ID number hint': '證件號碼15-18位數',
      'ID number hint2': '上傳證件正面',
      'ID number hint3': '上傳證件反面',
      'ID number hint4': '手持身份證及證明',
      'Upload request': '上傳要求',
      'Upload hint': '*請上傳清晰的證件照片，必須能看清證件號和姓名',
      'Upload hint2': '*僅支持PNG、JPG、JPEG格式，每張大小限制在2M 以內',
      'Upload hint3': '*手持證件照需要包含“HBit”和當日日期',
      'Upload hint4': '拍攝提示',
      'standard': '標準',
      'Upload hint5': '邊框缺失',
      'Upload hint6': '照片模糊',
      'Upload hint7': '閃光強烈',
      'Mainland China users': '中國大陸用戶',
      'other area': '其他國家或地區用戶',
      'History login': '歷史登錄',
      'interview time': '訪問時間',
      'equipment': '設備',
      'money password': '資金密碼',
      'Set successfully': '設置成功',
      'Currency rate': '幣幣費率',
      'Contract rate': '合約費率',
      'Withdrawal fee': '提幣手續費',
      'login password': '登錄密碼',
      'modify': '修改',
      'Cell phone': '手機',
      'unbounded': '去綁定',
      'Bound': '已綁定',
      'Go to set': '去設置',
      'To modify': '去修改',
      'invite friends': '邀請好友',
      'invite hint': '邀請妳加入HBit，長按識別二維碼',
      'Save album': '保存相冊',
      'Set code': '設置防釣魚碼',
      'Set code hint': '防釣魚碼可以防範假冒HBit網站和郵件。設置後HBit給您發 送郵件中包含此碼，沒有包含的作為詐騙郵件。',
      'Set code hint2': '請輸入8-32位英文或數字',
      'Anti-phishing code': '防釣魚碼',
      'Google authentication': '谷歌驗證',
      'searche Currency': '請輸入幣種名稱',
      'searche noCurrency': '沒有相關幣種',
      'searche announcement': '公告',
      'searche clearRecord': '清除歷史記錄',
      'searche noRecord': '暫無記錄',
      'searche hot': '熱門搜索',
      'searche Historical': '歷史公告',
      'home Optional': '自選',
      'home contract': '合約',
      'home Coin': '幣幣',
      'home No data': '暫無數據',
      'home customer service': 'HBit在線客服',
      'home Sustainable': '永續',
      'home open': '開盤',
      'home name': '名稱',
      'home Latest price': '最新價',
      'home change': '漲跌幅',
      'home 24volume': '24h成交量',
      'home 24amount': '24H額',
      'splash jump over': '跳過',
      'tradr Success': '成功',
      'tradr Current Order': '當前訂單',
      'tradr Historical Orders': '歷史訂單',
      'tradr All': '全部',
      'tradr Sell': '賣出',
      'tradr Buy': '買入',
      'tradr Cancel Hint': '是否撤單',
      'tradr Cancel Success': '撤單成功',
      'kline depth': '深度',
      'kline VOL': '成交',
      'kline Max': '24H最高',
      'kline Min': '24H最低',
      'kline More': '更多',
      'kline Minute': '分鐘',
      'kline Hour': '小時',
      'kline Day': '天',
      'kline Index': '指標',
      'kline Main': '主圖',
      'kline Hide': '隱藏',
      'kline Side': '副圖',
      'kline hold': '持倉',
      'home quit hint': '妳確定要退出嗎?',
      'home quit': '退出',
      'tradr ListCoin': '幣幣列表',
      'tradr time': '時間',
      'tradr Direction': '方向',
      'tradr Price': '價格',
      'tradr Quantity': '數量',
      'tradr BuyOrder': '買盤',
      'tradr SellOrder': '賣盤',
      'tradr Buy and Sell': '買賣盤',
      'tradr Limit Price': '限價',
      'tradr Market Price': '市價',
      'tradr best': '以當前最優價格交易',
      'tradr Available': '可用',
      'tradr Amount': '交易額',
      'tradr Price Hint': '請輸入價格',
      'tradr Quantity Hint': '請輸入數量',
      'tradr Pending': '掛單成功',
      'tradr No Entrust': '暫無委托',
      'tradr Current Entrust': '當前委托',
      'tradr AllEntrust': '全部委托',
      'tradr Revoke': '撤銷',
      'tradr Actual Transaction': '實際成交',
      'tradr Entrust price': '委托價',
      'tradr Entrust Amounts': '委托量',
      'tradr Total Turnovers': '成交總額',
      'tradr Average price': '成交均價',
      'tradr Volume': '成交量',
      'tradr fee': '手續費',
      'tradr filter': '篩選',
      'tradr Reset': '重置',
      'asset Coin': '幣幣資產',
      'asset Contract': '合約資產',
      'asset Coin record': '幣幣財務記錄',
      'asset Contract record': '合約財務記錄',
      'asset Freeze': '凍結',
      'asset Converted amount': '折合金額',
      'asset Recharge': '充幣',
      'asset Withdrawal': '提幣',
      'asset Transfer': '劃轉',
      'asset To trade': '去交易',
      'asset Withdrawal Hint': '掃描二維碼獲取充幣地址',
      'asset Copy address': '復制地址',
      'asset Tips': '溫馨提示',
      'asset No More': '沒有更多',
      'asset Choose': '請選擇',
      'asset Billing Detail': '賬單明細',
      'asset Address': '地址',
      'asset Chain name': '鏈名稱',
      'asset Transaction ID': '交易ID',
      'asset Transaction hour': '交易時間',
      'asset Trading status': '交易狀態',
      'asset Coin account': '幣幣賬戶',
      'asset Contract account': '合約賬戶',
      'asset TransferQuantity hint': '請輸入劃轉數量',
      'asset No available': '無可用資金',
      'asset Confirm transfer': '確認劃轉',
      'asset QuantityEmpty hint': '劃轉數量不能為空',
      'asset Successful transfer': '劃轉成功',
      'asset Balance': '余額',
      'asset Current currency': '當前幣種',
      'asset safety verification': '安全驗證',
      'asset Successful withdrawal': '申請提現成功',
      'asset Search': '搜索',
      'asset Withdrawal Hint2': '請輸入提幣地址',
      'asset ALL': '全提',
      'asset Arrival quantity': '到賬數量',
      'asset Carry on': '繼續',
      'asset Withdrawal Max hint': '單次最大提幣',
      'asset NoFundpwd': '您還沒有設置資金密碼，為了您的 賬戶安全，請前往設置。',
      'asset Set': '立即設置',
      'asset protection': '賬號保護',
      'asset Withdrawal hint3': '24小時內無法提幣',
      'asset Empty hint1': '提幣地址不能為空',
      'asset Empty hint2': '提幣數量不能為空',
      'asset Valuation coin': '幣幣資產估值',
      'asset Valuation coin contract': '合約資產估值',
      'asset Nonactivated': '未開通',
      'asset Activation': '激活合約交易賬戶',
      'asset Account Equity': '賬戶權益',
      'asset equity': '當前權益',
      'asset hold': '持倉（手）',
      'asset Hide': '隱藏小額幣種',
      'asset 7 Day': '最近7天',
      'asset 7-1 month': '7天至1個月',
      'asset 7-3 month': '7天至3個月',
      'asset Date': '日期',
      'asset Transaction Type': '交易類型',
      'asset Choose type': '選擇類型',
      'asset Currency': '幣種',
      'asset Choose currency': '選擇幣種',
      'asset Transfer1': '由合約賬戶轉入',
      'asset Transfer2': '轉出至合約賬戶',
      'asset completed': '已完成',
      'asset hand': '手',
      'asset Remarks': '備註',
      'asset amount': '金額',
      'contract Transaction detail': '成交明細',
      'contract Close Bull': '平多',
      'contract UserEntrust': '用戶委托',
      'contract Volume_Hand': '成交量(手)',
      'contract EntrustType': '委托類型',
      'contract TransactionTime': '成交時間',
      'contract TransactionPrice': '成交價',
      'contract HistoricalEntrust': '歷史委托',
      'contract CurrentPlan': '當前計劃',
      'contract HistoricalPlan': '歷史計劃',
      'contract OpenLong': '開多',
      'contract OpenShort': '開空',
      'contract CloseLong': '平多',
      'contract CloseShort': '平空',
      'contract Forced1': '強制減多',
      'contract Forced2': '強制減空',
      'contract PlanEntrust': '計劃委托',
      'contract TriggerPrice': '觸發價',
      'contract StrikePrice': '執行價',
      'contract BestPrice': '最優成交價',
      'contract Entrusting': '委托中',
      'contract Revoked': '已撤銷',
      'contract DealDone': '已成交',
      'contract Profit2': '已實現盈虧',
      'contract NoProfit': '未實現盈虧',
      'contract Profit': '盈利',
      'contract Loss': '虧損',
      'contract Failure': '失敗',
      'contract intend': '計劃中',
      'contract ExecutionVolume': '執行量(張)',
      'contract ContractList': '合約列表',
      'contract CurrentPosition': '當前倉位',
      'contract LimitOpening': '限價開倉',
      'contract Strike Price': '執行價格',
      'contract RapidLiquidation': '閃電平倉',
      'contract MarketValue': '市值',
      'contract Margin': '保證金',
      'contract Buy open long': '買入開多',
      'contract Sell more': '賣出平多',
      'contract buy1': '買入平空',
      'contract sell1': '賣出開空',
      'contract buy2': '調整多頭杠桿',
      'contract sell2': '調整空頭杠桿',
      'contract EnterTriggerHint': '請輸入觸發價格',
      'contract EnterExecuteHint': '請輸入執行價格',
      'contract EnterOrderNumberHint': '請輸入下單手數',
      'contract MaxStopLossNumber': '止損數量最大',
      'contract ≤': '必須≤開倉均價',
      'contract ≥': '必須≥開倉均價',
      'contract StopLoss': '止損',
      'contract Close': '關閉',
      'contract CurrentPrice': '當前價格',
      'contract AverageOpenPrice': '開倉均價',
      'contract StopPrice': '止損價格',
      'contract StopNumber': '止損數量',
      'contract SingleLargest': '單筆最大',
      'contract MarketPrice': '當市場價格',
      'contract BestPriceHint': '將以最優成交價平倉,數量',
      'contract ExpectedReturn': '預計收益',
      'contract SelectMultiple': '選擇倍數',
      'contract MaximumMultiple': '最高倍數',
      'contract OpeningPrice': '開倉價格',
      'contract SavePicture': '保存圖片',
      'contract NotOpen': '暫未開放',
      'contract know': '知道了',
      'contract SavedSuccessfully': '保存成功',
      'contract MaximumProfit': '止盈數量最大',
      'contract latestPrice': '最新價格',
      'contract MaximumProfitPrice': '止盈價格',
      'contract MaximumProfitNumber': '止盈數量',
      'contract OpenLongSell': '多頭倉位平倉',
      'contract CloseLongSell': '空頭倉位平倉',
      'contract LimitClose': '限價平倉',
      'contract OptimalTransaction': '最優追價交易',
      'contract  CanSell': '可平',
      'contract Operation': '操作',
      'contract NoOrder': '暫無倉位訂單',
      'contract Bull': '多',
      'contract Bear': '空',
      'contract RateOfReturn': '回報率',
      'contract ForecastStopPrice': '預估強平價',
      'contract NoEntrustOrders': '暫無委托訂單',
      'contract NoOrders': '暫無計劃訂單',
      'contract positions': '倉位',
      'contract CurrentOrder': '當前跟單',
      'contract Entrust': '普通委托',
      'contract Open': '開倉',
      'contract close2': '平倉',
      'contract StoProfit': '止盈',
      'contract Market': '市場',
      'contract prompt': '提示',
      'contract understand more': '了解更多',
      'contract SpeedSell Hint21': '用戶預先設置觸發條件及其執行價格和數量，當市場最新成交價格達到出發條件時，系統將提前設置好執行價格和數量進行下單（即限價單）',
      'contract SpeedSell Hint20': '計劃委托說明',
      'contract SpeedSell Hint19': '若市場波動劇烈，觸發止盈/止損時，實際成交價可能與該時刻的價格存在差異。止盈/止損訂單也存在無法成交或無法完全成交的可能。',
      'contract SpeedSell Hint18': '的形式將您此倉位設置的手數進行委托掛單',
      'contract SpeedSell Hint17': '建議您的執行價格',
      'contract SpeedSell Hint16': '當市場最新成交價格達到您設置的止盈/止損價格時，將會以',
      'contract SpeedSell Hint15': '委托成功，此次委托數量已影響您設置止盈止損委托的數量，請到當前計劃中查看',
      'contract SpeedSell Hint14': '提示：計劃委托不壹定成功執行，可能會因為價格限制、倉位限制、保證金不足、倉位檔次、網絡問題、系統問題等而下單失敗',
      'contract SpeedSell Hint13': '.若超出此範圍，觸發時委托可能執行失敗。',
      'contract SpeedSell Hint12': '，建議您的執行價格',
      'contract SpeedSell Hint11': '您的觸發價格為',
      'contract ConfirmOrder': '確認委托',
      'contract SpeedSell Hint10': '進行掛單，若超出此範圍，觸發時委托可能執行失敗。',
      'contract SpeedSell Hint9': '進行掛單。點擊確認此操作。',
      'contract SpeedSell Hint8': '時，您的委托將以',
      'contract SpeedSell Hint7': '該計劃委托執行後，當市場價格到達',
      'contract SpeedSell Hint6': '，未了確保您的委托成功，請增加倉位保證金。',
      'contract SpeedSell Hint5': '<=倉位的預估強平價',
      'contract SpeedSell Hint4': '您的止損委托價格',
      'contract SpeedSell Hint3': '若價格到達預估強平價時，會終止此次平倉，執行強平策略。',
      'contract SpeedSell Hint2': '系統選擇最容易成交的價格掛單，若該委托沒有成交或沒有完全成交。會以最新的容易成交的價格繼續掛單。',
      'contract SpeedSell Hint1': '閃電平倉說明',
      'contract SpeedSell Hint55': '>=倉位的預估強平價',
      'choose Country': '選擇國家',
      'choose Country Hint': '請輸入國家',
      'Mining': '挖礦',
      'mining Lock': '鎖倉挖礦',
      'mining List': '挖礦列表',
      'mining Available Balance': '可用余額',
      'mining Time': '挖礦時間',
      'mining Amount': '挖礦枚數',
      'mining rate': '收益率',
      'mining Enter hint': '請輸入资金密码',
      'mining Confirm Lock': '確認鎖倉',
      'mining Rule Description': '規則說明',
      'mining Lockup': '鎖倉',
      'mining Released': '已釋放',
      'mining Lockup Time': '鎖倉時間',
      'mining To': '至',
      'mining LockPeriod': '選擇鎖倉周期',
      'mining NotCurrently': '暫不支持該幣種',
      'mining NotAmountHint': '請輸入挖礦枚數',
      'mining MinAmountHint': '不能小於最低枚数',
      'enter name': '請輸入名字',
      'a': '枚',
      'reward': '獎勵',
      'Claim': '持幣要求(最低)',
      'Lockup Day': '鎖倉天數',

      'rules hint': '鎖倉規則',
      'rules hint2': ' 1:鎖倉挖礦為，7天，15天， 30天，60天，90天。',
      'rules hint3': ' 2:鎖倉挖礦有相對應的持幣要求以及相對應的獎勵制度',
      'rules hint4': '3:鎖倉挖礦獎勵計算公式: (鎖倉天數獎勵) * (持幣鎖倉數量)1000*3%=30枚(锁仓币) ',
      'rules hint5': ' 4:為維持锁仓币的稀有性，我們利用鎖倉功能鼓勵長期持有锁仓币的用戶，鎖倉挖礦用戶會比常規持有用戶得到更多的獎勵 ',
      'rules hint6': ' 注意事項: ',
      'rules hint7': ' 1:鎖倉挖礦開始後無法強制結束',
      'rules hint8': ' 2:鎖倉挖礦期間您的锁仓币幣將在倉內，無法在幣幣賬戶餘額中顯示，鎖倉期限結束會跟隨您的獎勵一起返回幣幣賬戶餘額中',
      'rules hint9': ' 3:鎖倉挖礦和其他活動要求鎖倉天數不重複疊加',
      'rules hint10': ' HBit有對本規則的永久修改權，獎勵調整權，以及最終解釋權',
      'main otc': '法幣',
      'c2c Buy': '購買',
      'c2c Sell': '出售',
      'c2c Rate': '成交率',
      'c2c Limit': '限額',
      'c2c Undone': '未完成',
      'c2c Cancelled': '已取消',
      'c2c Price': '單價',
      'c2c TotalAmount': '總金額',
      'c2c Set': '法幣交易設置',
      'c2c Management': '收款方式管理',
      'c2c Name': '姓名',
      'c2c BankCardNumber': '銀行卡號',
      'c2c BankAccount': '開戶銀行',
      'c2c Branch': '開戶支行',
      'c2c EnterNameHint': '請輸入真實姓名',
      'c2c EnterNumberHint': '請輸入銀行卡號',
      'c2c EnterBankAccountHint': '請輸入開戶銀行',
      'c2c BranchHint': '可選填',
      'c2c WeChatNickname': '微信昵稱',
      'c2c WeChatAccount': '微信賬號',
      'c2c CollectionCode': '收款碼',
      'c2c Upload': '上傳收款碼',
      'c2c AlipayAccount': '支付寶賬號',
      'c2c EnterAlipayAccountHint': '請輸入支付寶賬號',
      'c2c EnterWeChatNameHint': '請輸入微信昵稱',
      'c2c EnterWeChatHint': '請輸入微信賬號',
      'c2c Alipay': '支付寶',
      'c2c Bank': '銀行卡',
      'c2c PaymentMethod': '支付方式',
      'c2c CancelOrder': '取消訂單',
      'c2c CancelOrderHint': '3分鐘內可自主',
      'c2c OrderNumber': '訂單編號',
      'c2c RealNameInfo': '實名信息',
      'c2c OrderAmount': '訂單金額',
      'c2c OrderTime': '下單時間',
      'c2c ConfirmSK': '確認收款',
      'c2c CompletedOrder': '已完成訂單',
      'c2c PaymentConfirmed': '已確認付款',
      'c2c ConfirmSKHint': '如確認通過以下方式線下收到對方匯款，方可放幣',
      'c2c CancelOrderHint2': '當天取消多次將凍結法幣交易功能，是否確認取消訂單',
      'c2c CancelOrderHint3': '再想想',
      'c2c CancelSuccess': '取消成功',
      'c2c ConfirmPayment': '確認付款',
      'c2c ConfirmPaymentHint': '如確認通過以下方式線下匯款給對方，方可付款',
      'c2c ConfirmPaymentHint2': '已付款，請放幣',
      'c2c PaymentPaid': '待支付',
      'c2c AlreadyPaid': '已付款',
      'c2c Confirmed': '待確認',
      'c2c PaymentMethod2': '收款方式',
      'c2c PaymentBank': '收款銀行',
      'c2c PaymentUser': '收款人',
      'c2c AffiliatedBranch': '隸屬支行',
      'c2c ReceivingQRCode': '收款二維碼',
      'c2c TradHint': '交易警惕',
      'c2c TradHint2': '非工作時間大於5萬以上的跨行匯款，請分批支付(少於5W匯款可及時到賬)',
      'c2c TradHint3': '請及時到賬的支付方式，銀行卡2小時匯款等支付方式1小時內為到賬，賣家有權退回款項',
      'Order detail': '訂單詳情',
      'c2c BuyQuantity': '可買數量',
      'c2c SellQuantity': '可賣數量',
      'c2c BuySuccessful': '購買成功',
      'c2c SellSuccessful': '出售成功',
      'ContractAgreementTitle': 'HBit永續合約用戶使用協議',
      'ContractAgreementTitle2': '綜述',
      'ContractAgreement1': '1.1永續合約(“本服務”)是“HBit”推出的虛擬資產衍生品。由HBit負責產品的設計管理和交易平臺的運營服務。 為使用HBit永續合約，您應當閱讀並遵守《HBit永續合約用戶使用協議》(“本協議”)。請您務必審慎閱讀、充分理解各條款內容，並選擇接受或不接受本協議。',
      'ContractAgreement2':'1.2 除非您已閱讀並接受本協議所有條款，否則您無權使用HBit永續合約及其相應的服務。您接受本協議的行為，以及您使用本服務的行為即視為您已閱讀並同意受本協議的約束。',
      'ContractAgreement3':'2. 使用本服務的資格',
      'ContractAgreement4':'2.1 您了解並確認：',
      'ContractAgreement5':'您已同意遵守“HBit服務條款”，同時您有資格並且不被禁止使用其中定義的“服務”;',
      'ContractAgreement6':'本協議與您所在國家或地區的法律沒有沖突;',
      'ContractAgreement7':'您是存入本服務的虛擬資產的合法所有者，並保證這些虛擬資產的來源是合法的。',
      'ContractAgreement8':'2.2 您了解使用本服務的風險，包括但不限於：',
      'ContractAgreement9':'虛擬資產及其衍生品的高價格波動可能會在短時間內造成重大或全部損失；',
      'ContractAgreement10':'作為保證金存入的虛擬資產不足可能導致您的倉位立即被強制減倉，您可能會丟失所有存入本服務的虛擬資產；',
      'ContractAgreement11':'可能會發生技術異常，這可能會延遲或阻止您使用本服務；',
      'ContractAgreement12':'可能發生市場異常，這可能導致您的虛擬資產發生損失；',
      'ContractAgreement13':'為了保持市場的整體健康，HBit需要不時添加，刪除或更改政策。此類行為可能有利於或損害像您壹樣的個人客戶。',
      'ContractAgreement14':'3. 使用本服務',
      'ContractAgreement15':'3.1 本服務為您提供實時市場深度以及其他信息。您可以查看或下載信息以供自己分析。',
      'ContractAgreement16':'3.2 您可以通過網頁，客戶端，API 等方式下達交易委托。壹旦所委托的交易成交後，您將無法取消或修改委托。',
      'ContractAgreement17':'3.3 當您下達開倉委托並且成交時，您將會建立相應的合約倉位。當您下達平倉委托並且成交時，將會從您所持有的倉位中扣減相應的持倉數量。本服務將實時為您提供有關您的倉位以及您的虛擬資產及其衍生產品的價值的信息。',
      'ContractAgreement18':'3.4 永續合約將於每新加坡時間07:00、15:00、23:00日3:00 & 15:00 (歐洲中部時間) / 4:00 & 16:00 (歐洲中部夏令時間) 進行資金費用結算，持有多倉和空倉的用戶需要互相支付資金費用 (由本服務定義及計算，詳情可參考“HBit永續合約簡介”)。',
      'ContractAgreement19':'3.5 永續合約對您平倉形成的已實現盈虧采用實時結算方式，結算後的與已實現盈虧相同的數量的虛擬資產將存入至您的賬戶，並可以即時轉出 (受到保證金要求和本服務的其他相關限制)。然後未實現盈虧將根據當前的最新的合理標記價格 (由本服務定義及計算，詳情可參考“HBit永續合約簡介”)與您當前持有的合約數量實時計算（未實現盈虧、已實現盈虧和分攤數量的定義和計算方法詳見“HBit 永續合約簡介”)。',
      'ContractAgreement20':'3.6 您使用本服務應該向HBit支付服務費用，有關服務費用的安排詳見“HBit 永續合約簡介”。',
      'ContractAgreement21':'4. 風控規則',
      'ContractAgreement22':'4.1 HBit永續合約采用多種制度以控制風險，包括並不限於：',
      'ContractAgreement23':'全倉維持保證金率制度',
      'ContractAgreement24':'協議平倉制度',
      'ContractAgreement25':'HBit 會根據市場情況不斷完善風控規則。',
      'ContractAgreement26':'4.2 全倉維持保證金率制度。根據您在本服務中存入的虛擬資產，您可以開的倉位的大小是有限的。此外，為避免強制平倉，您的保證金率（由本服務定義和計算，請參閱“HBit永續合約簡介”）需要高於維持保證金率，即維持您目前的倉位的最低保證金比率。本服務采用全倉維持保證金率制度，倉位越大，維持保證金比率就越高。有關詳細信息，請參閱“HBit永續合約簡介”。',
      'ContractAgreement27':'4.3 協議平倉制度。有關詳細信息，請參閱“HBit永續合約簡介”。',
      'ContractAgreement28':'5. 責任限制',
      'ContractAgreement29':'5.1 您承認您完全理解規則和政策。若您對規則和政策有誤解，HBit對您的損失不承擔任何責任。',
      'ContractAgreement30':'5.2您的交易信息只有在結算後才顯示為準確的信息。結算之間所顯示的信息僅供參考，不能保證為官方結果，如您使用此信息進行操作，有可能會造成損失。 HBit對您的上述損失不承擔任何責任。',
      'ContractAgreement31':'5.3 為了遵守法律或法規的變化，或為了維護市場的整體健康，HBit將自行決定不時更改政策或實施緊急規則。此類更改或實施有可能導致您的帳戶暫時無法訪問本服務、或中斷其他服務等。HBit對您的上述損失不承擔任何責任。',
      'ContractAgreement32':'5.4 系統平臺因下列狀況無法正常運作，使您無法使用各項服務或不能正常委托時，HBit不承擔損害賠償責任，該狀況包括但不限於：',
      'ContractAgreement33':'A．HBit平臺公告之系統停機維護期間；',
      'ContractAgreement34':'B．電信設備出現故障不能進行數據傳輸的；',
      'ContractAgreement35':'C．因臺風、地震、海嘯、洪水、停電、戰爭、恐怖襲擊等不可抗力之因素，造成 HBit平臺系統障礙不能執行業務的；',
      'ContractAgreement36':'D．由於黑客攻擊、計算機病毒侵入或發作、電信部門技術調整或故障、網站升級、銀行方面的問題、因政府管制而造成的暫時性關閉等影響網絡正常經營的原因而造成的服務中斷或者延遲；',
      'ContractAgreement37':'E．因為行業現有技術力量無法預測或無法解決的技術問題而造成的損失；',
      'ContractAgreement38':'F．因第三方的過錯或者延誤而給您或者其他第三方造成的損失。',
      'ContractAgreement39':'5.5 由於系統故障，網絡原因，DDos 等黑客攻擊等不可歸責於 HBit 的意外因素可能導致的異常成交，行情中斷，以及其他可能的異常情況，HBit 有權根據實際情況取消交易或者回滾某壹段時間的成交。HBit 對您的上述損失不承擔任何責任。',
      'ContractAgreement40':'5.6 您了解技術問題可能會意外發生。對於技術問題造成的任何損失，HBit概不負責，包括但不限於：',
      'ContractAgreement41':'與本服務連接的失敗、延遲、中斷或其他故障。',
      'ContractAgreement42':'由於超載導致本服務停止、緩慢、無響應或其他故障。',
      'ContractAgreement43':'由於本服務無法通過互聯網從第三方正確獲取必要數據而導致的故障。',
      'ContractAgreement44':'5.7 HBit 嚴格禁止不公平的交易行為。如果您參與以下行為，HBit保留自行決定對您的帳戶實施高管控制權的權利：',
      'ContractAgreement45':'參與價格操縱或任何其他惡意的市場行為；',
      'ContractAgreement46':'可能通過利用本服務的漏洞或其他不合理的手段損害其他用戶或HBit；',
      'ContractAgreement47':'參與HBit認為對市場有害的任何其他活動。',
      'ContractAgreement48':'為了消除任何對市場整體健康的不利影響，HBit 保留采取以下措施的權利，包括但不限於關閉您的賬戶，限制、暫停和取消交易，回滾成交。',
      'ContractAgreement49':'HBit對因采取上述措施而給您帶來的任何損失不承擔責任。',
      'ContractAgreement50':'6. 賠償責任',
      'ContractAgreement51':'6.1 您應該采取壹切可能的措施保證 HBit 免受任何來自於您使用本服務或者其他與您的 HBit 賬戶相關的行為的損害，否則您應該對HBit承擔賠償責任。',
      'ContractAgreement52':'6.2 您在此確認並同意，對因您違反本協議的行為、您不正當使用HBit的服務的行為、您違反任何法律或侵犯任何第三方權利的行為、經您授權使用您的 HBit 賬戶或者登錄 HBit網站、客戶端、系統（包括用於提供任何 HBit服務的網絡和服務器，且無論該等網站、客戶端和系統是由 HBit運營，或者是為了 HBit而運營，或者為了為向您提供 HBit 服務而運營）的任何第三方的作為或者不作為而引起的任何索賠或者要求（包括合理的法律費用），您應該進行抗辯、賠償，並盡壹切努力使 HBit免受傷害。',
      'ContractAgreement53':'7. 其它',
      'ContractAgreement54':'7.1 本協議內容同時包括 HBit 的各項制度規範、其它本協議附件中的協議或規則、HBit可能不斷發布的關於本服務的其他相關協議、規則等內容。上述內容壹經正式發布，即為本協議不可分割的組成部分，您同樣應當遵守。上述內容與本協議存在沖突的，以本協議為準。',
      'ContractAgreement55':'7.2 如有必要，HBit有權隨時單方變更本協議的內容，且 HBit 無需事前通知您。如果 HBit 單方變更了本協議的內容，變更的內容將立即在 HBit的網站上公布，屆時請及時查看上述網站上的最新信息。在上述變更公布後，如果您繼續使用本服務，則視為您已經同意對本協議的變更。如果您不同意對本協議的變更，您應該停止使用本服務。',
      'ContractAgreement56':'7.3 您應該認真閱讀本協議以及本協議第7.1條和7.2條所提到的任何構成本協議的內容的其他相關協議、規則等內容。如果對於上述內容您有任何疑問，請聯系 HBit，HBit將提供合理和必要的說明。除非 HBit 有其他要求，否則您應該通過電子郵件的方式聯系 HBit，並通過電子郵件的方式和 HBit 之間進行文件的傳輸（“正式溝通”）。您也可以非正式地通過電話聯系 HBit（非正式溝通）。除非雙方有任何其他約定，否則任何正式溝通都應該使用英語進行。如果任何英文版的溝通和非英文版的溝通不壹致，則以英文版的溝通內容為準。如果任何正式溝通或者非正式溝通的內容與本協議的內容不壹致，以本協議的內容為準。',
      'ContractAgreement57':'如果本協議的英文版內容與其他語言的翻譯版本的內容存在沖突，以英文版的本協議內容為準。',
      'ContractAgreement58':'7.4 任何與本協議相關的事項，包括但不限於本協定的成立、生效、履行、變更、解釋及糾紛解決，均適用開曼群島地區法律。',
      'ContractAgreement59':'7.5 若您和 HBit之間發生任何糾紛或爭議，首先應友好協商解決；協商不成功的，雙方均同意將糾紛或爭議提交開曼群島地區有管轄權的法院解決。',
      'ContractAgreement61':'7.6 本協議所有條款的標題僅為閱讀方便，本身並無實際涵義，不能作為本協議含義解釋的依據。',
      'ContractAgreement62':'7.7 對於 HBit永續合約的參加者，本協議供參考，具有約束性。',
      'Upload successfully':'上傳成功',
      'Upload failed':'上傳失敗',
      'Photo album':'相冊',
      'Take pictures':'拍照',
      're-upload':'重新上傳',
      'bindGoogle1':'操作步驟',
      'bindGoogle2':'1.登錄安卓應用商店或利用手機瀏覽器搜索',
      'bindGoogle3':'谷歌驗證器',
      'bindGoogle4':'2.請打開谷歌驗證器軟件，點擊右上角',
      'bindGoogle5':'選擇“手動輸入驗證碼”',
      'bindGoogle6':'3.輸入HBit賬戶或其他自定義名稱，並粘貼上面的密鑰“',
      'bindGoogle7':'”到“Authenticcator”中的密鑰框內。',
      'bindGoogle8':'4.點擊右上角“',
      'bindGoogle9':'“進行保存。',
      'bindGoogle10':'5.將您谷歌驗證器App中生成的6位數驗證碼填到上方的驗證框中，點擊“',
      'c2c ContactTip': '為確保您的資金安全，請添加財務聯系方式',
      'c2c ContactTip2': 'Line',
      'c2c ContactTip3': 'Telogram',
      'c2c ContactTip4': 'whatapp',
      'c2c OrderDetail': '訂單詳情',
      'Invitation code': '我的邀請碼',
      'Invitation code Hint': '請輸入邀請碼',
      'Certification again': '再次認證',
      'IDCard photo': '身份證正面照',
      'IDCard photo2': '身份證反面照',
      'IDCard photoHint2': '手持身份證及聲明',
      'upload passport': '上傳證件內頁照',
      'upload passport2': '上傳手持證件照',
      'upload passport3': '手持證件及證明',
      'upload passport4': '上傳要求',
      'upload passport5': '請上傳清晰的證件照片，必須能看清證件號和姓名',
      'upload passport6': '僅支持PNG、JPG、JPEG格式，每張大小限制在2M 以內',
      'upload passport7': '手持證件照需要包含“HBit”和當日日期',
      'Certificate authentication': '證件認證',

      'bank Card Hint': '沒有綁定該銀行卡',
      'task title': '易米八弋',
      'set title': '设置',
      'theme set': '主题设置',
      'language set': '语言设置'
    },
    'US': {
      'main home': 'Home',
      'main coin': 'Coin',
      'main otc': 'C2c',
      'main contract': 'Contract',
      'main assets': 'Assets',
      'Mobile verification code': 'Mobile code',
      'Welcome login': 'Welcome login',
      'login account hint': 'Enter your phone  or email',
      'login pwd hint': 'Please enter password',
      'login register': 'Register',
      'forget password': 'Forget password',
      'login': 'Login',
      'login successful': 'Login successful',
      'Next step': 'Next',
      'reset Password': 'Reset password',
      'confirm Password': 'Confirm password',
      'Confirm': 'Confirm',
      'Google verification code': 'Google code',
      'enter Google verification code': 'Enter Google verification code',
      'Password cannot be empty': 'Password cannot be empty',
      'confirm password hint': 'confirm password cannot be empty',
      'password hint2': 'Password is different',
      'Phone code hint': 'Phone verification code cannot be empty',
      'Email code hint': 'Email verification code cannot be empty',
      'Google code hint': 'Google verification code cannot be empty',
      'Password reset': 'Password reset',
      'have account': 'Have account',
      'Go to login': 'to Login',
      'Welcome register': 'Welcome  register',
      'phone registration': 'Register phone',
      'email registration': 'Register email',
      'phone input hint': 'Please enter phone number',
      'code input hint': 'please enter verification code',
      'registration confirm password': 'Please confirm the password',
      'invitationCode input hint': 'Please enter the invitation code',
      'terms hint': 'I have read and agree to the HBit terms',
      'email input hint': 'Please input your email',
      'registration success': 'Registration Success',
      'email code input hint': 'Please enter email verification code',
      'phone code input hint': 'Please enter phone verification code',
      'send': 'Send',
      'Reacquire': 'Reacquire',
      'sent': 'Sent',
      'mine': 'Mine',
      'Copy successfully': 'Copy successfully',
      'Security center': 'Security center',
      'Authentication': 'Authentication',
      'My assets': 'My assets',
      'Rate standard': 'Rate standard',
      'Promotion': 'Promotion',
      'Help center': 'Help center',
      'version': 'version',
      'Latest version': 'Latest version',
      'sign out': 'sign out',
      'sign out hint': 'Are you sure to exit？',
      'cancel': 'Cancel',
      'determine': 'Determine',
      'mine hint':
          'Please do not trust any "HBit recharge on behalf of" service or the requirement of recharging digital currency to malicious addresses, and enhance the awareness of asset security. HBit does not recognize any property losses caused by user negligence.',
      'mine hint2':
          'Digital currency is a high-risk investment method. Please judge your investment ability rationally and make investment choices cautiously. The HBit will select high-quality currencies, but will not assume responsibility for guarantees, compensation, etc. for investment activities. ',
      'bind mailbox': 'Bind mailbox',
      'enter email address': 'Enter the email  you want to bind',
      'mailbox': 'E-mail',
      'submit Binding': 'Submit binding',
      'Binding submitte': 'binding',
      'bind Google': 'Bind Google',
      'bind Google Hint':
          'To protect the security of your account, please record the 16-digit key on paper and keep it safe. If your phone is lost, you can use this key to restore your Google verification.',
      'Key': 'Key',
      'copy': 'Copy',
      'bind Phone': 'Bind phone',
      'phone Number': 'Phone number',
      'modify Login Password': 'Modify login password',
      'modify Login Password Hint':
          'For the safety of your funds, withdrawals are not allowed within 24 hours after changing the login password.',
      'original Login Password': 'Original',
      'Login Password hint':
          '6-32 bits, containing more than one letter/number/symbol combination',
      'New login password': 'New',
      'Repeat password': 'Repeat',
      'Confirm new password': 'Confirm',
      'submit': 'Submit',
      'oldpassword empty hint': 'The original password cannot be empty',
      'Password changed': 'Password changed',
      'Change fund password': 'Change money password',
      'password limit hint': 'Please enter 6 digits',
      'New money password': 'New',
      'Confirm money password': 'Confirm',
      'moneypwd empty hint': 'Money password cannot be empty',
      'moneypwd empty hint2': 'Confirm fund password cannot be empty',
      'Successfully modified': 'Successfully modified',
      'Follow': 'Follow us',
      'WeChat': 'WeChat',
      'We chat number': 'We chat number',
      'Weibo': 'Weibo',
      'customer service': 'customer servic',
      'market collaboration': 'market collaboration',
      'Community hint': 'Welcome to the official HBit community',
      'Saved album': 'Saved album',
      'Save failed': 'Save failed',
      'Save hint': 'Long press or screenshot to save the QR code',
      'ID card': 'ID card',
      'passport': 'Passport',
      'China Mainland': 'China Mainland',
      'area': 'Country/region',
      'input name hint2': 'Please enter your name',
      'name': 'Name',
      'input name hint': 'Please enter Last name',
      'Last name': 'Last name',
      'Authentication type': 'Authentication type',
      'input ID card': 'Input ID card',
      'ID number': 'ID number',
      'ID number hint': 'The id number is 15-18 digits',
      'ID number hint2': 'Front of upload document',
      'ID number hint3': 'Reverse side of upload id',
      'ID number hint4': 'Carry your ID card and identification',
      'Upload request': 'Upload required',
      'Upload hint':
          '*Please upload clear id photo. Id number and name must be clear',
      'Upload hint2':
          '*Only PNG, JPG, JPEG formats are supported, each size is limited to 2M',
      'Upload hint3':
          '*The hand id photo needs to contain the "HBit" and the date of the day',
      'Upload hint4': 'Shoot tip',
      'standard': 'standard',
      'Upload hint5': 'Border missing',
      'Upload hint6': 'Image fuzzy',
      'Upload hint7': 'Flash strong',
      'Mainland China users': 'Mainland China users',
      'other area': 'Users from other countries or regions',
      'History login': 'History Login',
      'interview time': 'Access time',
      'equipment': 'Equipment',
      'money password': 'Password',
      'Set successfully': 'Set successfully',
      'Currency rate': 'Currency rate',
      'Contract rate': 'Contract rate',
      'Withdrawal fee': 'Withdrawal fee',
      'login password': 'Login password',
      'modify': 'modify',
      'Cell phone': 'Phone',
      'unbounded': 'unbounded',
      'Bound': 'Bound',
      'Go to set': 'To set',
      'To modify': 'To modify',
      'invite friends': 'Invite friends',
      'invite hint': 'Invite you to join THE HBit, long press',
      'Save album': 'Save album',
      'Set code': 'Set anti-fishing code',
      'Set code hint':
          'Phishing codes protect against fake HBit websites and emails. After setting, the EMAIL sent by HBit to you contains this code, and those not included are regarded as fraudulent emails.',
      'Set code hint2': 'Please enter 8-32 digits in English or digits',
      'Anti-phishing code': 'Anti-phishing code',
      'Google authentication': 'Google',
      'searche Currency': 'Please enter the currency name',
      'searche noCurrency': 'noCurrency',
      'searche announcement': 'Announcement',
      'searche clearRecord': 'clearRecord',
      'searche noRecord': 'noRecord',
      'searche hot': 'Popular',
      'searche Historical': 'historical Announcement',
      'home Optional': 'Optional',
      'home contract': 'Contract',
      'home Coin': 'Coin',
      'home No data': 'No data',
      'home customer service': 'HBit online customer service',
      'home Sustainable': 'Perpetual',
      'home open': 'Open',
      'home name': 'Name',
      'home Latest price': 'Latest price',
      'home change': 'Change',
      'home 24volume': '24hVol',
      'home 24amount': '24Amount',
      'splash jump over': 'jump Over',
      'tradr Success': 'Success',
      'tradr Current Order': 'Current',
      'tradr Historical Orders': 'Historical',
      'tradr All': 'All',
      'tradr Sell': 'Sell',
      'tradr Buy': 'Buy',
      'tradr Cancel Hint': 'Whether cancel order',
      'tradr Cancel Success': 'Successful cancellation',
      'kline depth': 'Depth',
      'kline VOL': 'Deal',
      'kline Max': '24HMax',
      'kline Min': '24HMin',
      'kline More': 'More',
      'kline Minute': 'Minute',
      'kline Hour': 'Hour',
      'kline Day': 'Day',
      'kline Index': 'Index',
      'kline Main': 'Main',
      'kline Hide': 'Hide',
      'kline Side': 'Side',
      'kline hold': 'Hold',
      'home quit hint': 'Are you sure want quit?',
      'home quit': 'Quit',
      'tradr ListCoin': 'Coin list ',
      'tradr time': ' Time',
      'tradr Direction': 'Direction',
      'tradr Price': 'Price',
      'tradr Quantity': ' Quantity',
      'tradr BuyOrder': 'Buy',
      'tradr SellOrder': 'Sell',
      'tradr Buy and Sell': 'BuyAndSell',
      'tradr Limit Price': ' Limit Price',
      'tradr Market Price': 'Market Price',
      'tradr best': 'Current best price',
      'tradr Available': 'Available',
      'tradr Amount': ' Trading volume',
      'tradr Price Hint': 'Price',
      'tradr Quantity Hint': ' Enter Quantity',
      'tradr Pending': ' Order Pending successfully',
      'tradr No Entrust': 'No Entrust',
      'tradr Current Entrust': 'Current Entrust',
      'tradr AllEntrust': 'AllEntrust',
      'tradr Revoke': ' Revoke',
      'tradr Actual Transaction': 'Actual Transaction',
      'tradr Entrust price': 'Entrust price',
      'tradr Entrust Amounts': 'Entrust amount',
      "tradr Total Turnovers": 'Total Turnover',
      'tradr Average price': ' Average price',
      'tradr Volume': ' Trading Volume',
      'tradr fee': 'Entrust fee',
      'tradr filter': 'Filter',
      'tradr Reset': ' Reset',
      'asset Coin': 'Currency',
      'asset Contract': 'Contract',
      'asset Coin record': 'Financial record',
      'asset Contract record': 'Financial record',
      'asset Freeze': 'Freeze',
      'asset Converted amount': 'Converted amount',
      'asset Recharge': 'Recharge',
      'asset Withdrawal': 'Withdrawal',
      'asset Transfer': 'Transfer',
      'asset To trade': 'To trade',
      'asset Withdrawal Hint': 'Scan the QR code to get the deposit address',
      'asset Copy address': 'Copy address',
      'asset Tips': 'Tips',
      'asset No More': 'No More',
      'asset Choose': 'Choose',
      'asset Billing Detail': 'Billing Detail',
      'asset Address': 'Address',
      'asset Chain name': 'Chain name',
      'asset Transaction ID': 'Transaction ID',
      'asset Transaction hour': 'Transaction hour',
      'asset Trading status': 'Trading status',
      'asset Coin account': 'Currency account',
      'asset Contract account': 'Contract account',
      'asset TransferQuantity hint': 'Enter transfer amount',
      'asset No available': 'No funds available',
      'asset Confirm transfer': 'Confirm transfer',
      'asset QuantityEmpty hint': 'Transfer amount cannot empty',
      'asset Successful transfer': 'Successful transfer',
      'asset Balance': 'Balance',
      'asset Current currency': 'Current currency',
      'asset safety verification': 'safety verification',
      'asset Successful withdrawal': 'Successful withdrawal',
      'asset Search': 'Search',
      'asset Withdrawal Hint2': 'Enter withdrawal address',
      'asset ALL': 'All',
      'asset Arrival quantity': 'Arrival quantity',
      'asset Carry on': 'Carry on',
      'asset Withdrawal Max hint': 'Max Withdrawal',
      'asset NoFundpwd':
          'You have not set the fund password. For the security of your account, please go to set。',
      'asset Set': 'Set',
      'asset protection': 'Account protection',
      'asset Withdrawal hint3': 'Cannot withdraw money within 24 hours',
      'asset Empty hint1': 'Withdrawal address cannot empty',
      'asset Empty hint2': 'Withdrawal quantity cannot empty',
      'asset Valuation coin': 'Currency Valuation',
      'asset Valuation coin contract': 'Contract Valuation',
      'asset Nonactivated': 'No open',
      'asset Activation': 'Activate contract trading account',
      'asset Account Equity': 'rights',
      'asset equity': 'Current rights',
      'asset hold': 'hold（hand）',
      'asset Hide': 'Hide',
      'asset 7 Day': 'recent 7 day',
      'asset 7-1 month': '7 days to 1 month',
      'asset 7-3 month': '7 days to 3 month',
      'asset Date': 'Date',
      'asset Transaction Type': 'Transaction Type',
      'asset Choose type': 'Choose type',
      'asset Currency': 'Currency',
      'asset Choose currency': 'Choose currency',
      'asset Transfer1': 'Into',
      'asset Transfer2': 'Out',
      'asset completed': 'Completed',
      'asset hand': '',
      'asset Remarks': 'Remarks',
      'asset amount': 'Amount',
      'contract Transaction detail': 'Transaction detail',
      'contract Close Bull': 'Close Long',
      'contract UserEntrust': 'User Entrust',
      'contract Volume_Hand': 'Volume',
      'contract EntrustType': 'Entrust Type',
      'contract TransactionTime': 'Time',
      'contract TransactionPrice': 'Price',
      'contract HistoricalEntrust': 'Historical',
      'contract CurrentPlan': 'CurrentPlan',
      'contract HistoricalPlan': 'HistoricalPlan',
      'contract OpenLong': 'Open Long',
      'contract OpenShort': 'Open Short',
      'contract CloseLong': 'Close Long',
      'contract CloseShort': 'Close Short',
      'contract Forced1': '強制減多',
      'contract Forced2': '強制減空',
      'contract PlanEntrust': 'Plan Entrust',
      'contract TriggerPrice': 'Trigger Price',
      'contract StrikePrice': 'Strike Price',
      'contract BestPrice': 'Best deal price',
      'contract Entrusting': 'Entrusting',
      'contract Revoked': 'Revoked',
      'contract DealDone': 'DealDone',
      'contract Profit2': 'Profit',
      'contract NoProfit': 'Loss',
      'contract Profit': 'Profit',
      'contract Loss': 'Loss',
      'contract Failure': 'Failure',
      'contract intend': 'Intend',
      'contract ExecutionVolume': 'ExecutionVolume(Piece)',
      'contract ContractList': 'Contract list',
      'contract CurrentPosition': 'Current Position',
      'contract LimitOpening': 'Limit price open',
      'contract RapidLiquidation': 'RapidLiquidation',
      'contract MarketValue': 'Market Value',
      'contract Margin': 'Margin',
      'contract Buy open long': 'Buy open long',
      'contract Sell more': 'Sell close​long',
      'contract buy1': 'Buy close​short',
      'contract sell1': 'Sell open​short',
      'contract buy2': 'Adjust',
      'contract sell2': 'Adjust',
      'contract EnterTriggerHint': 'Please enter trigger price',
      'contract EnterExecuteHint': 'Please enter execution price',
      'contract EnterOrderNumberHint': 'Please enter  order quantity',
      'contract MaxStopLossNumber': 'Max Stop Loss Number',
      'contract ≤': 'Must be ≤ average open price',
      'contract ≥': 'Must be ≥ average open price',
      'contract StopLoss': 'Stop loss',
      'contract Close': 'Close',
      'contract CurrentPrice': 'Current price',
      'contract AverageOpenPrice': 'Average open price',
      'contract StopPrice': 'Stop price',
      'contract StopNumber': 'Number Stop Loss',
      'contract SingleLargest': 'Single largest',
      'contract MarketPrice': 'Market price',
      'contract BestPriceHint': 'The position will be closed at the best transaction price, quantity',
      'contract ExpectedReturn': 'Expected return',
      'contract SelectMultiple': 'Select multiple',
      'contract MaximumMultiple': 'Maximum Multiple',
      'contract OpeningPrice': 'Open Price',
      'contract SavePicture': 'Save Picture',
      'contract NotOpen': 'Not yet open',
      'contract know': 'know',
      'contract SavedSuccessfully': 'Saved successfully',
      'contract MaximumProfit': 'Maximum take profit',
      'contract latestPrice': 'Latest price',
      'contract MaximumProfitPrice': 'Maximum Profit Price',
      'contract MaximumProfitNumber': 'Profit Quantity',
      'contract OpenLongSell': 'Close',
      'contract CloseLongSell': 'Close',
      'contract LimitClose': 'LimitClose',
      'contract OptimalTransaction': 'Best price-trading transaction',
      'contract  CanSell': 'CanSell',
      'contract Operation': 'Operation',
      'contract NoOrder': 'No position order',
      'contract Bull': 'Bull',
      'contract Bear': 'Bear',
      'contract RateOfReturn': 'RateOfReturn',
      'contract ForecastStopPrice': 'Estimated Strong Parity',
      'contract NoEntrustOrders': 'No entrusted order',
      'contract NoOrders': 'No planned orders',
      'contract positions': 'Positions',
      'contract CurrentOrder': 'CurrentOrder',
      'contract Entrust': 'Entrust',
      'contract Open': 'Open',
      'contract close2': 'Liquidation',
      'contract StoProfit': 'Stop',
      'contract Market': 'Market',
      'contract prompt': 'Prompt',
      'contract understand more': 'understand more',
      'contract SpeedSell Hint21': 'The user presets the trigger condition and its execution price and quantity. When the latest transaction price in the market reaches the starting condition, the system will set the execution price and quantity in advance to place an order (ie a limit order)',
      'contract SpeedSell Hint20': 'Plan commission description',
      'contract SpeedSell Hint19': 'If the market fluctuates violently, when the stop profit/stop loss is triggered, the actual transaction price may be different from the price at that moment. Take profit/stop loss orders may not be traded or fully traded。',
      'contract SpeedSell Hint18': 'In the form of placing an order for the lot set by your position',
      'contract SpeedSell Hint17': 'Suggest your execution price',
      'contract SpeedSell Hint16': 'When the latest transaction price in the market reaches the take profit/stop loss price you set, it will be',
      'contract SpeedSell Hint15': 'The order is successful. The number of orders this time has affected the number of orders you set for stop profit and stop loss. Please check the current plan',
      'contract SpeedSell Hint14': 'Reminder: The planned order may not be executed successfully, and the order may fail due to price restrictions, position restrictions, insufficient margin, position levels, network problems, system problems, etc.',
      'contract SpeedSell Hint13': '.If it exceeds this range, the commission may fail to execute when triggered。',
      'contract SpeedSell Hint12': '，Suggest your execution price',
      'contract SpeedSell Hint11': 'Your trigger price is',
      'contract ConfirmOrder': 'Confirm order',
      'contract SpeedSell Hint10': 'Place a pending order, if it exceeds this range, the order may fail to execute when triggered。',
      'contract SpeedSell Hint9': 'Place a pending order. Click to confirm this action。',
      'contract SpeedSell Hint8': ', Your commission will be',
      'contract SpeedSell Hint7': 'After the plan is commissioned, when the market price reaches',
      'contract SpeedSell Hint6': '，Have not ensured that your order is successful, please increase the position margin。',
      'contract SpeedSell Hint5': '<=Estimated strong parity price of the position',
      'contract SpeedSell Hint4': 'Your stop loss order price',
      'contract SpeedSell Hint3': 'If the price reaches the estimated forced flat price, the liquidation will be terminated and the forced flat strategy will be executed。',
      'contract SpeedSell Hint2': 'The system selects the most easily traded price pending order, if the order is not traded or not fully traded. Will continue to place orders at the latest easy-to-find price。',
      'contract SpeedSell Hint1': 'Lightning closing instructions',
      'contract SpeedSell Hint55': '>=Estimated strong parity of position',
      'choose Country Hint': 'Please Choose Country',
      'choose Country': 'Choose Country',
      'Mining': 'Mining',
      'mining Lock': 'Mining lock',
      'mining List': 'Mining List',
      'mining Available Balance': 'Available',
      'mining Time': 'Mining Time',
      'mining Amount': 'Mining Amount',
      'mining rate': 'Rate of return',
      'mining Enter hint': 'Please enter the fund password',
      'mining Confirm Lock': 'Confirm lock',
      'mining Rule Description': 'Rule description',
      'mining Lockup': 'Lockup',
      'mining Released': 'Released',
      'mining Lockup Time': 'Lockup Time',
      'mining To': 'to',
      'mining LockPeriod': 'Select the lock period',
      'mining NotCurrently': 'This currency is not currently supported',
      'mining NotAmountHint': 'Please enter mining amount',
      'mining MinAmountHint': 'Cannot be less than the minimum amount',
      'enter name': 'Please enter the name',
      'a': '',
      'reward': 'Reward',
      'Claim': 'minimum',
      'Lockup Day': 'Lockup Day',

      'rules hint': 'Locking rules',
      'rules hint2': ' 1:Lock-up mining is 7 days, 15 days, 30 days, 60 days, 90 days。',
      'rules hint3': ' 2:Lock-up mining has corresponding currency holding requirements and a corresponding reward system',
      'rules hint4': '3:The calculation formula of the lock-up mining reward: (lock-up days reward) * (number of coins held and locked) 1000*3%=30 (lock-up coins) ',
      'rules hint5': ' 4:In order to maintain the rarity of locked coins, we use the lock function to encourage users who hold locked coins for a long time. Locked mining users will get more rewards than regular holders.',
      'rules hint6': ' Precautions: ',
      'rules hint7': ' 1:Locked-up mining cannot be forced to end after it starts',
      'rules hint8': ' 2:During lock-up mining, your locked-up coins will be in the warehouse and cannot be displayed in the currency account balance. After the lock-up period is over, it will be returned to the currency account balance along with your rewards.',
      'rules hint9': ' 3:Locked-up mining and other activities require that the locked-up days do not overlap repeat',
      'rules hint10': 'HBit has the right to permanently modify the rules, the right to adjust the rewards, and the right to final interpretation',

      'c2c Buy': 'Buy',
      'c2c Sell': 'Sell',
      'c2c Rate': 'Ratio',
      'c2c Limit': 'Limit',
      'c2c Undone': 'Undone',
      'c2c Cancelled': 'Cancelled',
      'c2c Price': 'Price',
      'c2c TotalAmount': 'Total',
      'c2c Set': 'C2c Settings',
      'c2c Management': 'Management',
      'c2c Name': 'Name',
      'c2c BankCardNumber': 'Card number',
      'c2c BankAccount': 'Bank account',
      'c2c Branch': 'Branch',
      'c2c EnterNameHint': 'please enter your real name',
      'c2c EnterNumberHint': 'Please enter the bank card number',
      'c2c EnterBankAccountHint': 'Please enter the account bank',
      'c2c BranchHint': 'Optional',
      'c2c WeChatNickname': 'WeChat nickname',
      'c2c WeChatAccount': 'WeChat account',
      'c2c CollectionCode': 'Collection code',
      'c2c Upload': 'Upload payment code',
      'c2c AlipayAccount': 'Alipay account',
      'c2c EnterAlipayAccountHint': 'Please enter Alipay account',
      'c2c EnterWeChatNameHint': 'Please enter WeChat nickname',
      'c2c EnterWeChatHint': 'Please enter WeChat account',
      'c2c Alipay': 'Alipay',
      'c2c Bank': 'Bank Card',
      'c2c PaymentMethod': 'Payment method',
      'c2c CancelOrder': 'Cancel order',
      'c2c CancelOrderHint': '3 minutes',
      'c2c OrderNumber': 'Order number',
      'c2c RealNameInfo': 'RealName',
      'c2c OrderAmount': 'Order amount',
      'c2c OrderTime': 'Order time',
      'c2c ConfirmSK': 'Confirm',
      'c2c CompletedOrder': 'Completed order',
      'c2c PaymentConfirmed': 'Payment confirmed',
      'c2c ConfirmSKHint': 'The currency can be released only if it is confirmed that the other party remittance is received offline through the following methods',
      'c2c CancelOrderHint2': 'Canceling multiple times on the same day will freeze the legal currency transaction function, are you sure to cancel the order',
      'c2c CancelOrderHint3': 'Think again',
      'c2c CancelSuccess': 'Cancel success',
      'c2c ConfirmPayment': 'confirm payment',
      'c2c ConfirmPaymentHint': 'The payment can only be made if it is confirmed that the offline remittance to the other party through the following methods',
      'c2c ConfirmPaymentHint2': 'AlreadyPaid',
      'c2c PaymentPaid': 'Unpaid',
      'c2c AlreadyPaid': 'AlreadyPaid',
      'c2c Confirmed': 'unConfirmed',
      'c2c PaymentMethod2': 'Payment method',
      'c2c PaymentBank': 'Payment bank',
      'c2c PaymentUser': 'PaymentUser',
      'c2c AffiliatedBranch': 'Branch',
      'c2c ReceivingQRCode': 'ReceivingQRCode',
      'c2c TradHint': 'Trading vigilance',
      'c2c TradHint2': 'For inter-bank remittances with non-working hours greater than 50,000, please pay in batches (remittances less than 5 W can be received in time)',
      'c2c TradHint3': 'Please pay to the account in time.bank card, 2-hour remittance and other payment methods are received within 1 hour, and the seller has the right to refund the payment',
      'c2c OrderDetail': 'Order Detail',
      'c2c BuyQuantity': 'Buy Quantity',
      'c2c SellQuantity': 'Sell Quantity',
      'c2c BuySuccessful': 'Buy Successful',
      'c2c SellSuccessful': 'Sell Successful',
      'ContractAgreementTitle': 'HBit Perpetual Contract User Agreement',
      'ContractAgreementTitle2': 'Summary',
      'ContractAgreement1': '1.1Perpetual contracts ("this service") are virtual asset derivatives launched by "HBit". HBit is responsible for product design management and trading platform operation services. In order to use the HBit Perpetual Contract, you should read and abide by the "HBit Perpetual Contract User Agreement" ("this agreement"). Please read carefully, fully understand the content of each clause, and choose to accept or not accept this agreement。',
      'ContractAgreement2':'1.2 Unless you have read and accepted all the terms of this agreement, you have no right to use the H Bit perpetual contract and its corresponding services. Your acceptance of this agreement and your use of this service are deemed to have been read and agreed to be bound by this agreement。',
      'ContractAgreement3':'2. Eligibility to use this service',
      'ContractAgreement4':'2.1 You understand and confirm：',
      'ContractAgreement5':'You have agreed to abide by the "HBit Terms of Service" and you are eligible and not prohibited from using the "services" defined therein;',
      'ContractAgreement6':'This agreement does not conflict with the laws of your country or region;',
      'ContractAgreement7':'You are the legal owner of the virtual assets deposited in this service, and ensure that the source of these virtual assets is legal。',
      'ContractAgreement8':'2.2 You understand the risks of using this service, including but not limited to：',
      'ContractAgreement9':'High price fluctuations of virtual assets and their derivatives may cause major or total losses in a short period of time；',
      'ContractAgreement10':'Insufficient virtual assets deposited as margin may cause your position to be immediately reduced；',
      'ContractAgreement11':'A technical anomaly may occur, which may delay or prevent you from using the service；',
      'ContractAgreement12':'Market abnormalities may occur, which may result in loss of your virtual assets；',
      'ContractAgreement13':'To maintain the overall health of the market, HBit needs to add, remove, or change policies from time to time. Such behavior may benefit or harm an individual client like you。',
      'ContractAgreement14':'3. Use this service',
      'ContractAgreement15':'3.1 This service provides you with real-time market depth and other information. You can view or download information for your own analysis。',
      'ContractAgreement16':'3.2 You can place transaction orders through web, client, API, etc. Once the commissioned transaction is completed, you will not be able to cancel or modify the commission。',
      'ContractAgreement17':'3.3 When you place an order to open a position and complete the transaction, you will establish a corresponding contract position. When you place an order to close a position and complete the transaction, the corresponding amount of position will be deducted from your position. This service will provide you with information about your position and the value of your virtual assets and their derivatives in real time。',
      'ContractAgreement18':'3.4 The perpetual contract will be settled at 3:00 & 15:00 (Central European Time) / 4:00 & 16:00 (Central European Summer Time) every 07:00, 15:00, 23:00 Singapore time. , Users who hold long positions and short positions need to pay each other funds (defined and calculated by this service, please refer to "HBit Perpetual Contract Introduction" for details)。',
      'ContractAgreement19':'3.5 The perpetual contract uses real-time settlement for the realized profit and loss formed by your liquidation. The virtual assets of the same amount as the realized profit and loss after settlement will be deposited into your account and can be transferred out immediately (subject to margin requirements and this service Other related restrictions). Then the unrealized profit and loss will be calculated based on the current latest reasonable mark price (defined and calculated by this service, for details, please refer to "HBit Perpetual Contract Introduction") and the number of contracts you currently hold (unrealized profit and loss, realized profit and loss and For the definition and calculation method of the allocated amount, please refer to "HBit Perpetual Contract Introduction")。',
      'ContractAgreement20':'3.6 You should pay service fees to HBit for using this service. For the arrangement of service fees, please refer to "HBit Perpetual Contract Introduction"”。',
      'ContractAgreement21':'4. Risk control rules',
      'ContractAgreement22':'4.1 HBit Perpetual contracts use a variety of systems to control risks, including but not limited to：',
      'ContractAgreement23':'Whole position maintenance margin rate system',
      'ContractAgreement24':'Agreement liquidation system',
      'ContractAgreement25':'HBit Will continue to improve risk control rules based on market conditions。',
      'ContractAgreement26':'4.2 Full position maintenance margin rate system. Depending on the virtual assets you store in the service, the size of the positions you can open is limited. In addition, to avoid forced closing, your margin rate (defined and calculated by this service, see "Introduction to HBit Perpetual Contracts") will need to be higher than the maintenance margin rate, which is the minimum margin rate required to maintain your current position. This service adopts the full position maintenance margin system, the larger the position, the higher the maintenance margin ratio. For more information, please refer to the "Introduction to HBit Perpetuity Contracts"。',
      'ContractAgreement27':'4.3 Agreement closing system. For more information, see the introduction to the HBit Perpetual Contract”。',
      'ContractAgreement28':'5. Limitation of liability',
      'ContractAgreement29':'5.1 You acknowledge that you fully understand the rules and policies. HBit shall not be liable for your loss in the event of any misunderstanding of the rules and policies。',
      'ContractAgreement30':'5.2 Your transaction information will only be displayed as accurate information after the settlement. The information displayed between accounts is for reference only and cannot be guaranteed to be official results. If you use this information to conduct operations, it may cause losses. HBit shall not be liable for any of your losses。',
      'ContractAgreement31':'5.3 In order to comply with changes in laws or regulations or to maintain the overall health of the market, HBit will, at its discretion, change policies or implement emergency rules from time to time. Such changes or implementations may cause your account to temporarily lose access to the Service, or interrupt other services, etc. HBit shall not be liable for any of your losses。',
      'ContractAgreement32':'5.4 HBit shall not be liable for damages, including but not limited to, if the system platform is unable to operate normally and you are unable to use the services or entrust the platform normally due to any of the following conditions：',
      'ContractAgreement33':'A．HBit Platform announcement system shutdown maintenance period；',
      'ContractAgreement34':'B．Failure of telecommunications equipment to carry out data transmission；',
      'ContractAgreement35':'C．Failure of HBit platform system to perform business due to force majeure such as typhoon, earthquake, tsunami, flood, power failure, war, terrorist attack, etc；',
      'ContractAgreement36':'D．Service interruption or delay due to hacking, computer virus invasion or outbreak, technical adjustment or failure of telecommunications department, website upgrade, banking problem, temporary shutdown due to government regulation and other reasons that affect the normal operation of the network；',
      'ContractAgreement37':'E．Losses caused by technical problems that cannot be predicted or resolved by the industry existing technical force；',
      'ContractAgreement38':'F．Losses caused to you or other third parties due to the fault or delay of third parties。',
      'ContractAgreement39':'5.5 Due to unexpected factors not attributable to HBit, such as system failure, network reasons, DDos and other hacking attacks, which may lead to abnormal transactions, market interruption and other possible abnormal situations, HBit has the right to cancel the transaction or roll back the transaction within a certain period of time according to the actual situation. HBit shall not be liable for any of your losses。',
      'ContractAgreement40':'5.6 You understand that technical problems can occur by accident. HBit shall not be responsible for any loss caused by technical problems, including but not limited to：',
      'ContractAgreement41':'Failure, delay, interruption, or other failure to connect to the service。',
      'ContractAgreement42':'The service is stopped, slowed, unresponsive, or otherwise malfunctioning due to overload。',
      'ContractAgreement43':'Failure of the Service to properly obtain the necessary data from a third party over the Internet。',
      'ContractAgreement44':'5.7 HBit Unfair trading practices are strictly prohibited. HBit reserves the right to exercise executive control over your account in its sole discretion if you engage in any of the following activities：',
      'ContractAgreement45':'To engage in price manipulation or any other malicious market activity；',
      'ContractAgreement46':'May harm other users or HBITS by exploiting vulnerabilities or other unreasonable means of the Service；',
      'ContractAgreement47':'Participate in any other activities that HBit considers harmful to the market。',
      'ContractAgreement48':'In order to eliminate any adverse effects on the overall health of the market, HBit reserves the right to take the following measures, including but not limited to closing your account, restricting, suspending and canceling transactions, and rolling back transactions。',
      'ContractAgreement49':'HBit You shall not be liable for any loss caused to you as a result of taking the above measures。',
      'ContractAgreement50':'6. The liability for compensation',
      'ContractAgreement52':'6.1 You shall take all possible steps to indemnify HBit against any damages arising from your use of the Services or other actions associated with your HBit account, failing which you shall be liable to HBit。',
      'ContractAgreement53':'6.2 You hereby confirm and agree that, due to your violation of this agreement, you don use it wisely HBit service behavior, your violation of any law or infringe any third party rights behavior, is made by authorization of the you use your HBit account or login HBit website, the client and the system (including used to provide any HBit service network and server, and whether the websites, such as the client and the system is made up of HBit operations, or operations, for HBit You shall defend, indemnify and hold HBit harmless from and against any claim or demand (including reasonable legal costs) arising out of the act or omission of any third party operating in connection with the provision of HBit services to you。',
      'ContractAgreement54':'7. other',
      'ContractAgreement55':'7.1 This Agreement shall also include HBit institutional specifications, other agreements or rules set forth in the annexes to this Agreement, and other relevant agreements and rules regarding the Service that HBit may publish from time to time. The above contents, once officially released, shall form an integral part of this Agreement and you shall also abide by it. In case of any conflict between the above contents and this Agreement, this Agreement shall prevail。',
      'ContractAgreement56':'7.2 HBit reserves the right to unilaterally change the contents of this Agreement at any time if necessary and HBit does not need to notify you in advance. If HBit unilaterally changes the contents of this Agreement, such changes will be published immediately on HBit website and please check the above website for the latest information at that time. If you continue to use the Service after the above changes are published, you shall be deemed to have agreed to the changes to this Agreement. If you do not agree to changes to this Agreement, you should stop using the Service。',
      'ContractAgreement57':'7.3 You shall carefully read this Agreement and any other relevant agreements, rules, etc. referred to in Sections 7.1 and 7.2 that constitute the content of this Agreement. If you have any questions about the above, please contact HBit and HBit will provide reasonable and necessary explanations. Unless HBit requires otherwise, you should contact HBit by email and transfer files between HBit and HBit by email (" formal communication "). You can also informally contact HBit (informal communication) over the phone. Unless otherwise agreed between the parties, any formal communication should be conducted in English. In case of any inconsistency between the English version and the non-English version, the English version shall prevail. If the content of any formal or informal communication is different from that of this Agreement, the content of this Agreement shall prevail。',
      'ContractAgreement58':'In case of any conflict between the English version of this Agreement and the translated version in other languages, the English version of this Agreement shall prevail。',
      'ContractAgreement59':'7.4 Any matters relating to this Agreement, including but not limited to the establishment, entry into force, performance, variation, interpretation and dispute resolution of this Agreement, shall be governed by the laws of the Cayman Islands。',
      'ContractAgreement60':'7.5 Any dispute or dispute between you and HBit shall first be settled through friendly negotiation. If negotiations fail, both parties agree to refer the dispute or dispute to a court of competent jurisdiction in the Cayman Islands region for settlement。',
      'ContractAgreement61':'7.6 The headings in all the terms of this Agreement are for convenience only and have no practical meaning and cannot be used as the basis for interpretation of the meaning of this Agreement。',
      'ContractAgreement62':'7.7 This agreement is for reference and binding for participants in the HBit perpetuity Agreement。',
      'Upload successfully':'Upload successfully',
      'Upload failed':'Upload failed',
      'Photo album':'Photo album',
      'Take pictures':'Pictures',
      're-upload':'Upload again',
      'bindGoogle1':'Steps',
      'bindGoogle2':'1.Log in to the Android App Store or search using your mobile browser',
      'bindGoogle3':'Google Authenticator',
      'bindGoogle4':'2.Please open the Google Authenticator software and click on the upper right corner',
      'bindGoogle5':'Select "Manually enter verification code"',
      'bindGoogle6':'3.Enter the HBit account or other custom name, and paste the key above "',
      'bindGoogle7':'”Go to the key box in "Authenticcator"。',
      'bindGoogle8':'4.Click on the upper right corner“',
      'bindGoogle9':'“Save。',
      'bindGoogle10':'5.Fill in the 6-digit verification code generated in your Google Authenticator App into the verification box above, and click "',
      'c2c ContactTip': 'To ensure the safety of your funds, please add financial contact information',
      'c2c ContactTip2': 'Line',
      'c2c ContactTip3': 'Telogram',
      'c2c ContactTip4': 'whatapp',
      'Invitation code': 'Invitation Code',
      'Invitation code Hint': 'Please enter the invitation code',
      'Certification again': 'Certification again',
      'IDCard photo': 'ReverseSide photo',
      'IDCard photo2': 'Reverse photo',
      'IDCard photoHint2': 'Hold ID card and statement',
      'upload passport': 'Upload photo of the inside page of your ID',
      'upload passport2': 'Upload hand-held ID photo',
      'upload passport3': 'Hold ID and proof',
      'upload passport4': 'Upload reques',
      'upload passport5': 'Please upload a clear ID photo, you must be able to see the ID number and name',
      'upload passport6': 'Only support PNG, JPG, JPEG format, each size is limited to 2M',
      'upload passport7': 'Hand-held ID photo needs to contain "H Bit" and the date of the day',
      'Certificate authentication': 'Certificate authentication',
      'bank Card Hint': 'The bank card is not bound',
      'task title': 'TTTT ',
      'set title': 'Setting',
      'theme set': 'Theme Settings',
      'language set': 'Language Settings'
    },
  };


  get IDCardPhoto {
    return _localizedValues[localProvider.locale.countryCode]
    ['IDCard photo'];
  }
  get IDCardPhoto2 {
    return _localizedValues[localProvider.locale.countryCode]
    ['IDCard photo2'];
  }
  get IDCardPhotoHint2 {
    return _localizedValues[localProvider.locale.countryCode]
    ['IDCard photoHint2'];
  }

  get uploadPassport {
    return _localizedValues[localProvider.locale.countryCode]
    ['upload passport'];
  }

  get CertificateAuthentication {
    return _localizedValues[localProvider.locale.countryCode]
    ['Certificate authentication'];
  }

  get uploadPassport2 {
    return _localizedValues[localProvider.locale.countryCode]
    ['upload passport2'];
  }

  get bankCardHint {
    return _localizedValues[localProvider.locale.countryCode]
    ['bank Card Hint'];
  }


  get uploadPassport3 {
    return _localizedValues[localProvider.locale.countryCode]
    ['upload passport3'];
  }


  get uploadPassport4 {
    return _localizedValues[localProvider.locale.countryCode]
    ['upload passport4'];
  }


  get uploadPassport5 {
    return _localizedValues[localProvider.locale.countryCode]
    ['upload passport5'];
  }


  get uploadPassport6 {
    return _localizedValues[localProvider.locale.countryCode]
    ['upload passport6'];
  }


  get uploadPassport7 {
    return _localizedValues[localProvider.locale.countryCode]
    ['upload passport7'];
  }

  get CertificationAgain {
    return _localizedValues[localProvider.locale.countryCode]
    ['Certification again'];
  }

  get InvitationCodeHint {
    return _localizedValues[localProvider.locale.countryCode]
    ['Invitation code Hint'];
  }

  get InvitationCode {
    return _localizedValues[localProvider.locale.countryCode]
    ['Invitation code'];
  }

  get c2cContactTip {
    return _localizedValues[localProvider.locale.countryCode]
    ['c2c ContactTip'];
  }

  get c2cContactTip2 {
    return _localizedValues[localProvider.locale.countryCode]
    ['c2c ContactTip2'];
  }

  get c2cContactTip3 {
    return _localizedValues[localProvider.locale.countryCode]
    ['c2c ContactTip3'];
  }

  get c2cContactTip4 {
    return _localizedValues[localProvider.locale.countryCode]
    ['c2c ContactTip4'];
  }


  get bindGoogle1 {
    return _localizedValues[localProvider.locale.countryCode]
    ['bindGoogle1'];
  }

  get bindGoogle2 {
    return _localizedValues[localProvider.locale.countryCode]
    ['bindGoogle2'];
  }

  get bindGoogle3 {
    return _localizedValues[localProvider.locale.countryCode]
    ['bindGoogle3'];
  }

  get bindGoogle4 {
    return _localizedValues[localProvider.locale.countryCode]
    ['bindGoogle4'];
  }

  get bindGoogle5 {
    return _localizedValues[localProvider.locale.countryCode]
    ['bindGoogle5'];
  }

  get bindGoogle6 {
    return _localizedValues[localProvider.locale.countryCode]
    ['bindGoogle6'];
  }

  get bindGoogle7 {
    return _localizedValues[localProvider.locale.countryCode]
    ['bindGoogle7'];
  }

  get bindGoogle8 {
    return _localizedValues[localProvider.locale.countryCode]
    ['bindGoogle8'];
  }

  get bindGoogle9 {
    return _localizedValues[localProvider.locale.countryCode]
    ['bindGoogle9'];
  }

  get bindGoogle10 {
    return _localizedValues[localProvider.locale.countryCode]
    ['bindGoogle10'];
  }

  get UploadSuccessfully {
    return _localizedValues[localProvider.locale.countryCode]
    ['Upload successfully'];
  }


  get UploadFailed {
    return _localizedValues[localProvider.locale.countryCode]
    ['Upload failed'];
  }
  get PhotoAlbum {
    return _localizedValues[localProvider.locale.countryCode]
    ['Photo album'];
  }
  get TakePictures {
    return _localizedValues[localProvider.locale.countryCode]
    ['Take pictures'];
  }
  get reUpload {
    return _localizedValues[localProvider.locale.countryCode]
    ['re-upload'];
  }

  get ContractAgreementTitle {
    return _localizedValues[localProvider.locale.countryCode]
    ['ContractAgreementTitle'];
  }

  get ContractAgreementTitle2 {
    return _localizedValues[localProvider.locale.countryCode]
    ['ContractAgreementTitle2'];
  }

  get ContractAgreement1 {
    return _localizedValues[localProvider.locale.countryCode]
    ['ContractAgreement1'];
  }

  get ContractAgreement2 {
    return _localizedValues[localProvider.locale.countryCode]
    ['ContractAgreement2'];
  }

  get ContractAgreement3 {
    return _localizedValues[localProvider.locale.countryCode]
    ['ContractAgreement3'];
  }

  get ContractAgreement4 {
    return _localizedValues[localProvider.locale.countryCode]
    ['ContractAgreement4'];
  }

  get ContractAgreement5 {
    return _localizedValues[localProvider.locale.countryCode]
    ['ContractAgreement5'];
  }

  get ContractAgreement6 {
    return _localizedValues[localProvider.locale.countryCode]
    ['ContractAgreement6'];
  }

  get ContractAgreement7 {
    return _localizedValues[localProvider.locale.countryCode]
    ['ContractAgreement7'];
  }

  get ContractAgreement8 {
    return _localizedValues[localProvider.locale.countryCode]
    ['ContractAgreement8'];
  }

  get ContractAgreement9 {
    return _localizedValues[localProvider.locale.countryCode]
    ['ContractAgreement9'];
  }

  get ContractAgreement10 {
    return _localizedValues[localProvider.locale.countryCode]
    ['ContractAgreement10'];
  }

  get ContractAgreement11 {
    return _localizedValues[localProvider.locale.countryCode]
    ['ContractAgreement11'];
  }

  get ContractAgreement12 {
    return _localizedValues[localProvider.locale.countryCode]
    ['ContractAgreement12'];
  }

  get ContractAgreement13 {
    return _localizedValues[localProvider.locale.countryCode]
    ['ContractAgreement13'];
  }

  get ContractAgreement14 {
    return _localizedValues[localProvider.locale.countryCode]
    ['ContractAgreement14'];
  }

  get ContractAgreement15 {
    return _localizedValues[localProvider.locale.countryCode]
    ['ContractAgreement15'];
  }

  get ContractAgreement16 {
    return _localizedValues[localProvider.locale.countryCode]
    ['ContractAgreement16'];
  }

  get ContractAgreement17 {
    return _localizedValues[localProvider.locale.countryCode]
    ['ContractAgreement17'];
  }

  get ContractAgreement18 {
    return _localizedValues[localProvider.locale.countryCode]
    ['ContractAgreement18'];
  }

  get ContractAgreement19 {
    return _localizedValues[localProvider.locale.countryCode]
    ['ContractAgreement19'];
  }

  get ContractAgreement20 {
    return _localizedValues[localProvider.locale.countryCode]
    ['ContractAgreement20'];
  }

  get ContractAgreement21 {
    return _localizedValues[localProvider.locale.countryCode]
    ['ContractAgreement21'];
  }

  get ContractAgreement22 {
    return _localizedValues[localProvider.locale.countryCode]
    ['ContractAgreement22'];
  }

  get ContractAgreement23 {
    return _localizedValues[localProvider.locale.countryCode]
    ['ContractAgreement23'];
  }

  get ContractAgreement24 {
    return _localizedValues[localProvider.locale.countryCode]
    ['ContractAgreement24'];
  }

  get ContractAgreement25 {
    return _localizedValues[localProvider.locale.countryCode]
    ['ContractAgreement25'];
  }

  get ContractAgreement26 {
    return _localizedValues[localProvider.locale.countryCode]
    ['ContractAgreement26'];
  }

  get ContractAgreement27 {
    return _localizedValues[localProvider.locale.countryCode]
    ['ContractAgreement27'];
  }

  get ContractAgreement28 {
    return _localizedValues[localProvider.locale.countryCode]
    ['ContractAgreement28'];
  }

  get ContractAgreement29 {
    return _localizedValues[localProvider.locale.countryCode]
    ['ContractAgreement29'];
  }

  get ContractAgreement30 {
    return _localizedValues[localProvider.locale.countryCode]
    ['ContractAgreement30'];
  }

  get ContractAgreement31 {
    return _localizedValues[localProvider.locale.countryCode]
    ['ContractAgreement31'];
  }

  get ContractAgreement32 {
    return _localizedValues[localProvider.locale.countryCode]
    ['ContractAgreement32'];
  }

  get ContractAgreement33 {
    return _localizedValues[localProvider.locale.countryCode]
    ['ContractAgreement33'];
  }

  get ContractAgreement34 {
    return _localizedValues[localProvider.locale.countryCode]
    ['ContractAgreement34'];
  }

  get ContractAgreement35 {
    return _localizedValues[localProvider.locale.countryCode]
    ['ContractAgreement35'];
  }

  get ContractAgreement36{
    return _localizedValues[localProvider.locale.countryCode]
    ['ContractAgreement36'];
  }

  get ContractAgreement37 {
    return _localizedValues[localProvider.locale.countryCode]
    ['ContractAgreement37'];
  }

  get ContractAgreement38 {
    return _localizedValues[localProvider.locale.countryCode]
    ['ContractAgreement38'];
  }

  get ContractAgreement39 {
    return _localizedValues[localProvider.locale.countryCode]
    ['ContractAgreement39'];
  }

  get ContractAgreement40 {
    return _localizedValues[localProvider.locale.countryCode]
    ['ContractAgreement40'];
  }

  get ContractAgreement41 {
    return _localizedValues[localProvider.locale.countryCode]
    ['ContractAgreement41'];
  }

  get ContractAgreement42 {
    return _localizedValues[localProvider.locale.countryCode]
    ['ContractAgreement42'];
  }

  get ContractAgreement43 {
    return _localizedValues[localProvider.locale.countryCode]
    ['ContractAgreement43'];
  }

  get ContractAgreement44 {
    return _localizedValues[localProvider.locale.countryCode]
    ['ContractAgreement44'];
  }

  get ContractAgreement45 {
    return _localizedValues[localProvider.locale.countryCode]
    ['ContractAgreement45'];
  }

  get ContractAgreement46{
    return _localizedValues[localProvider.locale.countryCode]
    ['ContractAgreement46'];
  }

  get ContractAgreement47 {
    return _localizedValues[localProvider.locale.countryCode]
    ['ContractAgreement47'];
  }

  get ContractAgreement48 {
    return _localizedValues[localProvider.locale.countryCode]
    ['ContractAgreement48'];
  }

  get ContractAgreement49 {
    return _localizedValues[localProvider.locale.countryCode]
    ['ContractAgreement49'];
  }

  get ContractAgreement50 {
    return _localizedValues[localProvider.locale.countryCode]
    ['ContractAgreement50'];
  }
  get ContractAgreement51 {
    return _localizedValues[localProvider.locale.countryCode]
    ['ContractAgreement51'];
  }

  get ContractAgreement52 {
    return _localizedValues[localProvider.locale.countryCode]
    ['ContractAgreement52'];
  }

  get ContractAgreement53 {
    return _localizedValues[localProvider.locale.countryCode]
    ['ContractAgreement53'];
  }

  get ContractAgreement54 {
    return _localizedValues[localProvider.locale.countryCode]
    ['ContractAgreement54'];
  }

  get ContractAgreement55 {
    return _localizedValues[localProvider.locale.countryCode]
    ['ContractAgreement55'];
  }

  get ContractAgreement56{
    return _localizedValues[localProvider.locale.countryCode]
    ['ContractAgreement56'];
  }

  get ContractAgreement57 {
    return _localizedValues[localProvider.locale.countryCode]
    ['ContractAgreement57'];
  }

  get ContractAgreement58 {
    return _localizedValues[localProvider.locale.countryCode]
    ['ContractAgreement58'];
  }

  get ContractAgreement59 {
    return _localizedValues[localProvider.locale.countryCode]
    ['ContractAgreement59'];
  }

  get ContractAgreement60 {
    return _localizedValues[localProvider.locale.countryCode]
    ['ContractAgreement60'];
  }
  get ContractAgreement61 {
    return _localizedValues[localProvider.locale.countryCode]
    ['ContractAgreement61'];
  }
  get ContractAgreement62 {
    return _localizedValues[localProvider.locale.countryCode]
    ['ContractAgreement62'];
  }
  get c2cBuy {
    return _localizedValues[localProvider.locale.countryCode]
    ['c2c Buy'];
  }

  get c2cBuyQuantity {
    return _localizedValues[localProvider.locale.countryCode]
    ['c2c BuyQuantity'];
  }
  get c2cSellQuantity {
    return _localizedValues[localProvider.locale.countryCode]
    ['c2c SellQuantity'];
  }
  get c2cBuySuccessful {
    return _localizedValues[localProvider.locale.countryCode]
    ['c2c BuySuccessful'];
  }

  get c2cSellSuccessful {
    return _localizedValues[localProvider.locale.countryCode]
    ['c2c SellSuccessful'];
  }

  get c2cOrderDetail {
    return _localizedValues[localProvider.locale.countryCode]
    ['c2c OrderDetail'];
  }


  get c2cCancelOrder {
    return _localizedValues[localProvider.locale.countryCode]
    ['c2c CancelOrder'];
  }

    get c2cCancelOrderHint {
    return _localizedValues[localProvider.locale.countryCode]
    ['c2c CancelOrderHint'];
  }
      get c2cOrderNumber {
    return _localizedValues[localProvider.locale.countryCode]
    ['c2c OrderNumber'];
  }

      get c2cRealNameInfo {
    return _localizedValues[localProvider.locale.countryCode]
    ['c2c RealNameInfo'];
  }
        get c2cOrderAmount {
    return _localizedValues[localProvider.locale.countryCode]
    ['c2c OrderAmount'];
  }

  get c2cOrderTime {
    return _localizedValues[localProvider.locale.countryCode]
    ['c2c OrderTime'];
  }
    get c2cConfirmSK {
    return _localizedValues[localProvider.locale.countryCode]
    ['c2c ConfirmSK'];
  }

      get c2cCompletedOrder {
    return _localizedValues[localProvider.locale.countryCode]
    ['c2c CompletedOrder'];
  }
      get c2cPaymentConfirmed {
    return _localizedValues[localProvider.locale.countryCode]
    ['c2c PaymentConfirmed'];
  }

  get c2cCancelOrderHint2 {
    return _localizedValues[localProvider.locale.countryCode]
    ['c2c CancelOrderHint2'];
  }

  get c2cCancelOrderHint3 {
    return _localizedValues[localProvider.locale.countryCode]
    ['c2c CancelOrderHint3'];
  }

  get c2cCancelSuccess {
    return _localizedValues[localProvider.locale.countryCode]
    ['c2c CancelSuccess'];
  }

  get c2cConfirmPayment {
    return _localizedValues[localProvider.locale.countryCode]
    ['c2c ConfirmPayment'];
  }
    get c2cConfirmPaymentHint {
    return _localizedValues[localProvider.locale.countryCode]
    ['c2c ConfirmPaymentHint'];
  }


   get c2cConfirmPaymentHint2 {
    return _localizedValues[localProvider.locale.countryCode]
    ['c2c ConfirmPaymentHint2'];
  }

   get c2cPaymentPaid {
    return _localizedValues[localProvider.locale.countryCode]
    ['c2c PaymentPaid'];
  }

   get c2cAlreadyPaid {
    return _localizedValues[localProvider.locale.countryCode]
    ['c2c AlreadyPaid'];
  }

  get c2cPaymentUser {
    return _localizedValues[localProvider.locale.countryCode]
    ['c2c PaymentUser'];
  }

  get c2cTradHint2 {
    return _localizedValues[localProvider.locale.countryCode]
    ['c2c TradHint2'];
  }
  get c2cTradHint3 {
    return _localizedValues[localProvider.locale.countryCode]
    ['c2c TradHint3'];
  }

  get c2cTradHint {
    return _localizedValues[localProvider.locale.countryCode]
    ['c2c TradHint'];
  }

  get c2cReceivingQRCode {
    return _localizedValues[localProvider.locale.countryCode]
    ['c2c ReceivingQRCode'];
  }

  get c2cAffiliatedBranch {
    return _localizedValues[localProvider.locale.countryCode]
    ['c2c AffiliatedBranch'];
  }

   get c2cPaymentBank {
    return _localizedValues[localProvider.locale.countryCode]
    ['c2c PaymentBank'];
  }

   get c2cPaymentMethod2 {
    return _localizedValues[localProvider.locale.countryCode]
    ['c2c PaymentMethod2'];
  }

   get c2cConfirmed {
    return _localizedValues[localProvider.locale.countryCode]
    ['c2c Confirmed'];
  }

  get c2cConfirmSKHint {
    return _localizedValues[localProvider.locale.countryCode]
    ['c2c ConfirmSKHint'];
  }


  get c2cPaymentMethod {
    return _localizedValues[localProvider.locale.countryCode]
    ['c2c PaymentMethod'];
  }

  get c2cSet {
    return _localizedValues[localProvider.locale.countryCode]
    ['c2c Set'];
  }

  get c2cName {
    return _localizedValues[localProvider.locale.countryCode]
    ['c2c Name'];
  }

  get c2cManagement {
    return _localizedValues[localProvider.locale.countryCode]
    ['c2c Management'];
  }
  get c2cBankCardNumber {
    return _localizedValues[localProvider.locale.countryCode]
    ['c2c BankCardNumber'];
  }
  get c2cBankAccount {
    return _localizedValues[localProvider.locale.countryCode]
    ['c2c BankAccount'];
  }
  get c2cBranch {
    return _localizedValues[localProvider.locale.countryCode]
    ['c2c Branch'];
  }
  get c2cEnterNameHint {
    return _localizedValues[localProvider.locale.countryCode]
    ['c2c EnterNameHint'];
  }
  get c2cEnterNumberHint {
    return _localizedValues[localProvider.locale.countryCode]
    ['c2c EnterNumberHint'];
  }

    get c2cEnterBankAccountHint {
    return _localizedValues[localProvider.locale.countryCode]
    ['c2c EnterBankAccountHint'];
  }

    get c2cBranchHint {
    return _localizedValues[localProvider.locale.countryCode]
    ['c2c BranchHint'];
  }

  get c2cWeChatNickname {
    return _localizedValues[localProvider.locale.countryCode]
    ['c2c WeChatNickname'];
  }


  get c2cWeChatAccount {
    return _localizedValues[localProvider.locale.countryCode]
    ['c2c WeChatAccount'];
  }

  get c2cCollectionCode {
    return _localizedValues[localProvider.locale.countryCode]
    ['c2c CollectionCode'];
  }


  get c2cUpload {
    return _localizedValues[localProvider.locale.countryCode]
    ['c2c Upload'];
  }
  get c2cAlipayAccount {
    return _localizedValues[localProvider.locale.countryCode]
    ['c2c AlipayAccount'];
  }
  get c2cEnterAlipayAccountHint {
    return _localizedValues[localProvider.locale.countryCode]
    ['c2c EnterAlipayAccountHint'];
  }
  get c2cEnterWeChatNameHint {
    return _localizedValues[localProvider.locale.countryCode]
    ['c2c EnterWeChatNameHint'];
  }
  get c2cEnterWeChatHint {
    return _localizedValues[localProvider.locale.countryCode]
    ['c2c EnterWeChatHint'];
  }

  get c2cAlipay {
    return _localizedValues[localProvider.locale.countryCode]
    ['c2c Alipay'];
  }
  get c2cBank {
    return _localizedValues[localProvider.locale.countryCode]
    ['c2c Bank'];
  }



  get c2cSell {
    return _localizedValues[localProvider.locale.countryCode]
    ['c2c Sell'];
  }

  get c2cRate {
    return _localizedValues[localProvider.locale.countryCode]
    ['c2c Rate'];
  }

  get c2cLimit {
    return _localizedValues[localProvider.locale.countryCode]
    ['c2c Limit'];
  }

  get c2cUndone {
    return _localizedValues[localProvider.locale.countryCode]
    ['c2c Undone'];
  }

  get c2cCancelled {
    return _localizedValues[localProvider.locale.countryCode]
    ['c2c Cancelled'];
  }

  get c2cPrice {
    return _localizedValues[localProvider.locale.countryCode]
    ['c2c Price'];
  }

  get c2cTotalAmount {
    return _localizedValues[localProvider.locale.countryCode]
    ['c2c TotalAmount'];
  }

  get a {
    return _localizedValues[localProvider.locale.countryCode]
    ['a'];
  }

  get Claim {
    return _localizedValues[localProvider.locale.countryCode]
    ['Claim'];
  }

  get reward {
    return _localizedValues[localProvider.locale.countryCode]
    ['reward'];
  }

  get LockupDay {
    return _localizedValues[localProvider.locale.countryCode]
    ['Lockup Day'];
  }
    get rulesHint {
    return _localizedValues[localProvider.locale.countryCode]
    ['rules hint'];
  }
 get rulesHint2 {
    return _localizedValues[localProvider.locale.countryCode]
    ['rules hint2'];
  }

  get rulesHint3 {
    return _localizedValues[localProvider.locale.countryCode]
    ['rules hint3'];
  }

  get rulesHint4 {
    return _localizedValues[localProvider.locale.countryCode]
    ['rules hint4'];
  }

  get rulesHint5 {
    return _localizedValues[localProvider.locale.countryCode]
    ['rules hint5'];
  }

  get rulesHint6 {
    return _localizedValues[localProvider.locale.countryCode]
    ['rules hint6'];
  }

  get rulesHint7 {
    return _localizedValues[localProvider.locale.countryCode]
    ['rules hint7'];
  }

  get rulesHint8 {
    return _localizedValues[localProvider.locale.countryCode]
    ['rules hint8'];
  }

  get rulesHint9 {
    return _localizedValues[localProvider.locale.countryCode]
    ['rules hint9'];
  }

  get rulesHint10 {
    return _localizedValues[localProvider.locale.countryCode]
    ['rules hint10'];
  }

  get miningLock {
    return _localizedValues[localProvider.locale.countryCode]
    ['mining Lock'];
  }
  get miningMinAmountHint {
    return _localizedValues[localProvider.locale.countryCode]
    ['mining MinAmountHint'];
  }

  get miningLockPeriod {
    return _localizedValues[localProvider.locale.countryCode]
    ['mining LockPeriod'];
  }

  get miningNotAmountHint {
    return _localizedValues[localProvider.locale.countryCode]
    ['mining NotAmountHint'];
  }

  get miningNotCurrently {
    return _localizedValues[localProvider.locale.countryCode]
    ['mining NotCurrently'];
  }

  get miningLockup {
    return _localizedValues[localProvider.locale.countryCode]
    ['mining Lockup'];
  }
  get miningReleased {
    return _localizedValues[localProvider.locale.countryCode]
    ['mining Released'];
  }
  get miningLockupTime {
    return _localizedValues[localProvider.locale.countryCode]
    ['mining Lockup Time'];
  }

  get miningTo {
    return _localizedValues[localProvider.locale.countryCode]
    ['mining To'];
  }


  get miningList {
    return _localizedValues[localProvider.locale.countryCode]
    ['mining List'];
  }
  get miningAvailableBalance{
    return _localizedValues[localProvider.locale.countryCode]
    ['mining Available Balance'];
  }
  get miningTime{
    return _localizedValues[localProvider.locale.countryCode]
    ['mining Time'];
  }
  get miningAmount{
    return _localizedValues[localProvider.locale.countryCode]
    ['mining Amount'];
  }

    get miningRate{
    return _localizedValues[localProvider.locale.countryCode]
    ['mining rate'];
  }

    get miningEnterHint{
    return _localizedValues[localProvider.locale.countryCode]
    ['mining Enter hint'];
  }
    get miningConfirmLock{
    return _localizedValues[localProvider.locale.countryCode]
    ['mining Confirm Lock'];
  }
    get miningRuleDescription{
    return _localizedValues[localProvider.locale.countryCode]
    ['mining Rule Description'];
  }


  get Mining {
    return _localizedValues[localProvider.locale.countryCode]
    ['Mining'];
  }
  ///** 合约 **//
  ///
  get contractTransactionDetail {
    return _localizedValues[localProvider.locale.countryCode]
    ['contract Transaction detail'];
  }

  get contractSpeedSellHint55 {
    return _localizedValues[localProvider.locale.countryCode]
    ['contract SpeedSell Hint55'];
  }
  get chooseCountryHint {
    return _localizedValues[localProvider.locale.countryCode]
    ['choose Country Hint'];
  }

  get contractConfirmOrder {
    return _localizedValues[localProvider.locale.countryCode]
    ['contract ConfirmOrder'];
  }

    get contractUnderstandMore {
    return _localizedValues[localProvider.locale.countryCode]
    ['contract understand more'];
  }

  get contractPrompt {
    return _localizedValues[localProvider.locale.countryCode]
    ['contract prompt'];
  }

  get contractSpeedSellHint1 {
    return _localizedValues[localProvider.locale.countryCode]
    ['contract SpeedSell Hint1'];
  }
    get contractSpeedSellHint2 {
    return _localizedValues[localProvider.locale.countryCode]
    ['contract SpeedSell Hint2'];
  }
      get contractSpeedSellHint3 {
    return _localizedValues[localProvider.locale.countryCode]
    ['contract SpeedSell Hint3'];
  }
        get contractSpeedSellHint4 {
    return _localizedValues[localProvider.locale.countryCode]
    ['contract SpeedSell Hint4'];
  }
    get contractSpeedSellHint5 {
    return _localizedValues[localProvider.locale.countryCode]
    ['contract SpeedSell Hint5'];
  }

    get contractSpeedSellHint6 {
    return _localizedValues[localProvider.locale.countryCode]
    ['contract SpeedSell Hint6'];
  }

    get contractSpeedSellHint7 {
    return _localizedValues[localProvider.locale.countryCode]
    ['contract SpeedSell Hint7'];
  }


    get contractSpeedSellHint8 {
    return _localizedValues[localProvider.locale.countryCode]
    ['contract SpeedSell Hint8'];
  }


    get contractSpeedSellHint9 {
    return _localizedValues[localProvider.locale.countryCode]
    ['contract SpeedSell Hint9'];
  }


    get contractSpeedSellHint10 {
    return _localizedValues[localProvider.locale.countryCode]
    ['contract SpeedSell Hint10'];
  }

    get contractSpeedSellHint11 {
    return _localizedValues[localProvider.locale.countryCode]
    ['contract SpeedSell Hint11'];
  }

      get contractSpeedSellHint12 {
    return _localizedValues[localProvider.locale.countryCode]
    ['contract SpeedSell Hint12'];
  }

      get contractSpeedSellHint13 {
    return _localizedValues[localProvider.locale.countryCode]
    ['contract SpeedSell Hint13'];
  }

      get contractSpeedSellHint14 {
    return _localizedValues[localProvider.locale.countryCode]
    ['contract SpeedSell Hint14'];
  }


      get contractSpeedSellHint15 {
    return _localizedValues[localProvider.locale.countryCode]
    ['contract SpeedSell Hint15'];
  }

      get contractSpeedSellHint16 {
    return _localizedValues[localProvider.locale.countryCode]
    ['contract SpeedSell Hint16'];
  }


      get contractSpeedSellHint17 {
    return _localizedValues[localProvider.locale.countryCode]
    ['contract SpeedSell Hint17'];
  }


      get contractSpeedSellHint18 {
    return _localizedValues[localProvider.locale.countryCode]
    ['contract SpeedSell Hint18'];
  }

      get contractSpeedSellHint19 {
    return _localizedValues[localProvider.locale.countryCode]
    ['contract SpeedSell Hint19'];
  }

      get contractSpeedSellHint20 {
    return _localizedValues[localProvider.locale.countryCode]
    ['contract SpeedSell Hint20'];
  }

      get contractSpeedSellHint21 {
    return _localizedValues[localProvider.locale.countryCode]
    ['contract SpeedSell Hint21'];
  }



  get contractStoProfit {
    return _localizedValues[localProvider.locale.countryCode]
    ['contract StoProfit'];
  }

  get contractMarket {
    return _localizedValues[localProvider.locale.countryCode]
    ['contract Market'];
  }
  get contractOpen {
    return _localizedValues[localProvider.locale.countryCode]
    ['contract Open'];
  }

  get contractClose2 {
    return _localizedValues[localProvider.locale.countryCode]
    ['contract close2'];
  }
  get contractCloseBull {
    return _localizedValues[localProvider.locale.countryCode]
    ['contract Close Bull'];
  }

  get contractUserEntrust {
    return _localizedValues[localProvider.locale.countryCode]
    ['contract UserEntrust'];
  }

  get contractVolumeHand {
    return _localizedValues[localProvider.locale.countryCode]
    ['contract Volume_Hand'];
  }

  get contractEntrustType {
    return _localizedValues[localProvider.locale.countryCode]
    ['contract EntrustType'];
  }
  get contractTransactionTime {
    return _localizedValues[localProvider.locale.countryCode]
    ['contract TransactionTime'];
  }
  get contractTransactionPrice {
    return _localizedValues[localProvider.locale.countryCode]
    ['contract TransactionPrice'];
  }
  get contractHistoricalEntrust {
    return _localizedValues[localProvider.locale.countryCode]
    ['contract HistoricalEntrust'];
  }

  get contractCurrentPlan {
    return _localizedValues[localProvider.locale.countryCode]
    ['contract CurrentPlan'];
  }

  get contractHistoricalPlan {
    return _localizedValues[localProvider.locale.countryCode]
    ['contract HistoricalPlan'];
  }
  get contractOpenLong {
    return _localizedValues[localProvider.locale.countryCode]
    ['contract OpenLong'];
  }
  get contractOpenShort {
    return _localizedValues[localProvider.locale.countryCode]
    ['contract OpenShort'];
  }
  get contractCloseLong {
    return _localizedValues[localProvider.locale.countryCode]
    ['contract CloseLong'];
  }
  get contractCloseShort {
    return _localizedValues[localProvider.locale.countryCode]
    ['contract CloseShort'];
  }
  get contractForced1 {
    return _localizedValues[localProvider.locale.countryCode]
    ['contract Forced1'];
  }
  get contractForced2 {
    return _localizedValues[localProvider.locale.countryCode]
    ['contract Forced2'];
  }
  get contractPlanEntrust {
    return _localizedValues[localProvider.locale.countryCode]
    ['contract PlanEntrust'];
  }
  get contractTriggerPrice {
    return _localizedValues[localProvider.locale.countryCode]
    ['contract TriggerPrice'];
  }
  get contractStrikePrice {
    return _localizedValues[localProvider.locale.countryCode]
    ['contract StrikePrice'];
  }

  get contractBestPrice {
    return _localizedValues[localProvider.locale.countryCode]
    ['contract BestPrice'];
  }
  get contractEntrusting {
    return _localizedValues[localProvider.locale.countryCode]
    ['contract Entrusting'];
  }

  get contractRevoked {
    return _localizedValues[localProvider.locale.countryCode]
    ['contract Revoked'];
  }
  get contractDealDone {
    return _localizedValues[localProvider.locale.countryCode]
    ['contract DealDone'];
  }
  get contractProfit2 {
    return _localizedValues[localProvider.locale.countryCode]
    ['contract Profit2'];
  }

  get contractNoProfit {
    return _localizedValues[localProvider.locale.countryCode]
    ['contract NoProfit'];
  }

  get contractProfit {
    return _localizedValues[localProvider.locale.countryCode]
    ['contract Profit'];
  }
  get contractLoss {
    return _localizedValues[localProvider.locale.countryCode]
    ['contract Loss'];
  }

  get contractFailure {
    return _localizedValues[localProvider.locale.countryCode]
    ['contract Failure'];
  }

  get contractIntend {
    return _localizedValues[localProvider.locale.countryCode]
    ['contract intend'];
  }

  get contractExecutionVolume {
    return _localizedValues[localProvider.locale.countryCode]
    ['contract ExecutionVolume'];
  }

  get contractContractList {
    return _localizedValues[localProvider.locale.countryCode]
    ['contract ContractList'];
  }

  get contractCurrentPosition {
    return _localizedValues[localProvider.locale.countryCode]
    ['contract CurrentPosition'];
  }
  get contractLimitOpening {
    return _localizedValues[localProvider.locale.countryCode]
    ['contract LimitOpening'];
  }
  get contractRapidLiquidation {
    return _localizedValues[localProvider.locale.countryCode]
    ['contract RapidLiquidation'];
  }

  get contractMarketValue {
    return _localizedValues[localProvider.locale.countryCode]
    ['contract MarketValue'];
  }

  get contractMargin {
    return _localizedValues[localProvider.locale.countryCode]
    ['contract Margin'];
  }
  get contractBuyOpenLong {
    return _localizedValues[localProvider.locale.countryCode]
    ['contract Buy open long'];
  }
  get contractSellMore {
    return _localizedValues[localProvider.locale.countryCode]
    ['contract Sell more'];
  }

  get contractBuy1 {
    return _localizedValues[localProvider.locale.countryCode]
    ['contract buy1'];
  }

  get contractSell1 {
    return _localizedValues[localProvider.locale.countryCode]
    ['contract sell1'];
  }

  get contractBuy2 {
    return _localizedValues[localProvider.locale.countryCode]
    ['contract buy2'];
  }

  get contractSell2 {
    return _localizedValues[localProvider.locale.countryCode]
    ['contract sell2'];
  }

  get contractEnterTriggerHint {
    return _localizedValues[localProvider.locale.countryCode]
    ['contract EnterTriggerHint'];
  }

  get contractEnterExecuteHint {
    return _localizedValues[localProvider.locale.countryCode]
    ['contract EnterExecuteHint'];
  }

  get contractEnterOrderNumberHint {
    return _localizedValues[localProvider.locale.countryCode]
    ['contract EnterOrderNumberHint'];
  }


  get contractMaxStopLossNumber {
    return _localizedValues[localProvider.locale.countryCode]
    ['contract MaxStopLossNumber'];
  }

  get contractXY {
    return _localizedValues[localProvider.locale.countryCode]
    ['contract ≤'];
  }
  get contractYX {
    return _localizedValues[localProvider.locale.countryCode]
    ['contract ≥'];
  }
  get contractStopLoss {
    return _localizedValues[localProvider.locale.countryCode]
    ['contract StopLoss'];
  }
  get contractClose {
    return _localizedValues[localProvider.locale.countryCode]
    ['contract Close'];
  }
  get contractCurrentPrice {
    return _localizedValues[localProvider.locale.countryCode]
    ['contract CurrentPrice'];
  }
  get contractAverageOpenPrice {
    return _localizedValues[localProvider.locale.countryCode]
    ['contract AverageOpenPrice'];
  }
  get contractStopPrice {
    return _localizedValues[localProvider.locale.countryCode]
    ['contract StopPrice'];
  }
  get contractStopNumber {
    return _localizedValues[localProvider.locale.countryCode]
    ['contract StopNumber'];
  }
  get contractSingleLargest {
    return _localizedValues[localProvider.locale.countryCode]
    ['contract SingleLargest'];
  }
  get contractMarketPrice {
    return _localizedValues[localProvider.locale.countryCode]
    ['contract MarketPrice'];
  }
  get contractBestPriceHint {
    return _localizedValues[localProvider.locale.countryCode]
    ['contract BestPriceHint'];
  }
  get contractExpectedReturn {
    return _localizedValues[localProvider.locale.countryCode]
    ['contract ExpectedReturn'];
  }

  get contractSelectMultiple {
    return _localizedValues[localProvider.locale.countryCode]
    ['contract SelectMultiple'];
  }
  get contractMaximumMultiple {
    return _localizedValues[localProvider.locale.countryCode]
    ['contract MaximumMultiple'];
  }
  get contractOpeningPrice {
    return _localizedValues[localProvider.locale.countryCode]
    ['contract OpeningPrice'];
  }
  get contractSavePicture {
    return _localizedValues[localProvider.locale.countryCode]
    ['contract SavePicture'];
  }
  get contractNotOpen {
    return _localizedValues[localProvider.locale.countryCode]
    ['contract NotOpen'];
  }

  get contractknow {
    return _localizedValues[localProvider.locale.countryCode]
    ['contract know'];
  }
  get contractSavedSuccessfully {
    return _localizedValues[localProvider.locale.countryCode]
    ['contract SavedSuccessfully'];
  }
  get contractMaximumProfit {
    return _localizedValues[localProvider.locale.countryCode]
    ['contract MaximumProfit'];
  }

  get contractlatestPrice {
    return _localizedValues[localProvider.locale.countryCode]
    ['contract latestPrice'];
  }

  get contractMaximumProfitPrice {
    return _localizedValues[localProvider.locale.countryCode]
    ['contract MaximumProfitPrice'];
  }
  get contractMaximumProfitNumber {
    return _localizedValues[localProvider.locale.countryCode]
    ['contract MaximumProfitNumber'];
  }

  get contractOpenLongSell {
    return _localizedValues[localProvider.locale.countryCode]
    ['contract OpenLongSell'];
  }

  get contractCloseLongSell {
    return _localizedValues[localProvider.locale.countryCode]
    ['contract CloseLongSell'];
  }
  get contractLimitClose {
    return _localizedValues[localProvider.locale.countryCode]
    ['contract LimitClose'];
  }
  get contractOptimalTransaction {
    return _localizedValues[localProvider.locale.countryCode]
    ['contract OptimalTransaction'];
  }

  get contractCanSell {
    return _localizedValues[localProvider.locale.countryCode]
    ['contract  CanSell'];
  }

  get contractOperation {
    return _localizedValues[localProvider.locale.countryCode]
    ['contract Operation'];
  }


  get contractNoOrder {
    return _localizedValues[localProvider.locale.countryCode]
    ['contract NoOrder'];
  }

  get contractBull {
    return _localizedValues[localProvider.locale.countryCode]
    ['contract Bull'];
  }
  get contractBear {
    return _localizedValues[localProvider.locale.countryCode]
    ['contract Bear'];
  }

  get contractRateOfReturn {
    return _localizedValues[localProvider.locale.countryCode]
    ['contract RateOfReturn'];
  }
 get ContractRate {
    return _localizedValues[localProvider.locale.countryCode]
    ['Contract rate'];
  }


  get contractForecastStopPrice {
    return _localizedValues[localProvider.locale.countryCode]
    ['contract ForecastStopPrice'];
  }
  get contractNoEntrustOrders {
    return _localizedValues[localProvider.locale.countryCode]
    ['contract NoEntrustOrders'];
  }

  get contractNoOrders {
    return _localizedValues[localProvider.locale.countryCode]
    ['contract NoOrders'];
  }

  get contractPositions {
    return _localizedValues[localProvider.locale.countryCode]
    ['contract positions'];
  }
  get contractCurrentOrder {
    return _localizedValues[localProvider.locale.countryCode]
    ['contract CurrentOrder'];
  }

  get contractEntrust {
    return _localizedValues[localProvider.locale.countryCode]
    ['contract Entrust'];
  }




  ///** 资产 **//
  get assetWithdrawalMaxhint {
    return _localizedValues[localProvider.locale.countryCode]
        ['asset Withdrawal Max hint'];
  }

  get assetAmount {
    return _localizedValues[localProvider.locale.countryCode]
        ['asset amount'];
  }
  get assetDate {
    return _localizedValues[localProvider.locale.countryCode]
        ['asset Date'];
  }
  get assetHand {
    return _localizedValues[localProvider.locale.countryCode]
        ['asset hand'];
  }
    get assetRemarks {
    return _localizedValues[localProvider.locale.countryCode]
        ['asset Remarks'];
  }

  get assetTransactionType {
    return _localizedValues[localProvider.locale.countryCode]
        ['asset Transaction Type'];
  }

  get assetChoosetype {
    return _localizedValues[localProvider.locale.countryCode]
        ['asset Choose type'];
  }
  get assetChoosecurrency {
    return _localizedValues[localProvider.locale.countryCode]
        ['asset Choose currency'];
  }
  get assetTransfer1 {
    return _localizedValues[localProvider.locale.countryCode]
        ['asset Transfer1'];
  }
    get assetcompleted {
    return _localizedValues[localProvider.locale.countryCode]
        ['asset completed'];
  }

  get assetTransfer2 {
    return _localizedValues[localProvider.locale.countryCode]
        ['asset Transfer2'];
  }

  get assetCurrency {
    return _localizedValues[localProvider.locale.countryCode]
        ['asset Currency'];
  }

  get assetValuationcoin {
    return _localizedValues[localProvider.locale.countryCode]
        ['asset Valuation coin'];
  }

  get assetValuationcoincontract {
    return _localizedValues[localProvider.locale.countryCode]
        ['asset Valuation coin contract'];
  }

  get assetNonactivated {
    return _localizedValues[localProvider.locale.countryCode]
        ['asset Nonactivated'];
  }

  get assetActivation {
    return _localizedValues[localProvider.locale.countryCode]
        ['asset Activation'];
  }

  get assetAccountEquity {
    return _localizedValues[localProvider.locale.countryCode]
        ['asset Account Equity'];
  }

  get assetEquity {
    return _localizedValues[localProvider.locale.countryCode]['asset equity'];
  }

  get assethold {
    return _localizedValues[localProvider.locale.countryCode]['asset hold'];
  }

  get assetHide {
    return _localizedValues[localProvider.locale.countryCode]['asset Hide'];
  }

  get asset7Day {
    return _localizedValues[localProvider.locale.countryCode]['asset 7 Day'];
  }
  get asset7o1month {
    return _localizedValues[localProvider.locale.countryCode]['asset 7-1 month'];
  }
  get asset7o3month {
    return _localizedValues[localProvider.locale.countryCode]['asset 7-3 month'];
  }
  get assetWithdrawalhint3 {
    return _localizedValues[localProvider.locale.countryCode]
        ['asset Withdrawal hint3'];
  }

  get assetEmptyhint1 {
    return _localizedValues[localProvider.locale.countryCode]
        ['asset Empty hint1'];
  }

  get assetEmptyhint2 {
    return _localizedValues[localProvider.locale.countryCode]
        ['asset Empty hint2'];
  }

  get assetSet {
    return _localizedValues[localProvider.locale.countryCode]['asset Set'];
  }

  get assetprotection {
    return _localizedValues[localProvider.locale.countryCode]
        ['asset protection'];
  }

  get assetNoFundpwd {
    return _localizedValues[localProvider.locale.countryCode]
        ['asset NoFundpwd'];
  }

  get assetCoin {
    return _localizedValues[localProvider.locale.countryCode]['asset Coin'];
  }

  get assetCoinaccount {
    return _localizedValues[localProvider.locale.countryCode]
        ['asset Coin account'];
  }

  get assetContractaccount {
    return _localizedValues[localProvider.locale.countryCode]
        ['asset Contract account'];
  }

  get assetTransferQuantityhint {
    return _localizedValues[localProvider.locale.countryCode]
        ['asset TransferQuantity hint'];
  }

  get assetNoavailable {
    return _localizedValues[localProvider.locale.countryCode]
        ['asset No available'];
  }

  get assetConfirmtransfer {
    return _localizedValues[localProvider.locale.countryCode]
        ['asset Confirm transfer'];
  }

  get assetQuantityEmptyhint {
    return _localizedValues[localProvider.locale.countryCode]
        ['asset QuantityEmpty hint'];
  }

  get assetSuccessfultransfer {
    return _localizedValues[localProvider.locale.countryCode]
        ['asset Successful transfer'];
  }

  get assetBalance {
    return _localizedValues[localProvider.locale.countryCode]['asset Balance'];
  }

  get assetCurrentcurrency {
    return _localizedValues[localProvider.locale.countryCode]
        ['asset Current currency'];
  }

  get assetsafetyverification {
    return _localizedValues[localProvider.locale.countryCode]
        ['asset safety verification'];
  }

  get assetSuccessfulwithdrawal {
    return _localizedValues[localProvider.locale.countryCode]
        ['asset Successful withdrawal'];
  }

  get assetSearch {
    return _localizedValues[localProvider.locale.countryCode]['asset Search'];
  }

  get assetWithdrawalHint2 {
    return _localizedValues[localProvider.locale.countryCode]
        ['asset Withdrawal Hint2'];
  }

  get assetArrivalquantity {
    return _localizedValues[localProvider.locale.countryCode]
        ['asset Arrival quantity'];
  }

  get assetCarryon {
    return _localizedValues[localProvider.locale.countryCode]['asset Carry on'];
  }

  get assetALL {
    return _localizedValues[localProvider.locale.countryCode]['asset ALL'];
  }

  get assetContract {
    return _localizedValues[localProvider.locale.countryCode]
        ['asset Contract'];
  }

  get assetCoinrecord {
    return _localizedValues[localProvider.locale.countryCode]
        ['asset Coin record'];
  }

  get assetContractrecord {
    return _localizedValues[localProvider.locale.countryCode]
        ['asset Contract record'];
  }

  get assetFreeze {
    return _localizedValues[localProvider.locale.countryCode]['asset Freeze'];
  }

  get assetConvertedamount {
    return _localizedValues[localProvider.locale.countryCode]
        ['asset Converted amount'];
  }

  get assetRecharge {
    return _localizedValues[localProvider.locale.countryCode]['asset Recharge'];
  }

  get assetWithdrawal {
    return _localizedValues[localProvider.locale.countryCode]
        ['asset Withdrawal'];
  }

  get assetTransfer {
    return _localizedValues[localProvider.locale.countryCode]['asset Transfer'];
  }

  get assetTotrade {
    return _localizedValues[localProvider.locale.countryCode]['asset To trade'];
  }

  get assetWithdrawalHint {
    return _localizedValues[localProvider.locale.countryCode]
        ['asset Withdrawal Hint'];
  }

  get assetCopyaddress {
    return _localizedValues[localProvider.locale.countryCode]
        ['asset Copy address'];
  }

  get assetTips {
    return _localizedValues[localProvider.locale.countryCode]['asset Tips'];
  }

  get assetNoMore {
    return _localizedValues[localProvider.locale.countryCode]['asset No More'];
  }

  get assetChoose {
    return _localizedValues[localProvider.locale.countryCode]['asset Choose'];
  }

  get assetBillingDetail {
    return _localizedValues[localProvider.locale.countryCode]
        ['asset Billing Detail'];
  }

  get assetAddress {
    return _localizedValues[localProvider.locale.countryCode]['asset Address'];
  }

  get assetChainname {
    return _localizedValues[localProvider.locale.countryCode]
        ['asset Chain name'];
  }

  get assetTransactionID {
    return _localizedValues[localProvider.locale.countryCode]
        ['asset Transaction ID'];
  }

  get assetTransactionhour {
    return _localizedValues[localProvider.locale.countryCode]
        ['asset Transaction hour'];
  }

  get assetTradingstatus {
    return _localizedValues[localProvider.locale.countryCode]
        ['asset Trading status'];
  }

  ///** 交易 **//
  get tradrAll {
    return _localizedValues[localProvider.locale.countryCode]['tradr All'];
  }

  get tradrEntrustprice {
    return _localizedValues[localProvider.locale.countryCode]
        ['tradr Entrust price'];
  }

  get TradrFilter {
    return _localizedValues[localProvider.locale.countryCode]['tradr filter'];
  }

  get TradrReset {
    return _localizedValues[localProvider.locale.countryCode]['tradr Reset'];
  }

  get TradrVolume {
    return _localizedValues[localProvider.locale.countryCode]['tradr Volume'];
  }

  get tradrFee {
    return _localizedValues[localProvider.locale.countryCode]['tradr fee'];
  }

  get tradrEntrustAmount {
    return _localizedValues[localProvider.locale.countryCode]
        ['tradr Entrust Amounts'];
  }

  get TradrTotalTurnover {
    return _localizedValues[localProvider.locale.countryCode]
        ['tradr Total Turnovers'];
  }

  get TradrAverageprice {
    return _localizedValues[localProvider.locale.countryCode]
        ['tradr Average price'];
  }

  get tradrBuyOrder {
    return _localizedValues[localProvider.locale.countryCode]['tradr BuyOrder'];
  }

  get tradrSellOrder {
    return _localizedValues[localProvider.locale.countryCode]
        ['tradr SellOrder'];
  }

  get tradrBuyAndSell {
    return _localizedValues[localProvider.locale.countryCode]
        ['tradr Buy and Sell'];
  }

  get TradrLimitPrice {
    return _localizedValues[localProvider.locale.countryCode]
        ['tradr Limit Price'];
  }

  get tradrMarketPrice {
    return _localizedValues[localProvider.locale.countryCode]
        ['tradr Market Price'];
  }

  get TradrBest {
    return _localizedValues[localProvider.locale.countryCode]['tradr best'];
  }

  get tradrAvailable {
    return _localizedValues[localProvider.locale.countryCode]
        ['tradr Available'];
  }

  get TradrAmount {
    return _localizedValues[localProvider.locale.countryCode]['tradr Amount'];
  }

  get TradrPriceHint {
    return _localizedValues[localProvider.locale.countryCode]
        ['tradr Price Hint'];
  }

  get TradrQuantityHint {
    return _localizedValues[localProvider.locale.countryCode]
        ['tradr Quantity Hint'];
  }

  get TradrPending {
    return _localizedValues[localProvider.locale.countryCode]['tradr Pending'];
  }

  get TradrRevoke {
    return _localizedValues[localProvider.locale.countryCode]['tradr Revoke'];
  }

  get tradrActualTransaction {
    return _localizedValues[localProvider.locale.countryCode]
        ['tradr Actual Transaction'];
  }

  get tradrNoEntrust {
    return _localizedValues[localProvider.locale.countryCode]
        ['tradr No Entrust'];
  }

  get tradrCurrentEntrust {
    return _localizedValues[localProvider.locale.countryCode]
        ['tradr Current Entrust'];
  }

  get tradrAllEntrust {
    return _localizedValues[localProvider.locale.countryCode]
        ['tradr AllEntrust'];
  }

  get TradrQuantity {
    return _localizedValues[localProvider.locale.countryCode]['tradr Quantity'];
  }

  get tradrListCoin {
    return _localizedValues[localProvider.locale.countryCode]['tradr ListCoin'];
  }

  get TradrTime {
    return _localizedValues[localProvider.locale.countryCode]['tradr time'];
  }

  get tradrDirection {
    return _localizedValues[localProvider.locale.countryCode]
        ['tradr Direction'];
  }

  get tradrPrice {
    return _localizedValues[localProvider.locale.countryCode]['tradr Price'];
  }

  get tradrSell {
    return _localizedValues[localProvider.locale.countryCode]['tradr Sell'];
  }

  get tradrBuy {
    return _localizedValues[localProvider.locale.countryCode]['tradr Buy'];
  }

  get homeQuit {
    return _localizedValues[localProvider.locale.countryCode]['home quit'];
  }

  get homeQuitHint {
    return _localizedValues[localProvider.locale.countryCode]['home quit hint'];
  }

  get tradrSuccess {
    return _localizedValues[localProvider.locale.countryCode]['tradr Success'];
  }

  get tradrCurrentOrder {
    return _localizedValues[localProvider.locale.countryCode]
        ['tradr Current Order'];
  }

  get tradrHistoricalOrders {
    return _localizedValues[localProvider.locale.countryCode]
        ['tradr Historical Orders'];
  }

  get tradrCancelHint {
    return _localizedValues[localProvider.locale.countryCode]
        ['tradr Cancel Hint'];
  }

  get tradrCancelSuccess {
    return _localizedValues[localProvider.locale.countryCode]
        ['tradr Cancel Success'];
  }

  ///** 主页tab **//
  get mainHome {
    return _localizedValues[localProvider.locale.countryCode]['main home'];
  }
  get mainOtc {
    return _localizedValues[localProvider.locale.countryCode]['main otc'];
  }

  get mainCoin {
    return _localizedValues[localProvider.locale.countryCode]['main coin'];
  }

  get mainContract {
    return _localizedValues[localProvider.locale.countryCode]['main contract'];
  }

  get mainAssets {
    return _localizedValues[localProvider.locale.countryCode]['main assets'];
  }

  ///** K线 **//
  get klineDepth {
    return _localizedValues[localProvider.locale.countryCode]['kline depth'];
  }

  get klineHold {
    return _localizedValues[localProvider.locale.countryCode]['kline hold'];
  }

  get klineVOL {
    return _localizedValues[localProvider.locale.countryCode]['kline VOL'];
  }

  get klineMax {
    return _localizedValues[localProvider.locale.countryCode]['kline Max'];
  }

  get klineMin {
    return _localizedValues[localProvider.locale.countryCode]['kline Min'];
  }

  get klineMore {
    return _localizedValues[localProvider.locale.countryCode]['kline More'];
  }

  get klineMinute {
    return _localizedValues[localProvider.locale.countryCode]['kline Minute'];
  }

  get klineHour {
    return _localizedValues[localProvider.locale.countryCode]['kline Hour'];
  }

  get klineDay {
    return _localizedValues[localProvider.locale.countryCode]['kline Day'];
  }

  get klineIndex {
    return _localizedValues[localProvider.locale.countryCode]['kline Index'];
  }

  get klineMain {
    return _localizedValues[localProvider.locale.countryCode]['kline Main'];
  }

  get klineHide {
    return _localizedValues[localProvider.locale.countryCode]['kline Hide'];
  }

  get klineSide {
    return _localizedValues[localProvider.locale.countryCode]['kline Side'];
  }

  ///** 首页 **//
  get splashJumpOver {
    return _localizedValues[localProvider.locale.countryCode]
        ['splash jump over'];
  }

  get homeOptional {
    return _localizedValues[localProvider.locale.countryCode]['home Optional'];
  }

  get homeContract {
    return _localizedValues[localProvider.locale.countryCode]['home contract'];
  }

  get homeCoin {
    return _localizedValues[localProvider.locale.countryCode]['home Coin'];
  }

  get homeNodata {
    return _localizedValues[localProvider.locale.countryCode]['home No data'];
  }

  get homeCustomerService {
    return _localizedValues[localProvider.locale.countryCode]
        ['home customer service'];
  }

  get homeSustainable {
    return _localizedValues[localProvider.locale.countryCode]
        ['home Sustainable'];
  }

  get homeOpen {
    return _localizedValues[localProvider.locale.countryCode]['home open'];
  }

  get homeName {
    return _localizedValues[localProvider.locale.countryCode]['home name'];
  }

  get homeLatestprice {
    return _localizedValues[localProvider.locale.countryCode]
        ['home Latest price'];
  }

  get homeChange {
    return _localizedValues[localProvider.locale.countryCode]['home change'];
  }

  get home24volume {
    return _localizedValues[localProvider.locale.countryCode]['home 24volume'];
  }

  get home24Amount {
    return _localizedValues[localProvider.locale.countryCode]['home 24amount'];
  }

  ///** 搜索 **//
  get searcheCurrency {
    return _localizedValues[localProvider.locale.countryCode]
        ['searche Currency'];
  }

  get searcheNoCurrency {
    return _localizedValues[localProvider.locale.countryCode]
        ['searche noCurrency'];
  }

  get searcheAnnouncement {
    return _localizedValues[localProvider.locale.countryCode]
        ['searche announcement'];
  }

  get searcheClearRecord {
    return _localizedValues[localProvider.locale.countryCode]
        ['searche clearRecord'];
  }

  get searcheNoRecord {
    return _localizedValues[localProvider.locale.countryCode]
        ['searche noRecord'];
  }

  get searcheHot {
    return _localizedValues[localProvider.locale.countryCode]['searche hot'];
  }

  get searcheHistoricalAnnouncement {
    return _localizedValues[localProvider.locale.countryCode]
        ['searche Historical'];
  }

  ///** 我的 **//
  get GoogleAuthentication {
    return _localizedValues[localProvider.locale.countryCode]
        ['Google authentication'];
  }

  get MobileVerificationCode {
    return _localizedValues[localProvider.locale.countryCode]
        ['Mobile verification code'];
  }

  get inputNameHint2 {
    return _localizedValues[localProvider.locale.countryCode]
        ['input name hint'];
  }

  get SuccessfullyModified {
    return _localizedValues[localProvider.locale.countryCode]
        ['Successfully modified'];
  }

  get Follow {
    return _localizedValues[localProvider.locale.countryCode]['Follow'];
  }

  get WeChat {
    return _localizedValues[localProvider.locale.countryCode]['WeChat'];
  }

  get WeChatNumber {
    return _localizedValues[localProvider.locale.countryCode]['We chat number'];
  }

  get Weibo {
    return _localizedValues[localProvider.locale.countryCode]['Weibo'];
  }

  get customerService {
    return _localizedValues[localProvider.locale.countryCode]
        ['customer service'];
  }

  get marketCollaboration {
    return _localizedValues[localProvider.locale.countryCode]
        ['market collaboration'];
  }

  get CommunityHint {
    return _localizedValues[localProvider.locale.countryCode]['Community hint'];
  }

  get SavedAlbum {
    return _localizedValues[localProvider.locale.countryCode]['Saved album'];
  }

  get Savefailed {
    return _localizedValues[localProvider.locale.countryCode]['Save failed'];
  }

  get SaveHint {
    return _localizedValues[localProvider.locale.countryCode]['Save hint'];
  }

  get IDCard {
    return _localizedValues[localProvider.locale.countryCode]['ID card'];
  }

  get Passport {
    return _localizedValues[localProvider.locale.countryCode]['passport'];
  }

  get ChinaMainland {
    return _localizedValues[localProvider.locale.countryCode]['China Mainland'];
  }

  get area {
    return _localizedValues[localProvider.locale.countryCode]['area'];
  }

  get enterName {
    return _localizedValues[localProvider.locale.countryCode]['enter name'];
  }

  get name {
    return _localizedValues[localProvider.locale.countryCode]['name'];
  }

  get inputNameHint {
    return _localizedValues[localProvider.locale.countryCode]
        ['input name hint'];
  }

  get LastName {
    return _localizedValues[localProvider.locale.countryCode]['Last name'];
  }

  get AuthenticationType {
    return _localizedValues[localProvider.locale.countryCode]
        ['Authentication type'];
  }

  get inputIDcard {
    return _localizedValues[localProvider.locale.countryCode]['input ID card'];
  }

  get IDNumber {
    return _localizedValues[localProvider.locale.countryCode]['ID number'];
  }

  get IDNumberHint {
    return _localizedValues[localProvider.locale.countryCode]['ID number hint'];
  }

  get IDNumberHint2 {
    return _localizedValues[localProvider.locale.countryCode]
        ['ID number hint2'];
  }

  get IDNumberHint3 {
    return _localizedValues[localProvider.locale.countryCode]
        ['ID number hint3'];
  }

  get IDNumberHint4 {
    return _localizedValues[localProvider.locale.countryCode]
        ['ID number hint4'];
  }

  get UploadRequest {
    return _localizedValues[localProvider.locale.countryCode]['Upload request'];
  }

  get UploadHint {
    return _localizedValues[localProvider.locale.countryCode]['Upload hint'];
  }

  get UploadHint2 {
    return _localizedValues[localProvider.locale.countryCode]['Upload hint2'];
  }

  get UploadHint3 {
    return _localizedValues[localProvider.locale.countryCode]['Upload hint3'];
  }

  get UploadHint4 {
    return _localizedValues[localProvider.locale.countryCode]['Upload hint4'];
  }

  get UploadHint5 {
    return _localizedValues[localProvider.locale.countryCode]['Upload hint5'];
  }

  get UploadHint6 {
    return _localizedValues[localProvider.locale.countryCode]['Upload hint6'];
  }

  get UploadHint7 {
    return _localizedValues[localProvider.locale.countryCode]['Upload hint7'];
  }

  get standard {
    return _localizedValues[localProvider.locale.countryCode]['standard'];
  }

  get MainlandChinausers {
    return _localizedValues[localProvider.locale.countryCode]
        ['Mainland China users'];
  }

  get otherArea {
    return _localizedValues[localProvider.locale.countryCode]['other area'];
  }

  get HistoryLogin {
    return _localizedValues[localProvider.locale.countryCode]['History login'];
  }

  get interviewTime {
    return _localizedValues[localProvider.locale.countryCode]['interview time'];
  }

  get equipment {
    return _localizedValues[localProvider.locale.countryCode]['equipment'];
  }

  get moneyPassword {
    return _localizedValues[localProvider.locale.countryCode]['money password'];
  }

  get SetSuccessfully {
    return _localizedValues[localProvider.locale.countryCode]
        ['Set successfully'];
  }

  get CurrencyRate {
    return _localizedValues[localProvider.locale.countryCode]['Currency rate'];
  }



  get WithdrawalFee {
    return _localizedValues[localProvider.locale.countryCode]['Withdrawal fee'];
  }

  get loginPassword {
    return _localizedValues[localProvider.locale.countryCode]['login password'];
  }

  get modify {
    return _localizedValues[localProvider.locale.countryCode]['modify'];
  }

  get CellPhone {
    return _localizedValues[localProvider.locale.countryCode]['Cell phone'];
  }

  get unbounded {
    return _localizedValues[localProvider.locale.countryCode]['unbounded'];
  }

  get Bound {
    return _localizedValues[localProvider.locale.countryCode]['Bound'];
  }

  get GoToSet {
    return _localizedValues[localProvider.locale.countryCode]['Go to set'];
  }

  get Tomodify {
    return _localizedValues[localProvider.locale.countryCode]['To modify'];
  }

  get inviteFriends {
    return _localizedValues[localProvider.locale.countryCode]['invite friends'];
  }

  get inviteHint {
    return _localizedValues[localProvider.locale.countryCode]['invite hint'];
  }

  get SaveAlbum {
    return _localizedValues[localProvider.locale.countryCode]['Save album'];
  }

  get SetCode {
    return _localizedValues[localProvider.locale.countryCode]['Set code'];
  }

  get SetCodeHint {
    return _localizedValues[localProvider.locale.countryCode]['Set code hint'];
  }

  get SetCodeHint2 {
    return _localizedValues[localProvider.locale.countryCode]['Set code hint2'];
  }

  get AntiPhishingCode {
    return _localizedValues[localProvider.locale.countryCode]
        ['Anti-phishing code'];
  }

  get oldpasswordEmptyHint {
    return _localizedValues[localProvider.locale.countryCode]
        ['oldpassword empty hint'];
  }

  get Passwordchanged {
    return _localizedValues[localProvider.locale.countryCode]
        ['Password changed'];
  }

  get ChangeFundPassword {
    return _localizedValues[localProvider.locale.countryCode]
        ['Change fund password'];
  }

  get passwordLimitHint {
    return _localizedValues[localProvider.locale.countryCode]
        ['password limit hint'];
  }

  get NewMoneyPassword {
    return _localizedValues[localProvider.locale.countryCode]
        ['New money password'];
  }

  get ConfirmMoneyPassword {
    return _localizedValues[localProvider.locale.countryCode]
        ['Confirm money password'];
  }

  get moneypwdEmptyHint {
    return _localizedValues[localProvider.locale.countryCode]
        ['moneypwd empty hint'];
  }

  get moneypwdEmptyHint2 {
    return _localizedValues[localProvider.locale.countryCode]
        ['moneypwd empty hint2'];
  }

  get phoneNumber {
    return _localizedValues[localProvider.locale.countryCode]['phone Number'];
  }

  get modifyLoginPassword {
    return _localizedValues[localProvider.locale.countryCode]
        ['modify Login Password'];
  }

  get modifyLoginPasswordHint {
    return _localizedValues[localProvider.locale.countryCode]
        ['modify Login Password Hint'];
  }

  get originalLoginPassword {
    return _localizedValues[localProvider.locale.countryCode]
        ['original Login Password'];
  }

  get LoginPasswordhint {
    return _localizedValues[localProvider.locale.countryCode]
        ['Login Password hint'];
  }

  get Newloginpassword {
    return _localizedValues[localProvider.locale.countryCode]
        ['New login password'];
  }

  get bindPhone {
    return _localizedValues[localProvider.locale.countryCode]['bind Phone'];
  }

  get RepeatPassword {
    return _localizedValues[localProvider.locale.countryCode]
        ['Repeat password'];
  }

  get ConfirmNewPassword {
    return _localizedValues[localProvider.locale.countryCode]
        ['Confirm new password'];
  }

  get submit {
    return _localizedValues[localProvider.locale.countryCode]['submit'];
  }

  get copy {
    return _localizedValues[localProvider.locale.countryCode]['copy'];
  }

  get Key {
    return _localizedValues[localProvider.locale.countryCode]['Key'];
  }

  get bindGoogleHint {
    return _localizedValues[localProvider.locale.countryCode]
        ['bind Google Hint'];
  }

  get bindGoogle {
    return _localizedValues[localProvider.locale.countryCode]['bind Google'];
  }

  get BindingSubmitte {
    return _localizedValues[localProvider.locale.countryCode]
        ['Binding submitte'];
  }

  get submitBinding {
    return _localizedValues[localProvider.locale.countryCode]['submit Binding'];
  }

  get mailbox {
    return _localizedValues[localProvider.locale.countryCode]['mailbox'];
  }

  get enterEmailAddress {
    return _localizedValues[localProvider.locale.countryCode]
        ['enter email address'];
  }

  get bindMailbox {
    return _localizedValues[localProvider.locale.countryCode]['bind mailbox'];
  }

  get mine {
    return _localizedValues[localProvider.locale.countryCode]['mine'];
  }

  get copySuccessfully {
    return _localizedValues[localProvider.locale.countryCode]
        ['Copy successfully'];
  }

  get securityCenter {
    return _localizedValues[localProvider.locale.countryCode]
        ['Security center'];
  }

  get authentication {
    return _localizedValues[localProvider.locale.countryCode]['Authentication'];
  }

  get myAssets {
    return _localizedValues[localProvider.locale.countryCode]['My assets'];
  }

  get rateStandard {
    return _localizedValues[localProvider.locale.countryCode]['Rate standard'];
  }

  get promotion {
    return _localizedValues[localProvider.locale.countryCode]['Promotion'];
  }

  get helpCenter {
    return _localizedValues[localProvider.locale.countryCode]['Help center'];
  }

  get version {
    return _localizedValues[localProvider.locale.countryCode]['version'];
  }

  get latestVersion {
    return _localizedValues[localProvider.locale.countryCode]['Latest version'];
  }

  get signOut {
    return _localizedValues[localProvider.locale.countryCode]['sign out'];
  }

  get signOutHint {
    return _localizedValues[localProvider.locale.countryCode]['sign out hint'];
  }

  get cancel {
    return _localizedValues[localProvider.locale.countryCode]['cancel'];
  }

  get determine {
    return _localizedValues[localProvider.locale.countryCode]['determine'];
  }

  get mineHint {
    return _localizedValues[localProvider.locale.countryCode]['mine hint'];
  }

  get mineHint2 {
    return _localizedValues[localProvider.locale.countryCode]['mine hint2'];
  }

  ///** 登陆注册页面 **//
  ///
  ///
  get send {
    return _localizedValues[localProvider.locale.countryCode]['send'];
  }

  get Reacquire {
    return _localizedValues[localProvider.locale.countryCode]['Reacquire'];
  }

  get sent {
    return _localizedValues[localProvider.locale.countryCode]['sent'];
  }

  get WelcomeRegister {
    return _localizedValues[localProvider.locale.countryCode]
        ['Welcome register'];
  }

  get emailCodeInputHint {
    return _localizedValues[localProvider.locale.countryCode]
        ['email code input hint'];
  }

  get phoneCodeInputHint {
    return _localizedValues[localProvider.locale.countryCode]
        ['phone code input hint'];
  }

  get haveAccount {
    return _localizedValues[localProvider.locale.countryCode]['have account'];
  }

  get GoLogin {
    return _localizedValues[localProvider.locale.countryCode]['Go to login'];
  }

  get phoneRegistration {
    return _localizedValues[localProvider.locale.countryCode]
        ['phone registration'];
  }

  get emailRegistration {
    return _localizedValues[localProvider.locale.countryCode]
        ['email registration'];
  }

  get phoneInputHint {
    return _localizedValues[localProvider.locale.countryCode]
        ['phone input hint'];
  }

  get codeInputHint {
    return _localizedValues[localProvider.locale.countryCode]
        ['code input hint'];
  }

  get registrationConfirmPassword {
    return _localizedValues[localProvider.locale.countryCode]
        ['registration confirm password'];
  }

  get invitationCodeInputHint {
    return _localizedValues[localProvider.locale.countryCode]
        ['invitationCode input hint'];
  }

  get termsHint {
    return _localizedValues[localProvider.locale.countryCode]['terms hint'];
  }

  get emailInputHint {
    return _localizedValues[localProvider.locale.countryCode]
        ['email input hint'];
  }

  get registrationSuccess {
    return _localizedValues[localProvider.locale.countryCode]
        ['registration success'];
  }

  get welcomeLogin {
    return _localizedValues[localProvider.locale.countryCode]['Welcome login'];
  }

  get loginAccountHint {
    return _localizedValues[localProvider.locale.countryCode]
        ['login account hint'];
  }

  get loginPwdHint {
    return _localizedValues[localProvider.locale.countryCode]['login pwd hint'];
  }

  get loginRegister {
    return _localizedValues[localProvider.locale.countryCode]['login register'];
  }

  get forgetPassword {
    return _localizedValues[localProvider.locale.countryCode]
        ['forget password'];
  }

  get chooseCountry {
    return _localizedValues[localProvider.locale.countryCode]
        ['choose Country'];
  }

  get login {
    return _localizedValues[localProvider.locale.countryCode]['login'];
  }

  get loginSuccessful {
    return _localizedValues[localProvider.locale.countryCode]
        ['login successful'];
  }

  get Nextstep {
    return _localizedValues[localProvider.locale.countryCode]['Next step'];
  }

  get resetPassword {
    return _localizedValues[localProvider.locale.countryCode]['reset Password'];
  }

  get confirmPassword {
    return _localizedValues[localProvider.locale.countryCode]
        ['confirm Password'];
  }

  get Confirm {
    return _localizedValues[localProvider.locale.countryCode]['Confirm'];
  }

  get Googleverificationcode {
    return _localizedValues[localProvider.locale.countryCode]
        ['Google verification code'];
  }

  get GoogleVerificationCodeHint {
    return _localizedValues[localProvider.locale.countryCode]
        ['enter Google verification code'];
  }

  get PasswordEmptyHint {
    return _localizedValues[localProvider.locale.countryCode]
        ['Password cannot be empty'];
  }

  get confirmPasswordHint {
    return _localizedValues[localProvider.locale.countryCode]
        ['confirm password hint'];
  }

  get passwordHint2 {
    return _localizedValues[localProvider.locale.countryCode]['password hint2'];
  }

  get PhoneCodeHint {
    return _localizedValues[localProvider.locale.countryCode]
        ['Phone code hint'];
  }

  get EmailCodeHint {
    return _localizedValues[localProvider.locale.countryCode]
        ['Email code hint'];
  }

  get GoogleCodeHint {
    return _localizedValues[localProvider.locale.countryCode]
        ['Google code hint'];
  }

  get Passwordreset {
    return _localizedValues[localProvider.locale.countryCode]['Password reset'];
  }

  get taskTitle {
    return _localizedValues[locales.countryCode]['task title'];
  }

  get setTitle {
    return _localizedValues[locales.countryCode]['set title'];
  }

  get themeSet {
    return _localizedValues[locales.countryCode]['theme set'];
  }

  get langSet {
    return _localizedValues[locales.countryCode]['language set'];
  }

  final String localeName;

  String get autoBySystem {
    return Intl.message(
      'Auto',
      name: 'autoBySystem',
      desc: '跟随系统',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<Tr> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale('zh', 'CH'),
      Locale('en', 'US'),
      Locale('zh', 'HK'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);

  @override
  Future<Tr> load(Locale locale) => Tr.load(locale);

  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    if (locale != null) {
      for (Locale supportedLocale in supportedLocales) {
        if (supportedLocale.languageCode == locale.languageCode) {
          return true;
        }
      }
    }
    return false;
  }
}
