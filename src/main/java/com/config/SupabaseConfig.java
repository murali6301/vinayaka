package com.config;

import io.github.supabase.Client;
import io.github.supabase.ClientOptions;
import io.github.supabase.SupabaseClient;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

@Configuration
public class SupabaseConfig {
    
    private final String SUPABASE_URL = System.getenv("SUPABASE_URL");
    private final String SUPABASE_KEY = System.getenv("SUPABASE_KEY");
    
    @Bean
    public SupabaseClient supabaseClient() {
        ClientOptions options = ClientOptions.builder()
            .setApiKey(SUPABASE_KEY)
            .setApiUrl(SUPABASE_URL)
            .build();
            
        return new Client(options);
    }
}