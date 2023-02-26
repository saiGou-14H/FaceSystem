package com.org.config;

import com.alibaba.druid.pool.DruidDataSource;
import com.alibaba.druid.support.http.StatViewServlet;
import com.alibaba.druid.support.http.WebStatFilter;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.boot.web.servlet.FilterRegistrationBean;
import org.springframework.boot.web.servlet.ServletRegistrationBean;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import javax.sql.DataSource;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Properties;

@Configuration
public class DruidConfig {

    @ConfigurationProperties(prefix = "spring.datasource")
    @Bean
    public DataSource druidDataSource() throws SQLException {
        DruidDataSource dds = new DruidDataSource();
        dds.setInitialSize(5);                                  /* 初始化时建立物理连接的个数 */
        dds.setMaxActive(20);                                   /* 最大连接池数量 */
        dds.setMaxWait(60000);                                  /* 获取连接时最大等待时间，单位毫秒 */
        dds.setMinIdle(8);                                      /* 最小连接池数量 */
        dds.setTimeBetweenEvictionRunsMillis(60000);            /* Destroy线程会检测连接的间隔时间 */
        dds.setMinEvictableIdleTimeMillis(300000);              /* 连接保持空闲而不被驱逐的最小时间 */
        dds.setValidationQuery("SELECT 1 FROM DUAL");           /* 用来检测连接是否有效的sql，要求是一个查询语句，常用select 'x'。如果validationQuery为null，testOnBorrow、testOnReturn、testWhileIdle都不会起作用。 */
        dds.setTestWhileIdle(true);                             /* 建议配置为true，不影响性能，并且保证安全性 */
        dds.setTestOnBorrow(false);                             /* 申请连接时执行validationQuery检测连接是否有效，做了这个配置会降低性能 */
        dds.setTestOnReturn(false);                             /* 归还连接时执行validationQuery检测连接是否有效，做了这个配置会降低性能 */
        dds.setPoolPreparedStatements(false);                   /* 是否缓存preparedStatement，也就是PSCache。PSCache对支持游标的数据库性能提升巨大，比如说oracle。在mysql下建议关闭 */
        dds.setFilters("stat,wall");                            /* 属性类型是字符串，通过别名的方式配置扩展插件，常用的插件有：监控统计用的filter:stat, 日志用的filter:log4j, 防御sql注入的filter:wall */
        dds.setMaxPoolPreparedStatementPerConnectionSize(50);   /* 要启用PSCache，必须配置大于0，当大于0时，poolPreparedStatements自动触发修改为true。在Druid中，不会存在Oracle下PSCache占用内存过多的问题，可以把这个数值配置大一些，比如说100 */
        dds.setUseGlobalDataSourceStat(true);
        Properties properties = new Properties();
        properties.setProperty("druid.stat.mergeSql", "true");
        properties.setProperty("druid.stat.slowSqlMillis", "100");
        dds.setConnectProperties(properties);
        dds.setDbType("mysql");//mysql必须小写
        return dds;
    }
    /*public DataSource druidDataSource() {
        return  new DruidDataSource();
    }*/

    /*后台监控
    * 因为SpringBoot内置了servlet容器，所以没有web.xml,替代方法ServletRegistrationBean
    * */
    @Bean
    public ServletRegistrationBean statViewServlet() {
        ServletRegistrationBean<StatViewServlet> bean = new ServletRegistrationBean<>(new StatViewServlet(),"/druid/*");
        //后台需要有人登录
        HashMap<String,String> initParameters = new HashMap<>();
        //增加配置
        initParameters.put("loginUsername", "admin");
        initParameters.put("loginPassword", "7107");
        //允许谁可以访问
        initParameters.put("allow", "");            //默认允许所有可访问
        //禁止谁可以访问
        //initParameters.put("用户名", "ip地址");

        bean.setInitParameters(initParameters);     //设置初始化参数
        return bean;
    }

    @Bean
    public FilterRegistrationBean<WebStatFilter> statFilter(){
        FilterRegistrationBean<WebStatFilter> filterRegistrationBean = new FilterRegistrationBean<>(new WebStatFilter());
        //添加过滤规则
        filterRegistrationBean.addUrlPatterns("/*");
        //忽略过滤的格式
        filterRegistrationBean.addInitParameter("exclusions","*.js,*.gif,*.jpg,*.png,*.css,*.ico,/druid/*");
        return filterRegistrationBean;
    }



}
