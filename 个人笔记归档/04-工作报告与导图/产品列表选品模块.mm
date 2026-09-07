<map>
  <node ID="root" TEXT="产品列表/选品模块">
    <node TEXT="前置条件与测试数据" ID="pl001" STYLE="bubble" POSITION="right">
      <node TEXT="Admin后台已维护马来西亚多币种配置，状态为启用，结算币种USD，展示币种MYR，币种符号RM，存在当前生效汇率" ID="pl001001" STYLE="fork"/>
      <node TEXT="Admin后台已维护免责声明、生效日期、金额精度，产品列表页可读取并展示" ID="pl001002" STYLE="fork"/>
      <node TEXT="准备未配置多币种国家、配置停用国家、无有效汇率国家，用于验证USD-only降级" ID="pl001003" STYLE="fork"/>
      <node TEXT="准备马来渠道账号、非马来渠道账号、销售账号、销售代客可选的马来Partner和非马来Partner" ID="pl001004" STYLE="fork"/>
      <node TEXT="准备普通商品、促销商品、组合包商品、有价服务、免费服务、库存不足、MOQ/MTU限制、配额限制等产品数据" ID="pl001005" STYLE="fork"/>
      <node TEXT="准备不同金额精度和边界金额数据，覆盖小数、0金额、大金额、折扣金额和四舍五入场景" ID="pl001006" STYLE="fork"/>
    </node>
    <node TEXT="页面入口与初始化加载" ID="pl002" STYLE="bubble" POSITION="right">
      <node TEXT="马来渠道登录PC进入产品列表页，页面加载成功，产品列表正常展示" ID="pl002001" STYLE="fork"/>
      <node TEXT="马来渠道首次进入产品列表页，默认展示MYR/RM金额" ID="pl002002" STYLE="fork"/>
      <node TEXT="产品列表页读取国家多币种配置成功后，显示汇率横幅和MYR/USD切换入口" ID="pl002003" STYLE="fork"/>
      <node TEXT="产品列表页读取配置过程中，页面加载状态正常，不影响原产品查询结果展示" ID="pl002004" STYLE="fork"/>
      <node TEXT="产品列表页读取配置失败时，降级为USD-only，隐藏MYR入口，不阻塞产品列表查询" ID="pl002005" STYLE="fork"/>
      <node TEXT="非马来渠道或未配置国家进入产品列表页，默认展示USD，隐藏汇率横幅和MYR/USD切换入口" ID="pl002006" STYLE="fork"/>
      <node TEXT="配置停用国家进入产品列表页，默认展示USD，隐藏MYR入口" ID="pl002007" STYLE="fork"/>
      <node TEXT="无当前生效汇率时进入产品列表页，默认展示USD，隐藏MYR入口" ID="pl002008" STYLE="fork"/>
    </node>
    <node TEXT="汇率横幅" ID="pl003" STYLE="bubble" POSITION="right">
      <node TEXT="汇率横幅展示当前生效汇率，格式正确，如：1 USD = x.xxxxxx MYR" ID="pl003001" STYLE="fork"/>
      <node TEXT="汇率横幅展示当前生效汇率的生效日期，日期格式正确" ID="pl003002" STYLE="fork"/>
      <node TEXT="汇率横幅展示后台配置的免责声明文案，文案完整不截断" ID="pl003003" STYLE="fork"/>
      <node TEXT="后台修改免责声明后，产品列表页重新进入或刷新后展示最新免责声明" ID="pl003004" STYLE="fork"/>
      <node TEXT="后台修改币种符号后，产品列表页金额符号更新正确" ID="pl003005" STYLE="fork"/>
      <node TEXT="后台修改金额精度后，产品列表页MYR金额小数位更新正确" ID="pl003006" STYLE="fork"/>
      <node TEXT="存在待生效汇率时，产品列表页仍展示当前生效汇率，不展示待生效汇率给客户" ID="pl003007" STYLE="fork"/>
      <node TEXT="汇率横幅中的MYR/USD切换按钮状态与当前展示币种一致" ID="pl003008" STYLE="fork"/>
      <node TEXT="页面缩放或窄屏情况下，汇率、日期、免责声明、切换入口显示不重叠" ID="pl003009" STYLE="fork"/>
    </node>
    <node TEXT="默认币种与本地选择" ID="pl004" STYLE="bubble" POSITION="right">
      <node TEXT="马来渠道首次进入产品列表页，默认选中MYR" ID="pl004001" STYLE="fork"/>
      <node TEXT="马来渠道切换为USD后，刷新产品列表页，若系统支持记忆本地选择，则继续展示USD" ID="pl004002" STYLE="fork"/>
      <node TEXT="马来渠道切换回MYR后，刷新产品列表页，展示MYR" ID="pl004003" STYLE="fork"/>
      <node TEXT="本地已记忆MYR，但当前渠道国家不支持MYR时，进入产品列表页自动降级USD并隐藏MYR入口" ID="pl004004" STYLE="fork"/>
      <node TEXT="本地已记忆USD，切换到支持MYR的马来渠道时，按产品规则验证是否沿用USD或默认MYR" ID="pl004005" STYLE="fork"/>
      <node TEXT="清除浏览器本地缓存后重新进入马来产品列表页，默认展示MYR" ID="pl004006" STYLE="fork"/>
    </node>
    <node TEXT="币种切换交互" ID="pl005" STYLE="bubble" POSITION="right">
      <node TEXT="点击USD切换，汇率横幅切换状态正确，所有受影响金额展示为USD" ID="pl005001" STYLE="fork"/>
      <node TEXT="点击MYR切换，汇率横幅切换状态正确，所有受影响金额展示为RM" ID="pl005002" STYLE="fork"/>
      <node TEXT="连续多次切换MYR/USD，金额展示稳定，不出现重复换算、精度漂移或累乘汇率" ID="pl005003" STYLE="fork"/>
      <node TEXT="币种切换只刷新金额展示，不触发产品重新查询" ID="pl005004" STYLE="fork"/>
      <node TEXT="币种切换不清空当前搜索条件、筛选条件、排序条件、分页位置和已选服务项" ID="pl005005" STYLE="fork"/>
      <node TEXT="币种切换不改变产品库存、配额、可售状态、MOQ/MTU校验结果" ID="pl005006" STYLE="fork"/>
      <node TEXT="币种切换后再执行搜索、筛选、分页，列表结果正常，金额按当前展示币种展示" ID="pl005007" STYLE="fork"/>
      <node TEXT="币种切换过程中接口返回慢或失败时，页面有合理加载或失败处理，不出现半USD半MYR混乱展示" ID="pl005008" STYLE="fork"/>
    </node>
    <node TEXT="产品价格字段展示" ID="pl006" STYLE="bubble" POSITION="right">
      <node TEXT="产品单价在MYR模式下按USD金额乘当前生效汇率展示，符号为RM" ID="pl006001" STYLE="fork"/>
      <node TEXT="产品单价在USD模式下展示原USD金额，符号和小数位符合原有规则" ID="pl006002" STYLE="fork"/>
      <node TEXT="促销价在MYR模式下换算正确，原价、划线价、促销价之间展示关系不变" ID="pl006003" STYLE="fork"/>
      <node TEXT="无促销价商品不展示促销价，币种切换不新增多余促销信息" ID="pl006004" STYLE="fork"/>
      <node TEXT="服务价在MYR模式下换算正确，服务名称、服务可选状态不变" ID="pl006005" STYLE="fork"/>
      <node TEXT="免费服务在MYR/USD模式下均展示为0或Free，展示规则符合现有产品逻辑" ID="pl006006" STYLE="fork"/>
      <node TEXT="加购合计在MYR模式下按当前数量、服务和当前生效汇率展示正确" ID="pl006007" STYLE="fork"/>
      <node TEXT="修改购买数量后，加购合计按当前展示币种实时刷新" ID="pl006008" STYLE="fork"/>
      <node TEXT="选择或取消有价服务后，加购合计和服务小计按当前展示币种实时刷新" ID="pl006009" STYLE="fork"/>
      <node TEXT="大金额商品在MYR模式下千分位、小数位、币种符号展示正确" ID="pl006010" STYLE="fork"/>
      <node TEXT="小金额商品换算后涉及四舍五入时，展示金额符合后台配置精度" ID="pl006011" STYLE="fork"/>
      <node TEXT="金额为空、接口无价格、价格不可见时，页面按原有规则展示占位，不因MYR换算报错" ID="pl006012" STYLE="fork"/>
    </node>
    <node TEXT="组合包与服务价格" ID="pl007" STYLE="bubble" POSITION="right">
      <node TEXT="组合包总价在MYR模式下换算正确，组合包明细价展示口径一致" ID="pl007001" STYLE="fork"/>
      <node TEXT="组合包内硬件、软件、服务等不同明细金额均按当前展示币种展示" ID="pl007002" STYLE="fork"/>
      <node TEXT="展开/收起组合包明细后，金额展示币种与列表当前币种一致" ID="pl007003" STYLE="fork"/>
      <node TEXT="组合包促销价、折扣价、节省金额在MYR模式下换算正确" ID="pl007004" STYLE="fork"/>
      <node TEXT="一级服务价格和二级服务价格均按当前展示币种展示" ID="pl007005" STYLE="fork"/>
      <node TEXT="切换服务项后，服务小计、产品加购合计、按钮旁金额均按当前币种刷新" ID="pl007006" STYLE="fork"/>
      <node TEXT="服务不可售、服务库存不足、服务与产品不匹配时，提示和禁用逻辑不受币种切换影响" ID="pl007007" STYLE="fork"/>
    </node>
    <node TEXT="销售代客/选择Partner场景" ID="pl008" STYLE="bubble" POSITION="right">
      <node TEXT="销售账号进入产品列表，未选择Partner时，按现有逻辑展示，不误用销售账号国家启用MYR" ID="pl008001" STYLE="fork"/>
      <node TEXT="销售选择马来Partner后，产品列表按该Partner所属国家配置展示MYR入口" ID="pl008002" STYLE="fork"/>
      <node TEXT="销售选择非马来Partner后，产品列表展示USD-only，隐藏MYR入口" ID="pl008003" STYLE="fork"/>
      <node TEXT="销售从马来Partner切换到非马来Partner，币种上下文重置为USD，金额和横幅刷新正确" ID="pl008004" STYLE="fork"/>
      <node TEXT="销售从非马来Partner切换到马来Partner，按马来配置展示MYR入口，默认币种符合产品规则" ID="pl008005" STYLE="fork"/>
      <node TEXT="销售连续查看多个不同国家Partner，不能沿用上一个Partner的币种选择导致展示错误" ID="pl008006" STYLE="fork"/>
      <node TEXT="销售账号所属国家为马来，但被下单Partner为非马来时，不展示MYR" ID="pl008007" STYLE="fork"/>
      <node TEXT="销售账号所属国家非马来，但被下单Partner为马来时，展示MYR" ID="pl008008" STYLE="fork"/>
      <node TEXT="Partner国家配置启停变更后，销售重新进入该Partner产品列表，展示状态与最新配置一致" ID="pl008009" STYLE="fork"/>
    </node>
    <node TEXT="搜索、筛选、排序、分页回归" ID="pl009" STYLE="bubble" POSITION="right">
      <node TEXT="MYR模式下按产品名称搜索，结果与USD模式一致，仅金额展示币种不同" ID="pl009001" STYLE="fork"/>
      <node TEXT="MYR模式下按产品型号搜索，结果与USD模式一致" ID="pl009002" STYLE="fork"/>
      <node TEXT="MYR模式下按品类、品牌、产品属性筛选，筛选结果正确" ID="pl009003" STYLE="fork"/>
      <node TEXT="MYR模式下分页切换，列表数据正确，金额继续按MYR展示" ID="pl009004" STYLE="fork"/>
      <node TEXT="MYR模式下排序逻辑沿用原USD基础字段，不因展示金额导致排序异常" ID="pl009005" STYLE="fork"/>
      <node TEXT="切换币种后，当前筛选、排序、分页状态保持不变" ID="pl009006" STYLE="fork"/>
      <node TEXT="搜索无结果时，空态展示正常，汇率横幅和币种切换状态正常" ID="pl009007" STYLE="fork"/>
    </node>
    <node TEXT="加购前展示与校验" ID="pl010" STYLE="bubble" POSITION="right">
      <node TEXT="MYR模式下点击加入购物车，原有库存校验、MOQ/MTU校验、服务可售校验正常执行" ID="pl010001" STYLE="fork"/>
      <node TEXT="MYR模式下加入购物车成功，成功提示中的金额如有展示需按当前币种展示" ID="pl010002" STYLE="fork"/>
      <node TEXT="MYR模式下加入购物车失败，错误提示沿用原逻辑，不出现币种相关异常" ID="pl010003" STYLE="fork"/>
      <node TEXT="加入购物车请求不能以MYR展示金额作为后端结算依据，后端仍以USD源金额和产品价格逻辑校验" ID="pl010004" STYLE="fork"/>
      <node TEXT="切换币种后再加入购物车，加入的商品、数量、服务项与切换前一致" ID="pl010005" STYLE="fork"/>
      <node TEXT="加入购物车后进入购物车页，购物车展示币种与当前上下文一致" ID="pl010006" STYLE="fork"/>
    </node>
    <node TEXT="异常与降级" ID="pl011" STYLE="bubble" POSITION="right">
      <node TEXT="汇率接口返回空值、0、负数、非数字时，产品列表降级USD-only，不展示错误MYR金额" ID="pl011001" STYLE="fork"/>
      <node TEXT="多币种配置接口超时或失败时，产品列表可继续展示USD价格和原有功能" ID="pl011002" STYLE="fork"/>
      <node TEXT="汇率缓存不可用但数据库可用时，产品列表读取数据库汇率并展示正确" ID="pl011003" STYLE="fork"/>
      <node TEXT="汇率缓存和数据库均不可用时，产品列表隐藏MYR入口并展示USD" ID="pl011004" STYLE="fork"/>
      <node TEXT="免责声明为空或异常时，按产品约束验证是阻断配置启用还是前台降级展示" ID="pl011005" STYLE="fork"/>
      <node TEXT="产品价格接口缺失USD源金额时，不执行MYR换算，页面按原异常占位展示" ID="pl011006" STYLE="fork"/>
      <node TEXT="前端本地币种值非法时，进入产品列表后自动重置为当前国家支持的默认币种" ID="pl011007" STYLE="fork"/>
      <node TEXT="切换币种过程中用户快速点击搜索、筛选、加购，页面状态和金额展示不混乱" ID="pl011008" STYLE="fork"/>
    </node>
    <node TEXT="配置联动验证" ID="pl012" STYLE="bubble" POSITION="right">
      <node TEXT="后台启用马来多币种配置后，马来产品列表展示MYR入口和汇率横幅" ID="pl012001" STYLE="fork"/>
      <node TEXT="后台停用马来多币种配置后，马来产品列表隐藏MYR入口，展示USD-only" ID="pl012002" STYLE="fork"/>
      <node TEXT="后台修改展示币种为其他币种后，新进入产品列表按最新配置展示，历史本地MYR选择失效" ID="pl012003" STYLE="fork"/>
      <node TEXT="后台修改币种符号后，产品列表价格符号更新正确" ID="pl012004" STYLE="fork"/>
      <node TEXT="后台修改金额精度后，产品列表所有MYR价格小数位更新一致" ID="pl012005" STYLE="fork"/>
      <node TEXT="当前生效汇率变更后，刷新产品列表，未下单页面按新汇率展示" ID="pl012006" STYLE="fork"/>
      <node TEXT="存在7天待生效汇率时，产品列表仍使用旧的当前生效汇率展示" ID="pl012007" STYLE="fork"/>
      <node TEXT="待生效汇率到期生效后，重新进入产品列表使用新汇率展示" ID="pl012008" STYLE="fork"/>
    </node>
    <node TEXT="金额计算与精度边界" ID="pl013" STYLE="bubble" POSITION="right">
      <node TEXT="MYR金额计算公式为USD金额乘当前生效汇率，展示结果与预期一致" ID="pl013001" STYLE="fork"/>
      <node TEXT="小数金额换算后按后台配置精度四舍五入" ID="pl013002" STYLE="fork"/>
      <node TEXT="金额为0时，MYR/USD展示均正确" ID="pl013003" STYLE="fork"/>
      <node TEXT="大金额换算后不溢出，千分位和小数位展示正确" ID="pl013004" STYLE="fork"/>
      <node TEXT="折扣金额、促销金额、服务金额分别换算后，与合计金额展示口径一致" ID="pl013005" STYLE="fork"/>
      <node TEXT="同一商品在产品列表、快速查看、组合包明细中的金额币种和金额一致" ID="pl013006" STYLE="fork"/>
      <node TEXT="重复刷新页面不会因前端缓存导致金额用旧汇率或错误汇率展示" ID="pl013007" STYLE="fork"/>
    </node>
    <node TEXT="UI与文案" ID="pl014" STYLE="bubble" POSITION="right">
      <node TEXT="MYR金额统一显示RM符号，USD金额显示原USD符号或文案" ID="pl014001" STYLE="fork"/>
      <node TEXT="币种切换按钮文案、选中态、禁用态展示正确" ID="pl014002" STYLE="fork"/>
      <node TEXT="汇率横幅免责声明支持中英文或现有国际化机制，英文环境展示正确" ID="pl014003" STYLE="fork"/>
      <node TEXT="金额列宽、卡片价格区域、服务价格区域在RM大金额场景下不换行错乱" ID="pl014004" STYLE="fork"/>
      <node TEXT="鼠标悬停或提示信息如涉及汇率，显示当前生效汇率和非结算金额说明" ID="pl014005" STYLE="fork"/>
      <node TEXT="无MYR配置时，页面不残留MYR、RM、汇率、免责声明相关文案" ID="pl014006" STYLE="fork"/>
    </node>
    <node TEXT="回归范围" ID="pl015" STYLE="bubble" POSITION="right">
      <node TEXT="产品查询、筛选、排序、分页、详情查看能力不受多币种改造影响" ID="pl015001" STYLE="fork"/>
      <node TEXT="库存、配额、MOQ/MTU、服务选择、促销规则、价格校验不受币种切换影响" ID="pl015002" STYLE="fork"/>
      <node TEXT="加入购物车、继续选品、返回列表、清空条件等既有操作正常" ID="pl015003" STYLE="fork"/>
      <node TEXT="不同浏览器或不同语言环境下，产品列表金额展示和切换逻辑一致" ID="pl015004" STYLE="fork"/>
      <node TEXT="用户无产品查看权限、无价格查看权限时，多币种展示不绕过原权限控制" ID="pl015005" STYLE="fork"/>
    </node>
  </node>
</map>
