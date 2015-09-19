<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@taglib prefix="tag" tagdir="/WEB-INF/tags/" %>

<tag:logpie_common_template>
    <jsp:body>
        <h3>你好, ${AdminName} 欢迎来到Logpie内部管理工具 今日汇率：${CurrencyRate}</h3>
        <h4>更新日志：</h4>
        <h5>2015-09-18 版本:Beta 1.16</h5>
        <ol>
        <li>新增了统一的默认404找不到页面</li>
        <li>登陆时，新增信任该设备选项,勾选后,会延长保持登陆的时间</li>
        <li>在订单结算界面，新增了全选按钮</li>
        <li>创建订单时，如果用户档案未选，系统会根据购买者姓名试图自动匹配到用户档案</li>
        </ol>
        <h5>2015-07-19 版本:Beta 1.15</h5>
        <ol>
        <li>重做了财务报表 订单利润历史趋势图的逻辑。现在显示的将是估计利润。（如果已有实际运费，则按实际运费，如没有实际运费 按估计运费）</li>
        <li>修复了订单警告信息的bug</li>
        </ol>
        <h5>2015-07-16 版本:Beta 1.14</h5>
        <ol>
        <li>新增系统设置。可以设置默认的代理，默认的分红百分比</li>
        <li>修正了页面下方的页脚。 使用logpie.com。 年份会自动增量</li>
        <li>开始使用currencylayer.com的汇率API 改成每两小时刷新一次</li>
        </ol>
        <h5>2015-07-08 版本:Beta 1.13</h5>
        <ol>
        <li>修复了备份界面只能显示100条记录的bug</li>
        <li>将创建订单，修改订单，订单管理界面的包裹信息中加入收件人</li>
        <li>在订单结算界面增加 订单分析功能，对于有问题的提单 将显示警告信息</li>
        <li>不再可以修改订单代理利润分红百分比。如果代理人为普通管理员 自动设成0.4。</li>
        <li>订单详情界面将包裹信息设成超链接。可以链接到包裹详情</li>
        </ol>
        <h5>2015-06-18 版本:Beta 1.12</h5>
        <ol>
        <li>支持将订单连接到用户档案，新增和修改订单时都可以连接</li>
        <li>如果订单连接了用户档案，那么订单购买者将会变成一个链接，点击后链接到对应的用户档案</li>
        <li>在搜索界面修改信息后，也将会产生提示消息 来提示是否修改成功</li>
        <li>修正了按购买者筛选后，排序及显示全部订单按钮将会产生错误链接的bug</li>
        <li>修正了在搜索界面修改订单后，会出现错误信息页面的bug</li>
        </ol>
        <h5>2015-06-11 版本:Beta 1.11</h5>
        <ol>
        <li>在导航栏增加了搜索框</li>
        <li>支持根据关键字 搜索订单，包裹和用户档案</li>
        </ol>
        <h5>2015-06-03 版本:Beta 1.18</h5>
        <ol>
        <li>修正了创建订单时，包裹列表显示不正确的bug</li>
        <li>系统改动日志不再显示SQL语句</li>
        <li>财务报表 订单/利润折线图 从12天延长至30天</li>
        <li>订单管理界面显示总营业额</li>
        <li>订单修改界面，普通管理员将不再可以修改一些属性</li>
        <li>修正了系统长期没有订单时，财务报表会出错的bug</li>
        </ol>
        <h5>2015-06-02 版本:Beta 1.17</h5>
        <ol>
        <li>新增客户档案管理，支持新增用户档案,修改用户档案</li>
        <li>用户管理档案界面可以按某一栏排序。（只需点击表头）</li>
        </ol>
        <h5>2015-05-20 版本:Beta 1.16</h5>
        <ol>
        <li>订单修改界面增加了两个快捷按钮，帮助快捷设定用户已付款 以及公司已收账款</li>
        <li>调整了订单修改界面的包裹信息列表</li>
        <li>取消了订单修改界面的数字调节器。（鼠标滚轮滚动不再能修改数字。）</li>
        </ol>
        <h5>2015-05-15 版本:Beta 1.15</h5>
        <ol>
        <li>将定价计算器的利润率计算逻辑改变。增加了利润率计算逻辑说明</li>
        <li>定价计算器缺省指定利润率时将默认使用利润率计算逻辑（10刀以下利润率0.25，30刀以下0.20，其余0.15）</li>
        <li>定价计算器现使用最新的实时汇率</li>
        </ol>
        <h5>2015-05-03 版本:Beta 1.14</h5>
        <ol>
        <li>新增结算历史功能。可以看到过去每次的结算记录。（代理总共汇款，代理利润，公司利润）</li>
        </ol>
        <h5>2015-05-01 版本:Beta 1.13</h5>
        <ol>
        <li>开放订单结算界面给普通管理员</li>
        </ol>
        <h5>2015-04-28 版本:Beta 1.12</h5>
        <ol>
        <li>汇率改成了每小时自动更新而不是每次加载订单管理界面都会刷新。大大加快了订单管理界面的加载速度。</li>
        <li>包裹管理界面增加了可以显示已到包裹的功能</li>
        <li>修复了新增订单会出现两个代理名字的bug</li>
        <li>修复了无法按购买者筛选的bug</li>
        </ol>
        <h5>2015-04-23 版本:Beta 1.11</h5>
        <ol>
        <li>开放了系统改动日志给普通管理员。</li>
        <li>修改了订单管理界面，将售价挪到左侧。 下方增加了关于如何判断订单已结算的用户指导</li>
        <li>修正了订单结算的公式。增加了公式提醒。</li>
        <li>优惠券验证失败后将显示红字信息</li>
        </ol>
        <h5>2015-04-22 版本:Beta 1.10</h5>
        <ol>
        <li>新增了优惠券管理,可以生成优惠券码,验证优惠券码,使用优惠券码</li>
        </ol>
        <h5>2015-04-20 版本:Beta 1.9</h5>
        <ol>
        <li>修复了需要清算订单的逻辑判断</li>
        <li>增加了系统的安全性。阻止跨站脚本，以及html注入</li>
        </ol>
        <h5>2015-04-18 版本:Beta 1.8</h5>
        <ol>
        <li>增加了新的订单属性“已向用户发货”</li>
        <li>清算界面将完全基于“已向用户发货”</li>
        <li>订单是否已结算的逻辑判断增加了“已向用户发货”必须为true的条件</li>
        <li>如果订单已向用户发货 则订单条目的购买者背景色会变成红色</li>
        </ol>
        <h5>2015-04-17 版本:Beta 1.7</h5>
        <ol>
        <li>改进了订单管理界面的排序功能，使界面更清楚</li>
        <li>订单管理界面完全支持筛选 显示全部 以及排序的 各种组合。但筛选条件，排序条件各只能有一个。</li>
        <li>包裹排序功能将没有包裹的排在前面，后面的按包裹号倒序排列</li>
        </ol>
        <h5>2015-04-14 版本:Beta 1.6</h5>
        <ol>
        <li>订单管理界面增加了按包裹排序</li>
        <li>修复了最终利润的计算错误</li>
        </ol>
        <h5>2015-04-08 版本:Beta 1.5</h5>
        <ol>
        <li>系统会每24个小时自动备份数据并上传阿里云存储</li>
        <li>新增了系统备份界面，支持手动备份数据库，显示备份历史</li>
        </ol>
        <h5>2015-04-07 版本:Beta 1.4</h5>
        <ol>
        <li>修正了订单改动界面会将已付国内运费设成0的bug</li>
        <li>新增订单取消了利润百分比，后台逻辑自动处理。默认0.4</li>
        <li>修正了商品修改界面的选择品牌时的多余括号</li>
        </ol>
        <h5>2015-04-05 版本:Beta 1.3</h5>
        <ol>
        <li>在订单清算界面能根据当前选中的订单 计算出代理应付公司多少钱，利润分别是多少</li>
        <li>在订单管理界面和清算界面 修改订单后会回到之前的订单位置</li>
        <li>开放包裹管理界面给普通管理员 普通管理员可以看到含有自己代理订单的包裹信息</li>
        </ol>
        <h5>2015-04-03 版本:Beta 1.2</h5>
        <ol>
        <li>修正了“按浏览器后退键以后不能修改订单”的bug</li>
        <li>订单结算界面 不再显示已结算的订单</li>
        <li>修正了“代理修改订单时会将包裹信息清空”的bug</li>
        <li>修正了“日志信息不记录将包裹改成空的改动”的bug</li>
        </ol>
        <h5>2015-03-29 版本:Beta 1.1</h5>
        <ol>
        <li>包裹管理界面增加了按购买者姓名排序功能</li>
        <li>将包裹管理界面首行字体变大 次行字体变小 颜色变淡</li>
        <li>包裹详情界面增加了快捷键 标记已到。 增加修改按钮</li>
        <li>修正了订单详情界面缺少了订单当时汇率</li>
        </ol>
        <h5>2015-03-28 版本:Beta 1.0</h5>
        <ol>
        <li>普通管理员将只可见自己代理订单的财务报表</li>
        <li>Beta 1.0 发布 开放账号给乔梦颖</li>
        </ol>
        <h5>2015-03-28 版本:Alpha 1.23</h5>
        <ol>
        <li>增加了订单的两个新属性 国内运费以及已付国内运费</li>
        <li>修正了订单是否清算判断逻辑和快捷结算逻辑</li>
        <li>增加了订单管理界面的表格显示宽度</li>
        <li>减小了订单管理界面行距，能显示更多订单</li>
        <li>修正了一些细小的界面bug</li>
        </ol>
        <h5>2015-03-23 版本:Alpha 1.22</h5>
        <ol>
        <li>加快了订单管理界面的加载速度</li>
        <li>当使用筛选条件时，保留了显示全部的功能</li>
        </ol>
        <h5>2015-03-23 版本:Alpha 1.21</h5>
        <ol>
        <li>在订单管理界面，默认只显示未清算的订单。增加了可以显示全部订单的切换按钮</li>
        <li>在包裹管理界面，默认只显示还未到达的包裹。增加了可以显示全部包裹的切换按钮</li>
        <li>支持了在修改订单完毕后，会自动重定向到之前的界面 而不是默认的订单管理界面</li>
        <li>增加了新的系统改动日志, 会记录系统里所有的信息改动。对于包裹和订单，会显示改动注释</li>
        </ol>
        <h5>2015-03-19 版本:Alpha 1.20</h5>
        <ol>
        <li>增加了快速结算界面。该界面只开放给超级管理员</li>
        <li>支持动态获取当日人民币对美元汇率，新建订单时会默认使用当前实时汇率</li>
        </ol>
        <h5>2015-03-18 版本:Alpha 1.19</h5>
        <ol>
        <li>订单管理，包裹管理 整行可点 进入详情</li>
        <li>改变了订单管理界面 栏目的顺序</li>
        <li>订单管理界面增加了新的一行给包裹信息以及备注</li>
        <li>订单管理界面 售价高亮显示 实收账款高亮显示</li>
        <li>包裹详情界面 包裹详情与包裹内所含订单位置对调</li>
        <li>包裹详情界面的订单列表与订单管理界面基本一致</li>
        <li>商品,品牌,图片按字母顺序排列</li>
        </ol>
        <h5>2015-03-12 版本:Alpha 1.18</h5>
        <ol>
        <li>增加了定价计算器功能。定价计算器不需要登录即可访问</li>
        </ol>
        <h5>2015-03-11 版本:Alpha 1.17</h5>
        <ol>
        <li>支持了区分普通管理员和超级管理员的可见内容</li>
        <li>修正了财务报表利润分布图 负数无法显示的bug</li>
        </ol>
        <h5>2015-03-07 版本:Alpha 1.16</h5>
        <ol>
        <li>增加了商品管理界面，支持修改商品信息</li>
        <li>增加了图片管理界面，支持修改图片信息</li>
        <li>增加了品牌管理界面，支持修改品牌信息</li>
        <li>增加了分类管理界面，支持修改分类信息</li>
        </ol>
        <h5>2015-03-06 版本:Alpha 1.15</h5>
        <ol>
        <li>增加了修改账号信息界面</li>
        </ol>
        <h5>2015-03-06 版本:Alpha 1.14</h5>
        <ol>
        <li>在订单管理界面，增加了估计利润/实际利润计算结果</li>
        </ol>
        <h5>2015-03-04 版本:Alpha 1.13</h5>
        <ol>
        <li>增加了订单重量</li>
        <li>在包裹详情界面显示属于该包裹的所有订单</li>
        <li>支持快捷计算运费</li>
        <li>将创建包裹的操作成功信息改为中文</li>
        </ol>
        <h5>2015-03-02 版本:Alpha 1.12</h5>
        <ol>
        <li>修正了不能筛选中文购买者名字的bug</li>
        </ol>
        <h5>2015-03-02 版本:Alpha 1.11</h5>
        <ol>
        <li>将操作成功信息改成中文</li>
        <li>支持显示操作失败信息</li>
        <li>改进了导航栏布局</li>
        <li>在订单管理界面，支持筛选购买者</li>
        <li>在订单管理界面，支持筛选包裹</li>
        <li>在订单管理页面，省略了订单的年份</li>
        <li>在订单管理界面，通过颜色来区分包裹是否已经到达。绿色表示包裹已到达。</li>
        <li>修正了不能将订单包裹修改为空缺的bug</li>
        </ol>
        <h5>2015-03-01 版本:Alpha 1.10</h5>
        <ol>
        <li>增加了包裹管理界面，支持查询所有包裹信息。</li>
        <li>增加了包裹修改界面，支持修改包裹信息。</li>
        </ol>
    </jsp:body>
</tag:logpie_common_template>

