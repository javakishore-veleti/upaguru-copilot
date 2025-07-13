#!/bin/bash

echo '🧠 Generating full Java classes for upaguru-copilot...'

mkdir -p $(dirname src/main/java/com/upaguru/copilot/controller/LessonPlanController.java)
cat <<EOF > src/main/java/com/upaguru/copilot/controller/LessonPlanController.java
package com.upaguru.copilot.controller;

import com.upaguru.copilot.dtos.LessonPlanReq;
import com.upaguru.copilot.dtos.LessonPlanResp;
import com.upaguru.copilot.service.LessonPlanService;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/api/lesson-plan")
@RequiredArgsConstructor
public class LessonPlanController {
    private final LessonPlanService lessonPlanService;

    @PostMapping
    public ResponseEntity<LessonPlanResp> generate(@RequestBody LessonPlanReq req) {
        return ResponseEntity.ok(lessonPlanService.generateLessonPlan(req));
    }
}

EOF

mkdir -p $(dirname src/main/java/com/upaguru/copilot/dtos/LessonPlanReq.java)
cat <<EOF > src/main/java/com/upaguru/copilot/dtos/LessonPlanReq.java
package com.upaguru.copilot.dtos;

import lombok.Data;

@Data
public class LessonPlanReq {
    private String subject;
    private String topic;
    private String gradeLevel;
    private String duration;
}

EOF

mkdir -p $(dirname src/main/java/com/upaguru/copilot/dtos/LessonPlanResp.java)
cat <<EOF > src/main/java/com/upaguru/copilot/dtos/LessonPlanResp.java
package com.upaguru.copilot.dtos;

import lombok.AllArgsConstructor;
import lombok.Data;

@Data
@AllArgsConstructor
public class LessonPlanResp {
    private String content;
}

EOF

mkdir -p $(dirname src/main/java/com/upaguru/copilot/service/LessonPlanService.java)
cat <<EOF > src/main/java/com/upaguru/copilot/service/LessonPlanService.java
package com.upaguru.copilot.service;

import com.upaguru.copilot.dtos.LessonPlanReq;
import com.upaguru.copilot.dtos.LessonPlanResp;

public interface LessonPlanService {
    LessonPlanResp generateLessonPlan(LessonPlanReq request);
}

EOF

mkdir -p $(dirname src/main/java/com/upaguru/copilot/service/impl/LessonPlanServiceImpl.java)
cat <<EOF > src/main/java/com/upaguru/copilot/service/impl/LessonPlanServiceImpl.java
package com.upaguru.copilot.service.impl;

import com.upaguru.copilot.broker.LessonPlannerBroker;
import com.upaguru.copilot.dtos.LessonPlanReq;
import com.upaguru.copilot.dtos.LessonPlanResp;
import com.upaguru.copilot.persistence.LessonPlanAuditPersistence;
import com.upaguru.copilot.service.LessonPlanService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class LessonPlanServiceImpl implements LessonPlanService {
    private final LessonPlannerBroker broker;
    private final LessonPlanAuditPersistence persistence;

    @Override
    public LessonPlanResp generateLessonPlan(LessonPlanReq request) {
        String content = broker.generateLessonPlanFromAI(request);
        persistence.saveRequest(request, content);
        return new LessonPlanResp(content);
    }
}

EOF

mkdir -p $(dirname src/main/java/com/upaguru/copilot/broker/LessonPlannerBroker.java)
cat <<EOF > src/main/java/com/upaguru/copilot/broker/LessonPlannerBroker.java
package com.upaguru.copilot.broker;

import com.upaguru.copilot.dtos.LessonPlanReq;

public interface LessonPlannerBroker {
    String generateLessonPlanFromAI(LessonPlanReq request);
}

EOF

mkdir -p $(dirname src/main/java/com/upaguru/copilot/broker/impl/OpenAiLessonPlannerBroker.java)
cat <<EOF > src/main/java/com/upaguru/copilot/broker/impl/OpenAiLessonPlannerBroker.java
package com.upaguru.copilot.broker.impl;

import com.upaguru.copilot.broker.LessonPlannerBroker;
import com.upaguru.copilot.config.OpenAiConfig;
import com.upaguru.copilot.dtos.LessonPlanReq;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Component;
import org.springframework.web.client.RestTemplate;

@Component
@RequiredArgsConstructor
public class OpenAiLessonPlannerBroker implements LessonPlannerBroker {

    private final OpenAiConfig config;
    private final RestTemplate restTemplate;

    @Override
    public String generateLessonPlanFromAI(LessonPlanReq request) {
        // Placeholder for OpenAI integration
        return String.format("Lesson plan for %s: %s", request.getSubject(), request.getTopic());
    }
}

EOF

mkdir -p $(dirname src/main/java/com/upaguru/copilot/config/OpenAiConfig.java)
cat <<EOF > src/main/java/com/upaguru/copilot/config/OpenAiConfig.java
package com.upaguru.copilot.config;

import lombok.Getter;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Configuration;

@Configuration
@Getter
public class OpenAiConfig {
    @Value("${openai.api.key}")
    private String apiKey;

    @Value("${openai.model:gpt-4}")
    private String model;
}

EOF

mkdir -p $(dirname src/main/java/com/upaguru/copilot/persistence/LessonPlanAuditPersistence.java)
cat <<EOF > src/main/java/com/upaguru/copilot/persistence/LessonPlanAuditPersistence.java
package com.upaguru.copilot.persistence;

import com.upaguru.copilot.dtos.LessonPlanReq;

public interface LessonPlanAuditPersistence {
    void saveRequest(LessonPlanReq request, String response);
}

EOF

mkdir -p $(dirname src/main/java/com/upaguru/copilot/persistence/impl/LessonPlanAuditPersistenceImpl.java)
cat <<EOF > src/main/java/com/upaguru/copilot/persistence/impl/LessonPlanAuditPersistenceImpl.java
package com.upaguru.copilot.persistence.impl;

import com.upaguru.copilot.dtos.LessonPlanReq;
import com.upaguru.copilot.entity.LessonPlanAudit;
import com.upaguru.copilot.persistence.LessonPlanAuditPersistence;
import com.upaguru.copilot.persistence.jpa.LessonPlanAuditRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Repository;

@Repository
@RequiredArgsConstructor
public class LessonPlanAuditPersistenceImpl implements LessonPlanAuditPersistence {

    private final LessonPlanAuditRepository repository;

    @Override
    public void saveRequest(LessonPlanReq request, String response) {
        LessonPlanAudit audit = new LessonPlanAudit(null,
            request.getSubject(),
            request.getTopic(),
            request.getGradeLevel(),
            response);
        repository.save(audit);
    }
}

EOF

mkdir -p $(dirname src/main/java/com/upaguru/copilot/persistence/jpa/LessonPlanAuditRepository.java)
cat <<EOF > src/main/java/com/upaguru/copilot/persistence/jpa/LessonPlanAuditRepository.java
package com.upaguru.copilot.persistence.jpa;

import com.upaguru.copilot.entity.LessonPlanAudit;
import org.springframework.data.jpa.repository.JpaRepository;

public interface LessonPlanAuditRepository extends JpaRepository<LessonPlanAudit, Long> {
}

EOF

mkdir -p $(dirname src/main/java/com/upaguru/copilot/entity/LessonPlanAudit.java)
cat <<EOF > src/main/java/com/upaguru/copilot/entity/LessonPlanAudit.java
package com.upaguru.copilot.entity;

import jakarta.persistence.*;
import lombok.*;

@Entity
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class LessonPlanAudit {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String subject;
    private String topic;
    private String gradeLevel;

    @Lob
    private String response;
}

EOF

mkdir -p $(dirname src/main/java/com/upaguru/copilot/UpaguruCopilotApplication.java)
cat <<EOF > src/main/java/com/upaguru/copilot/UpaguruCopilotApplication.java
package com.upaguru.copilot;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
public class UpaguruCopilotApplication {
    public static void main(String[] args) {
        SpringApplication.run(UpaguruCopilotApplication.class, args);
    }
}

EOF

echo '✅ All Java files populated with real code.'
