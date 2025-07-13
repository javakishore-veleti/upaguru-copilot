package com.upaguru.copilot.persistence.jpa;

import com.upaguru.copilot.entity.LessonPlanAudit;
import org.springframework.data.jpa.repository.JpaRepository;

public interface LessonPlanAuditRepository extends JpaRepository<LessonPlanAudit, Long> {
}

