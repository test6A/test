
<map>
  <node ID="root" TEXT="多币种配置模块">
    <node TEXT="入口：Admin后台→系统管理→多币种配置" ID="4d70cd129b84bb145448290a0a40f3f4" STYLE="bubble" POSITION="right"/>
    <node TEXT="仅系统管理员、财务配置管理员或指定运营角色可新增、编辑、启停配置。" ID="c5e286b2ae788251e1207575ab3e4312" STYLE="bubble" POSITION="right"/>
    <node TEXT="列表上方显示按钮：新增国家配置，点击右侧显示“新增国家配置”弹窗" ID="428aa45f2f252fd4facfbb167a4ec5b9" STYLE="bubble" POSITION="right"/>
    <node TEXT="列表头包含：国家名称、国家编码、结算币种、展示币种、币种符号、汇率数据源、波动阈值、缓冲天数、精度、状态、最后修改时间、操作" ID="5618055c874da14f625715efd886061f" STYLE="bubble" POSITION="right"/>
    <node TEXT="国家名称、国家编码、结算币种、展示币种、币种符号、汇率数据源、波动阈值、缓冲天数、精度" ID="49a7ba0bf27f780ebd6f5ce609b88910" STYLE="bubble" POSITION="right">
      <node TEXT="回显新增/编辑页维护的字段，只读字段" ID="961faf2ae9d3b7422b1d2081a8454f5b" STYLE="fork"/>
    </node>
    <node TEXT="状态" ID="f215480cc41a674d68f3947442119026" STYLE="bubble" POSITION="right">
      <node TEXT="回显新增/编辑页维护的状态，可以再次编辑" ID="1fba05b3a97a7f352bea3e77a23b08cc" STYLE="fork"/>
      <node TEXT="启用时显示红色打开样式，停用显示灰色关闭样式" ID="e425bd9b4181c35d656533bd384bba34" STYLE="fork"/>
      <node TEXT="启用时，操作停用，有二次确认弹窗" ID="49d058c53d9edac355106e2673f14e2d" STYLE="fork"/>
      <node TEXT="弹窗显示文案：启用后该国家（马来西亚）用户将看到 MYR 参考价格展示，是否确认？" ID="f6f07820e9d28c50f0c387132b4ed9ea" STYLE="fork"/>
      <node TEXT="停用时，操作启用，有二次确认弹窗" ID="08c3790c02a6c2437e56954d4fd86631" STYLE="fork"/>
      <node TEXT="弹窗显示文案：停用后该国家（马来西亚）用户将不再看到 MYR 参考价格，是否确认？" ID="a83b0b3013a5300c9ff3c12fe9729ab3" STYLE="fork"/>
      <node TEXT="点击取消按钮，状态保持不变" ID="1f2210dbfce1db2f51f6d8ddf4582fff" STYLE="fork"/>
      <node TEXT="点击确认按钮后关闭弹窗，状态更新正确" ID="e9728940ae6b38c45b6f1a9efcc1c69a" STYLE="fork"/>
      <node TEXT="国家显示本条数据维护的国家名称" ID="afae615812ebe3dbd2bf0b9c89f7eb74" STYLE="fork"/>
      <node TEXT="币种显示本条数据维护的展示币种" ID="9aafe90772de057f5a06d7f504477315" STYLE="fork"/>
      <node TEXT="从编辑弹窗修改展示币种后，再次操作启用/停用，查看二次确认弹窗提示文案显示币种更新正确" ID="0b6af59da85242e52f9035dca3a29ea1" STYLE="fork"/>
      <node TEXT="修改状态生效后，查看前台各个涉及页面是否显示汇率横幅正确" ID="3ed3d572f93243c01b1b959619244616" STYLE="fork"/>
    </node>
    <node TEXT="最后修改时间" ID="0052e79ec2f7dc2e3eebb1de5808d945" STYLE="bubble" POSITION="right">
      <node TEXT="首次添加显示，添加成功的时间" ID="256b8ed01b5e9bd9cef06bc660b035e5" STYLE="fork"/>
      <node TEXT="格式显示为：年年年年-月月-日日 时时:分分:秒秒" ID="c9c58ff6a4f085a90a64d6ea51231dfc" STYLE="fork"/>
      <node TEXT="从编辑弹窗修改并保存后，验证更新正确" ID="f412e5a62c9fe1cc3a15b4d7dc6c6579" STYLE="fork"/>
      <node TEXT="操作启用/停用后，最后修改时间更新" ID="08d558603aad0c784508f8d4457651f1" STYLE="fork"/>
      <node TEXT="多次修改后，验证更新正确" ID="0ba56565bde02e949c47b9a9ca256227" STYLE="fork"/>
    </node>
    <node TEXT="操作" ID="218bec8942e0b74c6fc2477cc1977b01" STYLE="bubble" POSITION="right">
      <node TEXT="显示编辑按钮，点击右侧显示“编辑国家配置”弹窗" ID="7f17966181d19d71dc33f4b221dca04c" STYLE="fork"/>
    </node>
    <node TEXT="新增国家配置" ID="cac1fe039f1cb6497a9f192cc286e2b0" STYLE="bubble" POSITION="right">
      <node TEXT="弹窗标题置顶加粗靠左显示：新增国家配置" ID="d3d044b23a58a3760b906eca67876f59" STYLE="fork"/>
      <node TEXT="共由5个小模块组成，模块名称置顶加粗靠左显示" ID="811ded1963b1cacb2fd04f4fd16ec9de" STYLE="fork"/>
      <node TEXT="显示：取消、保存、X按钮。保存按钮红色高亮显示" ID="60b716cac14c87f335a6cea4c7488968" STYLE="fork"/>
      <node TEXT="基础信息" ID="ca1807e6a0008eb20b5c2158712c6970" STYLE="fork">
        <node TEXT="*国家" ID="1543cdad429efc6697d2a6d338559959" STYLE="fork">
          <node TEXT="默认显示：请选择国家" ID="e0a042141e5ee41af9831d07ce43532f" STYLE="fork"/>
          <node TEXT="下搜索框，支持模糊/精确查询并选中国家" ID="4b2fcb6e9073086ba663c9bc6e2c2f34" STYLE="fork"/>
          <node TEXT="数据源：国家主数据" ID="40070ef91ff8164f7307304cb8753de5" STYLE="fork"/>
          <node TEXT="下拉项显示国家中文（国家英文），如：马来西亚(Malaysia)" ID="a196924be054a8d23968b0ee75572c6c" STYLE="fork"/>
          <node TEXT="仅支持单选，选择成功，回显正确" ID="10f1a4ca9c8accdfa68cbdce25cc1613" STYLE="fork"/>
          <node TEXT="多次切换下拉选中项，选择成功，回显正确" ID="055ee8160a5c0e326d5edb7d2b8b47c8" STYLE="fork"/>
          <node TEXT="已选中任意项后，末尾有删除按钮，点击清空已选项" ID="5ce38f121e18f7a9c24ef8c8055315c2" STYLE="fork"/>
          <node TEXT="查看已选中项，高亮显示" ID="36b224d9da25bb63639aad3872e84f85" STYLE="fork"/>
          <node TEXT="可以不区分字母大小写，展示所有匹配数据" ID="3a11fa4407438809c7a27c5e11391676" STYLE="fork"/>
          <node TEXT="必填为空，有必填提示" ID="9d8c7b261741178858b4229221275190" STYLE="fork"/>
        </node>
        <node TEXT="国家编码" ID="dd892db58177e27a418d044ff584fa79" STYLE="fork">
          <node TEXT="默认为空，置灰不可编辑，选中国家后，自动带出" ID="53bf696050b91165737993aa64130a65" STYLE="fork"/>
          <node TEXT="数据源：国家主数据" ID="369ae2cd181874dc01c043b7bdf70162" STYLE="fork"/>
          <node TEXT="多次切换国家选中项，查看国家编码联动回显正确" ID="766fc61797b8053eeaf784e533521187" STYLE="fork"/>
          <node TEXT="国家清空后，自动转为默认状态" ID="a8d0fcdbfe48210224a786d6a0664563" STYLE="fork"/>
        </node>
        <node TEXT="结算币种" ID="959f7537ca884b596e37d469d029eddb" STYLE="fork">
          <node TEXT="固定显示为USD，置灰不可编辑" ID="db4018ce11cb9540c3e9243af0c79892" STYLE="fork"/>
        </node>
        <node TEXT="*展示币种" ID="ca2fecb2738c313c34d6990eeb78176e" STYLE="fork">
          <node TEXT="默认显示：请选择展示币种" ID="a7df291accc19945475bc379501361a6" STYLE="fork"/>
          <node TEXT="下搜索框，支持模糊/精确查询并选中国家" ID="cd93a03a28ad16cc24c0784a6f865a4e" STYLE="fork"/>
          <node TEXT="数据源：" ID="e120662d01bdcc776bd4f453a5091ff2" STYLE="fork"/>
          <node TEXT="下拉项显示币种，如：MYR-马来西亚林吉特" ID="a0c2dd01ded0226244819a74c17e324a" STYLE="fork"/>
          <node TEXT="仅支持单选，选择成功，回显正确" ID="44f61f81e3bae572fc8011d324290028" STYLE="fork"/>
          <node TEXT="多次切换下拉选中项，选择成功，回显正确" ID="339e48aa647431850d29ed5780509d22" STYLE="fork"/>
          <node TEXT="已选中任意项后，末尾有删除按钮，点击清空已选项" ID="e76fd5120c9288a14111a73913335e26" STYLE="fork"/>
          <node TEXT="查看已选中项，高亮显示" ID="3b71cda5e690dd077285093bc5ed9825" STYLE="fork"/>
          <node TEXT="可以不区分字母大小写，展示所有匹配数据" ID="447309307b072b139e70e7c3cb37cbbe" STYLE="fork"/>
          <node TEXT="必填为空，有必填提示" ID="c79b6c92f42855cf87c38eb193acf125" STYLE="fork"/>
        </node>
        <node TEXT="币种符号" ID="edb1a28de3806c0936d49957ba51db1b" STYLE="fork">
          <node TEXT="默认为空，置灰不可编辑，选中展示币种后，自动带出" ID="67df29b9d3483419361bc8afdb65e11f" STYLE="fork"/>
          <node TEXT="数据源：" ID="b51bf7b8b74d7976a66d50a5a8d27fc8" STYLE="fork"/>
          <node TEXT="多次切换展示币种选中项，查看国家编码联动回显正确" ID="55a2fc80c8c783a6915b9cfe2bf42ac1" STYLE="fork"/>
          <node TEXT="展示币种清空后，自动转为默认状态" ID="8f8ec77910b2225827d146b02feb8b50" STYLE="fork"/>
        </node>
      </node>
      <node TEXT="汇率规则" ID="471b172d1164b4bdc8971a4fb22c5856" STYLE="fork">
        <node TEXT="*汇率数据源" ID="fb17e82884328e92bbbd2101b69af6c4" STYLE="fork">
          <node TEXT="默认选中：财务月度基准汇率" ID="f01ccaaf17c011ac18dc91a40102fb70" STYLE="fork"/>
          <node TEXT="下拉项显示：财务月度基准汇率、实时汇率API(暂未开放)、手动维护(暂未开放)" ID="f4ddd17af2b8b21a05961536893bc3dc" STYLE="fork"/>
          <node TEXT="实时汇率API(暂未开放)、手动维护(暂未开放)，可见不可选择" ID="309b21d3f7913b5a31e24eca6da1f758" STYLE="fork"/>
          <node TEXT="必填为空，有必填提示" ID="85e51db0b0e443f25dec6e7ada80e3d3" STYLE="fork"/>
        </node>
        <node TEXT="*波动阈值" ID="124cf51065494de4f65b901d25bd8fbe" STYLE="fork">
          <node TEXT="字段后默认显示灰色字体的文案：超过此百分比触发预警" ID="8b368dd6829a69a6cac8ac41e2e641df" STYLE="fork"/>
          <node TEXT="数字输入框，默认显示：3，支持再次修改，范围范围0.1到50" ID="6819af59cf0a5c93365c0a1d6c3e0254" STYLE="fork"/>
          <node TEXT="数字输入框后，显示：%" ID="b05d62851512ef53ce42ed4ec71bc264" STYLE="fork"/>
          <node TEXT="粘贴/输入超过50的数字，显示50" ID="53e5a5d77d6ce0c604756734f33357e1" STYLE="fork"/>
          <node TEXT="粘贴/输入低于0.1的数字，显示0.1" ID="33182b38f6814cc5454d5181f57bd8a0" STYLE="fork"/>
          <node TEXT="粘贴/输入0.1到50的数字，正常显示" ID="5f390e5e81c3bea7a052d3e569f74f64" STYLE="fork"/>
          <node TEXT="输入或粘贴非数字，不能输入" ID="0678d690a5611e3e67620c78f5c25150" STYLE="fork"/>
          <node TEXT="点击输入框右侧上下键，可以增加/减少数值，每次0.1" ID="87a03bbc176832a4fb7442d2ffe07c89" STYLE="fork"/>
          <node TEXT="必填为空，有必填提示" ID="38bfd3c5f6e4b7a7b6b0052434b9bb4c" STYLE="fork"/>
        </node>
        <node TEXT="*缓冲天数" ID="7a14b7511e4b575dfd695f934a2da632" STYLE="fork">
          <node TEXT="字段后默认显示灰色字体的文案：超阈值后新汇率延迟生效" ID="50c170ad42dc8287f5d815bf337b754d" STYLE="fork"/>
          <node TEXT="数字输入框，默认显示：7，支持再次修改，范围范围范围1到30" ID="ac8cef42777a13bb9cc8411506ec37a9" STYLE="fork"/>
          <node TEXT="数字输入框后，显示：天" ID="32894315c95f2416764bc3ee89d1c011" STYLE="fork"/>
          <node TEXT="粘贴/输入超过30的数字，显示30" ID="511183a24f9bdee027d2ae4cd339ae97" STYLE="fork"/>
          <node TEXT="粘贴/输入低于1的数字，显示1" ID="16e400d68a6b95f256d5926edfdac86f" STYLE="fork"/>
          <node TEXT="粘贴/输入1到30的数字，正常显示" ID="10ab0492d0980c80b665988c18321f04" STYLE="fork"/>
          <node TEXT="输入或粘贴非数字，不能输入" ID="e6ff73d02766cd162dae585b0b4397dc" STYLE="fork"/>
          <node TEXT="点击输入框右侧上下键，可以增加/减少数值，每次1" ID="457c06be98b6219142e39d42bbbe0f3b" STYLE="fork"/>
          <node TEXT="必填为空，有必填提示" ID="e3f603f89bbb4bb348ddfac79c14ec57" STYLE="fork"/>
        </node>
        <node TEXT="*展示精度" ID="6f05809c4bb098c7174a7c4f8de47dbe" STYLE="fork">
          <node TEXT="字段后默认显示灰色字体的文案：金额小数位数" ID="25651f653dc209c803d73951ba6d3315" STYLE="fork"/>
          <node TEXT="数字输入框，默认显示：2，支持再次修改，范围范围范围0到4" ID="b1bc1ad0615c474828f30df35fe59b01" STYLE="fork"/>
          <node TEXT="数字输入框后，显示：位小数" ID="8dfacc7b7b12288b9a0dae5a12980ee8" STYLE="fork"/>
          <node TEXT="粘贴/输入超过4的数字，显示4" ID="b0b84da3046a8499785df05504946f85" STYLE="fork"/>
          <node TEXT="粘贴/输入低于0的数字，显示0" ID="924a2a13b8a68e80bc04bc56c86e2569" STYLE="fork"/>
          <node TEXT="粘贴/输入0到4的数字，正常显示" ID="a9f33c6d272687df25bc515eef7c32eb" STYLE="fork"/>
          <node TEXT="输入或粘贴非数字，不能输入" ID="70e4ac2a9a4b477ff71c62afe5c611cd" STYLE="fork"/>
          <node TEXT="点击输入框右侧上下键，可以增加/减少数值，每次1" ID="895c0abedd893c8a920fc2bd83f91fcd" STYLE="fork"/>
          <node TEXT="必填为空，有必填提示" ID="c70ab6c5619acfb397714b6c959975ea" STYLE="fork"/>
        </node>
      </node>
      <node TEXT="预警邮件接收人" ID="e147106c828e76d0d08632319e3a5063" STYLE="fork">
        <node TEXT="预警邮件接收人" ID="c411742caff62dcf70bd2c2de4fe8126" STYLE="fork">
          <node TEXT="默认显示：输入邮箱后回车添加" ID="78c15a7f2feca9c75e2700831ab4d8c7" STYLE="fork"/>
          <node TEXT="维护1/多个邮箱，显示正确，且触发邮件后，查看收件人和配置一致" ID="0cd6bd08cfcdc20ddaa8f0c96a7b498e" STYLE="fork"/>
          <node TEXT="多次修改邮箱后，查看更新回显正确，且触发邮件后，查看收件人和配置一致" ID="2169888b5392a27063b5703650e13612" STYLE="fork"/>
          <node TEXT="必填为空，有必填提示" ID="919a78861d855b87406ee2c270144eb5" STYLE="fork"/>
          <node TEXT="非必填项，验证为空不卡必填" ID="1df55725855e8665450d5153ba5eb905" STYLE="fork"/>
          <node TEXT="正式系统建议替换为人员选择器。" ID="e4cb2c2468125b18ccf10d770c938a57" STYLE="fork"/>
        </node>
        <node TEXT="*免责声明（中文）" ID="f66a215981eec09cf2ec7cd813dbeec4" STYLE="fork">
          <node TEXT="默认显示：请输入中文免责声明文案" ID="2cbeb1be96daa52fc35d53797c48b848" STYLE="fork"/>
          <node TEXT="必填为空，有必填提示" ID="9eaff23572fe5b42e94dc988caa7a58e" STYLE="fork"/>
          <node TEXT="长度类型不做限制" ID="71ef7b1e7b0037afb895f833561e209f" STYLE="fork"/>
          <node TEXT="输入框右下角显示缩放器，验证点击拉伸，文本框拉长/缩小正确，文字显示正确" ID="c693e352b4d80b197299f6c34978ec2d" STYLE="fork"/>
          <node TEXT="输入框内，文字过多时，上下滑动显示正确" ID="9ba5df4488430c640169fff6cc0255a7" STYLE="fork"/>
        </node>
        <node TEXT="*免责声明（英文）" ID="6284b4f8c5c997330f7f6880dd75066d" STYLE="fork">
          <node TEXT="默认显示：请输入英文免责声明文案" ID="224dcc98d0d0d29c77aa885ef661b2de" STYLE="fork"/>
          <node TEXT="必填为空，有必填提示" ID="755d5dc64b4087243c151f819cccdb70" STYLE="fork"/>
          <node TEXT="长度类型不做限制" ID="5dbbd00d65053d41b1c5516b11fa1ca2" STYLE="fork"/>
          <node TEXT="输入框右下角显示缩放器，验证点击拉伸，文本框拉长/缩小正确，文字显示正确" ID="7a7c1592c6d59121fc7261121b4ab887" STYLE="fork"/>
          <node TEXT="输入框内，文字过多时，上下滑动显示正确" ID="b4f8dd0e74dab923a53217b73caf32cd" STYLE="fork"/>
        </node>
      </node>
      <node TEXT="状态" ID="78ccc2563a579c67ee17c82e823a3699" STYLE="fork">
        <node TEXT="默认显示停用状态" ID="5723b2f9eca7898f70b39c4d9e5fdcac" STYLE="fork"/>
        <node TEXT="启用时显示红色打开样式，停用显示灰色关闭样式" ID="f70bee5f6c27defea4457d483107100a" STYLE="fork"/>
        <node TEXT="操作启用/停用，查看显示正确" ID="843b33162ef4a38a6d771c0e3ba91319" STYLE="fork"/>
        <node TEXT="多次操作启用/停用，查看显示正确" ID="3808b735bb7f536abb5cd25091e6831d" STYLE="fork"/>
      </node>
      <node TEXT="取消" ID="945383286a3e798f1b2c893974579cab" STYLE="fork">
        <node TEXT="点击x按钮/取消按钮，关闭弹窗，不保存已输入的内容" ID="c3a144021ca2219fc4ca45ed000712e1" STYLE="fork"/>
      </node>
      <node TEXT="保存" ID="6c07ef4b0ba385c05f3e6cfef273f7d4" STYLE="fork">
        <node TEXT="正确填写所有信息时，点击保存按钮，弹窗关闭，数据回显至列表中" ID="6aacd8f1dae542100a1fa48cd3b6a691" STYLE="fork"/>
        <node TEXT="必填选项未填写时，标红未填项并提示，不关闭弹窗" ID="e40030dc39265953d00a3de6674a43b0" STYLE="fork"/>
        <node TEXT="必填项填写完成，非必填项未填写时，点击按钮提交成功" ID="e13986cce4820f255846dc0d3745ad85" STYLE="fork"/>
        <node TEXT="保存成功后，有保存成功的提示" ID="aab65fa65a805204f38e5742e1884c13" STYLE="fork"/>
        <node TEXT="红色高亮按钮显示" ID="45b8e43dd576733df69b74d10a9e8e80" STYLE="fork"/>
        <node TEXT="多次点击，有防连点" ID="4a83af9cda01ff78e11af0f6d34d7049" STYLE="fork"/>
        <node TEXT="选择已存在的国家，保存报错，同一国家仅允许一条当前配置" ID="7c78c287df65de0cda405211a9cdfa75" STYLE="fork"/>
      </node>
      <node TEXT="所有新增、编辑、启停、汇率人工修正和通知人变更需记录操作人、时间、前后值。" ID="2433afe3bf341e49fc8a6c173fce6917" STYLE="fork"/>
    </node>
    <node TEXT="编辑国家配置" ID="97c2920e1606590bff07e286c424e4ba" STYLE="bubble" POSITION="right">
      <node TEXT="弹窗标题置顶加粗靠左显示：编辑国家配置" ID="3be546803052b6b13edfdef8f7d0db4a" STYLE="fork"/>
      <node TEXT="基础信息" ID="de1a47104edc8a26b305d5eb1a6ca82a" STYLE="fork">
        <node TEXT="展示币种" ID="899eb3fa706a33015b298f5fe9931a54" STYLE="fork">
          <node TEXT="回显新增时维护的字段，可以再次修改，逻辑同添加弹窗" ID="15ae9d0ceb753dc0004553c94a446d19" STYLE="fork"/>
        </node>
        <node TEXT="    " ID="0b6b41351614882802286982d6fbed79" STYLE="fork"/>
        <node TEXT="国家、国家编码、结算币种" ID="a9d1260e779ccd4a9adbddcb918c236f" STYLE="fork">
          <node TEXT="回显新增时维护的字段，置灰只读字段" ID="d50525494d42697e87a58b2128eefb9a" STYLE="fork"/>
        </node>
      </node>
      <node TEXT="汇率规则" ID="a8fe1ed1aa94e0b9583e6a02f1f76443" STYLE="fork">
        <node TEXT="回显新增时维护的字段，可以再次修改，逻辑同添加弹窗" ID="1fe92739393592a6266bf3fe36d08765" STYLE="fork"/>
      </node>
      <node TEXT="通知与声明" ID="359b8d9e62479646588d021f4295990c" STYLE="fork">
        <node TEXT="预警邮件接收人、*免责声明（中文）、*免责声明（英文）" ID="4f562cbb76f60aa47d951b898b8bac9e" STYLE="fork">
          <node TEXT="回显新增时维护的字段，可以再次修改，逻辑同添加弹窗" ID="9b1a6f76edbd2df07095ea56fb080fca" STYLE="fork"/>
        </node>
      </node>
      <node TEXT="状态" ID="9277f0bcfad55573b5ac0e234a7da6a7" STYLE="fork">
        <node TEXT="回显新增时维护的字段，可以再次修改，逻辑同添加弹窗" ID="7aadeb7cc3dbbc3727ae400a1292d8ca" STYLE="fork"/>
      </node>
      <node TEXT="取消" ID="b2d94f12101c43f81f8348a960f32c7a" STYLE="fork">
        <node TEXT="点击x按钮/取消按钮，关闭弹窗，不保存已输入的内容" ID="ecb658ce4ce2c91f2c7e9e3db5d8b046" STYLE="fork"/>
      </node>
      <node TEXT="保存" ID="d20e4c1b4da949d1bb5acf284a9389e9" STYLE="fork">
        <node TEXT="正确填写所有信息时，点击保存按钮，弹窗关闭，数据回显至列表中" ID="2e5a528b1e2be8e4dfdf2bef3db364fc" STYLE="fork"/>
        <node TEXT="必填选项未填写时，标红未填项并提示，不关闭弹窗" ID="eff82522fc94a5816969a5b2def89a73" STYLE="fork"/>
        <node TEXT="必填项填写完成，非必填项未填写时，点击按钮提交成功" ID="741367fc1b48b8e9ff11097f80c34785" STYLE="fork"/>
        <node TEXT="保存成功后，有保存成功的提示" ID="e918722dfed81ca0ea41a8d958c438f7" STYLE="fork"/>
        <node TEXT="红色高亮按钮显示" ID="e82ea3d2aad8b06396e179aa05acae51" STYLE="fork"/>
        <node TEXT="多次点击，有防连点" ID="86d0dcbc093b3b351506a99bfcabde7b" STYLE="fork"/>
        <node TEXT="选择已存在的国家，保存报错，同一国家仅允许一条当前配置" ID="fbf26ced4e0cadf692819c5317911e16" STYLE="fork"/>
      </node>
    </node>
  </node>
</map>