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

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((imgUrl == null) ? 0 : imgUrl.hashCode());
		result = prime * result + ((itemId == null) ? 0 : itemId.hashCode());
		result = prime * result
				+ ((itemName == null) ? 0 : itemName.hashCode());
		result = prime * result + ((link == null) ? 0 : link.hashCode());
		result = prime * result + price;
		result = prime * result + ((xpos == null) ? 0 : xpos.hashCode());
		result = prime * result + ((ypos == null) ? 0 : ypos.hashCode());
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Items other = (Items) obj;
		if (imgUrl == null) {
			if (other.imgUrl != null)
				return false;
		} else if (!imgUrl.equals(other.imgUrl))
			return false;
		if (itemId == null) {
			if (other.itemId != null)
				return false;
		} else if (!itemId.equals(other.itemId))
			return false;
		if (itemName == null) {
			if (other.itemName != null)
				return false;
		} else if (!itemName.equals(other.itemName))
			return false;
		if (link == null) {
			if (other.link != null)
				return false;
		} else if (!link.equals(other.link))
			return false;
		if (price != other.price)
			return false;
		if (xpos == null) {
			if (other.xpos != null)
				return false;
		} else if (!xpos.equals(other.xpos))
			return false;
		if (ypos == null) {
			if (other.ypos != null)
				return false;
		} else if (!ypos.equals(other.ypos))
			return false;
		return true;
	}

	
	
	
	
}
