package cn.enilu.flash.service.training;

import cn.enilu.flash.bean.entity.training.BookType;
import cn.enilu.flash.dao.training.BookClassifyRepository;
import cn.enilu.flash.service.BaseService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


@Service
public class BookClassifyService extends BaseService<BookType, Long, BookClassifyRepository> {
    private Logger logger = LoggerFactory.getLogger(getClass());
    @Autowired
    private BookClassifyRepository bookClassifyRepository;

}
