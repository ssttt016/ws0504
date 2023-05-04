package com.kbstar.markerdesc;

import com.kbstar.dto.Marker;
import com.kbstar.service.MarkerService;
import lombok.extern.slf4j.Slf4j;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

@Slf4j
@SpringBootTest
class UpdateTest {
    @Autowired
    MarkerService service;
    @Test
    void contextLoads() {
        try {
            service.modify(new Marker(150, "밥플러스 하우스디점", "http://www.naver.com", 37.233, 127.3434, "a.jpg", "S" ));
            log.info("등록 정상..");
        } catch (Exception e) {
                log.info("시스템 장애입니다...------------------------------------------");
                e.printStackTrace();
        }
    }

}
