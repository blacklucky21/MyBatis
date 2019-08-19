package board.model.vo;

public class SearchCondition {
	
	private String writer;
	private String content;
	private String title;
	
	public SearchCondition() {}
	public SearchCondition(String writer, String content, String title) {
		super();
		this.writer = writer;
		this.content = content;
		this.title = title;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	@Override
	public String toString() {
		return "SearchCondition [writer=" + writer + ", content=" + content + ", title=" + title + "]";
	}
	
	
	
	

}
