package dlink.front.vo;

/**
 * @Class Name : MtsAtalkMsgVO.java
 * @Description : MtsAtalkMsg VO class
 * @Modification Information
 *
 * @author 이효진
 * @since 2022-04-07
 * @version 1.0
 * @see
 *  
 *  Copyright (C)  All right reserved.
 */
public class MtsAtalkMsgVO extends MtsAtalkMsgDefaultVO{
    private static final long serialVersionUID = 1L;
    
  //발신키 정보
  	private String site_z_key;
  	
    /** TRAN_PR */
    private java.math.BigInteger tranPr;
    
    /** TRAN_REFKEY */
    private java.lang.String tranRefkey;
    
    /** TRAN_ID */
    private java.lang.String tranId;
    
    /** TRAN_SENDER_KEY */
    private java.lang.String tranSenderKey;
    
    /** TRAN_TMPL_CD */
    private java.lang.String tranTmplCd;
    
    /** TRAN_BUTTON */
    private java.lang.String tranButton;
    
    /** TRAN_PHONE */
    private java.lang.String tranPhone;
    
    /** TRAN_MSG */
    private java.lang.String tranMsg;
    
    /** TRAN_DATE */
    private java.util.Date tranDate;
    
    /** TRAN_TYPE */
    private int tranType;
    
    /** TRAN_STATUS */
    private java.lang.String tranStatus;
    
    /** TRAN_SENDDATE */
    private java.util.Date tranSenddate;
    
    /** TRAN_REPORTDATE */
    private java.util.Date tranReportdate;
    
    /** TRAN_RSLTDATE */
    private java.util.Date tranRsltdate;
    
    /** TRAN_RSLT */
    private java.lang.String tranRslt;
    
    /** TRAN_REPLACE_MSG */
    private java.lang.String tranReplaceMsg;
    
    /** TRAN_SUBJECT */
    private java.lang.String tranSubject;
    
    /** TRAN_CALLBACK */
    private java.lang.String tranCallback;
    
    /** TRAN_REPLACE_TYPE */
    private java.lang.String tranReplaceType;
    
    /** TRAN_ETC1 */
    private java.lang.String tranEtc1;
    
    /** TRAN_ETC2 */
    private java.lang.String tranEtc2;
    
    /** TRAN_ETC3 */
    private java.lang.String tranEtc3;
    
    /** TRAN_ETC4 */
    private java.lang.String tranEtc4;
    
    /** TRAN_END_TELCO */
    private java.lang.String tranEndTelco;
    
    /** TRAN_LOG */
    private java.lang.String tranLog;
    
    /** TRAN_GRPSEQ */
    private int tranGrpseq;
     
    /** TRAN_CURRENCY */
    private java.lang.String tranCurrency;
    
    /** TRAN_PRICE */
    private java.math.BigInteger tranPrice;
    
    /** TRAN_SUPPLEMENT */
    private java.lang.String tranSupplement;
       
    /** TRAN_TITLE */
    private java.lang.String tranTitle;
    
    /** TRAN_NATION_PHONE */
    private java.lang.String tranNationPhone;
    
    /** MOBILE_NO */
    private java.lang.String mobileNo;
    
    /** USER_NM */
    private java.lang.String userNm;
    
    /** COM_ID */
    private java.lang.String comId;
    
    private java.lang.String ptplNm;
    
    
    
    
    
    
    
    
	public java.lang.String getComId() {
		return comId;
	}

	public void setComId(java.lang.String comId) {
		this.comId = comId;
	}

	public java.lang.String getPtplNm() {
		return ptplNm;
	}

	public void setPtplNm(java.lang.String ptplNm) {
		this.ptplNm = ptplNm;
	}

	public java.math.BigInteger getTranPr() {
		return tranPr;
	}

	public void setTranPr(java.math.BigInteger tranPr) {
		this.tranPr = tranPr;
	}

	public java.lang.String getTranRefkey() {
		return tranRefkey;
	}

	public void setTranRefkey(java.lang.String tranRefkey) {
		this.tranRefkey = tranRefkey;
	}

	public java.lang.String getTranId() {
		return tranId;
	}

	public void setTranId(java.lang.String tranId) {
		this.tranId = tranId;
	}

	public java.lang.String getTranSenderKey() {
		return tranSenderKey;
	}

	public void setTranSenderKey(java.lang.String tranSenderKey) {
		this.tranSenderKey = tranSenderKey;
	}

	public java.lang.String getTranTmplCd() {
		return tranTmplCd;
	}

	public void setTranTmplCd(java.lang.String tranTmplCd) {
		this.tranTmplCd = tranTmplCd;
	}

	public java.lang.String getTranButton() {
		return tranButton;
	}

	public void setTranButton(java.lang.String tranButton) {
		this.tranButton = tranButton;
	}

	public java.lang.String getTranPhone() {
		return tranPhone;
	}

	public void setTranPhone(java.lang.String tranPhone) {
		this.tranPhone = tranPhone;
	}

	public java.lang.String getTranMsg() {
		return tranMsg;
	}

	public void setTranMsg(java.lang.String tranMsg) {
		this.tranMsg = tranMsg;
	}

	public java.util.Date getTranDate() {
		return tranDate;
	}

	public void setTranDate(java.util.Date tranDate) {
		this.tranDate = tranDate;
	}

	public int getTranType() {
		return tranType;
	}

	public void setTranType(int tranType) {
		this.tranType = tranType;
	}

	public java.lang.String getTranStatus() {
		return tranStatus;
	}

	public void setTranStatus(java.lang.String tranStatus) {
		this.tranStatus = tranStatus;
	}

	public java.util.Date getTranSenddate() {
		return tranSenddate;
	}

	public void setTranSenddate(java.util.Date tranSenddate) {
		this.tranSenddate = tranSenddate;
	}

	public java.util.Date getTranReportdate() {
		return tranReportdate;
	}

	public void setTranReportdate(java.util.Date tranReportdate) {
		this.tranReportdate = tranReportdate;
	}

	public java.util.Date getTranRsltdate() {
		return tranRsltdate;
	}

	public void setTranRsltdate(java.util.Date tranRsltdate) {
		this.tranRsltdate = tranRsltdate;
	}

	public java.lang.String getTranRslt() {
		return tranRslt;
	}

	public void setTranRslt(java.lang.String tranRslt) {
		this.tranRslt = tranRslt;
	}

	public java.lang.String getTranReplaceMsg() {
		return tranReplaceMsg;
	}

	public void setTranReplaceMsg(java.lang.String tranReplaceMsg) {
		this.tranReplaceMsg = tranReplaceMsg;
	}

	public java.lang.String getTranSubject() {
		return tranSubject;
	}

	public void setTranSubject(java.lang.String tranSubject) {
		this.tranSubject = tranSubject;
	}

	public java.lang.String getTranCallback() {
		return tranCallback;
	}

	public void setTranCallback(java.lang.String tranCallback) {
		this.tranCallback = tranCallback;
	}

	public java.lang.String getTranReplaceType() {
		return tranReplaceType;
	}

	public void setTranReplaceType(java.lang.String tranReplaceType) {
		this.tranReplaceType = tranReplaceType;
	}

	public java.lang.String getTranEtc1() {
		return tranEtc1;
	}

	public void setTranEtc1(java.lang.String tranEtc1) {
		this.tranEtc1 = tranEtc1;
	}

	public java.lang.String getTranEtc2() {
		return tranEtc2;
	}

	public void setTranEtc2(java.lang.String tranEtc2) {
		this.tranEtc2 = tranEtc2;
	}

	public java.lang.String getTranEtc3() {
		return tranEtc3;
	}

	public void setTranEtc3(java.lang.String tranEtc3) {
		this.tranEtc3 = tranEtc3;
	}

	public java.lang.String getTranEtc4() {
		return tranEtc4;
	}

	public void setTranEtc4(java.lang.String tranEtc4) {
		this.tranEtc4 = tranEtc4;
	}

	public java.lang.String getTranEndTelco() {
		return tranEndTelco;
	}

	public void setTranEndTelco(java.lang.String tranEndTelco) {
		this.tranEndTelco = tranEndTelco;
	}

	public java.lang.String getTranLog() {
		return tranLog;
	}

	public void setTranLog(java.lang.String tranLog) {
		this.tranLog = tranLog;
	}

	public int getTranGrpseq() {
		return tranGrpseq;
	}

	public void setTranGrpseq(int tranGrpseq) {
		this.tranGrpseq = tranGrpseq;
	}

	public java.lang.String getTranCurrency() {
		return tranCurrency;
	}

	public void setTranCurrency(java.lang.String tranCurrency) {
		this.tranCurrency = tranCurrency;
	}

	public java.math.BigInteger getTranPrice() {
		return tranPrice;
	}

	public void setTranPrice(java.math.BigInteger tranPrice) {
		this.tranPrice = tranPrice;
	}

	public java.lang.String getTranSupplement() {
		return tranSupplement;
	}

	public void setTranSupplement(java.lang.String tranSupplement) {
		this.tranSupplement = tranSupplement;
	}

	public java.lang.String getTranTitle() {
		return tranTitle;
	}

	public void setTranTitle(java.lang.String tranTitle) {
		this.tranTitle = tranTitle;
	}

	public java.lang.String getTranNationPhone() {
		return tranNationPhone;
	}

	public void setTranNationPhone(java.lang.String tranNationPhone) {
		this.tranNationPhone = tranNationPhone;
	}

	public String getSite_z_key() {
		return site_z_key;
	}

	public void setSite_z_key(String site_z_key) {
		this.site_z_key = site_z_key;
	}

	public java.lang.String getMobileNo() {
		return mobileNo;
	}

	public void setMobileNo(java.lang.String mobileNo) {
		this.mobileNo = mobileNo;
	}

	public java.lang.String getUserNm() {
		return userNm;
	}

	public void setUserNm(java.lang.String userNm) {
		this.userNm = userNm;
	}
    

    
}
