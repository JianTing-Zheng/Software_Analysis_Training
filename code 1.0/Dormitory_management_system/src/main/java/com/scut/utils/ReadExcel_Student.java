package com.scut.utils;

import com.scut.domain.Student;
import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;

public class ReadExcel_Student {
    // 总行数
    private int totalRows = 0;
    // 总条数
    private int totalCells = 0;
    // 错误信息接收器
    private String errorMsg;

    // 构造方法
    public ReadExcel_Student() {
    }

    // 获取总行数
    public int getTotalRows() {
        return totalRows;
    }

    // 获取总列数
    public int getTotalCells() {
        return totalCells;
    }

    // 获取错误信息
    public String getErrorInfo() {
        return errorMsg;
    }

    public List<Student> getExcelInfo(MultipartFile mFile) {
        String fileName = mFile.getOriginalFilename();// 获取文件名
        List<Student> studentList = new ArrayList<>();
        try {
            if (!validateExcel(fileName)) {// 验证文件名是否合格
                return null;
            }
            boolean isExcel2003 = true;// 根据文件名判断文件是2003版本还是2007版本
            if (isExcel2007(fileName)) {
                isExcel2003 = false;
            }
            studentList = createExcel(mFile.getInputStream(), isExcel2003);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return studentList;
    }

    public List<Student> createExcel(InputStream is, boolean isExcel2003) {
        List<Student> studentList = new ArrayList<>();
        try {
            Workbook wb = null;
            if (isExcel2003) {// 当excel是2003时,创建excel2003
                wb = new HSSFWorkbook(is);
            } else {// 当excel是2007时,创建excel2007
                wb = new XSSFWorkbook(is);
            }
            studentList = readExcelValue(wb);// 读取Excel里面客户的信息
        } catch (IOException e) {
            e.printStackTrace();
        }
        return studentList;
    }

    /**
     * 读取Excel里面客户的信息
     *
     * @param wb
     * @return
     */
    private List<Student> readExcelValue(Workbook wb) {
        // 得到第一个shell
        Sheet sheet = wb.getSheetAt(0);
        // 得到Excel的行数
        this.totalRows = sheet.getPhysicalNumberOfRows();
        // 得到Excel的列数(前提是有行数)
        if (totalRows > 1 && sheet.getRow(0) != null) {
            this.totalCells = sheet.getRow(0).getPhysicalNumberOfCells();
        }
        List<Student> studentList = new ArrayList<Student>();
        // 循环Excel行数
        for (int r = 1; r < totalRows; r++) {
            Row row = sheet.getRow(r);
            if (row == null) {
                continue;
            }
            Student student = new Student();
            // 循环Excel的列
            for (int c = 0; c < this.totalCells; c++) {
                System.out.println(this.totalCells);
                Cell cell = row.getCell(c);
                if (null != cell) {
                    if (c == 0) {
                        // 如果是纯数字,比如你写的是25,cell.getNumericCellValue()获得是25.0,通过截取字符串去掉.0获得25
                        /**
                         * if (cell.getCellType() == HSSFCell.CELL_TYPE_NUMERIC) {
                         *     String id = String.valueOf(cell.getNumericCellValue());
                         *     student.setId(id.substring(0, id.length() - 2 > 0 ? id.length() - 2 : 1));
                         * } else {
                         *     student.setId(cell.getStringCellValue());
                         * }
                         */
                        cell.setCellType(1);
                        String sID = cell.getStringCellValue() + "";
                        student.setsID(sID);
                    } else if (c == 1) {
                        // 如果是纯数字,比如你写的是25,cell.getNumericCellValue()获得是25.0,通过截取字符串去掉.0获得25
                        /**
                         * if (cell.getCellType() == HSSFCell.CELL_TYPE_NUMERIC) {
                         *     String password = String.valueOf(cell.getNumericCellValue());
                         *     student.setPassword(password.substring(0, password.length() - 2 > 0 ? password.length() - 2 : 1));// 名称
                         * } else {
                         *     student.setPassword(cell.getStringCellValue());
                         * }
                         */
                        cell.setCellType(1);
                        String sPassword = cell.getStringCellValue() + "";
                        student.setsPassword(sPassword);
                    }
                    else if (c == 2) {
//                        cell.setCellType(1);
//                        String sSex = cell.getStringCellValue() + "";
//                        student.setsSex(sSex);

                          if (cell.getCellType() == HSSFCell.CELL_TYPE_NUMERIC) {
                              String sSex = String.valueOf(cell.getNumericCellValue());
                              student.setsSex(sSex.substring(0, sSex.length() - 2 > 0 ? sSex.length() - 2 : 1));
                          } else {
                              student.setsSex(cell.getStringCellValue());
                          }

                    }
                    else if (c == 3) {
                        cell.setCellType(1);
                        String sIDcardNo = cell.getStringCellValue() + "";
                        student.setsIDcardNo(sIDcardNo);
                    }
                    else if (c == 4) {
//                        cell.setCellType(1);
//                        String sEnrollYear = cell.getStringCellValue() + "";
//                        student.setsEnrollYear(sEnrollYear);

                        if (cell.getCellType() == HSSFCell.CELL_TYPE_NUMERIC) {
                            String sEnrollYear = String.valueOf(cell.getNumericCellValue());
                            student.setsEnrollYear(sEnrollYear.substring(0, sEnrollYear.length() - 2 > 0 ? sEnrollYear.length() - 2 : 1));
                        } else {
                            student.setsEnrollYear(cell.getStringCellValue());
                        }

                    }
                    else if (c == 5) {
                        cell.setCellType(1);
                        String sPassword = cell.getStringCellValue() + "";
                        student.setsPassword(sPassword);
                    }
                    else if (c == 6) {
                        cell.setCellType(1);
                        String sPhoneNumber = cell.getStringCellValue() + "";
                        student.setsPhoneNumber(sPhoneNumber);
                    }
                    else if (c == 7) {
                        cell.setCellType(1);
                        String sEmail = cell.getStringCellValue() + "";
                        student.setsEmail(sEmail);
                    }
                    else if (c == 8) {
                        cell.setCellType(1);
                        String dormID = cell.getStringCellValue() + "";
                        student.setDormID(dormID);
                    }
                    else if (c == 9) {
                        cell.setCellType(1);
                        String roomID = cell.getStringCellValue() + "";
                        student.setRoomID(roomID);
                    }
                    else if (c == 10) {
//                        cell.setCellType(1);
//                        String livingState = cell.getStringCellValue() + "";
//                        student.setLivingState(livingState);

                        if (cell.getCellType() == HSSFCell.CELL_TYPE_NUMERIC) {
                            String livingState = String.valueOf(cell.getNumericCellValue());
                            student.setLivingState(livingState.substring(0, livingState.length() - 2 > 0 ? livingState.length() - 2 : 1));
                        } else {
                            student.setLivingState(cell.getStringCellValue());
                        }

                    }
                    else if (c == 11) {
                        cell.setCellType(1);
                        String schoolState = cell.getStringCellValue() + "";
                        student.setSchoolState(schoolState);
                    }
                }
            }
            // 添加到list
            studentList.add(student);
        }
        return studentList;
    }

    /**
     * 验证EXCEL文件
     * @param filePath
     * @return
     */
    public boolean validateExcel(String filePath) {
        if (filePath == null || !(isExcel2003(filePath) || isExcel2007(filePath))) {
            errorMsg = "文件名不是excel格式";
            return false;
        }
        return true;
    }

    // @描述：是否是2003的excel，返回true是2003
    public static boolean isExcel2003(String filePath) {
        return filePath.matches("^.+\\.(?i)(xls)$");
    }

    // @描述：是否是2007的excel，返回true是2007
    public static boolean isExcel2007(String filePath) {
        return filePath.matches("^.+\\.(?i)(xlsx)$");
    }
}