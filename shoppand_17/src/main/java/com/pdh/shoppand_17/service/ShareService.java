package com.pdh.shoppand_17.service;


import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.math.BigInteger;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.ParserConfigurationException;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.NodeList;
import org.xml.sax.SAXException;

import com.pdh.shoppand_17.model.entity.Groups;
import com.pdh.shoppand_17.model.entity.Members;
import com.pdh.shoppand_17.model.entity.Shares;
import com.pdh.shoppand_17.model.repository.ShareRepository;

@Service
@Transactional
public class ShareService {
	
	private CollaborativeFiltering cf = new CollaborativeFiltering();
	
	@Autowired
	private ShareRepository shareRepository;
	
	public Shares getShare(Long shareId) throws Exception{
		return shareRepository.findOne(shareId);
	}
	
	public JSONArray naverOpenAPI(String key){
		System.out.println("- \""+key+"\"으로 검색한 결과입니다. -");
		String apiKey = "5e263766c1cf05d4d1c946c47903d74b";
		String uri = null;
		DocumentBuilderFactory dbf = DocumentBuilderFactory.newInstance();
		JSONArray arr = null;
		JSONObject obj = null;

		try{
			uri = "http://openapi.naver.com/search?key=" + apiKey + "&target="+ "shop" +"&query=" + 
					URLEncoder.encode(key, "UTF-8") + "&display="+ 100 + "&sort=" + "sim";
		}catch(UnsupportedEncodingException e){
			System.out.println(e);
		}
		
		try
		{
			DocumentBuilder builder = dbf.newDocumentBuilder();
			Document doc = builder.parse(uri);
			Element root = doc.getDocumentElement();
			NodeList list = root.getElementsByTagName("item");
			System.out.println("1!");
			arr = new JSONArray();
			obj = new JSONObject();
			
			for(int i=0; i<list.getLength();i++){
				Element element = (Element)list.item(i);
				obj.put("title", getContent(element, "title", key));
				obj.put("price", getContent(element, "lprice"));
				obj.put("link", getContent(element, "link"));
				obj.put("imgUrl", getContent(element, "image"));
				arr.add(obj);
			}
		 }
		catch (ParserConfigurationException e){ e.printStackTrace(); }
		catch (SAXException e){ e.printStackTrace(); }
		catch (IOException e){ e.printStackTrace(); }
		
		return arr;
	}

	public static String getContent(Element element, String tagName)
	{
		NodeList list = element.getElementsByTagName(tagName);
		Element cElement = (Element)list.item(0);

		if(cElement.getFirstChild()!=null){
			String str = cElement.getFirstChild().getNodeValue();
			str = str.replaceAll("&quot;", "\"");
			str = str.replaceAll("<b>", "");
			str = str.replaceAll("</b>","");
			return str;
		}else{
			return "";
		}
	}
	
	// 키워드 진하게 설정
	public static String getContent(Element element, String tagName, String key)
	{
		NodeList list = element.getElementsByTagName(tagName);
		Element cElement = (Element)list.item(0);

		if(cElement.getFirstChild()!=null){
			String str = cElement.getFirstChild().getNodeValue();
			str = str.replaceAll("&quot;", "\"");
			str = str.replaceAll("<b>", "");
			str = str.replaceAll("</b>","");
			str = str.replaceAll(key,"<b>" + key + "</b>");
			return str;
		}else{
			return "";
		}
	}
	
	public LinkedHashSet<Shares> recommendShareList(Members member) {
		int user[];
		int data[][];
		int recommend[];
		int userIndex = 9999;
		int otherIndex = 0;
		//List<String> scrapUrlList;
		//Set<Shares> memberLikeList;
		List<BigInteger> likedShareIdList;
		
		//Set<String> scrapEmailList;
		List<String> likingMemberEmailList;
		
		
		Map<Integer,HashMap<Integer,String>> likedSharesMap;
		List<String> ul = new ArrayList<String>();
		List<String> el = new ArrayList<String>();
		Set<Shares> recommendShareList = new LinkedHashSet<Shares>();
		
		//scrapUrlList = articlesDao.scrapUrlList();
		/*	for (int i = 0; i < scrapUrlList.size(); i++) {
		ul.add(scrapUrlList.get(i));
		}*/
		//likedSharesList = shareRepository.findByLikesGreaterThan(0);
		/*for(int i =0; i < likedSharesList.size(); i++){
			ul.add(likedSharesList.get(i).getShareId().toString());
		}*/
	
		likedShareIdList = shareRepository.findLikedShares();
		for (int i = 0; i < likedShareIdList.size(); i++) {
			System.out.println(likedShareIdList.get(i));
			ul.add(String.valueOf(likedShareIdList.get(i)));
		}
		
		//scrapEmailList = articlesDao.scrapEmailList();
		
		/*scrapEmailList = articlesDao.scrapEmailList();
		for (int i = 0; i < scrapEmailList.size(); i++) {
			el.add(scrapEmailList.get(i));
		}*/
		
		likingMemberEmailList = shareRepository.findShareLikingMember();
		for (int i = 0; i < likingMemberEmailList.size(); i++) {
			System.out.println(likingMemberEmailList.get(i));
			el.add(likingMemberEmailList.get(i));
		}
		if(likingMemberEmailList.size() == 0){
			return null;
		}
		user = new int[likedShareIdList.size()];
		data = new int[likingMemberEmailList.size()-1][likedShareIdList.size()];
		//data = new int[likingMemberEmailList.size()-1][likedShareIdList.size()];
		recommend = new int[likedShareIdList.size()];
		//scrapsTableList = articlesDao.scrapsTableList();
		//likedSharesList = shareRepository.findByLikesGreaterThan(0);
		likedSharesMap = likedShares(member);
		System.out.println("lsm : " + likedSharesMap);
		/*for (int i = 0; i < scrapsTableList.size(); i++) {
			if (scrapsTableList.get(i).getEmail().equals(email)) {
				userIndex = ul.indexOf(scrapsTableList.get(i).getEmail());
				user[ul.indexOf(scrapsTableList.get(i).getArticleUrl())] = 1;
			} */
		
		for (int i = 0; i < likedSharesMap.size(); i++) {
			if (likedSharesMap.get(i).get(1).equals(member.getEmail())) {
				System.out.println("me : "+ likedSharesMap.get(i).get(1));
				userIndex = el.indexOf(likedSharesMap.get(i).get(1));
				user[ul.indexOf(likedSharesMap.get(i).get(2))] = 1;
			} else {
				System.out.println("other : "+ likedSharesMap.get(i).get(1));
				otherIndex = el.indexOf(likedSharesMap.get(i).get(1));
				System.out.println(otherIndex);
				if (userIndex < otherIndex) {
					data[otherIndex-1][ul.indexOf(likedSharesMap.get(i).get(2))] = 1;
				} else {
					data[otherIndex][ul.indexOf(likedSharesMap.get(i).get(2))] = 1;
				}
			}
		}
		for (int i = 0; i < user.length; i++) {
			System.out.println(user[i] + " ");
		}
		for (int i = 0; i < data[0].length; i++) {
			System.out.println(data[0][i] + " ");
		}
		recommend = cf.cal(user, data);
		for (int i = 0; i < data[0].length; i++) {
			System.out.print(recommend[i] + " ");
		}
		for (int i = 0; i < data[0].length; i++) {
			if (recommend[i] == 1) {
				BigInteger lg = likedShareIdList.get(i);
				Shares sh = shareRepository.findOne(lg.longValue());
				recommendShareList.add(sh);
			}
		}		
		
		return (LinkedHashSet<Shares>) recommendShareList;
	}
	
	public Map<Integer, HashMap<Integer,String>> likedShares(Members member){
		List<Long> fs;
		List<String> fm;
		HashMap<Integer,String> likedSharesMap;
		HashMap<Integer,HashMap<Integer,String>> indexMap = new HashMap<Integer,HashMap<Integer,String>>();
		fm =  shareRepository.findShareLikingMemberNotDis();
		System.out.println("fm : " + fm);
		fs = shareRepository.findLikedSharesNotDis();
		System.out.println("fs : " + fs);
		for(int i=0; i<fs.size(); i++){
			likedSharesMap = new HashMap<Integer,String>();
			System.out.println(fm.get(i) + " , " + fs.get(i));
			likedSharesMap.put(1, fm.get(i));
			likedSharesMap.put(2, String.valueOf(fs.get(i)));
			indexMap.put(i, likedSharesMap);
		}
		return indexMap;
	}

	public Shares saveShare(Shares share) {
		return shareRepository.save(share);
	}
	
	public List<Shares> getPageShare(Groups group, int pageNum){
		return shareRepository.findByGroup(group, new PageRequest(pageNum, 8, Direction.DESC, "writingDate"));
	}

	public List<Shares> getMemberGroupShare(String email) {
		return shareRepository.getMemberGroupShare(email);
	}
	
	public List<Shares> getMemberShare(String email) {
		return shareRepository.findByWriter(email);
	}

	public List<Shares> getMemberAuthShare(String email) {
		return shareRepository.findByWriterAndAccessAuth(email, 1);
	}

	public List<Shares> getGroupCategoryShare(Groups group, String category) {
		return shareRepository.findByGroupAndCategory(group, category);
	}
	
	public List<Shares> getGroupCategoryShare(Groups group, String category, int pageNum) {
		return shareRepository.findByGroupAndCategory(group, category, new PageRequest(pageNum, 8, Direction.DESC, "writingDate"));
	}
}
