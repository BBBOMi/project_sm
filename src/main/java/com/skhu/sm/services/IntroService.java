package com.skhu.sm.services;

import com.skhu.sm.dto.Intro;
import com.skhu.sm.mapper.IntroMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by ds on 2017-12-03.
 */
@Service
public class IntroService {

    @Autowired
    IntroMapper introMapper;

    //소개 항목 변경
    public void introChange(List<Intro> introList, String[] i_title, String[] i_contents) {
        int size1 = introList.size();
/*        int size2 = i_title.length;
        int size3 = i_contents.length;*/
        int i;
        for(i = 0; i < size1; i++) {
            introMapper.update(introList.get(i));
        }
       /* for(i = 1; i < size2; i++) {
            Intro intro = new Intro();
            intro.setI_id(size1+i);
            intro.setI_title(i_title[i].toString());
            intro.setI_contents(i_contents[i].toString());
            introMapper.insert(intro);
        }*/
    }
}
