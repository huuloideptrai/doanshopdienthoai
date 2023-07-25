/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package common;

import com.google.gson.Gson;
import com.google.gson.JsonObject;

import common.Config;
import dao.IDAO;
import dao.OrderDAO;
import dao.OrderdetailDAO;
import models.Cart;
import models.Item;
import models.Order;
import models.Orderdetail;
import models.User;
import tools.Sendmail;

import java.io.IOException;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Date;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author xonv
 */
public class ajaxServlet extends HttpServlet {
	  IDAO orderDAO= new OrderDAO();
      IDAO orderdetailDAO= new OrderdetailDAO();
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
       
    	String vnp_Version = "2.0.0";
        String vnp_Command = "pay";
        String vnp_OrderInfo = req.getParameter("vnp_OrderInfo");
        String orderType = req.getParameter("ordertype");
        String vnp_TxnRef =  Config.getRandomNumber(8);
        String vnp_IpAddr = Config.getIpAddress(req);

        String vnp_TmnCode = Config.vnp_TmnCode;

        String vnp_TransactionNo = vnp_TxnRef;
        String vnp_hashSecret = Config.vnp_HashSecret;
    	System.out.println("test payment");
         
        
    	int i,o,p;
    	String e1,mau,kthuoc;
    	String tensp;
    	ArrayList<String> lh= new ArrayList<>();
    	 
    		String name= (vnp_OrderInfo.split("--")[0]!=null?vnp_OrderInfo.split("--")[0]:"");
    		String phone=  (vnp_OrderInfo.split("--")[1]!=null?vnp_OrderInfo.split("--")[1]:"");;
    		String address=  (vnp_OrderInfo.split("--")[2]!=null?vnp_OrderInfo.split("--")[2]:"");
    		HttpSession session = req.getSession();
    		Cart cart= (Cart)session.getAttribute("cart");
    		User user= (User)session.getAttribute("user");
    		System.out.println(user.toString());
    		try {
    			java.sql.Date d= new java.sql.Date(new Date().getTime());
    			int sdt= Integer.parseInt(phone);
    			Order order= new Order();
    		int	 id = (int) new Date().getTime();
    			order.setOrderID(id);
    			order.setUserID(user.getUserID());
    			order.setDatecreate(d);
    			order.setStatus(sdt);
    			order.setTotal(cart.tongtien());
    			order.setPay(address);
    			order.setHide(3);
    			orderDAO.insert(order);
    			
    		 
    			session.setAttribute("order", order);
    			session.setAttribute("cartold", cart); 
    		lh.add("<table border=\"1\" bordercolor=\"green\" width=\"100%\"><tr><th >Sản phẩm</th><th>Số lượng</th><th>Chất liệu</th><th>Màu sắc</th><th>Kích thước</th><th>Giá tiền</th></tr>");
    			System.out.println(cart.demItem());
    			for(Entry<Integer, Item> list :cart.getCartHashMap().entrySet()){
    				tensp=list.getValue().getProduct().getProductName();
    				
    				i= list.getValue().getProduct().getProductID();
    				o=list.getValue().getQuantity();
    				e1=list.getValue().getProduct().getMaterial();
    				mau=list.getValue().getProduct().getColor();
    				kthuoc=list.getValue().getProduct().getSize();
    				p=list.getValue().getProduct().getPrice()-(list.getValue().getProduct().getPrice()*list.getValue().getProduct().getPriority()/100);
    				orderdetailDAO.insert(new Orderdetail(0,id,i,o,p,e1,mau,kthuoc)); 
    				
    				lh.add("<tr><td >"+tensp+"</td><td >"+o+"</td><td >"+e1+"</td><td >"+mau+"</td><td >"+kthuoc+"</td><td >"+p+"</td></tr>");
    				System.out.println("da them san pham vao table");
    			}
    			lh.add("</table>");
    	
    			System.out.println(user.getEmail());
    			Sendmail.sendMail(user.getEmail(), "Shop manga minh minh ", "<h4 style=\"color:green;\">Xin chào "+name +" Cảm ơn bạn đã đặt mua hàng từ hệ thống của chúng tôi  </h4> <br><h4 style=\"color:red;\"> Bạn vừa mua hết số tiền là "
    			+cart.tongtien() +"VNĐ </h4>"
    			+"<h4 style=\"color:red;\">MÃ ĐƠN HÀNG :"+id+"</h4>"
    					+ "<h4 style=\"color:red;\">Ngày Đặt hàng: "+d+"</h4>"
    			+intable(lh.toString().split(","))+"<br>"
    		+" <h3 style=\"color:red;\">vui lòng giữ mã đơn hàng chúng tôi sẽ liên hệ qua số điện thoại để xác thực đơn hàng </h3>");
//    			sendmail.sendMail(user.getEmail(), "shop manga minh minh", "xin chào"+name +" MINH minh shop Cảm ơn bạn đã đặt mua hàng , Bạn vừa mua hết số tiền là "
//    			+cart.tongtien() +"\n"
//    			+lh.toString()+"\n"
//    		+"mã xác nhận đơn hàng của quý khách là:"+ma+"\n vui lòng giữ mã xác thực chúng tôi sẽ liên hệ qua số điện thoại để xác thực đơn hàng");
//    			
    		
    			System.out.println("da gui mai");
    			cart= new Cart();
    			session.setAttribute("cart", cart);
    			
    		} catch (Exception e) {
    			// TODO: handle exception
    		}
    		
    

        int amount = Integer.parseInt(req.getParameter("amount")) * 100;
        Map<String, String> vnp_Params = new HashMap<>();
        vnp_Params.put("vnp_Version", vnp_Version);
        vnp_Params.put("vnp_Command", vnp_Command);
        vnp_Params.put("vnp_TmnCode", vnp_TmnCode);
        vnp_Params.put("vnp_Amount", String.valueOf(amount));
        vnp_Params.put("vnp_CurrCode", "VND");
        String bank_code = req.getParameter("bankcode");
        if (bank_code != null && bank_code.isEmpty()) {
            vnp_Params.put("vnp_BankCode", bank_code);
        }
        vnp_Params.put("vnp_TxnRef", vnp_TxnRef);
        vnp_Params.put("vnp_OrderInfo", vnp_OrderInfo);
        vnp_Params.put("vnp_OrderType", orderType);

        String locate = req.getParameter("language");
        if (locate != null && !locate.isEmpty()) {
            vnp_Params.put("vnp_Locale", locate);
        } else {
            vnp_Params.put("vnp_Locale", "vn");
        }
        vnp_Params.put("vnp_ReturnUrl", Config.vnp_Returnurl);
        vnp_Params.put("vnp_IpAddr", vnp_IpAddr);

        Date dt = new Date();
        SimpleDateFormat formatter = new SimpleDateFormat("yyyyMMddHHmmss");
        String dateString = formatter.format(dt);
        String vnp_CreateDate = dateString;
        String vnp_TransDate = vnp_CreateDate;
        vnp_Params.put("vnp_CreateDate", vnp_CreateDate);

        //Build data to hash and querystring
        List fieldNames = new ArrayList(vnp_Params.keySet());
        Collections.sort(fieldNames);
        StringBuilder hashData = new StringBuilder();
        StringBuilder query = new StringBuilder();
        Iterator itr = fieldNames.iterator();
        while (itr.hasNext()) {
            String fieldName = (String) itr.next();
            String fieldValue = (String) vnp_Params.get(fieldName);
            if ((fieldValue != null) && (fieldValue.length() > 0)) {
                //Build hash data
                hashData.append(fieldName);
                hashData.append('=');
                hashData.append(fieldValue);
                //Build query
                query.append(URLEncoder.encode(fieldName, StandardCharsets.US_ASCII.toString()));
                query.append('=');
                query.append(URLEncoder.encode(fieldValue, StandardCharsets.US_ASCII.toString()));

                if (itr.hasNext()) {
                    query.append('&');
                    hashData.append('&');
                }
            }
        }
        String queryUrl = query.toString();
        String vnp_SecureHash = Config.Sha256(Config.vnp_HashSecret + hashData.toString());
        //System.out.println("HashData=" + hashData.toString());
        queryUrl += "&vnp_SecureHashType=SHA256&vnp_SecureHash=" + vnp_SecureHash;
        String paymentUrl = Config.vnp_PayUrl + "?" + queryUrl;
        com.google.gson.JsonObject job = new JsonObject();
        job.addProperty("code", "00");
        job.addProperty("message", "success");
        job.addProperty("data", paymentUrl);
        Gson gson = new Gson();
        resp.getWriter().write(gson.toJson(job));
    }


public static String intable(String[] strings){
	String a="";
	for (int i =0 ; i < strings.length; i++) {
		a+=strings[i];
	}
	 

return a.substring(1, a.length()-1);
}}