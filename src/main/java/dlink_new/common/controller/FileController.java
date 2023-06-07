package dlink_new.common.controller;

import java.awt.AlphaComposite;
import java.awt.Graphics2D;
import java.awt.Image;
import java.awt.image.BufferedImage;
import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.math.BigDecimal;
import java.net.URLEncoder;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.logging.Logger;

import javax.annotation.Resource;
import javax.imageio.ImageIO;
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

import com.fasterxml.jackson.databind.ObjectMapper;

import dlink.common.service.CommProperties;
import dlink_new.common.service.FileService;
import dlink_new.common.vo.FileVO;
import egovframework.cmmn.EgovBasicLogger;
import egovframework.cmmn.EgovResourceCloseHelper;
import egovframework.cmmn.service.EgovFileUploadUtil;
import egovframework.cmmn.vo.EgovFormBasedFileVo;

@Controller
public class FileController {
	private final static Logger LOG = Logger.getGlobal();

	private static String stordFilePath = CommProperties.getProperty("Globals.fileStorePath");
	private static String extensionWhiteList = CommProperties.getProperty("Globals.fileUpload.Extensions");

	@Resource(name = "FileService")
	private FileService fileService;

	// @Resource(name = "TCommutyService")
	// private TCommutyService TCommutyService;

	// �대�몄����쇱��濡���
	@RequestMapping(value = "/imagefile/upload.do", method = RequestMethod.POST, produces = "application/text;charset=utf8")
	@ResponseBody
	public String fileUpload(FileVO attVO, HttpSession session, ModelAndView view, MultipartHttpServletRequest request)
			throws Exception {

		String rst = "";

		String saveFolder = stordFilePath;
		File Folder = new File(saveFolder);
		if (!Folder.exists()) {
			try {
				Folder.mkdir(); // �대�� ���깊�⑸����.
			} catch (Exception e) {
				e.getStackTrace();
			}
		}

		try {
			try {
				List<EgovFormBasedFileVo> fList = EgovFileUploadUtil.uploadFilesExt(request, saveFolder,
						1024 * 1024 * 50, extensionWhiteList);
				int fileSeq = 0;
				if (fList.size() > 0) {
					for (int i = 0; i < fList.size(); i++) {
						fileSeq = fileService.selectFileSeq(attVO);
						attVO.setFileNm(fList.get(i).getFileName()); // file_nm
						attVO.setSaveNm(fList.get(i).getPhysicalName()); // save_file_nm
						attVO.setSavePath(fList.get(i).getServerSubPath());
						attVO.setFileSize((String.valueOf(fList.get(i).getSize()))); // file_size
						attVO.setFileType(fList.get(i).getContentType());
						attVO.setFileSeq(new BigDecimal(fileSeq));
						// 泥⑤����쇰�깅�
						fileService.insertTAttfile(attVO);
					}
				}
				rst = String.valueOf(fileSeq) + "&" + attVO.getFileNm();
			} catch (NullPointerException e) {
				e.printStackTrace();
				rst = "empty";
				return rst;
			}

		} catch (Exception e) {
			e.printStackTrace();
			rst = null;
		}
		return rst;
	}

	@RequestMapping(value = "/multi/file/upload.do", method = RequestMethod.POST, produces = "application/text;charset=utf8")
	@ResponseBody
	public String multiFileUpload(HttpSession session, ModelAndView view, MultipartHttpServletRequest request)
			throws Exception {

		// String rst = "";
		List<FileVO> fileList = new ArrayList<FileVO>();
		ObjectMapper mapper = new ObjectMapper();
		HashMap<String, Object> returnMap = new HashMap<String, Object>();
		String jsonStr = "";

		returnMap.put("result", "N");
		jsonStr = mapper.writeValueAsString(returnMap);

		String saveFolder = stordFilePath;
		File Folder = new File(saveFolder);
		if (!Folder.exists()) {
			try {
				Folder.mkdir(); // 폴더생성
			} catch (Exception e) {
				e.getStackTrace();
			}
		}

		try {
			try {
				List<EgovFormBasedFileVo> fList = EgovFileUploadUtil.uploadFilesExt(request, saveFolder,
						1024 * 1024 * 50, extensionWhiteList);
				int fileSeq = 0;
				if (fList.size() > 0) {
					for (int i = 0; i < fList.size(); i++) {
						FileVO attVO = new FileVO();
						fileSeq = fileService.selectFileSeq(attVO);
						attVO.setFileNm(fList.get(i).getFileName()); // file_nm
						attVO.setSaveNm(fList.get(i).getPhysicalName()); // save_file_nm
						attVO.setSavePath(fList.get(i).getServerSubPath());
						attVO.setFileSize((String.valueOf(fList.get(i).getSize()))); // file_size
						attVO.setFileType(fList.get(i).getContentType());
						attVO.setFileSeq(new BigDecimal(fileSeq));
						// 첨부파일등록
						fileService.insertTAttfile(attVO);

						fileList.add(attVO);
					}

					returnMap.put("result", "Y");
					returnMap.put("fileList", fileList);
					jsonStr = mapper.writeValueAsString(returnMap);
				}
				// rst = String.valueOf(fileSeq) +"&"+attVO.getFileNm();

			} catch (NullPointerException e) {
				e.printStackTrace();
				// rst="empty";

				returnMap.put("result", "N");
				jsonStr = mapper.writeValueAsString(returnMap);

				return jsonStr;
			}

		} catch (Exception e) {
			e.printStackTrace();
			// rst=null;

			returnMap.put("result", "N");
			jsonStr = mapper.writeValueAsString(returnMap);
		}

		// return rst;

		return jsonStr;
	}

	@RequestMapping(value = "/imagefile/upload2.do")
	public void fileUpload_method(@ModelAttribute("FileVO") FileVO attVO)
			throws Exception, ClassNotFoundException, IOException, InvalidFormatException, SQLException {

		String saveFolder = stordFilePath;
		File Folder = new File(saveFolder);
		if (!Folder.exists()) {
			try {
				Folder.mkdir(); // �대�� ���깊�⑸����.
			} catch (Exception e) {
				e.getStackTrace();
			}
		}
		try {
			String numStr = "";
			// ���쇱��蹂댁����
			fileService.insertTAttfile(attVO);

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	// �대�몄����� �ㅼ�대���
	@RequestMapping(value = "/imagefile/download.do")
	public void fileDownload(HttpServletRequest request, HttpServletResponse response) throws Exception {
		BigDecimal file_no = new BigDecimal(request.getParameter("file_no"));

		FileVO vo = new FileVO();
		vo.setFileSeq(file_no);

		FileVO att = fileService.selectTAttfile(vo);
		String path = stordFilePath + att.getSavePath() + System.getProperty("file.separator");
		File downFile = null;

		downFile = new File(path + att.getSaveNm());

		String mimetype = "application/octet-stream";

		response.setContentType(mimetype);
		response.setHeader("Content-Disposition",
				"attachment; filename=\"" + URLEncoder.encode(att.getFileNm(), "utf-8") + "\"");

		BufferedInputStream in = null;
		BufferedOutputStream out = null;

		try {
			in = new BufferedInputStream(new FileInputStream(downFile));
			out = new BufferedOutputStream(response.getOutputStream());

			FileCopyUtils.copy(in, out);
			out.flush();
		} catch (IOException ex) {
			// �ㅼ�� Exception 臾댁�� 泥�由�
			// Connection reset by peer: socket write error
			EgovBasicLogger.ignore("IO Exception", ex);
		} finally {
			EgovResourceCloseHelper.close(in, out);
		}
	}

	// �대�몄����� 誘몃━蹂닿린
	@RequestMapping(value = "/imagefile/preview.do")
	public void filePreview(HttpServletRequest request, HttpServletResponse response) throws Exception {
		BigDecimal fileSeq = new BigDecimal(request.getParameter("fileSeq"));

		FileVO vo = new FileVO();
		vo.setFileSeq(fileSeq);
		FileVO att = fileService.selectTAttfile(vo);
		String path = stordFilePath + att.getSavePath() + System.getProperty("file.separator");

		File downFile = new File(path + att.getSaveNm());

		response.setHeader("Content-Disposition",
				"inline; filename=\"" + URLEncoder.encode(att.getFileNm(), "utf-8") + "\"");

		if (null != att.getFileType()) {

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
			// �ㅼ�� Exception 臾댁�� 泥�由�
			// Connection reset by peer: socket write error
			EgovBasicLogger.ignore("IO Exception", ex);
		} finally {
			EgovResourceCloseHelper.close(in, out);
		}
	}

	// ���� �ъ��濡��� 諛� ����
	@RequestMapping(value = "/imagefile/delete.do", method = RequestMethod.POST, produces = "application/text;charset=utf8")
	@ResponseBody
	public String mainimgdelete(FileVO attVO, HttpSession session, ModelAndView view, HttpServletRequest request)
			throws Exception {

		String rst = "";
		try {
			try {

				FileVO att = fileService.selectTAttfile(attVO);
				// ���� ����
				fileService.deleteTAttfile(att);

				rst = "suc";

			} catch (NullPointerException e) {
				e.printStackTrace();
				rst = "empty";
				return rst;
			}
		} catch (Exception e) {
			e.printStackTrace();
			rst = null;
		}
		return rst;
	}

	@RequestMapping(value = "/imagefile/waterMark.do", method = RequestMethod.POST, produces = "application/text;charset=utf8")
	@ResponseBody
	public String watermark(FileVO attVO, MultipartHttpServletRequest request, HttpServletResponse response)
			throws InterruptedException, IOException, Exception {
		String rst = "";

		String saveFolder = stordFilePath;
		File Folder = new File(saveFolder);
		if (!Folder.exists()) {
			try {
				Folder.mkdir(); // �대�� ���깊�⑸����.
			} catch (Exception e) {
				e.getStackTrace();
			}
		}

		try {
			try {
				List<EgovFormBasedFileVo> fList = EgovFileUploadUtil.uploadFilesExt(request, saveFolder,
						1024 * 1024 * 50, extensionWhiteList);
				int fileSeq = 0;
				if (fList.size() > 0) {
					for (int i = 0; i < fList.size(); i++) {
						fileSeq = fileService.selectFileSeq(attVO);
						attVO.setFileNm(fList.get(i).getFileName()); // file_nm
						attVO.setSaveNm(fList.get(i).getPhysicalName()); // save_file_nm
						attVO.setSavePath(fList.get(i).getServerSubPath());
						attVO.setFileSize((String.valueOf(fList.get(i).getSize()))); // file_size
						attVO.setFileType(fList.get(i).getContentType());
						attVO.setFileSeq(new BigDecimal(fileSeq));
						// 泥⑤����쇰�깅�
						fileService.insertTAttfile(attVO);
					}
				}
				rst = String.valueOf(fileSeq) + "&" + attVO.getFileNm();

		
			FileVO vo = new FileVO();
			vo.setFileSeq(attVO.getFileSeq());
			FileVO att = fileService.selectTAttfile(vo);
			String path = stordFilePath + att.getSavePath() + System.getProperty("file.separator");
			String waterMarkPath = stordFilePath + "waterMark/watermark.png";
			File sourceImageFile = new File(path + att.getSaveNm());
			File watermarkImageFile = new File(waterMarkPath);
			File destImageFile = new File(path + att.getSaveNm());

		
			BufferedImage sourceImage = ImageIO.read(sourceImageFile);
			
			int originWidth = sourceImage.getWidth();
	        int originHeight = sourceImage.getHeight();
	        int newWidth = 500;
	        if (originWidth > newWidth) {
	            // 기존 이미지 비율을 유지하여 세로 길이 설정
	            int newHeight = (originHeight * newWidth) / originWidth;
	            sourceImage = resize(sourceImage, newHeight, 500);
	        }
			// 리사이즈
			BufferedImage watermarkImage = ImageIO.read(watermarkImageFile);

			// initializes necessary graphic properties
			Graphics2D g2d = (Graphics2D) sourceImage.getGraphics();
			// 투명도
			AlphaComposite alphaChannel = AlphaComposite.getInstance(AlphaComposite.SRC_OVER, 0.5f);
			g2d.setComposite(alphaChannel);

			// 워터마크 센터 공식
			int topLeftX = (sourceImage.getWidth() - watermarkImage.getWidth()) / 2;
			int topLeftY = (sourceImage.getHeight() - watermarkImage.getHeight()) / 2;

			System.out.println(sourceImage.getWidth() + " : " + sourceImage.getHeight());
			System.out.println(watermarkImage.getWidth() + " : " + watermarkImage.getHeight());
			System.out.println("x:" + topLeftX + "\ty:" + topLeftY);

			// paints the image watermark
			g2d.drawImage(watermarkImage, topLeftX, topLeftY, null);

			ImageIO.write(sourceImage, "png", destImageFile);
			g2d.dispose();

			System.out.println("The image watermark is added to the image.");

			} catch (NullPointerException e) {
				e.printStackTrace();
				rst = "empty";
				return rst;
			}

		} catch (Exception e) {
			e.printStackTrace();
			rst = null;
		}
		return rst;

	}
	
	private static BufferedImage resize(BufferedImage img, int height, int width) {
        Image tmp = img.getScaledInstance(width, height, Image.SCALE_SMOOTH);
        BufferedImage resized = new BufferedImage(width, height, BufferedImage.TYPE_INT_ARGB);
        Graphics2D g2d = resized.createGraphics();
        g2d.drawImage(tmp, 0, 0, null);
        g2d.dispose();
        return resized;
    }

}