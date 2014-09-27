package com.pdh.shoppand_17.model.entity;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Embeddable;
import javax.persistence.EmbeddedId;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name = "SHARED_ITEMS")
public class SharedItems {
	
	@Embeddable
	public static class Id implements Serializable{
		
		@Column(name = "sId")
		private Long shareId;
		
		@Column(name = "iId")
		private Long itemId;
				
		public Id() {
		}
		
		public Id(Long shareId, Long itemId){
			this.shareId = shareId;
			this.itemId = itemId;
		}
		
		public boolean equals(Object obj) {
			if(obj!=null && obj instanceof Id){
				Id that = (Id) obj;
				return this.shareId.equals(this.shareId) && this.itemId.equals(this.itemId);
			}else{
				return false;
			}
		}
		
		public int hashCode() {
			return shareId.hashCode() + itemId.hashCode();
		}
	}
	
	public SharedItems() {
	}
	
	public SharedItems(Shares share, Items item){
		this.share = share;
		this.item = item;
		
		id.shareId = share.getShareId();
		id.itemId = item.getItemId();
	}
	
	@EmbeddedId
	private Id id = new Id();
	
	@Column
	private String position;
	
	@ManyToOne
	@JoinColumn(name = "shareId", insertable = false, updatable = false)
	private Shares share;
	
	@ManyToOne
	@JoinColumn(name = "itemId", insertable = false, updatable = false)
	private Items item;

	public Id getId() {
		return id;
	}

	public void setId(Id id) {
		this.id = id;
	}

	public String getPosition() {
		return position;
	}

	public void setPosition(String position) {
		this.position = position;
	}

	public Shares getShare() {
		return share;
	}

	public void setShare(Shares share) {
		this.share = share;
	}

	public Items getItem() {
		return item;
	}

	public void setItem(Items item) {
		this.item = item;
	}
	
	
}
