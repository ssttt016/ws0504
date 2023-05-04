package com.kbstar.markerdesc;


import com.kbstar.dto.MarkerDesc;
import com.kbstar.service.MarkerDescService;
import lombok.extern.slf4j.Slf4j;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.dao.DuplicateKeyException;

@Slf4j
@SpringBootTest
class InsertTest {
    @Autowired
    MarkerDescService service;
    @Test
    void contextLoads() {
        MarkerDesc obj = new MarkerDesc(106, "순대국밥",8000,"a.jpg" );

        try {
            service.register(obj);
            service.get();
            log.info("등록 정상..");
        } catch (Exception e) {
            if(e instanceof DuplicateKeyException){
                log.info("ID가 중복 되었습니다.-----------------------------------------");
            }else{
                log.info("시스템 장애입니다...------------------------------------------");
                e.printStackTrace();
            }



        }
    }

}
