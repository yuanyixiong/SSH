/*****************************************************************************
 * Copyright (c) 2015, www.qingshixun.com
 * 
 * All rights reserved
 * 
 *****************************************************************************/

package com.qingshixun.project.crm.module.index.controller;

import java.io.UnsupportedEncodingException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.qingshixun.project.crm.model.CampaignModel;
import com.qingshixun.project.crm.model.ContactModel;
import com.qingshixun.project.crm.model.CustomerModel;
import com.qingshixun.project.crm.model.IssueModel;
import com.qingshixun.project.crm.model.OpportunityModel;
import com.qingshixun.project.crm.model.ProblemModel;
import com.qingshixun.project.crm.model.ProductModel;
import com.qingshixun.project.crm.model.ProspectiveModel;
import com.qingshixun.project.crm.model.PurchaseOrderModel;
import com.qingshixun.project.crm.model.QuotationModel;
import com.qingshixun.project.crm.model.SalesOrderModel;
import com.qingshixun.project.crm.model.SupplierModel;
import com.qingshixun.project.crm.module.campaign.service.CampaignService;
import com.qingshixun.project.crm.module.contact.service.ContactService;
import com.qingshixun.project.crm.module.customer.service.CustomerService;
import com.qingshixun.project.crm.module.issue.service.IssueService;
import com.qingshixun.project.crm.module.opportunity.service.OpportunityService;
import com.qingshixun.project.crm.module.problem.service.ProblemService;
import com.qingshixun.project.crm.module.product.service.ProductService;
import com.qingshixun.project.crm.module.prospective.service.ProspectiveService;
import com.qingshixun.project.crm.module.purchase.service.PurchaseOrderService;
import com.qingshixun.project.crm.module.quotation.service.QuotationService;
import com.qingshixun.project.crm.module.sales.service.SalesOrderService;
import com.qingshixun.project.crm.module.supplier.service.SupplierService;
import com.qingshixun.project.crm.module.user.service.UserService;
import com.qingshixun.project.crm.util.GarbledUtil;
import com.qingshixun.project.crm.util.ImageUtils;
import com.qingshixun.project.crm.web.controller.BaseController;

/**
 * 主界面处理 Controller 类
 * 
 * @author QingShiXun
 * 
 * @version 1.0
 */
@Controller
@RequestMapping(value = "/index")
public class IndexController extends BaseController {

    // 注入用户处理service
    @Autowired
    private UserService userService;

    // 注入营销活动处理service
    @Autowired
    private CampaignService campaignService;

    // 注入潜在客户处理service
    @Autowired
    private ProspectiveService prospectiveService;

    // 注入客户处理service
    @Autowired
    private CustomerService customerService;

    // 注入联系人处理service
    @Autowired
    private ContactService contactService;

    // 注入销售机会处理service
    @Autowired
    private OpportunityService opportunityService;

    // 注入报价处理service
    @Autowired
    private QuotationService quotationService;

    // 注入销售订单处理service
    @Autowired
    private SalesOrderService salesOrderService;

    // 注入问题单处理service
    @Autowired
    private IssueService issueService;

    // 注入常见问题处理service
    @Autowired
    private ProblemService problemService;

    // 注入产品处理service
    @Autowired
    private ProductService productService;

    // 注入供应商处理service
    @Autowired
    private SupplierService supplierService;

    // 注入采购订单处理service
    @Autowired
    private PurchaseOrderService purchaseOrderService;

    /**
     * 进入主界面
     * 
     * @param model
     * @return
     */
    @RequestMapping(value = "")
    public String index(Model model) {
        model.addAttribute("user", userService.getCurrentUser());
        // 传递用户拥有的菜单信息
        model.addAttribute("userMenus", userService.getCurrentUserMenus());
        // 转向（forward）前端页面，文件：/WEB-INF/views/index.jsp
        return "/index";
    }

    /**
     * 进入主界面
     * 
     * @param model
     * @return
     */
    @RequestMapping(value = "/search/{name}")
    public String search(Model model, @PathVariable String name) {
        try {
            String value = "";
            // 如果乱码
            if (GarbledUtil.isMessyCode(name)) {
                // 解决get提交中文乱码
                value = new String(name.getBytes("iso8859-1"), "utf-8");
            } else {
                value = name;
            }

            // 查询营销活动数据
            List<CampaignModel> campaignList = campaignService.getCampaignList(value);
            model.addAttribute("campaignList", campaignList);

            // 查询潜在客户数据
            List<ProspectiveModel> prospectiveList = prospectiveService.getProspectiveList(value);
            model.addAttribute("prospectiveList", prospectiveList);

            // 查询客户数据
            List<CustomerModel> customerList = customerService.getCustomerList(value);
            model.addAttribute("customerList", customerList);

            // 查询联系人数据
            List<ContactModel> contactList = contactService.getContactList(value);
            model.addAttribute("contactList", contactList);

            // 查询销售机会数据
            List<OpportunityModel> opportunityList = opportunityService.getOpportunityList(value);
            model.addAttribute("opportunityList", opportunityList);

            // 查询报价单数据
            List<QuotationModel> quotationList = quotationService.getQuotationList(value);
            model.addAttribute("quotationList", quotationList);

            // 查询销售订单数据
            List<SalesOrderModel> salesOrderList = salesOrderService.getSalesOrderList(value);
            model.addAttribute("salesOrderList", salesOrderList);

            // 查询问题单数据
            List<IssueModel> issueList = issueService.getIssueList(value);
            model.addAttribute("issueList", issueList);

            // 查询常见问题数据
            List<ProblemModel> problemList = problemService.getProblemList(value);
            model.addAttribute("problemList", problemList);

            // 查询产品数据
            List<ProductModel> productList = productService.getProductList(value);
            model.addAttribute("productList", productList);

            // 图片路径
            model.addAttribute("imagePath", ImageUtils.DEFAULT_IMAGE_PATH);

            // 查询供应商数据
            List<SupplierModel> supplierList = supplierService.getSupplierList(value);
            model.addAttribute("supplierList", supplierList);

            // 查询采购订单数据
            List<PurchaseOrderModel> purchaseOrderList = purchaseOrderService.getPurchaseOrderList(value);
            model.addAttribute("purchaseOrderList", purchaseOrderList);

        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }
        // 转向（forward）前端页面，文件：/WEB-INF/views/search.jsp
        return "/search";
    }

    /**
     * 进入商机导航页面
     * 
     * @param model
     * @return
     */
    @RequestMapping(value = "/navigation/business")
    public String business(Model model) {
        // 转向（forward）前端页面，文件：/WEB-INF/views/navigation/business.jsp
        return "/navigation/business";
    }

    /**
     * 进入所有菜单导航页面
     * 
     * @param model
     * @return
     */
    @RequestMapping(value = "/navigation/menu")
    public String menu(Model model) {
        // 传递用户拥有的菜单信息
        model.addAttribute("userMenus", userService.getCurrentUserMenus());
        // 转向（forward）前端页面，文件：/WEB-INF/views/navigation/menu.jsp
        return "/navigation/menu";
    }
}
