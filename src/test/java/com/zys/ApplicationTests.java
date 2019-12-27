package com.zys;

import com.zys.sys.controller.LoginfoController;
import com.zys.sys.vo.LoginfoVo;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import java.util.Date;

@RunWith(SpringRunner.class)
@SpringBootTest
public class ApplicationTests {

	@Autowired
	LoginfoController loginfoController;

	@Test
	public void contextLoads() {
		LoginfoVo loginfoVo = new LoginfoVo();
		loginfoController.loadAllLoginfo(loginfoVo);
	}

}
