package com.pdh.shoppand_17.service;


import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.ParserConfigurationException;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.NodeList;
import org.xml.sax.SAXException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pdh.shoppand_17.model.entity.Shares;
import com.pdh.shoppand_17.model.repository.ShareRepository;

@Service
public class ShareService {
	
	@Autowired
	private ShareRepository shareRepository;
	
	public void getShare(Long shareId) throws Exception{
		shareRepository.findByShareId(shareId);
	}
	
	public JSONArray naverOpenAPI(String key){
		System.out.println("- \""+key+"\"으로 검색한 결과입니다. -");
		String apiKey = "6e055330faf89b926a29965edafacfef";
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

	public Shares saveShare(Shares share) {
		return shareRepository.save(share);
	}
}
