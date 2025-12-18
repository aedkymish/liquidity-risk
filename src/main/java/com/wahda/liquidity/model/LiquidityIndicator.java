package com.wahda.liquidity.model;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;

/**
 * Data model for Liquidity Risk Indicators
 * Represents LCR, NSFR, and Leverage Ratio
 */
public class LiquidityIndicator implements Serializable {

    private static final long serialVersionUID = 1L;

    private Long id;
    private String indicatorType; // LCR, NSFR, LEVERAGE_RATIO
    private Integer year;
    private String quarterRange; // Q1_Q2, Q2_Q3, Q3_Q4

    // Q1 values
    private BigDecimal q1Month1Value;
    private BigDecimal q1Month2Value;
    private BigDecimal q1Month3Value;
    private BigDecimal q1Result;

    // Q2 values
    private BigDecimal q2Month1Value;
    private BigDecimal q2Month2Value;
    private BigDecimal q2Month3Value;
    private BigDecimal q2Result;

    // Calculated values
    private BigDecimal absoluteCoverage;

    // Audit fields
    private Date createdDate;
    private String createdBy;
    private Date lastModifiedDate;
    private String lastModifiedBy;

    // Constructors
    public LiquidityIndicator() {
    }

    public LiquidityIndicator(String indicatorType, Integer year, String quarterRange) {
        this.indicatorType = indicatorType;
        this.year = year;
        this.quarterRange = quarterRange;
    }

    // Getters and Setters
    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getIndicatorType() {
        return indicatorType;
    }

    public void setIndicatorType(String indicatorType) {
        this.indicatorType = indicatorType;
    }

    public Integer getYear() {
        return year;
    }

    public void setYear(Integer year) {
        this.year = year;
    }

    public String getQuarterRange() {
        return quarterRange;
    }

    public void setQuarterRange(String quarterRange) {
        this.quarterRange = quarterRange;
    }

    public BigDecimal getQ1Month1Value() {
        return q1Month1Value;
    }

    public void setQ1Month1Value(BigDecimal q1Month1Value) {
        this.q1Month1Value = q1Month1Value;
    }

    public BigDecimal getQ1Month2Value() {
        return q1Month2Value;
    }

    public void setQ1Month2Value(BigDecimal q1Month2Value) {
        this.q1Month2Value = q1Month2Value;
    }

    public BigDecimal getQ1Month3Value() {
        return q1Month3Value;
    }

    public void setQ1Month3Value(BigDecimal q1Month3Value) {
        this.q1Month3Value = q1Month3Value;
    }

    public BigDecimal getQ1Result() {
        return q1Result;
    }

    public void setQ1Result(BigDecimal q1Result) {
        this.q1Result = q1Result;
    }

    public BigDecimal getQ2Month1Value() {
        return q2Month1Value;
    }

    public void setQ2Month1Value(BigDecimal q2Month1Value) {
        this.q2Month1Value = q2Month1Value;
    }

    public BigDecimal getQ2Month2Value() {
        return q2Month2Value;
    }

    public void setQ2Month2Value(BigDecimal q2Month2Value) {
        this.q2Month2Value = q2Month2Value;
    }

    public BigDecimal getQ2Month3Value() {
        return q2Month3Value;
    }

    public void setQ2Month3Value(BigDecimal q2Month3Value) {
        this.q2Month3Value = q2Month3Value;
    }

    public BigDecimal getQ2Result() {
        return q2Result;
    }

    public void setQ2Result(BigDecimal q2Result) {
        this.q2Result = q2Result;
    }

    public BigDecimal getAbsoluteCoverage() {
        return absoluteCoverage;
    }

    public void setAbsoluteCoverage(BigDecimal absoluteCoverage) {
        this.absoluteCoverage = absoluteCoverage;
    }

    public Date getCreatedDate() {
        return createdDate;
    }

    public void setCreatedDate(Date createdDate) {
        this.createdDate = createdDate;
    }

    public String getCreatedBy() {
        return createdBy;
    }

    public void setCreatedBy(String createdBy) {
        this.createdBy = createdBy;
    }

    public Date getLastModifiedDate() {
        return lastModifiedDate;
    }

    public void setLastModifiedDate(Date lastModifiedDate) {
        this.lastModifiedDate = lastModifiedDate;
    }

    public String getLastModifiedBy() {
        return lastModifiedBy;
    }

    public void setLastModifiedBy(String lastModifiedBy) {
        this.lastModifiedBy = lastModifiedBy;
    }

    @Override
    public String toString() {
        return "LiquidityIndicator{" +
                "id=" + id +
                ", indicatorType='" + indicatorType + '\'' +
                ", year=" + year +
                ", quarterRange='" + quarterRange + '\'' +
                ", q1Result=" + q1Result +
                ", q2Result=" + q2Result +
                ", absoluteCoverage=" + absoluteCoverage +
                '}';
    }
}
