package com.springlec.base.controller;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.stream.Collectors;

import org.eclipse.tags.shaded.org.apache.bcel.generic.RETURN;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.springlec.base.model.T_ordersDto;
import com.springlec.base.model.T_userinfoDto;
import com.springlec.base.service.T_purchaseDaoService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
public class T_pController {

	@Autowired
	T_purchaseDaoService service;
	
	
	
	public String ulist(HttpServletRequest request, Model model) throws Exception {
	    
	    HttpSession session = request.getSession();
	 	String userid = (String) session.getAttribute("USERID");
	 	List<T_userinfoDto> ulistDao = service.ulistDao(userid);
	 	
	    if (!ulistDao.isEmpty()) {
	        T_userinfoDto userinfo = ulistDao.get(0); // 첫 번째 객체 가져오기
	        
	        // 서버에서 가져온 데이터를 serverData 객체에 할당
	        model.addAttribute("username", userinfo.getUsername());
	        model.addAttribute("userpostcode", userinfo.getUserpostcode());
	        model.addAttribute("useraddress", userinfo.getUseraddress());
	        model.addAttribute("userdetailaddress", userinfo.getUserdetailaddress());
	        model.addAttribute("usertel", userinfo.getUsertel());
	        model.addAttribute("useremail", userinfo.getUseremail());
	        model.addAttribute("mileage", userinfo.getMileage());
	        model.addAttribute("usedmileage", userinfo.getUsedmileage());
	        
	    }
	    
	    return "T_purchase";
	}
	
	// 주문해서 orders테이블로 넘기기
	@RequestMapping("/orders")
	public String orders(HttpServletRequest request, Model model) throws Exception{
		HttpSession session = request.getSession();
	 	String userid = (String) session.getAttribute("USERID");
		 List<String> pidList = new ArrayList<>();
	        List<String> pnameList = new ArrayList<>();
	        List<Integer> orderpriceList = new ArrayList<>();
	        List<Integer> countList = new ArrayList<>();
		
		//String pname = request.getParameter("pname");
		String username = request.getParameter("username");
		String userpostcode = request.getParameter("userpostcode");
		String useraddress = request.getParameter("useraddress");
		String userdetailaddress = request.getParameter("userdetailaddress");
		String shipaddress = useraddress + " " + userdetailaddress;
		String phone1 = request.getParameter("phone1");
		String phone2 = request.getParameter("phone2");
		String phone3 = request.getParameter("phone3");
		String usertel = phone1 + "-" + phone2 + "-" + phone3;
		String ordermessage = request.getParameter("ordermessage");
		String payment = request.getParameter("payment");
//		int usedmileage = Integer.parseInt(request.getParameter("usedmileage"));
//		int enteredmileage = Integer.parseInt(request.getParameter("enteredmileage"));
		String usedmileageString = request.getParameter("usedmileage");
		String enteredmileageString = request.getParameter("enteredmileage");
		String ppriceString = request.getParameter("pprice");
		String ordernum = request.getParameter("ordernum");
		String orderdate = request.getParameter("orderdate");
		int usedmileage = 0; // 기본값 설정
		int enteredmileage = 0; // 기본값 설정
		int pprice = 0;
		if (usedmileageString != null && !usedmileageString.isEmpty()) {
		    try {
		        usedmileage = Integer.parseInt(usedmileageString);
		    } catch (NumberFormatException e) {
		        // usedmileageString을 정수로 변환할 수 없는 경우 예외 처리
		        // 적절한 오류 처리를 수행하거나 예외를 throw할 수 있습니다.
		    }
		}
		
		if (request.getParameter("pid") != null) {
            String[] pidArray = request.getParameterValues("pid");
            for (String pid : pidArray) {
                pidList.add(pid);
            }
        } else {
            System.out.println("null");
        }
        
        if (request.getParameter("pname") != null) {
            String[] pnameArray = request.getParameterValues("pname");
            for (String pname : pnameArray) {
            	pnameList.add(pname);
            	System.out.println("pname = " + pname);
            }
        } else {
            System.out.println("null");
        }

        if (request.getParameter("count") != null) {
            String[] countArray = request.getParameterValues("count");
            for (String countStr : countArray) {
                if (!countStr.isEmpty()) {
                    int productCount = Integer.parseInt(countStr);
                    countList.add(productCount);
                } else {
                    System.out.println("count is null or empty");
                    // 적절한 기본값 또는 오류 처리를 수행하세요.
                }
            }
        } else {
            System.out.println("count is null");
            // 적절한 기본값 또는 오류 처리를 수행하세요.
        }
        
        if (request.getParameter("orderprice") != null) {
            String[] orderpriceArray = request.getParameterValues("orderprice");
            for (String orderpriceStr : orderpriceArray) {
                if (!orderpriceStr.isEmpty()) {
                    int orderprice = Integer.parseInt(orderpriceStr);
                    orderpriceList.add(orderprice);
                } else {
                    System.out.println("orderprice is null or empty");
                    // Perform appropriate default value or error handling.
                }
            }
        } else {
            System.out.println("orderprice is null");
            // Perform appropriate default value or error handling.
        }
        
        
        for (int i = 0; i < pidList.size(); i++) {
            String pid = pidList.get(i);
            int count = countList.get(i);
            String pname = pnameList.get(i);

            int orderprice = count * pprice;

            orderpriceList.add(orderprice);
		
		model.addAttribute("pid", pid);
		model.addAttribute("count", count);
		model.addAttribute("pname", pname);
		model.addAttribute("pprice", pprice);
		model.addAttribute("username", username);
		model.addAttribute("userpostcode", userpostcode);
		model.addAttribute("shipaddress", shipaddress);
		model.addAttribute("usertel", usertel);
		model.addAttribute("ordermessage", ordermessage);
		model.addAttribute("payment", payment);
		model.addAttribute("usedmileage", usedmileage);
		

		
		
		System.out.println(pid);
		System.out.println(count);
		System.out.println(pname);
		System.out.println("pid: " + pidList);
		System.out.println("count: " + countList);
		System.out.println("pprice: " + pprice);
		System.out.println("orderprice: " + orderprice);
		System.out.println("pname: " + pnameList);
		System.out.println("username: " + username);
		System.out.println("userpostcode: " + userpostcode);
		System.out.println("shipaddress: " + shipaddress);
		System.out.println("phone1: " + phone1);
		System.out.println("phone2: " + phone2);
		System.out.println("phone3: " + phone3);
		System.out.println("ordermessage: " + ordermessage);
		System.out.println("payment: " + payment);
		System.out.println("usedmileage: " + usedmileage);
		System.out.println("enteredmileage: " + enteredmileage);

		service.orders(count, pname, orderprice, username, userpostcode, shipaddress, usertel, userid, pid, ordermessage, payment, usedmileage);
        }
        
        List<T_ordersDto> olistDao = service.olistDao(userid);
        model.addAttribute("orderList", olistDao);
        System.out.println("ordernum: " + ordernum);
        
        if (request.getParameter("pid") != null) {
            String[] pidArray = request.getParameterValues("pid");
            for (String pid : pidArray) {
                pidList.add(pid);
            }
        } else {
            System.out.println("null");
        }
        
        for (int i = 0; i < pidList.size(); i++) {
            String pid = pidList.get(i);
        
        service.deleteCart(userid, pid);
        }
        
        service.updateMileage(userid,usedmileage, enteredmileage);
        
        service.deletepurchase(userid);
        return "T_purchaseComplete";

		
	}
}
