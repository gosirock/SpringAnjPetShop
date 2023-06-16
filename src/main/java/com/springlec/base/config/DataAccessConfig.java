package com.springlec.base.config;

import javax.sql.DataSource;

import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.SqlSessionFactoryBean;
import org.mybatis.spring.SqlSessionTemplate;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
// 프로그램 실행중이아닌 셋팅될때 하는게 configuration
import org.springframework.core.io.support.PathMatchingResourcePatternResolver;

@Configuration
@MapperScan(basePackages = "com.springlec.base.dao")
public class DataAccessConfig {

	// DB연결되는 세션 경로빼고 변하는게 없다.
	@Bean
	public SqlSessionFactory sqlSessionFactory(DataSource dataSource) throws Exception{
		SqlSessionFactoryBean sessionFactory = new SqlSessionFactoryBean();
		sessionFactory.setDataSource(dataSource);
		sessionFactory.setMapperLocations(
				new PathMatchingResourcePatternResolver().getResources("classpath:mapper/*.xml")
				);
		return sessionFactory.getObject();
	}
	
	@Bean
	public SqlSessionTemplate sessionTemplate(SqlSessionFactory sqlSessionFactory) {
		return new SqlSessionTemplate(sqlSessionFactory);
	}
	
	
	
}
