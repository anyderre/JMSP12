package com.edu.pucmm.JMSP12;

import com.edu.pucmm.JMSP12.Entity.Temperatura;
import org.springframework.boot.ApplicationArguments;
import org.springframework.boot.ApplicationRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.jms.DefaultJmsListenerContainerFactoryConfigurer;
import org.springframework.context.ConfigurableApplicationContext;
import org.springframework.context.annotation.Bean;
import org.springframework.jms.annotation.EnableJms;
import org.springframework.jms.config.DefaultJmsListenerContainerFactory;
import org.springframework.jms.config.JmsListenerContainerFactory;
import org.springframework.jms.core.JmsTemplate;
import org.springframework.jms.support.converter.MappingJackson2MessageConverter;
import org.springframework.jms.support.converter.MessageConverter;
import org.springframework.jms.support.converter.MessageType;

import javax.jms.ConnectionFactory;
import java.util.Date;

@EnableJms
@SpringBootApplication
public class Jmsp12Application implements ApplicationRunner {
    //private static final Logger logger = LoggerFactory.getLogger(Application.class);
	@Bean
	public JmsListenerContainerFactory<?> temperaturaFactory (ConnectionFactory connectionFactory, DefaultJmsListenerContainerFactoryConfigurer configurer){
		DefaultJmsListenerContainerFactory factory = new DefaultJmsListenerContainerFactory();
		configurer.configure(factory, connectionFactory);
		factory.setErrorHandler(
				t -> System.err.println("An error has occurred in the transaction"));
		// lambda function
		factory.setErrorHandler(t -> System.err.println("An error has occurred in the transaction"));
		configurer.configure(factory, connectionFactory);
		return factory;
	}
	public static void main(String[] args) {
		ConfigurableApplicationContext context = SpringApplication.run(Jmsp12Application.class, args);
        JmsTemplate jmsTemplate = context.getBean(JmsTemplate.class);
        System.out.println("->>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>Sending a new Teperature");
        jmsTemplate.convertAndSend("temperaturaMessage", new Temperatura(new Date(), 1, 16, 27));
	}
	@Bean
	public MessageConverter jacksonJmsMessageConverter(){
		MappingJackson2MessageConverter converter = new MappingJackson2MessageConverter();
		converter.setTargetType(MessageType.TEXT);
		converter.setTypeIdPropertyName("_type");
		return converter;
	}

    @Override
    public void run(ApplicationArguments args) throws Exception {
        for (String name : args.getOptionNames()){
            System.out.println(name);
        }

    }
}
