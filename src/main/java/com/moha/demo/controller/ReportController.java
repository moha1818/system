
package com.moha.demo.controller;

import com.moha.demo.entity.AsAccountdetail;
import com.moha.demo.eums.ViewString;
import com.moha.demo.model.BalanceView;
import com.moha.demo.model.ProductCount;
import com.moha.demo.service.AsAccountdetailService;
import com.moha.demo.service.AsKeywordsService;
import com.moha.demo.service.AsUserService;
import org.apache.poi.hssf.usermodel.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.lang.reflect.Field;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
@Controller
public class ReportController extends BaseController {
    @Autowired
    private AsUserService asUserService;
    @Autowired
    private AsAccountdetailService asAccountdetailService;
    @Autowired
    private AsKeywordsService asKeywordsService;

    @RequestMapping(value = "/showReport")
    public String showReport() {
        return "/report/reportManager";
    }

    @RequestMapping(value = "/getReport")
    public String getReport(String reportType, Date starttime, Date endtime, Model model) {
        List<BalanceView> balanceViews;
        List<AsAccountdetail> detail;
        List<ProductCount> product;
        if (reportType.equals("balance")) {
            balanceViews = asUserService.balance();
            model.addAttribute("balanceViews",balanceViews);
            return "balance";
        }
        if (reportType.equals("preRunning")) {
            detail = asAccountdetailService.preRunning(starttime, endtime);
            model.addAttribute("detail",detail);
            return "preRunning";
        }
        if (reportType.equals("agentRunning")) {
            detail = asAccountdetailService.agentRunning(starttime, endtime);
            model.addAttribute("detail",detail);
            return "agentRunning";
        }
        if (reportType.equals("categories")) {
            product = asKeywordsService.getCount();
            model.addAttribute("product",product);
            return "categories";
        }
        return "redirect:/showReport";
    }

    @RequestMapping(value = "/exportExcel")
    public String exportExcel(String reportType,Date starttime,Date endtime) {
        InputStream excelStream; // 输出流变量
        String excelFileName; // 下载文件名
        try {
            // 第一步，创建一个webbook，对应一个Excel文件
            HSSFWorkbook wb = new HSSFWorkbook();
            // 第二步，在webbook中添加一个sheet，对应Excel文件中的 sheet
            HSSFSheet sheet = wb.createSheet("测试表格1");
            // 第三步，在sheet中添加表头第0行，注意老版本poi对Excel的行数列数有限制
            HSSFRow row = sheet.createRow(0);
            // 第四步，创建单元格样式：居中
            HSSFCellStyle style = wb.createCellStyle();
            style.setAlignment(HSSFCellStyle.ALIGN_CENTER);
            // 第五步，创建表头单元格，并设置样式
            HSSFCell cell;

            if (reportType.equals("balance")) {
                BalanceView balanceViewm=new BalanceView();
                int s=0;
                for(Field field:balanceViewm.getClass().getDeclaredFields()){
                    cell = row.createCell(s);
                    cell.setCellValue(ViewString.valueOf(field.getName()).getValue());
                    cell.setCellStyle(style);
                    s++;
                }

                List<BalanceView> balanceViews = asUserService.balance();
                if (balanceViews.size() >= 1) {
                    for (int i = 1; i <= balanceViews.size(); i++) {
                        row = sheet.createRow(i);
                        BalanceView balanceView = balanceViews.get(i - 1);
                        row.createCell(0).setCellValue(i);
                        row.createCell(1).setCellValue(balanceView.getUserName());
                        row.createCell(2).setCellValue(balanceView.getMoney());
                    }
                }

                excelFileName = "reportBalance.xls"; // 设置下载的文件名

            }
            if (reportType.equals("preRunning")) {
                cell = row.createCell(0);
                cell.setCellValue("序号");
                cell.setCellStyle(style);

                cell = row.createCell(1);
                cell.setCellValue("代理商名称");
                cell.setCellStyle(style);

                cell = row.createCell(2);
                cell.setCellValue("预付款");
                cell.setCellStyle(style);

                cell = row.createCell(3);
                cell.setCellValue("账户余额");
                cell.setCellStyle(style);

                cell = row.createCell(4);
                cell.setCellValue("备注信息");
                cell.setCellStyle(style);

                cell = row.createCell(5);
                cell.setCellValue("时间");
                cell.setCellStyle(style);

                SimpleDateFormat fmt = new SimpleDateFormat("yyyy-MM-dd : hh-mm-ss");

                List<AsAccountdetail> detail = asAccountdetailService.preRunning(starttime, endtime);
                if(detail.size()>=1){
                    for (int i = 1; i <= detail.size(); i++) {
                        row = sheet.createRow(i);
                        AsAccountdetail accountdetail = detail.get(i - 1);
                        row.createCell(0).setCellValue(i);
                        row.createCell(1).setCellValue(accountdetail.getUser().getUserName());
                        row.createCell(2).setCellValue(accountdetail.getMoney());
                        row.createCell(3).setCellValue(accountdetail.getAccountMoney());
                        row.createCell(4).setCellValue(accountdetail.getMemo());
                        row.createCell(5).setCellValue(fmt.format(accountdetail.getDetaildateTime()));
                    }
                }
                excelFileName = "reportPreRunning.xls"; // 设置下载的文件名

            }
            if (reportType.equals("agentRunning")) {
                cell = row.createCell(0);
                cell.setCellValue("序号");
                cell.setCellStyle(style);

                cell = row.createCell(1);
                cell.setCellValue("代理商名称");
                cell.setCellStyle(style);

                cell = row.createCell(2);
                cell.setCellValue("预付款");
                cell.setCellStyle(style);

                cell = row.createCell(3);
                cell.setCellValue("账户余额");
                cell.setCellStyle(style);

                cell = row.createCell(4);
                cell.setCellValue("备注信息");
                cell.setCellStyle(style);

                cell = row.createCell(5);
                cell.setCellValue("时间");
                cell.setCellStyle(style);

                SimpleDateFormat fmt = new SimpleDateFormat("yyyy-MM-dd : hh-mm-ss");
                List<AsAccountdetail> detail = asAccountdetailService.agentRunning(starttime, endtime);
                if(detail.size()>=1){
                    for (int i = 1; i <= detail.size(); i++) {
                        row = sheet.createRow(i);
                        AsAccountdetail accountdetail = detail.get(i - 1);
                        row.createCell(0).setCellValue(i);
                        row.createCell(1).setCellValue(accountdetail.getUser().getUserName());
                        row.createCell(2).setCellValue(accountdetail.getMoney());
                        row.createCell(3).setCellValue(accountdetail.getAccountMoney());
                        row.createCell(4).setCellValue(accountdetail.getMemo());
                        row.createCell(5).setCellValue(fmt.format(accountdetail.getDetaildateTime()));
                    }
                }
                excelFileName = "reportAgentRunning.xls"; // 设置下载的文件名

            }
            if (reportType.equals("categories")) {
                cell = row.createCell(0);
                cell.setCellValue("序号");
                cell.setCellStyle(style);

                cell = row.createCell(1);
                cell.setCellValue("产品分类名称");
                cell.setCellStyle(style);

                cell = row.createCell(2);
                cell.setCellValue("数量");
                cell.setCellStyle(style);

                cell = row.createCell(3);
                cell.setCellValue("价格");
                cell.setCellStyle(style);

                List<ProductCount> product = asKeywordsService.getCount();
                if(product.size()>=1){
                    for (int i = 1; i <= product.size(); i++) {
                        row = sheet.createRow(i);
                        ProductCount productCount = product.get(i - 1);
                        row.createCell(0).setCellValue(i);
                        row.createCell(1).setCellValue(productCount.getTypeName());
                        row.createCell(2).setCellValue(productCount.getCount());
                        row.createCell(3).setCellValue(productCount.getMoney());
                    }
                }
                excelFileName = "reportCategories.xls"; // 设置下载的文件名
            }

            ByteArrayOutputStream os = new ByteArrayOutputStream();

            wb.write(os);

            byte[] fileContent = os.toByteArray();
            ByteArrayInputStream is = new ByteArrayInputStream(fileContent);

            excelStream = is; // 文件流
            return "";
        } catch (IOException e) {
            e.printStackTrace();
            return "";
        }
    }
}
