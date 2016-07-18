<%@page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="com.eypg.util.ApplicationListenerImpl"%>
<%
  String _pagetype=request.getParameter("pageType");
  if(_pagetype==null){
	  _pagetype="0";
  }
  //out.println(_pagetype);
  %>
   <!--底部-->
 <footer class="footer">
<div class="footer clearfix" style="display:none;">
    <ul>
        <li class="f_home"><a href="/index.html"<%if("0".equals(_pagetype.trim())){ %> class="hover"<%} %>><i></i><%=ApplicationListenerImpl.sysConfigureJson.getShortName()%></a></li>
        <li class="f_announced"><a href="/lottery/index.html"<%if("1".equals(_pagetype.trim())){ %> class="hover"<%} %>><i></i>最新揭晓</a></li>
        <li class="f_single"><a href="/share/new20.html"<%if("2".equals(_pagetype.trim())){ %> class="hover"<%} %>><i></i>晒单</a></li>
        <li class="f_car"><a id="btnCart" href="/mycart/index.html"<%if("3".equals(_pagetype.trim())){ %> class="hover"<%} %>><i></i>购物车</a></li>
        <li class="f_personal"><a href="/user/index.html"<%if("4".equals(_pagetype.trim())){ %> class="hover"<%} %>><i></i>我的</a></li>
    </ul>
    <script type="text/javascript">var cnzz_protocol = (("https:" == document.location.protocol) ? " https://" : " http://");document.write(unescape("%3Cspan id='cnzz_stat_icon_1259920137'%3E%3C/span%3E%3Cscript src='" + cnzz_protocol + "s4.cnzz.com/z_stat.php%3Fid%3D1259920137%26show%3Dpic' type='text/javascript'%3E%3C/script%3E"));</script>
</div>
</footer>