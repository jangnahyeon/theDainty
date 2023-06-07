package dlink_new.common;

import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertNotSame;
import static org.junit.Assert.fail;

import javax.annotation.Resource;
import javax.sql.DataSource;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import dlink_new.common.service.TbAtalkTmplService;
import dlink_new.common.vo.TbAtalkTmplVO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations= {		
	"file:src/test/resources/egovframework/spring/context-*.xml",		
	"file:src/test/resources/egovframework/spring/dispatcher-servlet.xml",
})
public class TestAtalkTmpl {	
	
	@Resource(name = "tbAtalkTmplService")
    private TbAtalkTmplService tbAtalkTmplService;
	
	@Resource(name = "dataSource")
	DataSource dataSource;	

	@Test
	public void test() {
		fail("Not yet implemented");
	}
	
	@Test
	public void testDatasource() {
		assertNotNull(tbAtalkTmplService);
		assertNotNull(dataSource);
	}
	
	@Test
	public void testAtalkTmpl_001() throws Exception {
		
		TbAtalkTmplVO vo = new TbAtalkTmplVO();
		vo.setTmplCd("dlink_mts001");
		vo = tbAtalkTmplService.selectTbAtalkTmpl(vo);
		assertNotNull(vo);
		
		if( "Y".equals(vo.getUseYn()) ) {		
			String msg = vo.getTranMsg();
			vo.setTranMsg(msg);
			
			java.lang.Integer tranPr = tbAtalkTmplService.insertMtsAtalkMsg(vo);
			assertNotSame(0, tranPr);
		}
		
	}
	
	@Test
	public void testAtalkTmpl_002() throws Exception {
		
		TbAtalkTmplVO vo = new TbAtalkTmplVO();
		vo.setTmplCd("dlink_mts002");
		vo = tbAtalkTmplService.selectTbAtalkTmpl(vo);
		assertNotNull(vo);
		
		String msg = vo.getTranMsg();		
		vo.setTranMsg(msg);
		
		java.lang.Integer tranPr = tbAtalkTmplService.insertMtsAtalkMsg(vo);
		assertNotSame(0, tranPr);
		
	}
	
	@Test
	public void testAtalkTmpl_003() throws Exception {
		
		TbAtalkTmplVO vo = new TbAtalkTmplVO();
		vo.setTmplCd("dlink_mts003");
		vo = tbAtalkTmplService.selectTbAtalkTmpl(vo);
		assertNotNull(vo);
		
		String msg = vo.getTranMsg();		
		vo.setTranMsg(msg);
		
		java.lang.Integer tranPr = tbAtalkTmplService.insertMtsAtalkMsg(vo);
		assertNotSame(0, tranPr);
		
	}
	
	@Test
	public void testAtalkTmpl_005() throws Exception {
		
		TbAtalkTmplVO vo = new TbAtalkTmplVO();
		vo.setTmplCd("dlink_mts005");
		vo = tbAtalkTmplService.selectTbAtalkTmpl(vo);
		assertNotNull(vo);
		
		String msg = vo.getTranMsg();
		String rejectMsg = "반려사유 : 중복가입";
		msg = msg.replace("#{반려사유}", rejectMsg);
		vo.setTranMsg(msg);
		
		java.lang.Integer tranPr = tbAtalkTmplService.insertMtsAtalkMsg(vo);
		assertNotSame(0, tranPr);
		
	}
	
	@Test
	public void testAtalkTmpl_004() throws Exception {		
		TbAtalkTmplVO vo = new TbAtalkTmplVO();
		vo.setTmplCd("dlink_mts004");
		vo = tbAtalkTmplService.selectTbAtalkTmpl(vo);
		assertNotNull(vo);
		
		String msg = vo.getTranMsg();
		String authNo = "[010101]";
		msg = msg.replace("#{인증번호}", authNo);
		vo.setTranMsg(msg);
		
		java.lang.Integer tranPr = tbAtalkTmplService.insertMtsAtalkMsg(vo);
		assertNotSame(0, tranPr);		
	}
	
	@Test
	public void testAtalkTmpl_006() throws Exception {		
		TbAtalkTmplVO vo = new TbAtalkTmplVO();
		vo.setTmplCd("dlink_mts006");
		vo = tbAtalkTmplService.selectTbAtalkTmpl(vo);
		assertNotNull(vo);
		
		String msg = vo.getTranMsg();	
		String pw = "[010101]";
		msg = msg.replace("#{비밀번호}", pw);
		vo.setTranMsg(msg);
		
		java.lang.Integer tranPr = tbAtalkTmplService.insertMtsAtalkMsg(vo);
		assertNotSame(0, tranPr);		
	}
	
	@Test
	public void testAtalkTmpl_101() throws Exception {		
		TbAtalkTmplVO vo = new TbAtalkTmplVO();
		vo.setTmplCd("dlink_mts101");
		vo = tbAtalkTmplService.selectTbAtalkTmpl(vo);
		assertNotNull(vo);
		
		String msg = vo.getTranMsg();
		
		String rsvInfo = 
				String.format(
						"\n%s\n%s\n%s",
						"예약날짜 : 2023-02-07",
						"예약시간 : 09:00~12:00"
						);
		
		msg = msg.replace("#{예약정보}", rsvInfo);
		vo.setTranMsg(msg);
		
		java.lang.Integer tranPr = tbAtalkTmplService.insertMtsAtalkMsg(vo);
		assertNotSame(0, tranPr);		
	}
	
	@Test
	public void testAtalkTmpl_102() throws Exception {		
		TbAtalkTmplVO vo = new TbAtalkTmplVO();
		vo.setTmplCd("dlink_mts102");
		vo = tbAtalkTmplService.selectTbAtalkTmpl(vo);
		assertNotNull(vo);
		
		String msg = vo.getTranMsg();
		
		String rsvInfo = 
				String.format(
						"\n%s\n%s\n%s",
						"예약날짜 : 2023-02-07",
						"예약시간 : 09:00~12:00"
						);
		
		msg = msg.replace("#{예약정보}", rsvInfo);
		vo.setTranMsg(msg);
		
		java.lang.Integer tranPr = tbAtalkTmplService.insertMtsAtalkMsg(vo);
		assertNotSame(0, tranPr);		
	}
	
	@Test
	public void testAtalkTmpl_103() throws Exception {		
		TbAtalkTmplVO vo = new TbAtalkTmplVO();
		vo.setTmplCd("dlink_mts103");
		vo = tbAtalkTmplService.selectTbAtalkTmpl(vo);
		assertNotNull(vo);
		
		String msg = vo.getTranMsg();
		
		String rsvInfo = 
				String.format(
						"\n%s\n%s\n%s",
						"예약날짜 : 2023-02-07",
						"예약시간 : 09:00~12:00"
						);
		
		msg = msg.replace("#{예약정보}", rsvInfo);
		vo.setTranMsg(msg);
		
		java.lang.Integer tranPr = tbAtalkTmplService.insertMtsAtalkMsg(vo);
		assertNotSame(0, tranPr);		
	}
	
	@Test
	public void testAtalkTmpl_104() throws Exception {		
		TbAtalkTmplVO vo = new TbAtalkTmplVO();
		vo.setTmplCd("dlink_mts104");
		vo = tbAtalkTmplService.selectTbAtalkTmpl(vo);
		assertNotNull(vo);
		
		String msg = vo.getTranMsg();

		String rsvInfo = 
				String.format(
						"\n%s\n%s\n%s",
						"예약날짜 : 2023-02-07",
						"예약시간 : 09:00~12:00"
						);
		
		msg = msg.replace("#{예약정보}", rsvInfo);
		vo.setTranMsg(msg);
		
		java.lang.Integer tranPr = tbAtalkTmplService.insertMtsAtalkMsg(vo);
		assertNotSame(0, tranPr);		
	}
	
	@Test
	public void testAtalkTmpl_105() throws Exception {		
		TbAtalkTmplVO vo = new TbAtalkTmplVO();
		vo.setTmplCd("dlink_mts105");
		vo = tbAtalkTmplService.selectTbAtalkTmpl(vo);
		assertNotNull(vo);
		
		String msg = vo.getTranMsg();
		
		String rsvInfo = 
				String.format(
						"\n%s\n%s\n%s",
						"예약날짜 : 2023-02-07",
						"예약시간 : 09:00~12:00"
						);
		
		msg = msg.replace("#{예약정보}", rsvInfo);
		vo.setTranMsg(msg);
		
		java.lang.Integer tranPr = tbAtalkTmplService.insertMtsAtalkMsg(vo);
		assertNotSame(0, tranPr);		
	}
	
	@Test
	public void testAtalkTmpl_106() throws Exception {		
		TbAtalkTmplVO vo = new TbAtalkTmplVO();
		vo.setTmplCd("dlink_mts106");
		vo = tbAtalkTmplService.selectTbAtalkTmpl(vo);
		assertNotNull(vo);
		
		String msg = vo.getTranMsg();
		
		String rsvInfo = 
				String.format("\n%s\n%s\n%s",
						"예약날짜 : 2023-02-07",
						"예약시간 : 09:00~12:00",
						"반려사유 : 예약마감" );
		
		msg = msg.replace("#{예약정보}", rsvInfo);
		vo.setTranMsg(msg);
		
		java.lang.Integer tranPr = tbAtalkTmplService.insertMtsAtalkMsg(vo);
		assertNotSame(0, tranPr);		
	}

}
