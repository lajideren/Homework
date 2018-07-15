package controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import pobject.Client;
import pobject.Order;
import service.ClientService;
import service.OrderService;

import javax.servlet.http.HttpSession;
import java.util.List;

/**
 *
 */
@Controller
@RequestMapping("/order")
public class OrderController {

    @Autowired
    private OrderService orderService;

    @Autowired
    private ClientService clientService;

    @RequestMapping("/getOrderList")
    public String getOrderList(Model model, HttpSession session){
        String username = (String) session.getAttribute("username");

        List<Order> orders = orderService.showOrders(username);
        Client client = clientService.findClient(username);
        model.addAttribute("orders", orders);
        model.addAttribute("client", client);
        return "user";
    }
}
