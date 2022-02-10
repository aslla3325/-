package banana;

public class SpringVO {
    public Integer getNo() {
		return no;
	}
	public void setNo(Integer no) {
		this.no = no;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Integer getView() {
		return view;
	}
	public void setView(Integer view) {
		this.view = view;
	}
	public Integer getRecommend() {
		return recommend;
	}
	public void setRecommend(Integer recommend) {
		this.recommend = recommend;
	}
	public String getTime() {
		return time;
	}
	public void setTime(String time) {
		this.time = time;
	}
	
	private Integer no = null;
	private String username = null;
    private String title = null;
    private String content = null;
    private Integer view = null;
    private Integer recommend = null;
    private String time = null;
	@Override
	public String toString() {
		return "SpringVO [no=" + no + ", username=" + username + ", title=" + title + ", content=" + content + ", view="
				+ view + ", recommend=" + recommend + ", time=" + time + "]";
	}
    
}
