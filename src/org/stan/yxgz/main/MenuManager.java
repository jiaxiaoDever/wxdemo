package org.stan.yxgz.main;



import java.io.IOException;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.stan.yxgz.pojo.AccessToken;
import org.stan.yxgz.pojo.Button;
import org.stan.yxgz.pojo.CommonButton;
import org.stan.yxgz.pojo.ComplexButton;
import org.stan.yxgz.pojo.Menu;
import org.stan.yxgz.pojo.ViewButton;
import org.stan.yxgz.util.PropertyUtils;
import org.stan.yxgz.util.YiXinUtil;

public class MenuManager {
	private static Logger logger = LoggerFactory.getLogger(MenuManager.class);

	public static void main(String[] args) throws IOException {
		// TODO Auto-generated method stub

		//String appid = "wx2a74f8196b2017de";
		//String appSecret = "eb6581ea26d85189dab9d7881fa30431";
		
		String	appid =PropertyUtils.getWebServiceProperty("appid");
		String	appSecret =PropertyUtils.getWebServiceProperty("appSecret");
		AccessToken at = YiXinUtil.getAccessToken(appid, appSecret);

		if (null != at) {
			int det = YiXinUtil.deleteMenu(at.getToken());
			if (0 == det) {
				logger.info("删除菜单成功！");
			} else {
				logger.info("菜单删除失败，错误码：" +det);
			}
			
			int res = YiXinUtil.createMenu(getMenu(), at.getToken());

			if (0 == res) {
				logger.info("创建菜单成功！");
			} else {
				logger.info("菜单创建失败，错误码：" + res);
			}

		}

	}

	public static Menu getMenu() {
		
		ViewButton btn11 = new ViewButton();
		btn11.setName("找驾校");
		btn11.setType("view");
		btn11.setUrl("http://html5demo.bringbi.com/reportTree/common.html");
		
		ViewButton btn12 = new ViewButton();
		btn12.setName("找教练");
		btn12.setType("view");
		btn12.setUrl("http://html5demo.bringbi.com/reportTree/common.html");
		
		ViewButton btn13 = new ViewButton();
		btn13.setName("找场地");
		btn13.setType("view");
		btn13.setUrl("http://html5demo.bringbi.com/reportTree/common.html");
		
		ViewButton btn14 = new ViewButton();
		btn14.setName("我要报名");
		btn14.setType("view");
		btn14.setUrl("http://html5demo.bringbi.com/reportTree/common.html");
		
		
		CommonButton btn21 = new CommonButton();
		btn21.setKey("a1");
		btn21.setName("预约教练");
		btn21.setType("click");
		
		CommonButton btn22 = new CommonButton();
		btn22.setKey("a2");
		btn22.setName("预约考试");
		btn22.setType("click");
		
		CommonButton btn23 = new CommonButton();
		btn23.setKey("a3");
		btn23.setName("我的预约");
		btn23.setType("click");
		
		CommonButton btn24 = new CommonButton();
		btn24.setKey("a4");
		btn24.setName("我是教练");
		btn24.setType("click");
		
		ViewButton btn31 = new ViewButton();
		btn31.setName("毕业学员");
		btn31.setType("view");
		btn31.setUrl("http://html5demo.bringbi.com/reportTree/common.html");

		ViewButton btn32 = new ViewButton();
		btn32.setName("考试秘籍");
		btn32.setType("view");
		btn32.setUrl("http://html5demo.bringbi.com/reportTree/common.html");

		ComplexButton mainBtn1 = new ComplexButton();
		mainBtn1.setName("我要学车");
		mainBtn1.setSub_button(new Button[] {btn11,btn12,btn13,btn14 });

		ComplexButton mainBtn2 = new ComplexButton();
		mainBtn2.setName("学车预约 ");
		mainBtn2.setSub_button(new Button[] {btn21, btn22,btn23,btn24});

		ComplexButton mainBtn3 = new ComplexButton();
		mainBtn3.setName("学车互动 ");
		mainBtn3.setSub_button(new Button[] {btn31, btn32});


		Menu menu = new Menu();
		menu.setButton(new Button[] { mainBtn1, mainBtn2 ,mainBtn3});

		return menu;

	}

}




