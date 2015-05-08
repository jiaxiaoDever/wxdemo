package org.stan.yxgz.servlet;

import java.io.File;
import java.net.URLEncoder;
import java.text.MessageFormat;
import java.util.ArrayList;
import java.util.List;

import org.apache.commons.lang.StringUtils;

import org.stan.yxgz.util.HttpCommonUtil;
import org.stan.yxgz.util.MD5;


import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

public class aaa {
	

	public static void main(String [] args){
		
		String json="{\"success\":true,\"title\":\"操作成功\",\"reason\":\"操作成功\",\"result\":{\"openId\":\"微信ID\",\"userId\":\"用户编号\",\"subjectId\":\"用户所考科目编号\",\"subjectName\":\"用户所考科目名称\",\"branchId\":\"网点编号\",\"branchName\":\"网点名称\",\"subjectTeachers\":{\"de9581d9-d016-470b-9126-ae297b673e57\":[],\"351742ee-ebcc-40cc-b5fc-fb3a39131e14\":[{\"teacherId\":\"教练编号\",\"teacherName\":\"教练名称\",\"jxId\":\"驾校编号\",\"jxName\":\"驾校名称\",\"branchId\":\"网点编号\",\"branchName\":\"网点名称\",\"subjectId\":\"教练所教科目编号\",\"subjectName\":\"教练所教科目名称\",\"tLogo\":\"教练头像地址\",\"scroe\":\"评分\",\"scroeNum\":\"点评数\",\"checkNum\":\"教练被浏览数\",\"likeNum\":\"教练被赞数\",\"duteAge\":\"教龄N月\",\"sex\":\"性别\",\"courseDays\":[{\"day\":\"课程日期\",\"subjectId\":\"科目编号\",\"subjectName\":\"科目名称\",\"totalNum\":\"当天可接纳总人数\",\"canBookNum\":\"现在剩余可以预约人数\",\"totalNumOfMorn\":\"上午可接纳总人数\",\"canBookNumOfMorn\":\"上午剩余可预约人数\",\"totalNumOfAftern\":\"下午可接纳总人数\",\"canBookNumOfAftern\":\"下午剩余可预约人数\",\"coursesOfMorn\":[],\"coursesOfAftern\":[]},{\"day\":\"2015-04-15\",\"subjectId\":\"xxxxxx\",\"subjectName\":\"xxxxxxx\",\"totalNum\":\"24\",\"canBookNum\":\"16\",\"totalNumOfMorn\":\"9\",\"canBookNumOfMorn\":\"6\",\"totalNumOfAftern\":\"15\",\"canBookNumOfAftern\":\"10\",\"coursesOfMorn\":[],\"coursesOfAftern\":[]}],\"hot\":false}]},\"banded\":true}}";
		HttpCommonUtil.transForJson(json);
		
		
		
		
		
		
		String url="http://ssss/dfdd/reports/ss/222.xml";
		
		int index = url.indexOf("reports");
		String file = url.substring(index);
		String patsh = aaa.class.getResource("/").getPath().substring(0,aaa.class.getResource("/").getPath().indexOf("WebRoot"));
		System.out.println(patsh+"conf"+File.separator+file);
		
		
		
		String result = "report?rptId=2323434&rptName=324234&type=sdfsdf";
		String aa = result.substring(result.indexOf("rptName"));
		aa = aa.substring(0,aa.indexOf("&"));
		String bb=aa.split("=")[1];
		aa=result.replace(aa, "rptName=chenda");
		System.out.println(result.indexOf("ress"));
		// MD5.GetEncrypted("");
		// MD5
		String data="广州s分公司";
		String res="我是陈丹";
		//int test=7/3;
		//System.out.println(result);
		int a=1;
		System.out.println(data.substring(0, data.length()-3)+"="+data.substring(data.length()-3));
		String path= aaa.class.getResource("/").getPath();
		System.setProperty ("WORKDIR",path.substring(0, path.indexOf("WebRoot")));
		System.out.println(path.substring(0, path.indexOf("WebRoot")));
		//System.out.println(res.length());
	/*	String json =" {\"success\":true,\"msg\":\"\",\"data\":{\"cellset\":[[{\"value\":\"市公司\",\"type\":\"ROW_HEADER_HEADER\",\"properties\":{\"hierarchy\":\"[dim_org]\",\"dimension\":\"dim_org\",\"level\":\"[dim_org].[市公司]\"}},{\"value\":\"统计月份\",\"type\":\"ROW_HEADER_HEADER\",\"properties\":{\"hierarchy\":\"[统计月份]\",\"dimension\":\"统计月份\",\"level\":\"[统计月份].[统计月份]\"}},{\"value\":\"其他产品数\",\"type\":\"COLUMN_HEADER\",\"properties\":{\"uniquename\":\"[Measures].[其他产品数]\",\"hierarchy\":\"Measures\",\"dimension\":\"Measures\",\"level\":\"[Measures].[MeasuresLevel]\"}},{\"value\":\"产品数_4M以下\",\"type\":\"COLUMN_HEADER\",\"properties\":{\"uniquename\":\"[Measures].[产品数_4M以下]\",\"hierarchy\":\"Measures\",\"dimension\":\"Measures\",\"level\":\"[Measures].[MeasuresLevel]\"}},{\"value\":\"产品数_4M_8M\",\"type\":\"COLUMN_HEADER\",\"properties\":{\"uniquename\":\"[Measures].[产品数_4M_8M]\",\"hierarchy\":\"Measures\",\"dimension\":\"Measures\",\"level\":\"[Measures].[MeasuresLevel]\"}},{\"value\":\"产品数_8M_12M\",\"type\":\"COLUMN_HEADER\",\"properties\":{\"uniquename\":\"[Measures].[产品数_8M_12M]\",\"hierarchy\":\"Measures\",\"dimension\":\"Measures\",\"level\":\"[Measures].[MeasuresLevel]\"}}],[{\"value\":\"广州分公司\",\"type\":\"ROW_HEADER\",\"properties\":{\"uniquename\":\"[dim_org].[广东公司].[广州分公司]\",\"hierarchy\":\"dim_org\",\"dimension\":\"dim_org\",\"level\":\"[dim_org].[市公司]\"}},{\"value\":\"201302\",\"type\":\"ROW_HEADER\",\"properties\":{\"uniquename\":\"[统计月份].[201302]\",\"hierarchy\":\"统计月份\",\"dimension\":\"统计月份\",\"level\":\"[统计月份].[统计月份]\"}},{\"value\":\"5,957\",\"type\":\"DATA_CELL\",\"properties\":{\"position\":\"0:0\",\"raw\":\"5957.0\"}},{\"value\":\"0\",\"type\":\"DATA_CELL\",\"properties\":{\"position\":\"1:0\",\"raw\":\"0.0\"}},{\"value\":\"0\",\"type\":\"DATA_CELL\",\"properties\":{\"position\":\"2:0\",\"raw\":\"0.0\"}},{\"value\":\"0\",\"type\":\"DATA_CELL\",\"properties\":{\"position\":\"3:0\",\"raw\":\"0.0\"}}],[{\"value\":\"广州分公司\",\"type\":\"ROW_HEADER\",\"properties\":{\"uniquename\":\"[dim_org].[广东公司].[广州分公司]\",\"hierarchy\":\"dim_org\",\"dimension\":\"dim_org\",\"level\":\"[dim_org].[市公司]\"}},{\"value\":\"201303\",\"type\":\"ROW_HEADER\",\"properties\":{\"uniquename\":\"[统计月份].[201303]\",\"hierarchy\":\"统计月份\",\"dimension\":\"统计月份\",\"level\":\"[统计月份].[统计月份]\"}},{\"value\":\"6,702\",\"type\":\"DATA_CELL\",\"properties\":{\"position\":\"0:1\",\"raw\":\"6702.0\"}},{\"value\":\"111,385\",\"type\":\"DATA_CELL\",\"properties\":{\"position\":\"1:1\",\"raw\":\"111385.0\"}},{\"value\":\"104,229\",\"type\":\"DATA_CELL\",\"properties\":{\"position\":\"2:1\",\"raw\":\"104229.0\"}},{\"value\":\"45,372\",\"type\":\"DATA_CELL\",\"properties\":{\"position\":\"3:1\",\"raw\":\"45372.0\"}}],[{\"value\":\"广州分公司\",\"type\":\"ROW_HEADER\",\"properties\":{\"uniquename\":\"[dim_org].[广东公司].[广州分公司]\",\"hierarchy\":\"dim_org\",\"dimension\":\"dim_org\",\"level\":\"[dim_org].[市公司]\"}},{\"value\":\"201304\",\"type\":\"ROW_HEADER\",\"properties\":{\"uniquename\":\"[统计月份].[201304]\",\"hierarchy\":\"统计月份\",\"dimension\":\"统计月份\",\"level\":\"[统计月份].[统计月份]\"}},{\"value\":\"6,852\",\"type\":\"DATA_CELL\",\"properties\":{\"position\":\"0:2\",\"raw\":\"6852.0\"}},{\"value\":\"110,199\",\"type\":\"DATA_CELL\",\"properties\":{\"position\":\"1:2\",\"raw\":\"110199.0\"}},{\"value\":\"108,590\",\"type\":\"DATA_CELL\",\"properties\":{\"position\":\"2:2\",\"raw\":\"108590.0\"}},{\"value\":\"784\",\"type\":\"DATA_CELL\",\"properties\":{\"position\":\"3:2\",\"raw\":\"784.0\"}}],[{\"value\":\"广州分公司\",\"type\":\"ROW_HEADER\",\"properties\":{\"uniquename\":\"[dim_org].[广东公司].[广州分公司]\",\"hierarchy\":\"dim_org\",\"dimension\":\"dim_org\",\"level\":\"[dim_org].[市公司]\"}},{\"value\":\"201305\",\"type\":\"ROW_HEADER\",\"properties\":{\"uniquename\":\"[统计月份].[201305]\",\"hierarchy\":\"统计月份\",\"dimension\":\"统计月份\",\"level\":\"[统计月份].[统计月份]\"}},{\"value\":\"7,742\",\"type\":\"DATA_CELL\",\"properties\":{\"position\":\"0:3\",\"raw\":\"7742.0\"}},{\"value\":\"109,718\",\"type\":\"DATA_CELL\",\"properties\":{\"position\":\"1:3\",\"raw\":\"109718.0\"}},{\"value\":\"114,229\",\"type\":\"DATA_CELL\",\"properties\":{\"position\":\"2:3\",\"raw\":\"114229.0\"}},{\"value\":\"49,368\",\"type\":\"DATA_CELL\",\"properties\":{\"position\":\"3:3\",\"raw\":\"49368.0\"}}]],\"runtime\":33969,\"error\":null,\"height\":5,\"width\":6}}";
		JSONObject obj = JSONObject.fromObject(json);  
		json = obj.get("data").toString();
		JSONObject obj2 = JSONObject.fromObject(json); 
		
		JSONArray dataJson= JSONArray.fromObject(obj2.get("cellset"));
		List<List<Mdx>> listMdx=new ArrayList<List<Mdx>>();
		for(int i=0;i<dataJson.size();i++){  //N条数据，包括头部分
			List<Mdx> list=new ArrayList<Mdx>();
			
			MdxProperties properties=new MdxProperties();
			JSONArray data= JSONArray.fromObject(dataJson.get(i));
			for(int k=0;k<data.size();k++){
				Mdx mdx=new Mdx();
				JSONObject o = data.getJSONObject(k);
				mdx.setValue(o.get("value").toString());
				mdx.setType(o.get("type").toString());
				JSONObject pro =JSONObject.fromObject(o.get("properties").toString());
				
				properties.setDimension(pro.get("dimension")!=null?pro.get("dimension").toString():"");
				properties.setHierarchy(pro.get("hierarchy")!=null?pro.get("hierarchy").toString():"");
				properties.setLevel(pro.get("level")!=null?pro.get("level").toString():"");
				properties.setUniquename(pro.get("uniquename")!=null?pro.get("uniquename").toString():"");
				properties.setPosition(pro.get("position")!=null?pro.get("position").toString():"");
				properties.setRaw(pro.get("raw")!=null?pro.get("raw").toString():"");
				mdx.setMdxp(properties);
				list.add(mdx);
			}
			listMdx.add(list);
			//System.out.println(dataJson.get(i));
		}
		System.out.println(listMdx.size());
		
		aaa a=new aaa();
		String result = a.bulidTable(listMdx);
		System.out.println(result);*/
		
		//String tr="sfsdf:dfdf:";
		//String aa=tr.substring(tr.length()-1);
		//System.out.println(aa);
	}
	

}
