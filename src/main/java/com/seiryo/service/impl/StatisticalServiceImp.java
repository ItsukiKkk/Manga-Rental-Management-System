package com.seiryo.service.impl;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.util.Arrays;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.ss.util.CellRangeAddress;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.seiryo.dao.PrefectureMapper;
import com.seiryo.dao.StatisticalMapper;
import com.seiryo.pojo.City;
import com.seiryo.pojo.Customer;
import com.seiryo.pojo.MemberData;
import com.seiryo.pojo.Prefecture;
import com.seiryo.pojo.Statistical;
import com.seiryo.service.CustomerService;
import com.seiryo.service.StatisticalService;

/**
 * サービス実装クラス：会員統計
 */
@Service
@Transactional
public class StatisticalServiceImp implements StatisticalService{
	final String FILE_DIRECTORY = "D:/tempData/";
	@Autowired
	private StatisticalMapper statisticalMapper;
	@Autowired
	private PrefectureMapper prefectureMapper;
	@Autowired
	private CustomerService customerService;
	@Override
	public List<Statistical> allStatistical() {
		return statisticalMapper.allStatistical();
	}

	@Override
	public void updateStatisticalNumber(String id, int number) {
		statisticalMapper.updateStatisticalNumber(id, number);
	}

	@Override
	public int getDownloadNumber(String id) {
		return statisticalMapper.getDownloadNumber(id);
	}
	@Override
	public File exportToExcel(String fileName, LocalDate current) throws IOException {
		// 1. 创建工作簿和工作表
        Workbook workbook = new XSSFWorkbook();
        LocalDate lastMonth = current.minusMonths(1);
        Date currentSql = Date.valueOf(current);
        Date lastMonthSql = Date.valueOf(lastMonth);
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        String day = sdf.format(currentSql);
        
        Sheet sheet = workbook.createSheet("会員統計"+ day );

        // 2. 创建行和单元格
        
        Row headerRow = sheet.createRow(0);
        headerRow.createCell(0).setCellValue("名字");
        headerRow.createCell(1).setCellValue("城市");
        headerRow.createCell(2).setCellValue("区市町村");
        headerRow.createCell(3).setCellValue("年龄");
        headerRow.createCell(4).setCellValue("状态");
        headerRow.createCell(5).setCellValue("会员累计时间");
        headerRow.createCell(6).setCellValue("常驻时长");
        headerRow.createCell(7).setCellValue(" ");
        headerRow.createCell(8).setCellValue("20岁以下会员名单");
        headerRow.createCell(9).setCellValue("30岁以下会员名单");
        headerRow.createCell(10).setCellValue("40岁以下会员名单");
        headerRow.createCell(11).setCellValue("全部会员总数");
        sheet.addMergedRegion(new CellRangeAddress(0, 0, 11, 12));
        headerRow.createCell(13).setCellValue(" ");
        headerRow.createCell(14).setCellValue("城市名称");
        headerRow.createCell(15).setCellValue("城市人数");
        headerRow.createCell(16).setCellValue("相较上月变动");
        headerRow.createCell(17).setCellValue("区市町村");
        headerRow.createCell(18).setCellValue("区市町村人数");
        headerRow.createCell(19).setCellValue("相较上月变动");
        headerRow.createCell(20).setCellValue(" ");
        headerRow.createCell(21).setCellValue("新增会员名单");
        headerRow.createCell(22).setCellValue("退出会员名单");
        headerRow.createCell(23).setCellValue("会员总数");
        headerRow.createCell(24).setCellValue("非会员总数");
        headerRow.createCell(25).setCellValue("用户总数");
        int rowIndex = 1;
        // table1
        List<Customer> data1 = customerService.getAllCustomersPlus(current);
        for (int i = 0; i < data1.size(); i++) {
        	Row row = sheet.getRow(rowIndex);
            if (row == null) {
                row = sheet.createRow(rowIndex); // 如果行不存在，创建它
            }
            Customer customer = data1.get(i);
            row.createCell(0).setCellValue(customer.getLastname() + customer.getFirstname());
            row.createCell(1).setCellValue(customer.getAddr1());
            row.createCell(2).setCellValue(customer.getAddr2());
            row.createCell(3).setCellValue(customer.getAge());
            row.createCell(4).setCellValue(customer.getStatus() < 0 && customer.getDelFlag() == 0 ? "会员" : "非会员");
            if(customer.getStatus() < 0 && customer.getDelFlag() == 0){
            	row.createCell(5).setCellValue(customer.getAccumulativeDay());
            	if(customer.getAccumulativeYear() == 0) {
            		row.createCell(6).setCellValue("新会员");
            	}else {
            		 row.createCell(6).setCellValue(customer.getAccumulativeYear());
            	}
            }
            ++rowIndex;
        }
        // table2
        rowIndex = 1;
        int allVip = customerService.getCustomerCount(currentSql,1);
        List<Customer> data20 = customerService.getCustomerListByAge(20, current);
        List<Customer> data30 = customerService.getCustomerListByAge(30, current);
        List<Customer> data40 = customerService.getCustomerListByAge(40, current);
        List<List<Customer>> dataSets = Arrays.asList(data20, data30, data40);
        for(int i = 0; i < data20.size(); i++) {
//        	Row row = sheet.createRow(i + 1);
        	Row row = sheet.getRow(rowIndex);
            if (row == null) {
                row = sheet.createRow(rowIndex); // 如果行不存在，创建它
            }
            Customer customer = data20.get(i);
        	row.createCell(8).setCellValue(customer.getLastname() + customer.getFirstname());
        	++rowIndex;
        }
        rowIndex = 1;
		for(int i = 0; i < data30.size(); i++) {
//			Row row = sheet.createRow(i + 1);
			Row row = sheet.getRow(rowIndex);
            if (row == null) {
                row = sheet.createRow(rowIndex); // 如果行不存在，创建它
            }
            Customer customer = data30.get(i);
        	row.createCell(9).setCellValue(customer.getLastname() + customer.getFirstname() );
        	++rowIndex;
		}
		rowIndex = 1;
		for(int i = 0; i < data40.size(); i++) {
//			Row row = sheet.createRow(i + 1);
			Row row = sheet.getRow(rowIndex);
            if (row == null) {
                row = sheet.createRow(rowIndex); // 如果行不存在，创建它
            }
            Customer customer = data40.get(i);
        	row.createCell(10).setCellValue(customer.getLastname() + customer.getFirstname() );
        	++rowIndex;
		}
		Row secondRow = sheet.getRow(1);
		sheet.addMergedRegion(new CellRangeAddress(1, 1, 11, 12));
		secondRow.createCell(11).setCellValue(allVip);
		rowIndex = 2;
		for(int i = 0; i < 3; i++) {
			//2,4,6 
//			Row changeRow = sheet.createRow(i + 2);
			Row row = sheet.getRow(rowIndex);
            if (row == null) {
                row = sheet.createRow(rowIndex); // 如果行不存在，创建它
            }
            int ages = 20 + i*10;
			row.createCell(11).setCellValue(ages + "岁以下会员人数");
			row.createCell(12).setCellValue("相较上月变动");
			rowIndex = rowIndex + 2;
		}
		rowIndex = 3;
		List<Customer> data20LastMonth = customerService.getCustomerListByAge(20, lastMonth);
        List<Customer> data30LastMonth = customerService.getCustomerListByAge(30, lastMonth);
        List<Customer> data40LastMonth = customerService.getCustomerListByAge(40, lastMonth);
        List<List<Customer>> arrayLastMonth = Arrays.asList(data20LastMonth, data30LastMonth, data40LastMonth);
        for(int i = 0; i < 3; i++) {
			//3,5,7
	        Row row = sheet.getRow(rowIndex);
            if (row == null) {
                row = sheet.createRow(rowIndex); // 如果行不存在，创建它
            }
            row.createCell(11).setCellValue(dataSets.get(i).size());
			int minus = dataSets.get(i).size() - arrayLastMonth.get(i).size();
			row.createCell(12).setCellValue(minus > 0 ? "增加" : (minus < 0 ? "减少" : "-"));
			rowIndex = rowIndex + 2;
		}
		// table3
		// 写入城市数据
		rowIndex = 1;
		List<Prefecture> districtStats = prefectureMapper.getAllPrefecturesData();
		List<City> cityStats = prefectureMapper.getAllCitysData();
		// 将 City 数据按 PreCd 分组
		Map<String, List<City>> cityGroupedByPrefecture = cityStats.stream()
		    .collect(Collectors.groupingBy(City::getPreCd));

		// 遍历 Prefecture 数据
		for (Prefecture district : districtStats) {
		    // 获取当前 Prefecture 对应的 City 列表
		    List<City> relatedCities = cityGroupedByPrefecture.get(district.getPreCd());
		    
		    if (relatedCities == null || relatedCities.isEmpty()) {
		        // 如果没有对应的 City 数据，输出 Prefecture 数据和空的 City 数据
		        Row row = sheet.getRow(rowIndex);
		        if (row == null) {
		            row = sheet.createRow(rowIndex); // 如果行不存在，创建它
		        }
		        row.createCell(14).setCellValue(district.getPreName());
		        row.createCell(15).setCellValue(district.getCurrentMonthCount());
		        row.createCell(12).setCellValue(district.getChangeFromLastMonth() > 0 ? "增加" :
		        	(district.getChangeFromLastMonth() < 0 ? "减少" : "-"));

		        row.createCell(17).setCellValue("-"); // 空的 City 数据
		        row.createCell(18).setCellValue("0"); // 空的 City 数据
		        row.createCell(19).setCellValue("-"); // 空的 City 数据
		        rowIndex++; // 增加行号
		    } else {
		        // 如果有对应的 City 数据，逐个输出
		        for (City city : relatedCities) {
		            Row row = sheet.getRow(rowIndex);
		            if (row == null) {
		                row = sheet.createRow(rowIndex); // 如果行不存在，创建它
		            }
		            row.createCell(14).setCellValue(district.getPreName());
		            row.createCell(15).setCellValue(district.getCurrentMonthCount());
		            row.createCell(16).setCellValue(district.getChangeFromLastMonth() > 0 ? "增加" : (district.getChangeFromLastMonth() < 0 ? "减少" : "-"));
					
//		            row.createCell(16).setCellValue(district.getChangeFromLastMonth() > 0 ? "增加" : "减少");
		            row.createCell(17).setCellValue(city.getCityName());
		            row.createCell(18).setCellValue(city.getCurrentMonthCount());
		            row.createCell(19).setCellValue(district.getChangeFromLastMonth() > 0 ? "增加" : (district.getChangeFromLastMonth() < 0 ? "减少" : "-"));
					
//		            row.createCell(19).setCellValue(city.getChangeFromLastMonth() > 0 ? "增加" : "减少");
		            rowIndex++; // 增加行号
		        }
		    }
		}

//		List<Prefecture> districtStats = prefectureMapper.getAllPrefecturesData();
//		List<City> cityStats = prefectureMapper.getAllCitysData();
//		for(Prefecture district: districtStats) {
//			for (City city : cityStats) {
//		    	Row row = sheet.getRow(rowIndex);
//		    	if (row == null) {
//	              row = sheet.createRow(rowIndex); // 如果行不存在，创建它
//	            }
//		    	if(!city.getPreCd().equals(district.getPreCd())) {
//		    		row.createCell(14).setCellValue(district.getPreName());
//			        row.createCell(15).setCellValue("0");
//			        row.createCell(16).setCellValue("-");
//		    		row.createCell(17).setCellValue("-");
//			        row.createCell(18).setCellValue("0");
//			        row.createCell(19).setCellValue("-");
//		    		continue;
//		    	}else {
//		    		row.createCell(14).setCellValue(district.getPreName());
//			        row.createCell(15).setCellValue(district.getCurrentMonthCount());
//			        row.createCell(16).setCellValue(district.getChangeFromLastMonth() > 0 ? "增加":"减少");
//		    		row.createCell(17).setCellValue(city.getCityName());
//			        row.createCell(18).setCellValue(city.getCurrentMonthCount());
//			        row.createCell(19).setCellValue(city.getChangeFromLastMonth() > 0 ? "增加":"减少");
//		    	}
//		    }
//		}
	    
	    rowIndex = 1;
		//table4
	    rowIndex = 1;
		List<Customer> newCustmoter  = customerService.getCustomerListByExpired(current, 1);
		List<Customer> expiredCustmoter  = customerService.getCustomerListByExpired(current, 0);
		int allExpired = customerService.getCustomerCount(currentSql,0);
		int allVipLastMonth = customerService.getCustomerCount(lastMonthSql,1);
		int allExpiredLastMonth = customerService.getCustomerCount(lastMonthSql,0);
		for(int i = 0; i < newCustmoter.size(); i++) {
			Row row = sheet.getRow(rowIndex);
            if (row == null) {
                row = sheet.createRow(rowIndex); // 如果行不存在，创建它
            }
            Customer customer = newCustmoter.get(i);
			row.createCell(21).setCellValue(customer.getFirstname() + customer.getLastname());
			++rowIndex;
		}
		rowIndex = 1;
		Row tempRow1 = sheet.getRow(rowIndex);
        if (tempRow1 == null) {
        	tempRow1 = sheet.createRow(rowIndex); // 如果行不存在，创建它
        }
        tempRow1.createCell(23).setCellValue(allVip);
        tempRow1.createCell(24).setCellValue(allExpired);
        tempRow1.createCell(25).setCellValue(allVip + allExpired);
		Row tempRow2 = sheet.getRow(++rowIndex);
		if (tempRow2 == null) {
        	tempRow2 = sheet.createRow(++rowIndex); // 如果行不存在，创建它
        }
		tempRow2.createCell(23).setCellValue("会员变动");
		tempRow2.createCell(24).setCellValue("非会员变动");
		tempRow2.createCell(25).setCellValue("用户总数变动");
		Row tempRow3 = sheet.getRow(++rowIndex);
		if (tempRow3 == null) {
        	tempRow3 = sheet.createRow(++rowIndex); // 如果行不存在，创建它
        }
//		row.createCell(12).setCellValue(district.getChangeFromLastMonth() > 0 ? "增加" : (district.getChangeFromLastMonth() < 0 ? "减少" : "-"));
		tempRow3.createCell(23).setCellValue(allVip - allVipLastMonth > 0? "新增"+(allVip - allVipLastMonth): 
			(allVip - allVipLastMonth < 0 ? "减少"+(allVipLastMonth - allVip) : "-"));
		tempRow3.createCell(24).setCellValue(allVip - allVipLastMonth > 0 ? "新增"+(allExpired - allExpiredLastMonth) :
			(allVip - allVipLastMonth < 0 ? "减少"+(allExpiredLastMonth - allExpired) : "-"));
		tempRow3.createCell(25).setCellValue(allVip - allVipLastMonth > 0 ? "新增"+(allVip + allExpired) :
			(allVip - allVipLastMonth < 0 ? "减少" + (-allVip - allExpired) : "-"));
//		tempRow3.createCell(23).setCellValue(allVip - allVipLastMonth >= 0?
//				"新增"+(allVip - allVipLastMonth): "减少"+(allVipLastMonth - allVip));
//		tempRow3.createCell(24).setCellValue(allVip - allVipLastMonth >= 0?
//				"新增"+(allExpired - allExpiredLastMonth): "减少"+(allExpiredLastMonth - allExpired));
//		tempRow3.createCell(25).setCellValue(allVip - allVipLastMonth >= 0?
//				"新增"+((allVip + allExpired) - (allExpiredLastMonth + allVipLastMonth)): 
//					"减少"+(-(allVip + allExpired) + (allExpiredLastMonth + allVipLastMonth)));
		
		
		rowIndex = 1;
		for(int i = 0; i < expiredCustmoter.size(); i++) {
			Row row = sheet.getRow(rowIndex);
            if (row == null) {
                row = sheet.createRow(rowIndex); // 如果行不存在，创建它
            }
			Customer customer = expiredCustmoter.get(i);
			row.createCell(22).setCellValue(customer.getLastname() + customer.getFirstname());
			++rowIndex;
		}
		 // 4. 生成文件路径
		
        File file = new File(FILE_DIRECTORY + fileName);
        if (!file.getParentFile().exists()) {
            file.getParentFile().mkdirs(); // 如果目标文件夹不存在则创建
            Statistical statistical = new Statistical();
            statistical.setStatisticalDate(currentSql);
            statistical.setStatisticalName(fileName);
            statistical.setStatisticalNumber("0");
            statistical.setStatisticalURL(FILE_DIRECTORY);
            statisticalMapper.insertStatistical(statistical);
        }

        // 5. 将工作簿保存到文件中
        try (FileOutputStream fos = new FileOutputStream(file)) {
            workbook.write(fos);
        } finally {
            workbook.close();
        }
        // 返回文件的
        return file;
    }
	@Scheduled(cron = "0 0 23 L * ?")
	public void generateMonthlyReport() throws IOException {
        String fileName = LocalDate.now() + ".xlsx";
        exportToExcel(fileName, LocalDate.now());
        System.out.println("Excel文件生成成功: " + FILE_DIRECTORY + fileName);
    }

	@Override
	public void insertStatistical(Statistical statistical) {
		statisticalMapper.insertStatistical(statistical);
	}
}
