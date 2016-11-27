package hijoy.mvc.test;

import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.model;

import java.io.File;

import org.junit.Test;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import java.util.ArrayList;
import java.util.List;
import hijoy.mvc.test.Excel;

import jxl.Cell;
import jxl.Sheet;
import jxl.Workbook;
import net.sf.json.JSONObject;
@Controller
public class ExcelControl {
	
	@Test
	@RequestMapping("/upload")
	@ResponseBody
	public  ModelAndView test(@RequestParam("file") MultipartFile file) {
		ModelAndView modelAndView= new ModelAndView("main");
		Excel excel = new Excel();
		int i;
		Sheet sheet;
		Workbook workbook;
		Cell cell1,cell2,cell3;
		File newFile = new File("yes");
		try{
			file.transferTo(newFile);
			//t.xls为要读取的excel文件名
            workbook= Workbook.getWorkbook(newFile);
            
            //获得第一个工作表对象(ecxel中sheet的编号从0开始,0,1,2,3,....)
            sheet=workbook.getSheet(0); 
            //获取左上角的单元格
            cell1=sheet.getCell(0,0);
            System.out.println("标题："+cell1.getContents()); 
            i=1;
                //获取每一行的单元格 
                cell1=sheet.getCell(0,i);//（列，行）
                cell2=sheet.getCell(1,i);
                cell3=sheet.getCell(2,i);
                excel.setId(cell2.toString());
                excel.setBackornot(cell1.toString());
//                excels.add(excel);
                System.out.println(cell1.getContents()+"\t"+cell2.getContents()+"\t"+cell3.getContents()); 
                i++;
            
            workbook.close();
            modelAndView.addObject("excel",excel);
            modelAndView.addObject("sta",1);
            return modelAndView;
		}
		catch(Exception e){
			e.printStackTrace();
		}
		return modelAndView;
	}
	@RequestMapping("/upload2")
	public  ModelAndView test() {
		ModelAndView modelAndView= new ModelAndView("main");
		Excel excel = new Excel();
		try{excel.setBackornot("backornot");
		excel.setId("id");
            modelAndView.addObject("excel",excel);
            modelAndView.addObject("sta",1);
		}
		catch(Exception e){
			e.printStackTrace();
		}
		return modelAndView;
	}
}
