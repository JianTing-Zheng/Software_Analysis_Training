package com.scut.utils;

import com.scut.domain.DormitoryAndRoom;
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

public class ReadExcel_DormitoryAndRoom {
    // 总行数
    private int totalRows = 0;
    // 总条数
    private int totalCells = 0;
    // 错误信息接收器
    private String errorMsg;

    // 构造方法
    public ReadExcel_DormitoryAndRoom() {
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

    public List<DormitoryAndRoom> getExcelInfo(MultipartFile mFile) {
        String fileName = mFile.getOriginalFilename(); // 获取文件名
        List<DormitoryAndRoom> dormitoryAndRoomList = new ArrayList<>();
        try {
            if (!validateExcel(fileName)) { // 验证文件名是否合格
                return null;
            }
            boolean isExcel2003 = true; // 根据文件名判断文件是2003版本还是2007版本
            if (isExcel2007(fileName)) {
                isExcel2003 = false;
            }
            dormitoryAndRoomList = createExcel(mFile.getInputStream(), isExcel2003);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return dormitoryAndRoomList;
    }

    public List<DormitoryAndRoom> createExcel(InputStream is, boolean isExcel2003) {
        List<DormitoryAndRoom> dormitoryAndRoomList = new ArrayList<>();
        try {
            Workbook wb = null;
            if (isExcel2003) { // 当excel是2003时,创建excel2003
                wb = new HSSFWorkbook(is);
            } else { // 当excel是2007时,创建excel2007
                wb = new XSSFWorkbook(is);
            }
            dormitoryAndRoomList = readExcelValue(wb); // 读取Excel里面客户的信息
        } catch (IOException e) {
            e.printStackTrace();
        }
        return dormitoryAndRoomList;
    }

    /**
     * 读取Excel里面客户的信息
     *
     * @param wb
     * @return
     */
    private List<DormitoryAndRoom> readExcelValue(Workbook wb) {
        // 得到第一个shell
        Sheet sheet = wb.getSheetAt(0);
        // 得到Excel的行数
        this.totalRows = sheet.getPhysicalNumberOfRows();
        // 得到Excel的列数(前提是有行数)
        if (totalRows > 1 && sheet.getRow(0) != null) {
            this.totalCells = sheet.getRow(0).getPhysicalNumberOfCells();
        }
        List<DormitoryAndRoom> dormitoryAndRoomList = new ArrayList<DormitoryAndRoom>();
        // 循环Excel行数
        for (int r = 1; r < totalRows; r++) {
            Row row = sheet.getRow(r);
            if (row == null) {
                continue;
            }
            DormitoryAndRoom dormitoryAndRoom = new DormitoryAndRoom();
            // 循环Excel的列
            for (int c = 0; c < this.totalCells; c++) {
                Cell cell = row.getCell(c);
                if (null != cell) {
                    if (c == 0) {
                        cell.setCellType(1);
                        String dormID = cell.getStringCellValue() + "";
                        dormitoryAndRoom.setDormID(dormID);
                    } else if (c == 1) {
                        cell.setCellType(1);
                        String dormNumOfFloor = cell.getStringCellValue() + "";
                        dormitoryAndRoom.setDormNumOfFloor(dormNumOfFloor);
                    }
                    else if (c == 2) {
                        cell.setCellType(1);
                        String roomID = cell.getStringCellValue() + "";
                        dormitoryAndRoom.setRoomID(roomID);
                    }
                    else if (c == 3) {
                        cell.setCellType(1);
                        String roomNumOfFloor = cell.getStringCellValue() + "";
                        dormitoryAndRoom.setRoomNumOfFloor(roomNumOfFloor);
                    }
                    else if (c == 4) {
                        cell.setCellType(1);
                        String roomCapacity = cell.getStringCellValue() + "";
                        dormitoryAndRoom.setRoomCapacity(roomCapacity);
                    }
                    else if (c == 5) {
                        cell.setCellType(1);
                        String roomState = cell.getStringCellValue() + "";
                        dormitoryAndRoom.setRoomState(roomState);
                    }
                }
            }
            // 添加到list
            dormitoryAndRoomList.add(dormitoryAndRoom);
        }
        return dormitoryAndRoomList;
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