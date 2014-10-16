package com.pdh.shoppand_17.model.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name="ITEMS")
public class Items {

	@Id
	@Column
	@GeneratedValue(strategy = GenerationType.AUTO)
	private Long itemId;

	@Column
	private String itemName;
	
	@Column
	private String imgUrl;
	
	@Column
	private String link;

	@Column
	private int price;
	
	@Column
	private String xpos;
	
	@Column
	private String ypos;
	
	@ManyToOne
	@JoinColumn(name = "shareId")
	private Shares share;
	
	

	public Items() {
	}

	public Items(String itemName, String imgUrl, String link,
			int price, String xpos, String ypos) {
		this.itemName = itemName;
		this.imgUrl = imgUrl;
		this.link = link;
		this.price = price;
		this.xpos = xpos;
		this.ypos = ypos;
	}

	public Long getItemId() {
		return itemId;
	}

	public void setItemId(Long itemId) {
		this.itemId = itemId;
	}

	public String getItemName() {
		return itemName;
	}

	public void setItemName(String itemName) {
		this.itemName = itemName;
	}

	public String getLink() {
		return link;
	}

	public void setLink(String link) {
		this.link = link;
	}

	public String getImgUrl() {
		return imgUrl;
	}

	public void setImgUrl(String imgUrl) {
		this.imgUrl = imgUrl;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public String getXpos() {
		return xpos;
	}

	public void setXpos(String xpos) {
		this.xpos = xpos;
	}

	public String getYpos() {
		return ypos;
	}

	public void setYpos(String ypos) {
		this.ypos = ypos;
	}

	public Shares getShare() {
		return share;
	}

	public void setShare(Shares share) {
		this.share = share;
	}
	
	
}
