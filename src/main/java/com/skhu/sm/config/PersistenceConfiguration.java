package com.skhu.sm.config;

import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.tomcat.jdbc.pool.DataSource;
import org.mybatis.spring.SqlSessionFactoryBean;
import org.mybatis.spring.SqlSessionTemplate;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.io.support.PathMatchingResourcePatternResolver;
import org.springframework.transaction.annotation.EnableTransactionManagement;

import java.util.Properties;

/**
 * Created by ds on 2018-03-13.
 */

@Configuration
@EnableTransactionManagement
@MapperScan(basePackages = "com.skhu.sm.mapper")
public class PersistenceConfiguration {

    @Bean
    public SqlSessionFactory sqlSessionFatory(DataSource datasource) throws Exception{
        SqlSessionFactoryBean sqlSessionFactory = new SqlSessionFactoryBean();
        sqlSessionFactory.setDataSource(datasource);
        sqlSessionFactory.setMapperLocations(new PathMatchingResourcePatternResolver().getResources("classpath:mapper/*.xml"));
        return (SqlSessionFactory) sqlSessionFactory.getObject();
    }

    private Properties mybatisProperties() {
        Properties properties = new Properties();
        properties.put("lazyLoadingEnabled", "true");
        return properties;
    }

    @Bean
    public SqlSessionTemplate sqlSessionTemplate(SqlSessionFactory sqlSessionFactory) throws Exception {
        return new SqlSessionTemplate(sqlSessionFactory);
    }
}