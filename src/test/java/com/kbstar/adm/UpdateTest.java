package com.kbstar.adm;

import com.kbstar.dto.Adm;
import com.kbstar.service.AdmService;
import lombok.extern.slf4j.Slf4j;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

@Slf4j
@SpringBootTest
class UpdateTest {
    @Autowired
    AdmService service;
    @Test
    void contextLoads() {
        Adm obj = new Adm("id22","pwd05",4);
        try{
            service.modify(obj);
            log.info("등록 정상..");
            service.get("id22");
        } catch (Exception e){
                log.info("ID가 중복되었습니다.");
            }
        }
    }


