package dlink.common.controller;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.math.BigDecimal;
import java.net.URLEncoder;
import java.sql.SQLException;
import java.util.List;
import java.util.logging.Logger;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.compress.archivers.dump.InvalidFormatException;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import dlink.admin.service.TCommutyService;
import dlink.admin.vo.TCommutyVO;
import dlink.common.service.CommProperties;
import dlink.common.service.TAttfileService;
import dlink.common.vo.TAttfileVO;
import egovframework.cmmn.EgovBasicLogger;
import egovframework.cmmn.EgovResourceCloseHelper;
import egovframework.cmmn.service.EgovFileUploadUtil;
import egovframework.cmmn.vo.EgovFormBasedFileVo;


@Controller
public class FileController {
	private final static Logger LOG = Logger.getGlobal();
    
	private static String stordFilePath = CommProperties.getProperty("Globals.fileStorePath");
    @Resource(name = "TAttfileService")
    private TAttfileService tAttfileService;
    
    @Resource(name = "TCommutyService")
    private TCommutyService TCommutyService;
    
	
	//이미지파일업로드
	@RequestMapping(value="/imagefile/upload.do" , method=RequestMethod.POST, produces="application/text;charset=utf8")
	@ResponseBody
	public String fileUpload(TAttfileVO  attVO, HttpSession session, ModelAndView view, MultipartHttpServletRequest request
						) throws Exception{
		
		String rst = "";
		
		String saveFolder = stordFilePath;
		File Folder = new File(saveFolder);
		if (!Folder.exists()) {
			try{
				Folder.mkdir(); //폴더 생성합니다.
		    }catch(Exception e){
		    	e.getStackTrace();
		    }        
	    }
		
		try {
			try {
				List<EgovFormBasedFileVo> fList = EgovFileUploadUtil.uploadFiles(request, saveFolder, 1024 * 1024*50);
				int fileSeq = 0;
				if(fList.size()>0){
					for(int i=0; i<fList.size(); i++){
						fileSeq = tAttfileService.selectFileSeq(attVO);
						attVO.setFileNm(fList.get(i).getFileName());			//file_nm
						attVO.setFileSaveNm(fList.get(i).getPhysicalName());		//save_file_nm
						attVO.setSavePath(fList.get(i).getServerSubPath());
						attVO.setFileSize((String.valueOf(fList.get(i).getSize())));			//file_size
						attVO.setFileType(fList.get(i).getContentType());	
						attVO.setFileSeq(new BigDecimal(fileSeq));
						//첨부파일등록
						tAttfileService.insertTAttfile(attVO);
					}
				}
				rst = String.valueOf(fileSeq) +"&"+attVO.getFileNm();
			} catch (NullPointerException e) {
				e.printStackTrace();
				rst="empty";
				return rst;
			}
	
		} catch (Exception e) {
			e.printStackTrace();
			rst=null;
		}
		return rst;
	}
	
	@RequestMapping(value="/imagefile/upload2.do")
	public void fileUpload_method(@ModelAttribute("TAttfileVO") TAttfileVO attVO
			) throws Exception, ClassNotFoundException, IOException, InvalidFormatException, SQLException {
		
		String saveFolder = stordFilePath;
		File Folder = new File(saveFolder);
		if (!Folder.exists()) {
			try{
				Folder.mkdir(); //폴더 생성합니다.
			}catch(Exception e){
				e.getStackTrace();
			}           
		}
		try {
			String numStr = "";
			//파일정보입력
			tAttfileService.insertTAttfile(attVO);
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	//이미지파일 다운로드
	@RequestMapping(value="/imagefile/download.do")
	public void fileDownload(HttpServletRequest request, HttpServletResponse response) throws Exception {
		BigDecimal file_no = new BigDecimal(request.getParameter("file_no"));
		
		TAttfileVO vo = new TAttfileVO();
		vo.setFileSeq(file_no);
		
		TAttfileVO att = tAttfileService.selectTAttfile(vo);
		String path = stordFilePath + att.getSavePath() + System.getProperty("file.separator");
		File downFile = null;
		
		downFile = new File(path + att.getFileSaveNm());
		
		 String mimetype = "application/octet-stream";

            response.setContentType(mimetype);
            response.setHeader("Content-Disposition", "attachment; filename=\"" + URLEncoder.encode(att.getFileNm(), "utf-8") + "\"");

            BufferedInputStream in = null;
            BufferedOutputStream out = null;

            try {
               in = new BufferedInputStream(new FileInputStream(downFile));
               out = new BufferedOutputStream(response.getOutputStream());

               FileCopyUtils.copy(in, out);
               out.flush();
            } catch (IOException ex) {
               // 다음 Exception 무시 처리
               // Connection reset by peer: socket write error
               EgovBasicLogger.ignore("IO Exception", ex);
            } finally {
               EgovResourceCloseHelper.close(in, out);
            }
	}
	
	//이미지파일 미리보기
	@RequestMapping(value="/imagefile/preview.do")
	public void filePreview(HttpServletRequest request, HttpServletResponse response) 
			throws Exception {	
		BigDecimal fileSeq = new BigDecimal(request.getParameter("fileSeq"));
		
		TAttfileVO vo = new TAttfileVO();
		vo.setFileSeq(fileSeq);
		TAttfileVO att = tAttfileService.selectTAttfile(vo);
		String path = stordFilePath + att.getSavePath() + System.getProperty("file.separator");
		
		File downFile = new File(path + att.getFileSaveNm());
		
		response.setHeader("Content-Disposition", "inline; filename=\"" + URLEncoder.encode(att.getFileNm(), "utf-8") + "\"");
		
		if(null != att.getFileType()) {
			
	        response.setContentType(att.getFileType());
	        
		} else {
			
	        response.setContentType("application/octet-stream");
	        
		}

        BufferedInputStream in = null;
        BufferedOutputStream out = null;

        try {
           in = new BufferedInputStream(new FileInputStream(downFile));
           out = new BufferedOutputStream(response.getOutputStream());

           FileCopyUtils.copy(in, out);
           out.flush();
        } catch (IOException ex) {
           // 다음 Exception 무시 처리
           // Connection reset by peer: socket write error
           EgovBasicLogger.ignore("IO Exception", ex);
        } finally {
           EgovResourceCloseHelper.close(in, out);
        }
	}
	
	//파일 재업로드 및 삭제
	@RequestMapping(value="/imagefile/delete.do" , method=RequestMethod.POST, produces="application/text;charset=utf8")
	@ResponseBody
	public String mainimgdelete(TAttfileVO  attVO, HttpSession session, ModelAndView view, HttpServletRequest request) throws Exception{
		
		String rst = "";
		try {
			try {
				
				
				TAttfileVO att = tAttfileService.selectTAttfile(attVO);
				//파일 삭제
				tAttfileService.deleteTAttfile(att);
									
				rst = "suc";
				
			} catch (NullPointerException e) {
				e.printStackTrace();
				rst="empty";
				return rst;
			}
		} catch (Exception e) {
			e.printStackTrace();
			rst=null;
		}
		return rst;
	}
	

	
	
	
}