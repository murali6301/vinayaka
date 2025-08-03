package com.config;

import io.github.supabase.Client;
import io.github.supabase.ClientOptions;
import io.github.supabase.SupabaseClient;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.beans.factory.annotation.Value;
import javax.sql.DataSource;
import org.springframework.boot.jdbc.DataSourceBuilder;

@Configuration
public class SupabaseConfig {
    
    @Value("${SUPABASE_URL:}")
    private String supabaseUrl;
    
    @Value("${SUPABASE_KEY:}")
    private String supabaseKey;
    
    @Value("${SUPABASE_DB_URL:jdbc:postgresql://aws-0-ap-south-1.pooler.supabase.com:5432/postgres}")
    private String dbUrl;
    
    @Value("${SUPABASE_DB_USER:postgres.lpihzzgpbfjeikrxwhkc}")
    private String dbUser;
    
    @Value("${SUPABASE_DB_PASSWORD}")
    private String dbPassword;
    
    @Bean
    public SupabaseClient supabaseClient() {
        ClientOptions options = ClientOptions.builder()
            .setApiKey(supabaseKey)
            .setApiUrl(supabaseUrl)
            .build();
            
        return new Client(options);
    }
    
    @Bean
    public DataSource dataSource() {
        return DataSourceBuilder
            .create()
            .url(dbUrl)
            .username(dbUser)
            .password(dbPassword)
            .driverClassName("org.postgresql.Driver")
            .build();
    }
}