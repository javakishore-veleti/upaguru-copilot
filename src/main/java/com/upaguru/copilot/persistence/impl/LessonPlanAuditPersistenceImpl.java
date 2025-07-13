package com.upaguru.copilot.persistence.impl;

import com.upaguru.copilot.dtos.LessonPlanReq;
import com.upaguru.copilot.entity.LessonPlanAudit;
import com.upaguru.copilot.persistence.LessonPlanAuditPersistence;
import com.upaguru.copilot.persistence.jpa.LessonPlanAuditRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Repository;

import java.nio.charset.StandardCharsets;
import java.util.UUID;

@Repository
@RequiredArgsConstructor
public class LessonPlanAuditPersistenceImpl implements LessonPlanAuditPersistence {

    private final LessonPlanAuditRepository repository;

    @Override
    public void saveRequest(LessonPlanReq request, String response) {
        LessonPlanAudit audit = new LessonPlanAudit(UUID.randomUUID().toString(),
            request.getSubject(),
            request.getTopic(),
            request.getGradeLevel(),
            response.getBytes(StandardCharsets.UTF_8));
        repository.save(audit);
    }
}

