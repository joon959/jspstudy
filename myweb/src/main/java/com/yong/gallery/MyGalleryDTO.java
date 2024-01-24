package com.yong.gallery;

public class MyGalleryDTO {
	private int idx;
	private String id;
	private String filename;
	private int filesize;

	public MyGalleryDTO() {
		System.out.println("???");
	}

	public MyGalleryDTO(int idx, String id, String filename, int filesize) {
		super();
		this.idx = idx;
		this.id = id;
		this.filename = filename;
		this.filesize = filesize;
	}

	public int getIdx() {
		return idx;
	}

	public void setIdx(int idx) {
		this.idx = idx;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getFilename() {
		return filename;
	}

	public void setFilename(String filename) {
		this.filename = filename;
	}

	public int getFilesize() {
		return filesize;
	}

	public void setFilesize(int filesize) {
		this.filesize = filesize;
	}
	
	
}
