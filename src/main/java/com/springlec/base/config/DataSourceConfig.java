
//DB 사용을 위한 설정 파일로 application.properties에 선언된
//spring.datasource.* 값들로 DataSource로 빌드하기 위해 사용한다.
//DB 연동은 다른방법으로도 가능하지만 보다 편리한 유지보수를 위해 클래스 파일로 분리 한다.

package com.springlec.base.config;

import javax.sql.DataSource;

import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.boot.jdbc.DataSourceBuilder;
import org.springframework.context.annotation.Configuration;

@Configuration
public class DataSourceConfig {

	@ConfigurationProperties(prefix = "spring.datasource")
	public DataSource dataSource() {
		return DataSourceBuilder.create().build();
	}
}
