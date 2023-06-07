package dlink.front.vo;

import java.io.Serializable;

/**
 * @Class Name : LoginVO.java
 * @Description : Login VO class
 * @Modification Information
 * @
 * @  수정일         수정자                   수정내용
 * @ -------    --------    ---------------------------
 * @ 2009.03.03    박지욱          최초 생성
 *
 *  @author 공통서비스 개발팀 박지욱
 *  @since 2009.03.03
 *  @version 1.0
 *  @see
 *  
 */
public class LoginVO implements Serializable{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = -8274004534207618049L;
	
	private String user_id;
	private String user_type;
	private String user_nm;
	private String user_alias;
	private String user_pwd;
	private String user_sex;
	private String address;
	private String phone;
	private String phone1;
	private String phone2;
	private String phone3;
	private String user_status;
	private String insert_dt;
	private String login_dt;
	private String login_ip;
	private String hphone;
	private String hphone1;
	private String hphone2;
	private String hphone3;
	private String user_birth;
	private String mas_cd;
	private String site_id;
	
	private String postnum;
	private String add_detail;
	private String user_grade;
	
	private String secession_yn;
	private String secession_date;
	private String site_cd;
	private String menu_cd;
	private String emp_cd;
	private String emp_nm;
	private String tel_no1;
	private String tel_no2;
	private String tel_no3;
	private String hp_no1;
	private String hp_no2;
	private String hp_no3;
	private String org_nm;
	
	// 다산서당 관리자 테이블 통합 후
	private String organ_code;
	private String org_cd;
	private String last_login_date; 
	private String login_cnt; 
	private int pw_fail_cnt; 
	private String admin_div; 
	private String pw_upd_date; 
	private String pw_prev; 
	private String pw_upd_yn;
	private String admin_auth; 
	private String fax;
	private String use_yn;
	/** 수정일시 */
	private String mod_date = "";
	/** 암호사용제한일자 */
	private int adminPwLimitDay = 0;
	
	// 다산서당 세션용
	private String ID;
	private String NAME;
	private String org_gbn;
	private String org_id;
	private String org_name;
	private String admin_id;
	private String admin_nm;
	private String mem_id;
	private String mem_type;
	private String mem_nm;
	private String mem_pwd;
	private String mem_sex;
	private String mem_addr1;
	private String mem_email;
	private String mem_ho_no;
	private String reg_user_ip;
	private String mem_birthday;
	private String mem_zipcode;
	private String mem_addr2;
	private String mem_district;
	private String mem_job_cd;
	
	// 다산서당 tb_all_member용 
	private String mem_uid;
	private String merge_type; 
	private String merge_yn; 
	private String mem_hp_no;
	private String merge_init_yn;
	private String login_key;
	private String my_nam_yn;
	private String my_nam_code;
	private String upd_date;
	private String mem_pwd_upd_yn;
	private int userPwdLimitDay = 0;
	private String main_title;
	private String site_info;
	private String site_keyword;
	private String site_nm;
	private String middledepthmenu_nm;
	private String upmenucd;
	private String login_id;
	private String login_pw;
	private String tab_menu_cd;	//텝형 메뉴 리스트중 첫 번째 메뉴코드
	private String tab_menu_type;	//텝형 메뉴 리스트중 첫 번째 메뉴타입
	private String tab_menu_url;	//텝형 메뉴 리스트중 첫 번째 메뉴주소
	private String tab_upmenu_cd;	//텝형 메뉴 리스트중 첫 번째 상위메뉴코드
	private String menu_type;
	private String upmenu_cd;
	private String usertype;
	private String tel01;
	private String tel02;
	private String tel03;
	private String hp01;
	private String hp02;
	private String hp03;
	
	//알림톡 발신키 구분값
	private String site_z_key;

	//회원 승인여부
	private String proc_rst;
	
	/** 2021.07.07 관리자 메뉴 번호 */
	private String admin_menu_seq;	
	
	public String getProc_rst() {
		return proc_rst;
	}
	public void setProc_rst(String proc_rst) {
		this.proc_rst = proc_rst;
	}
	public String getAdmin_menu_seq() {
		return admin_menu_seq;
	}
	public void setAdmin_menu_seq(String admin_menu_seq) {
		this.admin_menu_seq = admin_menu_seq;
	}
	public String getSite_z_key() {
		return site_z_key;
	}
	public void setSite_z_key(String site_z_key) {
		this.site_z_key = site_z_key;
	}
	public String getHp01() {
		return hp01;
	}
	public void setHp01(String hp01) {
		this.hp01 = hp01;
	}
	public String getHp02() {
		return hp02;
	}
	public void setHp02(String hp02) {
		this.hp02 = hp02;
	}
	public String getHp03() {
		return hp03;
	}
	public void setHp03(String hp03) {
		this.hp03 = hp03;
	}
	public String getTel01() {
		return tel01;
	}
	public void setTel01(String tel01) {
		this.tel01 = tel01;
	}
	public String getTel02() {
		return tel02;
	}
	public void setTel02(String tel02) {
		this.tel02 = tel02;
	}
	public String getTel03() {
		return tel03;
	}
	public void setTel03(String tel03) {
		this.tel03 = tel03;
	}
	public String getUsertype() {
		return usertype;
	}
	public void setUsertype(String usertype) {
		this.usertype = usertype;
	}
	public String getTab_menu_cd() {
		return tab_menu_cd;
	}
	public void setTab_menu_cd(String tab_menu_cd) {
		this.tab_menu_cd = tab_menu_cd;
	}
	public String getTab_menu_type() {
		return tab_menu_type;
	}
	public void setTab_menu_type(String tab_menu_type) {
		this.tab_menu_type = tab_menu_type;
	}
	public String getTab_menu_url() {
		return tab_menu_url;
	}
	public void setTab_menu_url(String tab_menu_url) {
		this.tab_menu_url = tab_menu_url;
	}
	public String getTab_upmenu_cd() {
		return tab_upmenu_cd;
	}
	public void setTab_upmenu_cd(String tab_upmenu_cd) {
		this.tab_upmenu_cd = tab_upmenu_cd;
	}
	public String getUpmenu_cd() {
		return upmenu_cd;
	}
	public void setUpmenu_cd(String upmenu_cd) {
		this.upmenu_cd = upmenu_cd;
	}
	public String getMenu_type() {
		return menu_type;
	}
	public void setMenu_type(String menu_type) {
		this.menu_type = menu_type;
	}
	public String getEmp_cd() {
		return emp_cd;
	}
	public void setEmp_cd(String emp_cd) {
		this.emp_cd = emp_cd;
	}
	public String getEmp_nm() {
		return emp_nm;
	}
	public void setEmp_nm(String emp_nm) {
		this.emp_nm = emp_nm;
	}
	public String getTel_no1() {
		return tel_no1;
	}
	public void setTel_no1(String tel_no1) {
		this.tel_no1 = tel_no1;
	}
	public String getTel_no2() {
		return tel_no2;
	}
	public void setTel_no2(String tel_no2) {
		this.tel_no2 = tel_no2;
	}
	public String getTel_no3() {
		return tel_no3;
	}
	public void setTel_no3(String tel_no3) {
		this.tel_no3 = tel_no3;
	}
	public String getHp_no1() {
		return hp_no1;
	}
	public void setHp_no1(String hp_no1) {
		this.hp_no1 = hp_no1;
	}
	public String getHp_no2() {
		return hp_no2;
	}
	public void setHp_no2(String hp_no2) {
		this.hp_no2 = hp_no2;
	}
	public String getHp_no3() {
		return hp_no3;
	}
	public void setHp_no3(String hp_no3) {
		this.hp_no3 = hp_no3;
	}
	public String getOrg_nm() {
		return org_nm;
	}
	public void setOrg_nm(String org_nm) {
		this.org_nm = org_nm;
	}
	public String getLogin_id() {
		return login_id;
	}
	public void setLogin_id(String login_id) {
		this.login_id = login_id;
	}
	public String getLogin_pw() {
		return login_pw;
	}
	public void setLogin_pw(String login_pw) {
		this.login_pw = login_pw;
	}
	public String getUpmenucd() {
		return upmenucd;
	}
	public void setUpmenucd(String upmenucd) {
		this.upmenucd = upmenucd;
	}
	public String getMiddledepthmenu_nm() {
		return middledepthmenu_nm;
	}
	public void setMiddledepthmenu_nm(String middledepthmenu_nm) {
		this.middledepthmenu_nm = middledepthmenu_nm;
	}
	public String getMain_title() {
		return main_title;
	}
	public void setMain_title(String main_title) {
		this.main_title = main_title;
	}
	public String getSite_info() {
		return site_info;
	}
	public void setSite_info(String site_info) {
		this.site_info = site_info;
	}
	public String getSite_keyword() {
		return site_keyword;
	}
	public void setSite_keyword(String site_keyword) {
		this.site_keyword = site_keyword;
	}
	public String getSite_nm() {
		return site_nm;
	}
	public void setSite_nm(String site_nm) {
		this.site_nm = site_nm;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	/** 아이디 */
	private String id;
	/** 이름 */
	private String name;
	/** 주민등록번호 */
	private String ihidNum;
	/** 이메일주소 */
	private String email;
	/** 비밀번호 */
	private String password;
	/** 비밀번호 힌트 */
	private String passwordHint;
	/** 비밀번호 정답 */
	private String passwordCnsr;
	/** 사용자구분 */
	private String userSe;
	/** 조직(부서)ID */
	private String orgnztId;
	/** 조직(부서)명 */
	private String orgnztNm;
	/** 고유아이디 */
	private String uniqId;
	/** 로그인 후 이동할 페이지 */
	private String url;
	/** 사용자 IP정보 */
	private String ip;
	/** GPKI인증 DN */
	private String dn;
	/**
	 * id attribute 를 리턴한다.
	 * @return String
	 */
	

/**
 * @작성자				이상재
 * @최초작성			2019-09-19
 * @내용					세션에 에디터 상의 메뉴코드를 글로벌로 쓸 수 있는 glb_menu_cd 변수 생성
 * 							세션에 에디터 상의 페이지인덱스를 글로벌로 쓸 수 있는 glb_page_idx 변수 생성
 */
	private String glb_menu_cd;
	private String glb_page_idx;
	
/**
 * @작성자				이상재
 * @최초작성			2019-09-19
 * @내용					세션에 에디터 상의 메뉴코드를 글로벌로 쓸 수 있는 glb_temp_rsp 변수 생성
 * 							세션에 에디터 상의 페이지인덱스를 글로벌로 쓸 수 있는 glb_temp_code 변수 생성
 * 							세션에 에디터 상의 페이지인덱스를 글로벌로 쓸 수 있는 glb_temp_type 변수 생성
 */	
	private String glb_temp_rsp;
	private String glb_temp_code;
	private String glb_temp_type;
	
	public String getOrg_cd() {
		return org_cd;
	}
	public void setOrg_cd(String org_cd) {
		this.org_cd = org_cd;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getUser_type() {
		return user_type;
	}
	public void setUser_type(String user_type) {
		this.user_type = user_type;
	}
	public String getUser_nm() {
		return user_nm;
	}
	public void setUser_nm(String user_nm) {
		this.user_nm = user_nm;
	}
	public String getUser_alias() {
		return user_alias;
	}
	public void setUser_alias(String user_alias) {
		this.user_alias = user_alias;
	}
	public String getUser_pwd() {
		return user_pwd;
	}
	public void setUser_pwd(String user_pwd) {
		this.user_pwd = user_pwd;
	}
	public String getUser_sex() {
		return user_sex;
	}
	public void setUser_sex(String user_sex) {
		this.user_sex = user_sex;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getPhone1() {
		return phone1;
	}
	public void setPhone1(String phone1) {
		this.phone1 = phone1;
	}
	public String getPhone2() {
		return phone2;
	}
	public void setPhone2(String phone2) {
		this.phone2 = phone2;
	}
	public String getPhone3() {
		return phone3;
	}
	public void setPhone3(String phone3) {
		this.phone3 = phone3;
	}
	public String getUser_status() {
		return user_status;
	}
	public void setUser_status(String user_status) {
		this.user_status = user_status;
	}
	public String getInsert_dt() {
		return insert_dt;
	}
	public void setInsert_dt(String insert_dt) {
		this.insert_dt = insert_dt;
	}
	public String getLogin_dt() {
		return login_dt;
	}
	public void setLogin_dt(String login_dt) {
		this.login_dt = login_dt;
	}
	public String getLogin_ip() {
		return login_ip;
	}
	public void setLogin_ip(String login_ip) {
		this.login_ip = login_ip;
	}
	public String getHphone() {
		return hphone;
	}
	public void setHphone(String hphone) {
		this.hphone = hphone;
	}
	public String getHphone1() {
		return hphone1;
	}
	public void setHphone1(String hphone1) {
		this.hphone1 = hphone1;
	}
	public String getHphone2() {
		return hphone2;
	}
	public void setHphone2(String hphone2) {
		this.hphone2 = hphone2;
	}
	public String getHphone3() {
		return hphone3;
	}
	public void setHphone3(String hphone3) {
		this.hphone3 = hphone3;
	}
	public String getUser_birth() {
		return user_birth;
	}
	public void setUser_birth(String user_birth) {
		this.user_birth = user_birth;
	}
	public String getMas_cd() {
		return mas_cd;
	}
	public void setMas_cd(String mas_cd) {
		this.mas_cd = mas_cd;
	}
	public String getSite_id() {
		return site_id;
	}
	public void setSite_id(String site_id) {
		this.site_id = site_id;
	}
	public String getPostnum() {
		return postnum;
	}
	public void setPostnum(String postnum) {
		this.postnum = postnum;
	}
	public String getAdd_detail() {
		return add_detail;
	}
	public void setAdd_detail(String add_detail) {
		this.add_detail = add_detail;
	}
	public String getUser_grade() {
		return user_grade;
	}
	public void setUser_grade(String user_grade) {
		this.user_grade = user_grade;
	}
	public String getSecession_yn() {
		return secession_yn;
	}
	public void setSecession_yn(String secession_yn) {
		this.secession_yn = secession_yn;
	}
	public String getSecession_date() {
		return secession_date;
	}
	public void setSecession_date(String secession_date) {
		this.secession_date = secession_date;
	}
	public String getSite_cd() {
		return site_cd;
	}
	public void setSite_cd(String site_cd) {
		this.site_cd = site_cd;
	}
	public String getMenu_cd() {
		return menu_cd;
	}
	public void setMenu_cd(String menu_cd) {
		this.menu_cd = menu_cd;
	}
	public String getOrgan_code() {
		return organ_code;
	}
	public void setOrgan_code(String organ_code) {
		this.organ_code = organ_code;
	}
	public String getLast_login_date() {
		return last_login_date;
	}
	public void setLast_login_date(String last_login_date) {
		this.last_login_date = last_login_date;
	}
	public String getLogin_cnt() {
		return login_cnt;
	}
	public void setLogin_cnt(String login_cnt) {
		this.login_cnt = login_cnt;
	}
	public int getPw_fail_cnt() {
		return pw_fail_cnt;
	}
	public void setPw_fail_cnt(int pw_fail_cnt) {
		this.pw_fail_cnt = pw_fail_cnt;
	}
	public String getAdmin_div() {
		return admin_div;
	}
	public void setAdmin_div(String admin_div) {
		this.admin_div = admin_div;
	}
	public String getPw_upd_date() {
		return pw_upd_date;
	}
	public void setPw_upd_date(String pw_upd_date) {
		this.pw_upd_date = pw_upd_date;
	}
	public String getPw_prev() {
		return pw_prev;
	}
	public void setPw_prev(String pw_prev) {
		this.pw_prev = pw_prev;
	}
	public String getPw_upd_yn() {
		return pw_upd_yn;
	}
	public void setPw_upd_yn(String pw_upd_yn) {
		this.pw_upd_yn = pw_upd_yn;
	}
	public String getAdmin_auth() {
		return admin_auth;
	}
	public void setAdmin_auth(String admin_auth) {
		this.admin_auth = admin_auth;
	}
	public String getFax() {
		return fax;
	}
	public void setFax(String fax) {
		this.fax = fax;
	}
	public String getUse_yn() {
		return use_yn;
	}
	public void setUse_yn(String use_yn) {
		this.use_yn = use_yn;
	}
	public String getMod_date() {
		return mod_date;
	}
	public void setMod_date(String mod_date) {
		this.mod_date = mod_date;
	}
	public int getAdminPwLimitDay() {
		return adminPwLimitDay;
	}
	public void setAdminPwLimitDay(int adminPwLimitDay) {
		this.adminPwLimitDay = adminPwLimitDay;
	}
	public String getID() {
		return ID;
	}
	public void setID(String iD) {
		ID = iD;
	}
	public String getNAME() {
		return NAME;
	}
	public void setNAME(String nAME) {
		NAME = nAME;
	}
	public String getOrg_gbn() {
		return org_gbn;
	}
	public void setOrg_gbn(String org_gbn) {
		this.org_gbn = org_gbn;
	}
	public String getOrg_id() {
		return org_id;
	}
	public void setOrg_id(String org_id) {
		this.org_id = org_id;
	}
	public String getOrg_name() {
		return org_name;
	}
	public void setOrg_name(String org_name) {
		this.org_name = org_name;
	}
	public String getAdmin_id() {
		return admin_id;
	}
	public void setAdmin_id(String admin_id) {
		this.admin_id = admin_id;
	}
	public String getAdmin_nm() {
		return admin_nm;
	}
	public void setAdmin_nm(String admin_nm) {
		this.admin_nm = admin_nm;
	}
	public String getMem_id() {
		return mem_id;
	}
	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}
	public String getMem_type() {
		return mem_type;
	}
	public void setMem_type(String mem_type) {
		this.mem_type = mem_type;
	}
	public String getMem_nm() {
		return mem_nm;
	}
	public void setMem_nm(String mem_nm) {
		this.mem_nm = mem_nm;
	}
	public String getMem_pwd() {
		return mem_pwd;
	}
	public void setMem_pwd(String mem_pwd) {
		this.mem_pwd = mem_pwd;
	}
	public String getMem_sex() {
		return mem_sex;
	}
	public void setMem_sex(String mem_sex) {
		this.mem_sex = mem_sex;
	}
	public String getMem_addr1() {
		return mem_addr1;
	}
	public void setMem_addr1(String mem_addr1) {
		this.mem_addr1 = mem_addr1;
	}
	public String getMem_email() {
		return mem_email;
	}
	public void setMem_email(String mem_email) {
		this.mem_email = mem_email;
	}
	public String getMem_ho_no() {
		return mem_ho_no;
	}
	public void setMem_ho_no(String mem_ho_no) {
		this.mem_ho_no = mem_ho_no;
	}
	public String getReg_user_ip() {
		return reg_user_ip;
	}
	public void setReg_user_ip(String reg_user_ip) {
		this.reg_user_ip = reg_user_ip;
	}
	public String getMem_birthday() {
		return mem_birthday;
	}
	public void setMem_birthday(String mem_birthday) {
		this.mem_birthday = mem_birthday;
	}
	public String getMem_zipcode() {
		return mem_zipcode;
	}
	public void setMem_zipcode(String mem_zipcode) {
		this.mem_zipcode = mem_zipcode;
	}
	public String getMem_addr2() {
		return mem_addr2;
	}
	public void setMem_addr2(String mem_addr2) {
		this.mem_addr2 = mem_addr2;
	}
	public String getMem_district() {
		return mem_district;
	}
	public void setMem_district(String mem_district) {
		this.mem_district = mem_district;
	}
	public String getMem_job_cd() {
		return mem_job_cd;
	}
	public void setMem_job_cd(String mem_job_cd) {
		this.mem_job_cd = mem_job_cd;
	}
	public String getMem_uid() {
		return mem_uid;
	}
	public void setMem_uid(String mem_uid) {
		this.mem_uid = mem_uid;
	}
	public String getMerge_type() {
		return merge_type;
	}
	public void setMerge_type(String merge_type) {
		this.merge_type = merge_type;
	}
	public String getMerge_yn() {
		return merge_yn;
	}
	public void setMerge_yn(String merge_yn) {
		this.merge_yn = merge_yn;
	}
	public String getMem_hp_no() {
		return mem_hp_no;
	}
	public void setMem_hp_no(String mem_hp_no) {
		this.mem_hp_no = mem_hp_no;
	}
	public String getMerge_init_yn() {
		return merge_init_yn;
	}
	public void setMerge_init_yn(String merge_init_yn) {
		this.merge_init_yn = merge_init_yn;
	}
	public String getLogin_key() {
		return login_key;
	}
	public void setLogin_key(String login_key) {
		this.login_key = login_key;
	}
	public String getMy_nam_yn() {
		return my_nam_yn;
	}
	public void setMy_nam_yn(String my_nam_yn) {
		this.my_nam_yn = my_nam_yn;
	}
	public String getMy_nam_code() {
		return my_nam_code;
	}
	public void setMy_nam_code(String my_nam_code) {
		this.my_nam_code = my_nam_code;
	}
	public String getUpd_date() {
		return upd_date;
	}
	public void setUpd_date(String upd_date) {
		this.upd_date = upd_date;
	}
	public String getMem_pwd_upd_yn() {
		return mem_pwd_upd_yn;
	}
	public void setMem_pwd_upd_yn(String mem_pwd_upd_yn) {
		this.mem_pwd_upd_yn = mem_pwd_upd_yn;
	}
	public int getUserPwdLimitDay() {
		return userPwdLimitDay;
	}
	public void setUserPwdLimitDay(int userPwdLimitDay) {
		this.userPwdLimitDay = userPwdLimitDay;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getIhidNum() {
		return ihidNum;
	}
	public void setIhidNum(String ihidNum) {
		this.ihidNum = ihidNum;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getPasswordHint() {
		return passwordHint;
	}
	public void setPasswordHint(String passwordHint) {
		this.passwordHint = passwordHint;
	}
	public String getPasswordCnsr() {
		return passwordCnsr;
	}
	public void setPasswordCnsr(String passwordCnsr) {
		this.passwordCnsr = passwordCnsr;
	}
	public String getUserSe() {
		return userSe;
	}
	public void setUserSe(String userSe) {
		this.userSe = userSe;
	}
	public String getOrgnztId() {
		return orgnztId;
	}
	public void setOrgnztId(String orgnztId) {
		this.orgnztId = orgnztId;
	}
	public String getOrgnztNm() {
		return orgnztNm;
	}
	public void setOrgnztNm(String orgnztNm) {
		this.orgnztNm = orgnztNm;
	}
	public String getUniqId() {
		return uniqId;
	}
	public void setUniqId(String uniqId) {
		this.uniqId = uniqId;
	}
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	public String getIp() {
		return ip;
	}
	public void setIp(String ip) {
		this.ip = ip;
	}
	public String getDn() {
		return dn;
	}
	public void setDn(String dn) {
		this.dn = dn;
	}
	public String getGlb_menu_cd() {
		return glb_menu_cd;
	}
	public void setGlb_menu_cd(String glb_menu_cd) {
		this.glb_menu_cd = glb_menu_cd;
	}
	public String getGlb_page_idx() {
		return glb_page_idx;
	}
	public void setGlb_page_idx(String glb_page_idx) {
		this.glb_page_idx = glb_page_idx;
	}
	public String getGlb_temp_rsp() {
		return glb_temp_rsp;
	}
	public void setGlb_temp_rsp(String glb_temp_rsp) {
		this.glb_temp_rsp = glb_temp_rsp;
	}
	public String getGlb_temp_code() {
		return glb_temp_code;
	}
	public void setGlb_temp_code(String glb_temp_code) {
		this.glb_temp_code = glb_temp_code;
	}
	public String getGlb_temp_type() {
		return glb_temp_type;
	}
	public void setGlb_temp_type(String glb_temp_type) {
		this.glb_temp_type = glb_temp_type;
	}

	
	
	
}
