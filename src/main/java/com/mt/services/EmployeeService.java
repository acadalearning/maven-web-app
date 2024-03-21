package com.mt.services;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONException;
import org.json.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping; // Import GetMapping annotation
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/employee")
public class EmployeeService {

    @GetMapping(value = "/getEmployeeDetails") // Use GetMapping annotation for HTTP GET
    @ResponseBody
    public String getEmployeeDetails(HttpServletRequest request, HttpServletResponse response, HttpSession httpSession)
            throws JSONException {

        JSONObject js = new JSONObject();
        js.put("Name", "Acada Learning");
        js.put("Calling Name", "Acada");
        js.put("DOB", "May 1, 2005");
        js.put("Hobbies", "Praying, Singing, Reading Technical Blogs,Teaching, Helping to Poor People..");
        js.put("Places he like", "Africa, NA, Bali");
        return js.toString();
    }
}
