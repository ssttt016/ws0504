package com.kbstar.item;

import com.kbstar.service.ItemService;
import lombok.extern.slf4j.Slf4j;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

@Slf4j
@SpringBootTest
class SelectOneTest {

    @Autowired
    ItemService service;
    @Test
    void contextLoads() {

        try {
            service.get(105);
            log.info("정상 호출되었습니다..");
        } catch (Exception e) {
            log.info("오류..");
        }
    }

}
