package controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import dao.IDAO;
import dao.ImageDAO;
import models.Images;


/**
 * Servlet implementation class ServletUpload
 */
@WebServlet("/ServletUpload")
public class ServletUpload extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
 
    // location to store file uploaded
    private static final String UPLOAD_DIRECTORY = "upload";

    // upload settings
    private static final int MEMORY_THRESHOLD = 1024 * 1024 * 3;  // 3MB
    private static final int MAX_FILE_SIZE = 1024 * 1024 * 40; // 40MB
    private static final int MAX_REQUEST_SIZE = 1024 * 1024 * 50; // 50MB
     IDAO imageDAO= new ImageDAO();
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");
        HttpSession session = request.getSession();
        int id= (int) session.getAttribute("id");
          System.out.println(id);
//        String a= request.getParameter("daidien");
//        String luachon = request.getParameter("luachon");
//		System.out.println(luachon);
//		String productID=request.getParameter("productID");
//		System.out.println(productID);
//		String tensanpham= request.getParameter("tensanpham");
//		System.out.println(tensanpham);
//		String madanhmuc= request.getParameter("madanhmuc");
//		System.out.println(madanhmuc);
//		String priority= request.getParameter("priority");
//		System.out.println(priority.trim());
//	 System.out.println(anhien);
//		String mota= request.getParameter("mota");
//		System.out.println(mota);
    	  // checks if the request actually 
//        String gia= request.getParameter("gia");
//		System.out.println(gia.trim());
//	    String anhien= request.getParameter("anhien");
//	   contains upload file
        if (!ServletFileUpload.isMultipartContent(request)) {
            // if not, we stop here
            PrintWriter writer = response.getWriter();
            writer.println("Error: Form must has enctype=multipart/form-data.");
            writer.flush();
            return;
        }else{ 
       
        // configures upload settings
        DiskFileItemFactory factory = new DiskFileItemFactory();
        // sets memory threshold - beyond which files are stored in disk 
        factory.setSizeThreshold(MEMORY_THRESHOLD);
        // sets temporary location to store files
        factory.setRepository(new File(System.getProperty("java.io.tmpdir")));

        ServletFileUpload upload = new ServletFileUpload(factory);

        // sets maximum size of upload file
        upload.setFileSizeMax(MAX_FILE_SIZE);

        // sets maximum size of request (include file + form data)
        upload.setSizeMax(MAX_REQUEST_SIZE);

        // constructs the directory path to store upload file
        // this path is relative to application's directory
        String uploadPath = getServletContext().getRealPath("")
                + File.separator + UPLOAD_DIRECTORY;

        // creates the directory if it does not exist
        File uploadDir = new File(uploadPath);
        if (!uploadDir.exists()) {
            uploadDir.mkdir();
        }

        try {

            List<FileItem> formItems = upload.parseRequest(request);
           int dem=0;
            if (formItems != null && formItems.size() > 0) {
                // iterates over form's fields
            	 request.setAttribute("item" ,formItems);
                for (FileItem item : formItems) {
                dem++;
                    // processes only fields that are not form fields
                	 if (item.getFieldName().equals("anh") && !item.getName().isEmpty()) {
                               if (!item.isFormField()) {
                        String fileName = new File(item.getName()).getName();
                        String filePath = uploadPath + File.separator + fileName;
                        File storeFile = new File(filePath);
                        String link=UPLOAD_DIRECTORY + "/" + item.getName();
                if(dem==1){
                	imageDAO.insert(new Images(0, id, link, 1, 1));
                }else{
                	imageDAO.insert(new Images(0, id, link, 0, 1));
                }
          
                        // saves the file on disk
                        item.write(storeFile);
                     System.out.println(item.getName()+ dem);
                     
//                        request.setAttribute("msg", UPLOAD_DIRECTORY + "/" + fileName);
//                        request.setAttribute("message","Upload thanh cong image dc lu tai : " + UPLOAD_DIRECTORY + "/" + fileName);
                    }
                }
                
                }}          
          
            
        } catch (Exception ex) {
            request.setAttribute("message",
                    "There was an error: " + ex.getMessage());
        }
        // redirects client to message page
//        getServletContext().getRequestDispatcher("/upthanhcong.jsp").forward(request, response);
 		response.sendRedirect("Admin/manager_product.jsp");
    }}
  


    @Override
    protected void doPost(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");

      doGet(request, response);
}  }

