package com.upaguru.copilot.entity;

import jakarta.persistence.*;
import lombok.*;
import java.util.Date;

@Entity
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class LessonPlanAudit {

    @Id
    private String id;

    @Column(name = "subject")
    private String subject;

    @Column(name = "topic")
    private String topic;

    @Column(name = "grade_level")
    private String gradeLevel;

    @Column(name = "response")
    private byte[] response;

    @Column(updatable = false)
    @Temporal(TemporalType.TIMESTAMP)
    private Date createdAt;

    @Temporal(TemporalType.TIMESTAMP)
    private Date updatedAt;



    public LessonPlanAudit(String id, String subject, String topic, String gradeLevel, byte[] response) {
        this.id = id;
        this.subject = subject;
        this.topic = topic;
        this.gradeLevel = gradeLevel;
        this.response = response;
    }

    @PrePersist
    protected void onCreate() {
        createdAt = new Date();
        updatedAt = new Date();
    }

    @PreUpdate
    protected void onUpdate() {
        updatedAt = new Date();
    }
}

