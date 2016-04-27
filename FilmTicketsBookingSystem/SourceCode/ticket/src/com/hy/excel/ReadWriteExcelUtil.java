package com.hy.excel;

import java.io.File;
import java.io.IOException;
import java.util.List;

import com.hy.biz.IAlltableBiz;
import com.hy.biz.impl.AlltableBizImpl;

import jxl.Cell;
import jxl.Sheet;
import jxl.Workbook;
import jxl.read.biff.BiffException;
import jxl.write.Label;
import jxl.write.WritableSheet;
import jxl.write.WritableWorkbook;
import jxl.write.WriteException;
import jxl.write.biff.RowsExceededException;

public class ReadWriteExcelUtil {
  
    /** 
     * 從excel文件中讀取所有的內容 
     *  
     * @param file 
     *            excel文件 
     * @return excel文件的內容 
     */  
    public static boolean readExcel(String fileName,String[] tablenames) {  
        Workbook wb = null;  
        IAlltableBiz ab=new AlltableBizImpl();
        try {  
            // 构造Workbook（工作薄）对象  
            wb = Workbook.getWorkbook(new File(fileName));  
        } catch (BiffException e) {  
            e.printStackTrace();  
        } catch (IOException e) {  
            e.printStackTrace();  
        }  
  
        if (wb == null)  
            return false;  
  
        // 获得了Workbook对象之后，就可以通过它得到Sheet（工作表）对象了  
        Sheet[] sheet = wb.getSheets();  
        if (sheet != null && sheet.length > 0) { 
        	//对每个被选中的table循环
        	for (String tablename : tablenames) {
	            // 对每个工作表进行循环  
	            for (int i = 0; i < sheet.length; i++) {  
	            	if(tablename.equals(sheet[i].getName())){
	            		// 得到当前工作表的行数  
		                int rowNum = sheet[i].getRows();  
		                for (int j = 1; j < rowNum; j++) {
		                	String temp="";
		                	if(tablename.equals("buy"))temp="buy";
		                	if(tablename.equals("cinema"))temp="cinema";
		                	if(tablename.equals("film"))temp="film";
		                	if(tablename.equals("hall"))temp="hall";
		                	if(tablename.equals("percontent"))temp="percontent";
		                	if(tablename.equals("permission"))temp="permission";
		                	if(tablename.equals("slideimg"))temp="slideimg";
		                	if(tablename.equals("ticket"))temp="ticket";
		                	if(tablename.equals("user"))temp="user";
		                    // 得到当前行的所有单元格  
		                    Cell[] cells = sheet[i].getRow(j);  
		                    if (cells != null && cells.length > 0) {  
		                        // 对每个单元格进行循环  
		                        for (int k = 0; k < cells.length; k++) {  
		                            // 读取当前单元格的值  
		                            String cellValue = cells[k].getContents();
		                            temp+=("thisisseperator"+cellValue);
		                        }  
		                    }
		                    ab.updateAllDate(temp);
		                }
	            	}
	            }
            }  
        }  
        // 最后关闭资源，释放内存  
        wb.close();  
        return true;
    }  
  
    /** 
     * 把內容寫入excel文件中 
     *  
     * @param fileName 
     *            要寫入的文件的名稱 
     */  
    public static void writeExcel(String fileName,String[] tablenames) { 
    	IAlltableBiz ab=new AlltableBizImpl();
        WritableWorkbook wwb = null;  
        try {  
            // 首先要使用Workbook类的工厂方法创建一个可写入的工作薄(Workbook)对象  
            wwb = Workbook.createWorkbook(new File(fileName));  
        } catch (IOException e) {  
            e.printStackTrace();  
        }  
        if (wwb != null) {  
            // 创建一个可写入的工作表  
            // Workbook的createSheet方法有两个参数，第一个是工作表的名称，第二个是工作表在工作薄中的位置  
            for(int t=0;t<tablenames.length;t++){
            	WritableSheet ws = wwb.createSheet(tablenames[t], 0);  
            	List<Object> allData=ab.getAllData(tablenames[t]);
                // 下面开始添加单元格  
            	int maxi=allData.size();
            	int maxj=0;
            	if(tablenames[t].equals("buy"))maxj=5;
            	if(tablenames[t].equals("cinema"))maxj=14;
            	if(tablenames[t].equals("film"))maxj=17;
            	if(tablenames[t].equals("hall"))maxj=6;
            	if(tablenames[t].equals("percontent"))maxj=4;
            	if(tablenames[t].equals("permission"))maxj=2;
            	if(tablenames[t].equals("slideimg"))maxj=7;
            	if(tablenames[t].equals("ticket"))maxj=7;
            	if(tablenames[t].equals("user"))maxj=4;
                for (int i = 0; i <maxi/maxj ; i++) {  
                    for (int j = 0; j < maxj; j++) { 
                        // 这里需要注意的是，在Excel中，第一个参数表示列，第二个表示行  
                        Label labelC = new Label(j, i, allData.get(i*maxj+j).toString());  
                        try {  
                            // 将生成的单元格添加到工作表中  
                            ws.addCell(labelC);  
                        } catch (RowsExceededException e) {  
                            e.printStackTrace();  
                        } catch (WriteException e) {  
                            e.printStackTrace();  
                        }  
      
                    }  
                }  
            }
        	

            
            try {  
                // 从内存中写入文件中  
                wwb.write();  
                // 关闭资源，释放内存  
                wwb.close();  
            } catch (IOException e) {  
                e.printStackTrace();  
            } catch (WriteException e) {  
                e.printStackTrace();  
            }  
        }  
    }  
  
}  