package com.kbstar.sales;

import com.kbstar.dto.Sales;
import com.kbstar.service.SalesService;
import lombok.extern.slf4j.Slf4j;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.dao.DuplicateKeyException;

@Slf4j
@SpringBootTest
class InsertTest {
    @Autowired
    SalesService service;
    @Test
    void contextLoads() {
        Sales obj = new Sales("2023-04-27",50001,"M");
        try{
            service.register(obj);
            service.get();
            log.info("등록 정상..");
        } catch (Exception e){
            if(e instanceof DuplicateKeyException){
                log.info("ID가 중복 되었습니다.");
            }else{
                log.info("시스템 장애입니다.");
                e.printStackTrace();
            }
        }
    }

}
