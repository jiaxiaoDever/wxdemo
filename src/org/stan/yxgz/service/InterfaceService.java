package org.stan.yxgz.service;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import net.sf.json.JSONObject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.stan.yxgz.pojo.Coach;
import org.stan.yxgz.pojo.CoachCourse;
import org.stan.yxgz.util.HttpCommonUtil;
import org.stan.yxgz.util.LRUCache;
import org.stan.yxgz.util.LRUCacheHashMap;
import org.stan.yxgz.util.PropertyUtils;
import org.stan.yxgz.util.StaticDataCache;
import org.stan.yxgz.util.UrlUtil;
import org.stan.yxgz.util.UrlUtil.HttpRequestData;


/**
 * 调用接口类，主要给前台jsp调用
 * @author chendan
 *
 */

public  class InterfaceService  {
	private static final long serialVersionUID = 1L;
	private static Logger log=LoggerFactory.getLogger(InterfaceService.class);
	private static String subjectSecond=PropertyUtils.getWebServiceProperty("subjectSecond");
    private static String subjectThird=PropertyUtils.getWebServiceProperty("subjectThrid");
    public static String[] getSubjectArray(){
    	return new String[]{subjectSecond,subjectThird};
    }
    public static Map<String,Object> isBandedNew(String username,String userno,String telphone,String openId) throws UnsupportedEncodingException{
    	//绑定	
		String url= PropertyUtils.getWebServiceProperty("login.newIsbind");
		url=url.replace("openId", openId);
		String opt="?";
		if(url.indexOf("?")>=0)
			opt="&";
		url=url+opt+"studentName="+URLEncoder.encode(URLEncoder.encode(username,"UTF-8"),"UTF-8")+"&studentCardId="+userno+"&studentPhone="+telphone;
		String json="";
		String app=PropertyUtils.getWebServiceProperty("app");
		if(app.equals("true")){
			HttpRequestData data = UrlUtil.sendGet(url);
			json=data.getResult();
		}else
			json="{\"success\":true,\"title\":\"操作成功\",\"reason\":\"操作成功\",\"result\":{studentId:0bd22f1f-2aee-4e74-8ee0-144ffedd3822}}";
		
		Map<String,Object> result=new HashMap<String, Object>();
		
		JSONObject obj = JSONObject.fromObject(json);
		boolean state =Boolean.valueOf(obj.get("success").toString());
		result.put("state", state);
		result.put("reason", obj.get("reason"));
		if(state){
			JSONObject reObj=JSONObject.fromObject(obj.get("result"));
			result.put("userId", reObj.get("studentId"));
		}
		return result;
    }
    public static Map<String,Object> getUserId(String openId){
    	Map<String,Object> result=new HashMap<String, Object>();
    	String url= PropertyUtils.getWebServiceProperty("login.user");
		url=url.replace("openId", openId);
		
		//log.info("根据openId判断此用户是否绑定："+url);
		String json="";
		String app=PropertyUtils.getWebServiceProperty("app");
		if(app.equals("true")){
		HttpRequestData httpData = UrlUtil.sendGet(url);
		json=httpData.getResult();
		}else
			json="{\"success\":true,\"title\":\"\",\"reason\":\"\",\"result\":\"{studentId:null,isbanded:true}\"}";
		JSONObject obj = JSONObject.fromObject(json);
		boolean state =Boolean.valueOf(obj.get("success").toString());
		result.put("state", state);
		result.put("reason", obj.get("reason"));
		if(state){
			JSONObject reObj=JSONObject.fromObject(obj.get("result"));
			result.put("isbanded", reObj.get("isbanded"));
			result.put("userId", reObj.get("studentId"));
		}
		return result;
    }
    
    
    //我的预约
    public static Map<String,Object> getMineCourse(String openId){
    	Map<String,Object> result=new HashMap<String, Object>();
    	String url= PropertyUtils.getWebServiceProperty("course.mine");
		url=url.replace("openId", openId);
		
		
		String json="";
		String app=PropertyUtils.getWebServiceProperty("app");
		if(app.equals("true")){
		HttpRequestData httpData = UrlUtil.sendGet(url);
		json=httpData.getResult();
		}else
			json="{\"success\":true,\"title\":null,\"reason\":null,\"result\":[{\"stCourseId\":\"4d9d6d2e-3993-4792-a22a-f1795e5f4bbb\",\"roasterJx\":{\"courseId\":\"e5163103-1914-4ce4-978e-0051d49f7e5d\",\"branchId\":\"27a7e11d-7329-410b-99f3-6333f24107a1\",\"branchName\":\"市内分点\",\"canSignNum\":2,\"common\":null,\"courseHour\":1,\"courseInNum\":3,\"courseInfo\":null,\"courseName\":\"广州程通驾校-市内分点-陈曦教练-科目二\",\"courseNoticBHour\":4,\"courseStat\":\"待上课\",\"courseStatCode\":\"DSK\",\"courseTimearea\":\"下午\",\"courseTimeareaCode\":\"XW\",\"createDate\":1430115569000,\"editDate\":1430115569000,\"editEndTime\":1430208000000,\"endTime\":1430211600000,\"isCourseNotic\":1,\"isRoastNotic\":1,\"jxId\":\"9f4d700e-54c4-4843-8ff0-3fcff6661682\",\"jxName\":\"广州程通驾校\",\"offlineNum\":0,\"roastNoticAHour\":24,\"signEndTime\":1430208000000,\"startTime\":null,\"subjectId\":\"de9581d9-d016-470b-9126-ae297b673e57\",\"subjectName\":\"科目二\",\"teacherId\":\"4a99e726-f6d2-48ac-9ed8-3ce35f438662\",\"teacherName\":\"陈曦\"},\"courseSt\":{\"stCourseId\":\"4d9d6d2e-3993-4792-a22a-f1795e5f4bbb\",\"bookTime\":1430116956000,\"cancelDate\":null,\"cancelInfo\":null,\"carScore\":null,\"common\":null,\"courseId\":\"e5163103-1914-4ce4-978e-0051d49f7e5d\",\"courseName\":\"广州程通驾校-市内分点-陈曦教练-科目二\",\"courseStat\":\"待上课\",\"courseStatCode\":\"DSK\",\"implCourseStat\":null,\"implCourseStatCode\":null,\"isCancelBook\":0,\"isNormalCancel\":1,\"isUncareUnimpl\":0,\"learnInfo\":null,\"overTime\":null,\"scoreInfo\":null,\"scoreTime\":null,\"serviceScore\":null,\"startTime\":null,\"studentId\":\"0bd22f1f-2aee-4e74-8ee0-144ffedd3822\",\"studentName\":\"陈丹\",\"teacherReplyInfo\":null,\"teacherReplyTime\":null,\"teacherScore\":null,\"unimplInfo\":null}},{\"stCourseId\":\"d3e31eed-57be-440b-bdaf-de497ffeab56\",\"roasterJx\":{\"courseId\":\"039bb48e-aac0-4188-8a33-222bb4349441\",\"branchId\":\"27a7e11d-7329-410b-99f3-6333f24107a1\",\"branchName\":\"市内分点\",\"canSignNum\":0,\"common\":null,\"courseHour\":1,\"courseInNum\":3,\"courseInfo\":null,\"courseName\":\"广州程通驾校-市内分点-陈曦教练-科目二\",\"courseNoticBHour\":4,\"courseStat\":\"待上课\",\"courseStatCode\":\"DSK\",\"courseTimearea\":\"上午\",\"courseTimeareaCode\":\"SW\",\"createDate\":1430115569000,\"editDate\":1430115569000,\"editEndTime\":1430190000000,\"endTime\":1430193600000,\"isCourseNotic\":1,\"isRoastNotic\":1,\"jxId\":\"9f4d700e-54c4-4843-8ff0-3fcff6661682\",\"jxName\":\"广州程通驾校\",\"offlineNum\":0,\"roastNoticAHour\":24,\"signEndTime\":1430190000000,\"startTime\":null,\"subjectId\":\"de9581d9-d016-470b-9126-ae297b673e57\",\"subjectName\":\"科目二\",\"teacherId\":\"4a99e726-f6d2-48ac-9ed8-3ce35f438662\",\"teacherName\":\"陈曦\"},\"courseSt\":{\"stCourseId\":\"d3e31eed-57be-440b-bdaf-de497ffeab56\",\"bookTime\":1430116367000,\"cancelDate\":null,\"cancelInfo\":null,\"carScore\":null,\"common\":null,\"courseId\":\"039bb48e-aac0-4188-8a33-222bb4349441\",\"courseName\":\"广州程通驾校-市内分点-陈曦教练-科目二\",\"courseStat\":\"待上课\",\"courseStatCode\":\"DSK\",\"implCourseStat\":null,\"implCourseStatCode\":null,\"isCancelBook\":0,\"isNormalCancel\":1,\"isUncareUnimpl\":0,\"learnInfo\":null,\"overTime\":null,\"scoreInfo\":null,\"scoreTime\":null,\"serviceScore\":null,\"startTime\":null,\"studentId\":\"0bd22f1f-2aee-4e74-8ee0-144ffedd3822\",\"studentName\":\"陈丹\",\"teacherReplyInfo\":null,\"teacherReplyTime\":null,\"teacherScore\":null,\"unimplInfo\":null}}]}";
			
		result = HttpCommonUtil.transMyCourseForJson(json);
		return result;
    }
    //是否绑定
	public static Map<String,Object> isLogin(String openId){
		Map<String,Object> result=new HashMap<String, Object>();
		//获取课程地址
		String url= PropertyUtils.getWebServiceProperty("login.isbind");
		url=url.replace("openId", openId);
		/*String opt="?";
		if(url.indexOf("?")>=0)
			opt="&";
		url=url;*/
		//log.info("根据openId判断此用户是否绑定："+url);
		String json="";
		String app=PropertyUtils.getWebServiceProperty("app");
		if(app.equals("true")){
		HttpRequestData httpData = UrlUtil.sendGet(url);
		json=httpData.getResult();
		}else
			json="{\"success\":true,\"title\":\"操作成功\",\"reason\":\"操作成功\",\"result\":{\"openId\":\"0011223\",\"studentId\":\"22333222\",\"subjectId\":\"de9581d9-d016-470b-9126-ae297b673e57\",\"subjectName\":\"用户所考科目名称\",\"branchId\":\"网点编号\",\"branchName\":\"网点名称\",\"subjectTeachers\":{\"351742ee-ebcc-40cc-b5fc-fb3a39131e14\":[],\"de9581d9-d016-470b-9126-ae297b673e57\":[{\"teacherId\":\"教练编号\",\"teacherName\":\"教练名称\",\"jxId\":\"驾校编号\",\"jxName\":\"驾校名称\",\"branchId\":\"网点编号\",\"branchName\":\"网点名称\",\"subjectId\":\"教练所教科目编号\",\"subjectName\":\"教练所教科目名称\",\"tLogo\":\"教练头像地址\",\"scroe\":\"评分\",\"scroeNum\":\"点评数\",\"checkNum\":\"教练被浏览数\",\"likeNum\":\"教练被赞数\",\"duteAge\":\"教龄N月\",\"sex\":\"性别\",\"courseDays\":[{\"day\":\"课程日期\",\"subjectId\":\"科目编号\",\"subjectName\":\"科目名称\",\"totalNum\":\"当天可接纳总人数\",\"canBookNum\":\"现在剩余可以预约人数\",\"totalNumOfMorn\":\"上午可接纳总人数\",\"canBookNumOfMorn\":\"上午剩余可预约人数\",\"totalNumOfAftern\":\"下午可接纳总人数\",\"canBookNumOfAftern\":\"下午剩余可预约人数\",\"coursesOfMorn\":[],\"coursesOfAftern\":[]},{\"day\":\"2015-04-15\",\"subjectId\":\"xxxxxx\",\"subjectName\":\"xxxxxxx\",\"totalNum\":\"24\",\"canBookNum\":\"16\",\"totalNumOfMorn\":\"9\",\"canBookNumOfMorn\":\"6\",\"totalNumOfAftern\":\"15\",\"canBookNumOfAftern\":\"10\",\"coursesOfMorn\":[],\"coursesOfAftern\":[]}],\"hot\":false}]},\"banded\":false}}";
		//String json="{\"success\":false,\"title\":\"xxxx操作成功\",\"reason\":\"xxxx操作成功\",\"result\":{\"openId\":\"0011223\",\"userId\":\"22333222\",\"subjectId\":\"de9581d9-d016-470b-9126-ae297b673e57\",\"subjectName\":\"用户所考科目名称\",\"branchId\":\"网点编号\",\"branchName\":\"网点名称\",\"subjectTeachers\":{\"de9581d9-d016-470b-9126-ae297b673e57\":[],\"351742ee-ebcc-40cc-b5fc-fb3a39131e14\":[{\"teacherId\":\"教练编号\",\"teacherName\":\"教练名称\",\"jxId\":\"驾校编号\",\"jxName\":\"驾校名称\",\"branchId\":\"网点编号\",\"branchName\":\"网点名称\",\"subjectId\":\"教练所教科目编号\",\"subjectName\":\"教练所教科目名称\",\"tLogo\":\"教练头像地址\",\"scroe\":\"评分\",\"scroeNum\":\"点评数\",\"checkNum\":\"教练被浏览数\",\"likeNum\":\"教练被赞数\",\"duteAge\":\"教龄N月\",\"sex\":\"性别\",\"courseDays\":[{\"day\":\"课程日期\",\"subjectId\":\"科目编号\",\"subjectName\":\"科目名称\",\"totalNum\":\"当天可接纳总人数\",\"canBookNum\":\"现在剩余可以预约人数\",\"totalNumOfMorn\":\"上午可接纳总人数\",\"canBookNumOfMorn\":\"上午剩余可预约人数\",\"totalNumOfAftern\":\"下午可接纳总人数\",\"canBookNumOfAftern\":\"下午剩余可预约人数\",\"coursesOfMorn\":[],\"coursesOfAftern\":[]},{\"day\":\"2015-04-15\",\"subjectId\":\"xxxxxx\",\"subjectName\":\"xxxxxxx\",\"totalNum\":\"24\",\"canBookNum\":\"16\",\"totalNumOfMorn\":\"9\",\"canBookNumOfMorn\":\"6\",\"totalNumOfAftern\":\"15\",\"canBookNumOfAftern\":\"10\",\"coursesOfMorn\":[],\"coursesOfAftern\":[]}],\"hot\":false}]},\"banded\":true}}";
		Map<String,Object> dataMap = HttpCommonUtil.transForJson(json);
		boolean state=Boolean.valueOf(dataMap.get("state").toString());
		if(state){
			String banded=dataMap.get("banded").toString();
			if(banded.equals("true")){
				String subjectId = dataMap.get("subjectId").toString();
				String userId=dataMap.get("userId").toString();
				String branchName=dataMap.get("branchName").toString();
				String subjectName=dataMap.get("subjectName").toString();
				String branchId=dataMap.get("branchId").toString();
				
				String [] subjects=getSubjectArray();
				List<CoachCourse> coachListData=null;
				List<CoachCourse> coachListDatas=null;
				StaticDataCache cache = StaticDataCache.getInstance();
				for(String s:subjects){
					coachListDatas = (List<CoachCourse>)dataMap.get(s);
					if(s.equals(subjectId)){
						coachListData=coachListDatas;
					}
					if(!cache.isCachMapContain(userId+":"+subjectId))
						cache.putCache(userId+":"+s, coachListDatas);
				}
				result.put("userId", userId);
				result.put("branchId", branchId);
				result.put("branchName", branchName);
				result.put("data", coachListData);
				result.put("datas",coachListDatas);
				result.put("subjectId",subjectId);
				result.put("state", state);
				result.put("subjectName", subjectName);
			}
			result.put("banded", banded);
		}
		result.put("state", state);
		String reason=dataMap.get("reason")+"";
		result.put("reason", reason);
		
		return result;
	}
	public static List<CoachCourse> getCoachCourseById(String userId,String subjectId){
		LRUCache<String, Object> lruMap = StaticDataCache.getInstance().getCache();
		List<CoachCourse> coachList=(List<CoachCourse>)lruMap.get(userId+":"+subjectId);
		return coachList;
	}
	/**
	 * 根据教练Id去缓存里面查找，换成里面存的是整个科目的教练信息
	 * @param userId
	 * @param subjectId
	 * @param coachId
	 * @param openId
	 * @return
	 */
	public Coach getCoachById(String userId,String subjectId,String coachId,String openId){
		Coach coachs=null;
		LRUCacheHashMap lruMap = StaticDataCache.getInstance().getCachMap();
		List<CoachCourse> coachList=(List<CoachCourse>)lruMap.get(userId+":"+subjectId);
		for(CoachCourse coachDourse:coachList){
			Coach coach=coachDourse.getCoach();
			if(coach.getId().equals(coachId))
				coachs=coach;
			else
				continue;
		}
		return coachs;
	}
	//绑定
	public static  Map<String,Object> login(String openId,String username,String userno,String telphone){
		Map<String,Object> result=new HashMap<String, Object>();
		return result;
	}
	
	//获取教练课程表信息
	public static Map<String,Object> getSubjects(String openId,String coachId,String day){
		Map<String,Object> result=new HashMap<String, Object>();
		//获取课程地址
		String url= PropertyUtils.getWebServiceProperty("school.course");
		url=url.replace("teacherId", coachId).replace("bookingDate", day);
		/*String opt="?";
		if(url.indexOf("?")>=0)
			opt="&";
		url=url;*/
		//log.info("根据教练获取课程信息访问地址："+url);
		String json="";
		String app=PropertyUtils.getWebServiceProperty("app");
		if(app.equals("true")){
		HttpRequestData httpData = UrlUtil.sendGet(url);
		json=httpData.getResult();
		}else
		json="{\"success\":true,\"title\":null,\"reason\":null,\"result\":{\"day\":\"2015-04-15\",\"teacherId\":\"11112\",\"teacherName\":\"张三\",\"subjectId\":\"de9581d9-d016-470b-9126-ae297b673e57\",\"subjectName\":\"用户所考科目名称\",\"totalNum\":\"24\",\"canBookNum\":\"12\",\"totalNumOfMorn\":\"9\",\"canBookNumOfMorn\":\"2\",\"totalNumOfAftern\":\"15\",\"canBookNumOfAftern\":\"10\",\"coursesOfMorn\":[{\"courseId\":\"001\",\"courseName\":\"课程名称001\",\"startTime\":\"8:00\",\"endTime\":\"9：00\",\"courseTimearea\":\"am\",\"courseInNum\":\"12\",\"canSignNum\":\"1\"},{\"courseId\":\"xxxxxxxxxxxx\",\"courseName\":\"xxxxxxxxxxx\",\"startTime\":\"09:00:00\",\"endTime\":\"10:00:00\",\"courseTimearea\":\"上午\",\"courseInNum\":\"3\",\"canSignNum\":\"1\"},{\"courseId\":\"xxxxxxx\",\"courseName\":\"xxxxxx\",\"startTime\":\"10:00:00\",\"endTime\":\"11:00:00\",\"courseTimearea\":\"上午\",\"courseInNum\":\"3\",\"canSignNum\":\"0\"},{\"courseId\":\"xxxxxxx\",\"courseName\":\"xxxxxx\",\"startTime\":\"11:00:00\",\"endTime\":\"12:00:00\",\"courseTimearea\":\"上午\",\"courseInNum\":\"3\",\"canSignNum\":\"1\"}],\"coursesOfAftern\":[{\"courseId\":\"xxxxxxx\",\"courseName\":\"xxxxxx\",\"startTime\":\"14:00:00\",\"endTime\":\"15:00:00\",\"courseTimearea\":\"下午\",\"courseInNum\":\"3\",\"canSignNum\":\"3\"},{\"courseId\":\"xxxxxxx\",\"courseName\":\"xxxxxx\",\"startTime\":\"15:00:00\",\"endTime\":\"16:00:00\",\"courseTimearea\":\"下午\",\"courseInNum\":\"3\",\"canSignNum\":\"2\"},{\"courseId\":\"xxxxxxx\",\"courseName\":\"xxxxxx\",\"startTime\":\"16:00:00\",\"endTime\":\"17:00:00\",\"courseTimearea\":\"下午\",\"courseInNum\":\"3\",\"canSignNum\":\"1\"},{\"courseId\":\"xxxxxxx\",\"courseName\":\"xxxxxx\",\"startTime\":\"17:00:00\",\"endTime\":\"18:00:00\",\"courseTimearea\":\"下午\",\"courseInNum\":\"3\",\"canSignNum\":\"0\"}]}}";
		Map<String,Object> data = HttpCommonUtil.transCourseForJson(json);
		//boolean state=Boolean.valueOf(data.get("state").toString());
		//result.put("state", state);
		//String reason=data.get("reason").toString();
		//result.put("reason", reason);
		result=data;
		
		
		return result;
	}
	

	/**
	 * 机器人对话
	 * @param type  是否是关注,type=attention  关注，其他就是机器人对话
	 * @param value
	 * @return
	 */
	public static String getRobotStr(String type,String value){
		StringBuffer buffer=new StringBuffer();
		if(type.equals("attention")){
			
		}else{
			
		}
		return buffer.toString();
	}
}
