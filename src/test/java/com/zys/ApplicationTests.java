package com.zys;

import com.zys.sys.common.DataGridView;
import com.zys.sys.controller.LoginfoController;
import com.zys.sys.controller.NoticeController;
import com.zys.sys.domain.Notice;
import com.zys.sys.service.NoticeService;
import com.zys.sys.vo.LoginfoVo;
import com.zys.sys.vo.NoticeVo;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import java.util.Date;
import java.util.List;

@RunWith(SpringRunner.class)
@SpringBootTest
public class ApplicationTests {

	@Autowired
	LoginfoController loginfoController;

	@Autowired
	NoticeController noticeController;

	@Test
	public void contextLoads() {
		LoginfoVo loginfoVo = new LoginfoVo();
		loginfoController.loadAllLoginfo(loginfoVo);
	}

	@Test
	public void contextLoads2(){
		NoticeVo noticeVo = new NoticeVo();
		DataGridView list =  this.noticeController.locadAllNotice(noticeVo);

		System.out.println(list);
	}

}
