<map version="1.0.1">
  <node ID="root" TEXT="BOP返利与结算项目测试点">
    <node ID="scope" TEXT="前置条件与测试范围" STYLE="bubble" POSITION="right">
      <node ID="scope01" TEXT="准备返利管理员、供应链、销售/内部确认人、伙伴主账号、伙伴授权子账号、财务/发放运维及无权限账号" STYLE="fork"/>
      <node ID="scope02" TEXT="准备一级达量返利数据，覆盖整体考核、分开考核、合并/部分考核和未达量渠道" STYLE="fork"/>
      <node ID="scope03" TEXT="准备当前年上一个已结束季度、历史季度、无版本期间及多个历史版本数据" STYLE="fork"/>
      <node ID="scope04" TEXT="准备渠道汇总、考核单元、订单物料明细完全一致及存在汇总差异的数据" STYLE="fork"/>
      <node ID="scope05" TEXT="准备伙伴确认、销售确认、销售后伙伴确认三种确认策略及无策略默认伙伴确认数据" STYLE="fork"/>
      <node ID="scope06" TEXT="准备待推送、待销售确认、待伙伴确认、申诉中、已确认、发放中、已发放、发放失败、待核对状态数据" STYLE="fork"/>
      <node ID="scope07" TEXT="准备CES成功、明确失败、超时、网络中断、重复回调及长时间处理中响应" STYLE="fork"/>
      <node ID="scope08" TEXT="准备正常发放、人工发放、余额扣减、指定来源扣减、冻结账户及已发差异数据" STYLE="fork"/>
      <node ID="scope09" TEXT="本期完整自动化链路仅覆盖一级达量返利" STYLE="fork"/>
      <node ID="scope10" TEXT="二级达量、服务返利、硬件售后返利无正式数据源，入口禁用或仅允许人工发放" STYLE="fork"/>
      <node ID="scope11" TEXT="不测试分批发放、比例发放、最迟发放日期、到期自动发放和申诉金额试算" STYLE="fork"/>
      <node ID="scope12" TEXT="特殊规则仅支持完成率档位系数覆盖，不支持修改任务量、产品线、基础返利比例、订单明细或直接金额" STYLE="fork"/>
      <node ID="scope13" TEXT="预提及推送报账平台属于其他需求，不纳入本次测试范围" STYLE="fork"/>
    </node>

    <node ID="calc" TEXT="返利计算模块" STYLE="bubble" POSITION="right">
      <node ID="calc01" TEXT="页面入口与默认查询" STYLE="fork">
        <node ID="calc0101" TEXT="返利管理员进入页面成功，默认选中达量返利、一级、当前年、上一个已结束季度和当前版本" STYLE="fork"/>
        <node ID="calc0102" TEXT="普通只读角色进入页面时仅展示授权范围，获取、确认版本、推送及撤回按钮不可用" STYLE="fork"/>
        <node ID="calc0103" TEXT="二级达量、服务返利、硬件售后无数据源时入口禁用并显示明确原因" STYLE="fork"/>
        <node ID="calc0104" TEXT="切换年份后季度和版本选项联动刷新，不能残留上一范围数据" STYLE="fork"/>
        <node ID="calc0105" TEXT="选择无正式版本的期间展示空状态，管理员可见获取最新结果入口" STYLE="fork"/>
        <node ID="calc0106" TEXT="刷新页面只读取BOP当前保存版本，不调用数仓获取新结果" STYLE="fork"/>
      </node>
      <node ID="calc02" TEXT="获取最新结果与临时批次" STYLE="fork">
        <node ID="calc0201" TEXT="点击获取最新结果后锁定类型、层级、年份和季度并创建临时同步批次" STYLE="fork"/>
        <node ID="calc0202" TEXT="同一业务范围已有同步任务执行时，再次发起被阻断且不创建重复批次" STYLE="fork"/>
        <node ID="calc0203" TEXT="分阶段展示渠道结果、订单明细、校验、版本比较的处理进度和数量" STYLE="fork"/>
        <node ID="calc0204" TEXT="临时批次确认前不出现在正式版本下拉、确认单和发放流程" STYLE="fork"/>
        <node ID="calc0205" TEXT="尚未进入版本确认时取消任务，临时任务结束且不生成正式版本" STYLE="fork"/>
        <node ID="calc0206" TEXT="上游网络异常或业务失败时显示错误摘要和详情，原正式版本不受影响" STYLE="fork"/>
        <node ID="calc0207" TEXT="上游分页获取结果时校验页间总数和完整成功标志，缺页或总数不一致时阻断" STYLE="fork"/>
      </node>
      <node ID="calc03" TEXT="数据校验" STYLE="fork">
        <node ID="calc0301" TEXT="渠道结果必填字段缺失时同步阻断，不能确认生成版本" STYLE="fork"/>
        <node ID="calc0302" TEXT="渠道业务键重复时同步阻断并定位重复记录" STYLE="fork"/>
        <node ID="calc0303" TEXT="订单物料来源明细键重复时同步阻断并显示原因" STYLE="fork"/>
        <node ID="calc0304" TEXT="数量或关键金额为空、非数字、精度非法时同步阻断" STYLE="fork"/>
        <node ID="calc0305" TEXT="销售负责人为空作为质量提醒；若策略包含销售节点，该渠道推送被阻断" STYLE="fork"/>
        <node ID="calc0306" TEXT="地区或可选明细字段缺失只展示质量提醒，不影响其他合格数据生成版本" STYLE="fork"/>
        <node ID="calc0307" TEXT="渠道正式金额与订单明细汇总不一致时展示质量提醒，BOP不自行覆盖正式金额" STYLE="fork"/>
      </node>
      <node ID="calc04" TEXT="版本生成与快照" STYLE="fork">
        <node ID="calc0401" TEXT="校验通过并由管理员确认后一次性生成不可变正式版本" STYLE="fork"/>
        <node ID="calc0402" TEXT="取消确认时不生成正式版本，当前版本保持不变" STYLE="fork"/>
        <node ID="calc0403" TEXT="新结果与当前版本渠道结果及明细校验和完全一致时提示无变化，不生成空版本" STYLE="fork"/>
        <node ID="calc0404" TEXT="存在渠道金额、考核单元或订单明细变化时生成新版本并正确标识差异类型" STYLE="fork"/>
        <node ID="calc0405" TEXT="正式版本保存渠道结果、考核单元、订单物料、上游发布时间、运营输入摘要和校验结论" STYLE="fork"/>
        <node ID="calc0406" TEXT="正式版本生成后不能编辑、覆盖或删除，历史版本数据保持当时事实" STYLE="fork"/>
        <node ID="calc0407" TEXT="版本确认成功后页面自动切换到新版本，指标、列表和详情均使用同一版本" STYLE="fork"/>
      </node>
      <node ID="calc05" TEXT="指标、筛选与渠道列表" STYLE="fork">
        <node ID="calc0501" TEXT="返利总额、净已发金额、待发金额按币种分别统计，不跨币种直接相加" STYLE="fork"/>
        <node ID="calc0502" TEXT="已发放渠道数、达量渠道数、总渠道数统计正确；达量数为0时进度为0%" STYLE="fork"/>
        <node ID="calc0503" TEXT="伙伴名称/编码、考核方式、达量状态、推送状态、确认状态、发放状态和数据质量筛选正确" STYLE="fork"/>
        <node ID="calc0504" TEXT="重置查询恢复默认业务范围和查询条件" STYLE="fork"/>
        <node ID="calc0505" TEXT="整体考核显示整体任务量、完成率、档位系数和返利金额" STYLE="fork"/>
        <node ID="calc0506" TEXT="分开考核主行显示X/3已达标，展开后SME、SMB、ISP分别展示" STYLE="fork"/>
        <node ID="calc0507" TEXT="合并或部分考核仅展示实际考核单元，不虚构整体完成率或强拆三个产品线" STYLE="fork"/>
        <node ID="calc0508" TEXT="列表金额、状态、版本变化与所选版本一致，切换版本不串数据" STYLE="fork"/>
      </node>
      <node ID="calc06" TEXT="渠道详情与订单物料" STYLE="fork">
        <node ID="calc0601" TEXT="点击伙伴进入详情，展示所选版本的伙伴、期间、类型、层级、版本和发放状态" STYLE="fork"/>
        <node ID="calc0602" TEXT="详情按考核方式展示任务量、发货、豁免、完成率、基础比例、档位系数及返利" STYLE="fork"/>
        <node ID="calc0603" TEXT="特殊档位系数覆盖命中时有明确标识，未命中时展示数仓原系数" STYLE="fork"/>
        <node ID="calc0604" TEXT="切换该伙伴历史版本后结果摘要、考核单元和订单明细同步更新" STYLE="fork"/>
        <node ID="calc0605" TEXT="版本变化仅展示真正发生变化的字段、金额差额和明细增删改" STYLE="fork"/>
        <node ID="calc0606" TEXT="订单明细支持订单、物料、产品线和规则关键词搜索" STYLE="fork"/>
        <node ID="calc0607" TEXT="订单明细分页每页20行，切页和滚动过程中数据不重复、不遗漏" STYLE="fork"/>
        <node ID="calc0608" TEXT="订单明细导出严格使用当前伙伴、版本和搜索条件，数量及金额与页面一致" STYLE="fork"/>
        <node ID="calc0609" TEXT="普通发货、退货和豁免行按业务类型标识，豁免金额独立展示" STYLE="fork"/>
      </node>
      <node ID="calc07" TEXT="选择口径、推送与撤回" STYLE="fork">
        <node ID="calc0701" TEXT="单伙伴推送弹窗展示全部可用历史版本、金额、发布时间、相对最新版本差额、确认策略和确认人" STYLE="fork"/>
        <node ID="calc0702" TEXT="默认选中当前列表版本，选择历史版本必须填写原因" STYLE="fork"/>
        <node ID="calc0703" TEXT="历史版本推送成功后，列表、确认详情和审计均标识历史口径" STYLE="fork"/>
        <node ID="calc0704" TEXT="批量推送统一使用当前列表版本，不为不同伙伴自动选择不同版本" STYLE="fork"/>
        <node ID="calc0705" TEXT="批量预览正确统计可推送、被阻断及已有确认单数量，执行后逐条返回结果" STYLE="fork"/>
        <node ID="calc0706" TEXT="推送成功冻结版本、金额、币种、确认策略、销售和额外确认人快照" STYLE="fork"/>
        <node ID="calc0707" TEXT="推送后修改主数据或确认策略，已生成确认单的冻结口径不变化" STYLE="fork"/>
        <node ID="calc0708" TEXT="最终确认前管理员填写原因可撤回，记录恢复待推送并保留撤回历史" STYLE="fork"/>
        <node ID="calc0709" TEXT="申诉中撤回时结束未完成申诉并保留历史" STYLE="fork"/>
        <node ID="calc0710" TEXT="已确认、发放中、已发放或结果未知记录撤回被前后端共同阻断" STYLE="fork"/>
        <node ID="calc0711" TEXT="重复推送、并发推送或快速连点不生成重复确认单" STYLE="fork"/>
      </node>
    </node>

    <node ID="rules" TEXT="返利规则与豁免模块" STYLE="bubble" POSITION="right">
      <node ID="rules01" TEXT="豁免模板与上传" STYLE="fork">
        <node ID="rules0101" TEXT="供应链角色可进入豁免管理并下载当前版本增量模板及填写说明" STYLE="fork"/>
        <node ID="rules0102" TEXT="非供应链及无权限角色不能上传、修订或停用豁免记录" STYLE="fork"/>
        <node ID="rules0103" TEXT="上传正确Excel后创建批次和原始行，上传成功不等待数仓匹配" STYLE="fork"/>
        <node ID="rules0104" TEXT="文件类型、大小、表头、必填字段、期间和字段格式错误时逐行提示" STYLE="fork"/>
        <node ID="rules0105" TEXT="文件内重复数据正确识别，不重复新增" STYLE="fork"/>
        <node ID="rules0106" TEXT="与历史有效或已失效记录完全重复时不新增并统计为重复" STYLE="fork"/>
        <node ID="rules0107" TEXT="同业务键内容变化时形成新修订，不覆盖旧记录" STYLE="fork"/>
        <node ID="rules0108" TEXT="新增、重复、修订和失败数量统计准确，错误可定位到原文件行" STYLE="fork"/>
        <node ID="rules0109" TEXT="上传接口失败或重复提交时保留用户选择，避免生成重复批次" STYLE="fork"/>
      </node>
      <node ID="rules02" TEXT="豁免匹配、状态与历史" STYLE="fork">
        <node ID="rules0201" TEXT="本地校验通过后状态为系统校验中，不提前标记数仓匹配成功" STYLE="fork"/>
        <node ID="rules0202" TEXT="数仓订单明细回传关联标识及来源校验和一致时更新为已匹配" STYLE="fork"/>
        <node ID="rules0203" TEXT="关联标识缺失或校验和不一致时保持未匹配并显示原因" STYLE="fork"/>
        <node ID="rules0204" TEXT="刷新校验结果只读取正式订单结果并更新匹配状态，不重新上传或修改原始事实" STYLE="fork"/>
        <node ID="rules0205" TEXT="后续正常发货后发货状态正确更新，历史豁免金额不被清零" STYLE="fork"/>
        <node ID="rules0206" TEXT="豁免影响完成率口径但不直接增加返利发放基数" STYLE="fork"/>
        <node ID="rules0207" TEXT="渠道、产品线等数仓补全字段未返回时不伪造数据，以等待状态展示" STYLE="fork"/>
        <node ID="rules0208" TEXT="停用原始记录必须填写原因，只影响后续数仓抽取，不回写历史计算版本" STYLE="fork"/>
        <node ID="rules0209" TEXT="列表可查看原始行、修订版本、上传人、时间、匹配、发货和计算有效性" STYLE="fork"/>
      </node>
      <node ID="rules03" TEXT="确认主体策略" STYLE="fork">
        <node ID="rules0301" TEXT="返利管理员可新增伙伴确认、销售确认、销售后伙伴确认策略" STYLE="fork"/>
        <node ID="rules0302" TEXT="伙伴通过渠道主数据模糊搜索选择，伙伴名称和编码联动且不可自由输入不一致值" STYLE="fork"/>
        <node ID="rules0303" TEXT="未配置策略的伙伴推送时默认使用伙伴确认" STYLE="fork"/>
        <node ID="rules0304" TEXT="需要销售节点时自动解析负责销售，销售为空或账号无效时阻断推送" STYLE="fork"/>
        <node ID="rules0305" TEXT="按权限增加额外内部确认人后，确认人快照和节点顺序正确" STYLE="fork"/>
        <node ID="rules0306" TEXT="同一伙伴、返利类型的生效期间重叠时保存被阻断并提示冲突记录" STYLE="fork"/>
        <node ID="rules0307" TEXT="编辑已启用策略生成新修订，不覆盖原修订" STYLE="fork"/>
        <node ID="rules0308" TEXT="修改或停用策略只影响后续推送，已推送确认单继续使用旧快照" STYLE="fork"/>
        <node ID="rules0309" TEXT="详情展示当前值、历史修订、生效范围和命中确认单数量" STYLE="fork"/>
      </node>
      <node ID="rules04" TEXT="完成率档位系数特殊规则" STYLE="fork">
        <node ID="rules0401" TEXT="仅一级达量返利且存在正式结果版本时可新建特殊规则" STYLE="fork"/>
        <node ID="rules0402" TEXT="选择伙伴和期间后仅加载该版本真实考核单元" STYLE="fork"/>
        <node ID="rules0403" TEXT="只能选择0、0.6、0.8、1.0四个覆盖系数" STYLE="fork"/>
        <node ID="rules0404" TEXT="任意小数、直接返利金额、任务量、产品线、基础比例和订单调整入口不存在或被拒绝" STYLE="fork"/>
        <node ID="rules0405" TEXT="提交审批前原因必填，可关联申诉编号和附件" STYLE="fork"/>
        <node ID="rules0406" TEXT="草稿、待审批、已通过、已驳回、已停用状态流转正确" STYLE="fork"/>
        <node ID="rules0407" TEXT="审批通过时同一业务范围仅保留一条当前有效投影" STYLE="fork"/>
        <node ID="rules0408" TEXT="替换规则时原子停用旧投影并启用新投影，不出现两条同时有效" STYLE="fork"/>
        <node ID="rules0409" TEXT="停用后数仓下次复算不再取覆盖值，历史计算版本和审批历史不变" STYLE="fork"/>
        <node ID="rules0410" TEXT="规则命中时数仓使用覆盖系数，未命中时使用原档位系数" STYLE="fork"/>
      </node>
      <node ID="rules05" TEXT="异常审批与申诉处理" STYLE="fork">
        <node ID="rules0501" TEXT="异常审批列表默认筛选待审批，编号、伙伴、说明和状态查询正确" STYLE="fork"/>
        <node ID="rules0502" TEXT="详情展示申诉时冻结金额、口径版本、考核单元、订单、豁免和特殊规则，不随新版本静默变化" STYLE="fork"/>
        <node ID="rules0503" TEXT="查看问题类型、说明、图片和文件附件，附件下载按权限控制并记录访问" STYLE="fork"/>
        <node ID="rules0504" TEXT="审批通过后状态变为已通过待处理，不直接修改确认金额" STYLE="fork"/>
        <node ID="rules0505" TEXT="管理员完成外部调整后可标记处理完成，确认单仍等待数仓复算新版本" STYLE="fork"/>
        <node ID="rules0506" TEXT="审批驳回必须填写对申请方可见的原因，确认单恢复原待确认节点" STYLE="fork"/>
        <node ID="rules0507" TEXT="驳回后申请方可再次发起同类申诉，新旧申诉历史独立保留" STYLE="fork"/>
        <node ID="rules0508" TEXT="申诉详情和确认详情均展示审批状态、最新意见及完整时间线" STYLE="fork"/>
        <node ID="rules0509" TEXT="页面不提供调整后返利金额试算或虚假预估金额" STYLE="fork"/>
        <node ID="rules0510" TEXT="并发审批、停用或处理完成采用版本控制，后提交操作不能覆盖已完成结果" STYLE="fork"/>
      </node>
    </node>

    <node ID="confirm" TEXT="BOP返利确认模块" STYLE="bubble" POSITION="left">
      <node ID="confirm01" TEXT="工作台数据范围" STYLE="fork">
        <node ID="confirm0101" TEXT="返利管理员可查看全量确认单，但不能冒充销售或伙伴完成普通确认" STYLE="fork"/>
        <node ID="confirm0102" TEXT="销售和额外内部确认人仅查看本人负责范围或本人当前节点" STYLE="fork"/>
        <node ID="confirm0103" TEXT="构造伙伴编码、销售编码或确认编号不能扩大服务端授权范围" STYLE="fork"/>
        <node ID="confirm0104" TEXT="无菜单权限、无接口权限或无数据范围时服务端拒绝访问" STYLE="fork"/>
        <node ID="confirm0105" TEXT="摘要数量随角色、期间、类型和状态筛选准确刷新" STYLE="fork"/>
      </node>
      <node ID="confirm02" TEXT="列表、详情与状态" STYLE="fork">
        <node ID="confirm0201" TEXT="待销售确认、待伙伴确认、申诉中、已确认、已发放、全部页签数量正确" STYLE="fork"/>
        <node ID="confirm0202" TEXT="列表金额、版本、负责销售、确认模式、当前节点和推送时间取冻结快照" STYLE="fork"/>
        <node ID="confirm0203" TEXT="点击详情展示冻结结果、考核单元、订单物料、确认进度和申诉历史" STYLE="fork"/>
        <node ID="confirm0204" TEXT="节点步骤条展示处理人、处理时间和当前状态，文案不冲突" STYLE="fork"/>
        <node ID="confirm0205" TEXT="已确认仅表示最终确认完成，CES未成功前不能直接展示已发放" STYLE="fork"/>
        <node ID="confirm0206" TEXT="CES明确失败时业务用户看到发放待处理，管理员可查看错误详情" STYLE="fork"/>
        <node ID="confirm0207" TEXT="CES结果未知时显示发放核对中，不展示成功或重复发放入口" STYLE="fork"/>
      </node>
      <node ID="confirm03" TEXT="确认模式与节点推进" STYLE="fork">
        <node ID="confirm0301" TEXT="伙伴确认模式由伙伴完成确认后才创建发放意图" STYLE="fork"/>
        <node ID="confirm0302" TEXT="销售确认模式由销售完成确认后创建发放意图" STYLE="fork"/>
        <node ID="confirm0303" TEXT="销售后伙伴确认模式中，销售确认只推进到伙伴节点，不触发发放" STYLE="fork"/>
        <node ID="confirm0304" TEXT="销售后伙伴确认模式中，伙伴完成最后节点后才创建发放意图" STYLE="fork"/>
        <node ID="confirm0305" TEXT="非当前节点用户确认请求被拒绝，状态和资金记录均不变化" STYLE="fork"/>
        <node ID="confirm0306" TEXT="重复点击、并发确认或重复请求只推进一次，不生成重复发放意图" STYLE="fork"/>
        <node ID="confirm0307" TEXT="确认前二次确认弹窗展示伙伴、期间、类型和冻结金额" STYLE="fork"/>
      </node>
      <node ID="confirm04" TEXT="内部申诉" STYLE="fork">
        <node ID="confirm0401" TEXT="当前合法确认节点可选择任务量、考核方式、完成率/系数、产品线、豁免或其他发起申诉" STYLE="fork"/>
        <node ID="confirm0402" TEXT="问题说明必填，长度1至1000字，提交失败前保留输入" STYLE="fork"/>
        <node ID="confirm0403" TEXT="附件数量、单个大小和支持格式边界校验正确" STYLE="fork"/>
        <node ID="confirm0404" TEXT="重复点击提交不生成重复申诉，确认单仅进入一次申诉中" STYLE="fork"/>
        <node ID="confirm0405" TEXT="申诉中普通确认按钮和普通发放入口不可用" STYLE="fork"/>
        <node ID="confirm0406" TEXT="驳回后显示驳回原因，恢复原待确认节点且允许再次申诉" STYLE="fork"/>
        <node ID="confirm0407" TEXT="申诉通过后显示已通过待处理，不显示预估金额" STYLE="fork"/>
      </node>
    </node>

    <node ID="partner" TEXT="Partner Center返利确认模块" STYLE="bubble" POSITION="left">
      <node ID="partner01" TEXT="账号与数据范围" STYLE="fork">
        <node ID="partner0101" TEXT="伙伴主账号登录后仅看到自身伙伴的确认任务" STYLE="fork"/>
        <node ID="partner0102" TEXT="拥有返利权限的伙伴子账号可查看、确认和申诉" STYLE="fork"/>
        <node ID="partner0103" TEXT="无返利权限的伙伴子账号不可查看任务或调用确认、申诉接口" STYLE="fork"/>
        <node ID="partner0104" TEXT="内部销售账号仅能切换本人负责伙伴并只读查看，不能代伙伴确认或申诉" STYLE="fork"/>
        <node ID="partner0105" TEXT="浏览器篡改伙伴编码或账号类型不能查看其他伙伴数据" STYLE="fork"/>
        <node ID="partner0106" TEXT="任务仍在销售节点时伙伴端接口不返回，页面不展示等待销售页签或数量" STYLE="fork"/>
      </node>
      <node ID="partner02" TEXT="页面展示" STYLE="fork">
        <node ID="partner0201" TEXT="页面标题、说明和状态使用伙伴视角文案，不出现内部平台术语" STYLE="fork"/>
        <node ID="partner0202" TEXT="待确认、申诉中、已确认、已发放、全部页签和数量正确" STYLE="fork"/>
        <node ID="partner0203" TEXT="列表展示期间、返利类型、冻结金额、伙伴可理解状态和推送时间" STYLE="fork"/>
        <node ID="partner0204" TEXT="伙伴端不展示内部计算版本、确认模式、销售节点、规则编号和数仓技术信息" STYLE="fork"/>
        <node ID="partner0205" TEXT="详情展示结果、考核单元、订单明细、确认进度和申诉历史" STYLE="fork"/>
        <node ID="partner0206" TEXT="英文环境统一使用Partner，日期、按钮和状态国际化正确且不溢出" STYLE="fork"/>
        <node ID="partner0207" TEXT="PC窄屏及移动端适配下列表、弹窗、附件和按钮无重叠或截断" STYLE="fork"/>
      </node>
      <node ID="partner03" TEXT="伙伴确认与申诉" STYLE="fork">
        <node ID="partner0301" TEXT="当前伙伴节点点击确认，二次弹窗展示期间、类型、金额及确认后进入发放流程提示" STYLE="fork"/>
        <node ID="partner0302" TEXT="确认请求提交后按钮加载并防连点，重复操作不重复推进" STYLE="fork"/>
        <node ID="partner0303" TEXT="确认后根据CES结果区分已发放、发放待处理和发放核对中" STYLE="fork"/>
        <node ID="partner0304" TEXT="伙伴申诉问题类型、说明、附件上传、预览、删除和提交正常" STYLE="fork"/>
        <node ID="partner0305" TEXT="申诉提交成功后从待确认进入申诉中，确认按钮不可用" STYLE="fork"/>
        <node ID="partner0306" TEXT="申诉驳回后详情显示驳回原因并恢复待确认，可再次申诉或确认" STYLE="fork"/>
        <node ID="partner0307" TEXT="申诉通过待处理时显示处理状态和意见，不显示虚假调整金额" STYLE="fork"/>
        <node ID="partner0308" TEXT="新版本产生后详情显示新旧金额差异和后续处理状态" STYLE="fork"/>
      </node>
    </node>

    <node ID="issue" TEXT="返利发放与异常运维模块" STYLE="bubble" POSITION="left">
      <node ID="issue01" TEXT="正常自动发放" STYLE="fork">
        <node ID="issue0101" TEXT="最后一个必经确认节点完成后，仅创建一笔原始发放意图和BOP发放单号" STYLE="fork"/>
        <node ID="issue0102" TEXT="确认状态推进和发放意图创建在同一事务内，不能出现已确认但无发放单" STYLE="fork"/>
        <node ID="issue0103" TEXT="发放金额、币种、业务部门和版本取确认冻结口径，发放页不能临时修改" STYLE="fork"/>
        <node ID="issue0104" TEXT="CES明确成功后保存外部返利编号、响应摘要和时间并进入已发放" STYLE="fork"/>
        <node ID="issue0105" TEXT="BOP和Partner Center已发放状态及返利编号一致" STYLE="fork"/>
        <node ID="issue0106" TEXT="同一确认单重复回调、并发请求和连续点击返回同一发放单，不重复入账" STYLE="fork"/>
        <node ID="issue0107" TEXT="接口幂等键和数据库唯一约束共同防止重复发放" STYLE="fork"/>
      </node>
      <node ID="issue02" TEXT="失败、超时与核对" STYLE="fork">
        <node ID="issue0201" TEXT="CES明确失败时状态为发放失败，保存错误码和错误信息" STYLE="fork"/>
        <node ID="issue0202" TEXT="修复明确失败原因后由授权人员显式重试，沿用原业务单和幂等键" STYLE="fork"/>
        <node ID="issue0203" TEXT="CES超时、网络中断或响应不可判断时进入发放核对中，禁止自动重试" STYLE="fork"/>
        <node ID="issue0204" TEXT="发放中超过10分钟被定时任务转为发放核对中" STYLE="fork"/>
        <node ID="issue0205" TEXT="人工核对为CES已发放时填写依据并完成状态和外部编号补录" STYLE="fork"/>
        <node ID="issue0206" TEXT="人工核对确认未发放时填写依据后才允许重试" STYLE="fork"/>
        <node ID="issue0207" TEXT="待核对状态直接调用重试接口被拒绝，不产生新的CES请求" STYLE="fork"/>
      </node>
      <node ID="issue03" TEXT="强制发放" STYLE="fork">
        <node ID="issue0301" TEXT="已推送但长期未确认记录可由有权限管理员强制发放" STYLE="fork"/>
        <node ID="issue0302" TEXT="未推送结果不进入待发放列表，不能绕过选择口径和推送链路发放" STYLE="fork"/>
        <node ID="issue0303" TEXT="强制发放必须填写不少于5个字符的业务原因" STYLE="fork"/>
        <node ID="issue0304" TEXT="申诉中强制发放明确提示将结束申诉" STYLE="fork"/>
        <node ID="issue0305" TEXT="结束申诉和创建发放意图原子完成，申诉和审批历史继续可见" STYLE="fork"/>
        <node ID="issue0306" TEXT="批量强制发放逐条校验状态、伙伴范围和权限，返回成功、失败、跳过原因" STYLE="fork"/>
        <node ID="issue0307" TEXT="批量部分失败时成功记录不回滚，失败记录保留选择便于后续处理" STYLE="fork"/>
      </node>
      <node ID="issue04" TEXT="页面与权限" STYLE="fork">
        <node ID="issue0401" TEXT="待发放与异常列表仅展示需要人工介入的长期未确认、申诉卡点、明确失败和结果未知记录" STYLE="fork"/>
        <node ID="issue0402" TEXT="按伙伴、年份、季度、返利类型、操作状态和日期组合筛选正确" STYLE="fork"/>
        <node ID="issue0403" TEXT="强制发放、失败重试和人工核对为独立权限点，无权限接口调用被拒绝" STYLE="fork"/>
        <node ID="issue0404" TEXT="批量按钮仅在已选记录且用户具备相应权限时启用" STYLE="fork"/>
        <node ID="issue0405" TEXT="所有资金动作有二次确认、加载状态、防连点和逐条结果" STYLE="fork"/>
      </node>
    </node>

    <node ID="manual" TEXT="人工发放、扣减与冻结模块" STYLE="bubble" POSITION="left">
      <node ID="manual01" TEXT="人工兜底发放" STYLE="fork">
        <node ID="manual0101" TEXT="按业务部门和返利类型下载正确模板，目录项由后台配置驱动" STYLE="fork"/>
        <node ID="manual0102" TEXT="上传正确Excel后创建批次并逐行解析，展示有效行、错误行和提示行" STYLE="fork"/>
        <node ID="manual0103" TEXT="伙伴、期间、币种、金额、必填、重复和目录匹配校验准确" STYLE="fork"/>
        <node ID="manual0104" TEXT="存在错误行时不能静默整批执行，可下载带原因的错误文件" STYLE="fork"/>
        <node ID="manual0105" TEXT="确认执行前二次展示有效行数和总金额" STYLE="fork"/>
        <node ID="manual0106" TEXT="同一批次并发执行时仅一个请求取得执行权" STYLE="fork"/>
        <node ID="manual0107" TEXT="逐行保存业务单号、幂等键、原文件、模板版本、CES请求响应、外部编号和状态事件" STYLE="fork"/>
        <node ID="manual0108" TEXT="部分成功时批次正确展示成功数、失败数和可重试范围" STYLE="fork"/>
        <node ID="manual0109" TEXT="未执行批次填写原因可取消，执行中或已执行批次不可取消" STYLE="fork"/>
      </node>
      <node ID="manual02" TEXT="余额扣减与指定来源扣减" STYLE="fork">
        <node ID="manual0201" TEXT="输入伙伴和扣减总额后查询CES可用余额并生成来源分摊预览" STYLE="fork"/>
        <node ID="manual0202" TEXT="预览展示每笔来源返利编号、可用金额、拟扣金额和剩余金额" STYLE="fork"/>
        <node ID="manual0203" TEXT="扣减总额超过CES可用余额时阻断，不生成扣减动作" STYLE="fork"/>
        <node ID="manual0204" TEXT="Excel指定来源扣减校验来源归属、币种、状态、余额、重复和总额" STYLE="fork"/>
        <node ID="manual0205" TEXT="不允许跨伙伴或跨币种分摊扣减" STYLE="fork"/>
        <node ID="manual0206" TEXT="预览令牌绑定伙伴、来源、金额、操作人和过期时间" STYLE="fork"/>
        <node ID="manual0207" TEXT="余额变化、令牌过期或账户冻结时执行被阻断并要求重新预览" STYLE="fork"/>
        <node ID="manual0208" TEXT="扣减成功创建独立资金动作和流水，不修改原返利发放记录" STYLE="fork"/>
      </node>
      <node ID="manual03" TEXT="账户冻结与解冻" STYLE="fork">
        <node ID="manual0301" TEXT="按伙伴冻结返利账户必须填写原因并二次确认" STYLE="fork"/>
        <node ID="manual0302" TEXT="账户冻结后新发放、扣减及扣减预览被阻断" STYLE="fork"/>
        <node ID="manual0303" TEXT="解冻必须填写原因并二次确认，成功后重新校验可恢复操作" STYLE="fork"/>
        <node ID="manual0304" TEXT="重复冻结、重复解冻或状态变化并发操作返回明确结果，不产生错误资金动作" STYLE="fork"/>
        <node ID="manual0305" TEXT="冻结状态、操作人、时间、原因和CES结果进入审计记录" STYLE="fork"/>
      </node>
      <node ID="manual04" TEXT="发放与账户记录" STYLE="fork">
        <node ID="manual0401" TEXT="人工批次记录展示原文件、模板、逐行结果、错误、操作人和时间" STYLE="fork"/>
        <node ID="manual0402" TEXT="确认发放记录展示确认单、冻结版本、发放单号、幂等键和CES外部编号" STYLE="fork"/>
        <node ID="manual0403" TEXT="CES账户记录展示返利入账、扣减和冻结流水，并与BOP单号关联" STYLE="fork"/>
        <node ID="manual0404" TEXT="关键词、操作类型、状态、日期、业务部门和返利类型筛选正确" STYLE="fork"/>
        <node ID="manual0405" TEXT="按当前筛选条件导出，数据范围、数量和金额与页面一致" STYLE="fork"/>
        <node ID="manual0406" TEXT="BOP记录与CES权威流水不一致时标记对账异常，不自动覆盖任一侧" STYLE="fork"/>
      </node>
    </node>

    <node ID="diff" TEXT="已发放差异模块" STYLE="bubble" POSITION="left">
      <node ID="diff01" TEXT="差异生成" STYLE="fork">
        <node ID="diff0101" TEXT="已发放后新版本应发金额变化时，按同一伙伴、类型、层级和期间生成差异单" STYLE="fork"/>
        <node ID="diff0102" TEXT="差异金额等于最新应发金额减净已发金额" STYLE="fork"/>
        <node ID="diff0103" TEXT="净已发金额等于原始发放加成功补发减成功扣减" STYLE="fork"/>
        <node ID="diff0104" TEXT="差异为0时不生成差异单" STYLE="fork"/>
        <node ID="diff0105" TEXT="原确认和原发放记录不被新版本覆盖或修改" STYLE="fork"/>
        <node ID="diff0106" TEXT="新版本到达时旧的待处理、失败或仅预览差异失效，由最新差异替代" STYLE="fork"/>
        <node ID="diff0107" TEXT="存在执行中或待核对差异时阻断同业务范围生成新的可执行差异" STYLE="fork"/>
      </node>
      <node ID="diff02" TEXT="正差异补发" STYLE="fork">
        <node ID="diff0201" TEXT="差异大于0时展示版本变化和补发金额" STYLE="fork"/>
        <node ID="diff0202" TEXT="管理员填写业务原因后创建独立补发意图并调用CES" STYLE="fork"/>
        <node ID="diff0203" TEXT="补发成功后更新净已发金额，原始发放金额和记录不变" STYLE="fork"/>
        <node ID="diff0204" TEXT="补发失败或结果未知分别进入失败处理或人工核对" STYLE="fork"/>
        <node ID="diff0205" TEXT="补发重复点击、并发请求和重复回调不重复入账" STYLE="fork"/>
      </node>
      <node ID="diff03" TEXT="负差异扣回" STYLE="fork">
        <node ID="diff0301" TEXT="差异小于0时生成CES可用返利来源扣回预览" STYLE="fork"/>
        <node ID="diff0302" TEXT="确认来源分摊后执行扣回，金额不超过可用余额" STYLE="fork"/>
        <node ID="diff0303" TEXT="扣回成功后更新净已发金额并形成独立扣减流水" STYLE="fork"/>
        <node ID="diff0304" TEXT="账户冻结、余额变化或预览过期时扣回被阻断并要求重新预览" STYLE="fork"/>
        <node ID="diff0305" TEXT="扣回失败或结果未知进入对应异常处理，原始发放保持不变" STYLE="fork"/>
      </node>
      <node ID="diff04" TEXT="忽略与核对" STYLE="fork">
        <node ID="diff0401" TEXT="管理员可选择业务原因并填写或上传依据忽略不适用的差异" STYLE="fork"/>
        <node ID="diff0402" TEXT="忽略后差异单关闭，决定人、原因和证据永久保留" STYLE="fork"/>
        <node ID="diff0403" TEXT="补发或扣回结果未知时必须人工核对后才可完成或允许重试" STYLE="fork"/>
        <node ID="diff0404" TEXT="无差异处理权限的用户只能查看，不能补发、扣回、忽略或核对" STYLE="fork"/>
      </node>
    </node>

    <node ID="common" TEXT="权限、审计、接口与回归" STYLE="bubble" POSITION="left">
      <node ID="common01" TEXT="权限与越权" STYLE="fork">
        <node ID="common0101" TEXT="页面菜单、按钮、接口权限和数据范围四层校验一致" STYLE="fork"/>
        <node ID="common0102" TEXT="前端隐藏按钮后直接调用接口，服务端仍按角色、伙伴范围和当前状态拒绝" STYLE="fork"/>
        <node ID="common0103" TEXT="批量操作逐条校验权限和数据范围，不能因第一条合法默认整批合法" STYLE="fork"/>
        <node ID="common0104" TEXT="供应链仅维护豁免，不能配置确认策略、审批申诉或执行资金动作" STYLE="fork"/>
        <node ID="common0105" TEXT="销售仅处理本人当前确认节点，不能修改版本、规则或执行资金操作" STYLE="fork"/>
        <node ID="common0106" TEXT="财务/发放运维按独立授权执行人工发放、扣减、冻结、核对和导出" STYLE="fork"/>
      </node>
      <node ID="common02" TEXT="审计与历史事实" STYLE="fork">
        <node ID="common0201" TEXT="版本、金额、原因、附件、操作人、时间和状态事件完整记录" STYLE="fork"/>
        <node ID="common0202" TEXT="每笔资金变化可从业务结果追踪到BOP发放单和CES流水" STYLE="fork"/>
        <node ID="common0203" TEXT="规则、策略、豁免和申诉的新增、修订、审批、停用历史不可覆盖" STYLE="fork"/>
        <node ID="common0204" TEXT="历史季度数据不被最新任务量、产品标签、档位系数或渠道关系覆盖" STYLE="fork"/>
        <node ID="common0205" TEXT="敏感附件地址、CES密钥和完整身份令牌不写入业务日志" STYLE="fork"/>
      </node>
      <node ID="common03" TEXT="接口、并发与异常恢复" STYLE="fork">
        <node ID="common0301" TEXT="数仓渠道结果和订单明细接口请求年份、季度及分页参数正确" STYLE="fork"/>
        <node ID="common0302" TEXT="接口重复返回、乱序返回、空页或部分成功时校验和恢复机制正确" STYLE="fork"/>
        <node ID="common0303" TEXT="确认、申诉、审批、推送、发放、扣减等写操作均有防重和并发控制" STYLE="fork"/>
        <node ID="common0304" TEXT="局部接口失败时保留页面框架和用户输入，支持重试且不污染已成功数据" STYLE="fork"/>
        <node ID="common0305" TEXT="关键异常可按版本号、确认单号、申诉号、发放单号和CES外部编号检索" STYLE="fork"/>
      </node>
      <node ID="common04" TEXT="环境、安全与可观测性" STYLE="fork">
        <node ID="common0401" TEXT="UAT与生产CES地址、凭据、业务编码和写开关按环境隔离" STYLE="fork"/>
        <node ID="common0402" TEXT="资金写开关关闭时页面可只读查询并明确提示原因，不产生CES调用" STYLE="fork"/>
        <node ID="common0403" TEXT="同步失败、发放失败、结果未知、长期处理中、差异积压和对账异常有监控告警" STYLE="fork"/>
        <node ID="common0404" TEXT="附件私有存储，越权下载、过期地址和非法文件访问被拒绝" STYLE="fork"/>
        <node ID="common0405" TEXT="大批量渠道、订单明细、确认单和资金记录下查询、分页、导出及批量操作性能可接受" STYLE="fork"/>
      </node>
      <node ID="common05" TEXT="UI、国际化与基础回归" STYLE="fork">
        <node ID="common0501" TEXT="列表、弹窗、状态标签、金额、日期和错误文案显示完整且口径一致" STYLE="fork"/>
        <node ID="common0502" TEXT="中文和英文切换后Partner用词、日期本地化、按钮宽度和表格布局正确" STYLE="fork"/>
        <node ID="common0503" TEXT="加载、空数据、接口失败、部分成功和无权限状态均有明确页面反馈" STYLE="fork"/>
        <node ID="common0504" TEXT="搜索、筛选、分页、导出、刷新和浏览器前进后退不导致版本或伙伴上下文串联" STYLE="fork"/>
        <node ID="common0505" TEXT="非本期返利类型和既有人工发放、扣减、查询能力回归正常" STYLE="fork"/>
      </node>
      <node ID="common06" TEXT="待联调及重点风险" STYLE="fork">
        <node ID="common0601" TEXT="数仓豁免关联字段回传和档位系数投影抽取需完成联调" STYLE="fork"/>
        <node ID="common0602" TEXT="正常确认到CES完整实发链路需进行UAT真实账户回归" STYLE="fork"/>
        <node ID="common0603" TEXT="确认CES服务端是否支持按BOP业务单号幂等和结果核对" STYLE="fork"/>
        <node ID="common0604" TEXT="已发正差异补发和负差异扣回需进行真实账户回归" STYLE="fork"/>
        <node ID="common0605" TEXT="权限中台资金类权限点、伙伴授权子账号及生产菜单脚本需验收" STYLE="fork"/>
        <node ID="common0606" TEXT="申诉审批人后续可能调整，本期按单人审批验证并保留流程扩展风险" STYLE="fork"/>
      </node>
    </node>
  </node>
</map>
