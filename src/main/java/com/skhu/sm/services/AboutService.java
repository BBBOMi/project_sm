package com.skhu.sm.services;

import com.skhu.sm.dto.About;
import com.skhu.sm.mapper.AboutMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by ds on 2017-12-03.
 */
@Service
public class AboutService {

    @Autowired
    AboutMapper aboutMapper;

    //소개 항목 변경
    public void aboutChange(List<About> aboutList, String[] a_title, String[] a_contents) {
        int size1 = aboutList.size();
/*        int size2 = a_title.length;
        int size3 = a_contents.length;*/
        int i;
        for(i = 0; i < size1; i++) {
            aboutMapper.update(aboutList.get(i));
        }
/*        for(i = 1; i < size2; i++) {
            About about = new About();
            about.setA_id(size1+i);
            about.setA_title(a_title[i].toString());
            about.setA_contents(a_contents[i].toString());
            aboutMapper.insert(about);
        }*/
    }
}
