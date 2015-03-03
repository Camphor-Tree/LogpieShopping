<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@taglib prefix="tag" tagdir="/WEB-INF/tags/" %>

<tag:logpie_common_template>
    <jsp:body>
        <h3>你好, ${AdminName} 欢迎来到Logpie内部管理工具</h3>
        <h4>更新日志：</h4>
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

