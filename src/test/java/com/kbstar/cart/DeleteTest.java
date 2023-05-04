package com.kbstar.cart;

import com.kbstar.service.CartService;
import lombok.extern.slf4j.Slf4j;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

@Slf4j
@SpringBootTest
public class DeleteTest {

    @Autowired
    CartService service;

    @Test
    void contextLoads() {

        try {
            service.remove(1);
            log.info("삭제 정상");
            service.get();
        } catch (Exception e) {
            log.info("삭제가 정상적으로 처리되지 않았습니다");
        }

    }
}
