package dlink.admin.vo;

public class TReqMakeVO  extends SearchVO{
	
	  private static final long serialVersionUID = 1L;
	  
	  /* 제품의뢰관리번호 */
	  private int reqNo;
	  
	  /* 접속아이디 */
	  private String loginId;
	  
	  /* 포트폴리오관리번호 */
	  private String ptplNo;
	  
	  /* 순번 */
	  private int seq;
	  
	  /* 등록자구분 */
	  private String regGb;
	  
	  /* 내용 */
	  private String cont;
	  
	  /* 등록일자 */
	  private String regDt;
	  
	  /* 등록자 */
	  private String register;
	  
	  private  String registerFlag;
	  
	  /* 상담받을 기업 */
	  private String memLoginId;
	  
	  
	public String getMemLoginId() {
		return memLoginId;
	}

	public void setMemLoginId(String memLoginId) {
		this.memLoginId = memLoginId;
	}

	public int getReqNo() {
		return reqNo;
	}

	public void setReqNo(int reqNo) {
		this.reqNo = reqNo;
	}

	public String getLoginId() {
		return loginId;
	}

	public void setLoginId(String loginId) {
		this.loginId = loginId;
	}

	public String getPtplNo() {
		return ptplNo;
	}

	public void setPtplNo(String ptplNo) {
		this.ptplNo = ptplNo;
	}

	public int getSeq() {
		return seq;
	}

	public void setSeq(int seq) {
		this.seq = seq;
	}

	public String getRegGb() {
		return regGb;
	}

	public void setRegGb(String regGb) {
		this.regGb = regGb;
	}

	public String getCont() {
		return cont;
	}

	public void setCont(String cont) {
		this.cont = cont;
	}

	public String getRegDt() {
		return regDt;
	}

	public void setRegDt(String regDt) {
		this.regDt = regDt;
	}

	public String getRegister() {
		return register;
	}

	public void setRegister(String register) {
		this.register = register;
	}

	public String getRegisterFlag() {
		return registerFlag;
	}

	public void setRegisterFlag(String registerFlag) {
		this.registerFlag = registerFlag;
	}
	  
	  
	  
}
