/*****************************************************************************
 * Copyright (c) 2015, www.qingshixun.com
 * 
 * All rights reserved
 * 
 *****************************************************************************/
package com.qingshixun.project.crm.util;

import java.io.IOException;
import java.io.InputStream;
import java.text.DecimalFormat;
import java.util.ArrayList;

import org.apache.poi.hssf.usermodel.DVConstraint;
import org.apache.poi.hssf.usermodel.HSSFDataValidation;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.hssf.util.CellRangeAddressList;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

/**
 * excel处理 util类
 * 
 * @author QingShiXun
 * 
 * @version 1.0
 */
public class Poi4Excel {

    /**
     * excel导入方法
     * 
     * @params fileName 导入文件名称 fileType 导入文件后缀名 list 待导出数据
     */
    public static Workbook writer(String fileName, String fileType, ArrayList<ArrayList<String>> list) throws IOException {
        // 创建工作文档对象
        Workbook wb = null;
        if (fileType.equals("xls")) {
            wb = new HSSFWorkbook();
        } else if (fileType.equals("xlsx")) {
            wb = new XSSFWorkbook();
        }
        // 创建sheet对象
        Sheet sheet1 = (Sheet) wb.createSheet("sheet1");
        if (null != list && list.size() > 0) {
            // 遍历数据
            for (int i = 0; i < list.size(); i++) {
                ArrayList<String> list1 = list.get(i);
                // 获取行对象
                Row row = (Row) sheet1.createRow(i);
                for (int j = 0; j < list1.size(); j++) {
                    // 获取单元格对象
                    Cell cell = row.createCell(j);
                    // 给单元格设值
                    cell.setCellValue(list1.get(j));
                }
            }
        }
        // 返回工作文档对象
        return wb;
    }

    /**
     * excel导出方法
     * 
     * @params stream 输入流 fileType 导出文件后缀名
     */
    public static ArrayList<ArrayList<Object>> read(InputStream stream, String fileType) throws Exception {
        // 存放excel导出的数据信息
        ArrayList<ArrayList<Object>> list = new ArrayList<ArrayList<Object>>();
        Workbook wb = null;
        // 创建工作文档对象
        if (fileType.equals("xls")) {
            wb = new HSSFWorkbook(stream);
        } else if (fileType.equals("xlsx")) {
            wb = new XSSFWorkbook(stream);
        }
        // 获取sheet对象
        Sheet sheet1 = wb.getSheetAt(0);
        // 获取行信息
        for (Row row : sheet1) {
            // 存放行数据
            ArrayList<Object> list1 = new ArrayList<Object>();
            for (Cell cell : row) {
                Object str = null;
                try {
                    // 获取单元格信息
                    str = cell.getStringCellValue();
                } catch (Exception e) {
                    // 处理double数据
                    DecimalFormat df = new DecimalFormat("0");
                    str = df.format(cell.getNumericCellValue());
                }
                // 将单元格信息放在行数据中
                list1.add(str);
            }
            // 将行信息放到excel数据中
            list.add(list1);
        }
        return list;
    }

    /**
     * 设置某些列的值只能输入预制的数据,显示下拉框.
     * 
     * @param sheet 要设置的sheet.
     * @param textlist 下拉框显示的内容
     * @param firstRow 开始行
     * @param endRow 结束行
     * @param firstCol 开始列
     * @param endCol 结束列
     * @return 设置好的sheet.
     */
    public static Sheet setHSSFValidation(Sheet sheet, String[] textlist, int firstRow, int endRow, int firstCol, int endCol) {
        // 加载下拉列表内容
        DVConstraint constraint = DVConstraint.createExplicitListConstraint(textlist);
        // 设置数据有效性加载在哪个单元格上,四个参数分别是：起始行、终止行、起始列、终止列
        CellRangeAddressList regions = new CellRangeAddressList(firstRow, endRow, firstCol, endCol);
        // 数据有效性对象
        HSSFDataValidation data_validation_list = new HSSFDataValidation(regions, constraint);
        sheet.addValidationData(data_validation_list);
        return sheet;
    }

    /**
     * 设置单元格上提示
     * 
     * @param sheet 要设置的sheet.
     * @param promptTitle 标题
     * @param promptContent 内容
     * @param firstRow 开始行
     * @param endRow 结束行
     * @param firstCol 开始列
     * @param endCol 结束列
     * @return 设置好的sheet.
     */
    public static HSSFSheet setHSSFPrompt(HSSFSheet sheet, String promptTitle, String promptContent, int firstRow, int endRow, int firstCol, int endCol) {
        // 构造constraint对象
        DVConstraint constraint = DVConstraint.createCustomFormulaConstraint("BB1");
        // 四个参数分别是：起始行、终止行、起始列、终止列
        CellRangeAddressList regions = new CellRangeAddressList(firstRow, endRow, firstCol, endCol);
        // 数据有效性对象
        HSSFDataValidation data_validation_view = new HSSFDataValidation(regions, constraint);
        data_validation_view.createPromptBox(promptTitle, promptContent);
        sheet.addValidationData(data_validation_view);
        return sheet;
    }

}
