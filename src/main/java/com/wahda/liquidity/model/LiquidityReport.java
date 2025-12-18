package com.wahda.liquidity.model;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * Main data model for Liquidity Risk Report
 * Contains all indicators and workflow information
 */
public class LiquidityReport implements Serializable {

    private static final long serialVersionUID = 1L;

    // Report identification
    private Long reportId;
    private Integer selectedYear;
    private String selectedQuarterRange; // Q1_Q2, Q2_Q3, Q3_Q4

    // Indicators
    private LiquidityIndicator lcrIndicator;  // Liquidity Coverage Ratio
    private LiquidityIndicator nsfrIndicator; // Net Stable Funding Ratio
    private LiquidityIndicator leverageRatioIndicator;

    // Comments and workflow
    private String employeeComment;
    private String managerComment;
    private String directorComment;

    // Workflow status
    private String status; // DRAFT, SUBMITTED_TO_MANAGER, SUBMITTED_TO_DIRECTOR, APPROVED, ARCHIVED, RETURNED
    private String currentStage; // SCREEN_1, SCREEN_2, SCREEN_3, SCREEN_4

    // User information
    private String employeeId;
    private String employeeName;
    private String managerId;
    private String managerName;
    private String directorId;
    private String directorName;

    // Audit fields
    private Date createdDate;
    private Date submittedToManagerDate;
    private Date submittedToDirectorDate;
    private Date approvedDate;
    private Date archivedDate;
    private Date lastModifiedDate;

    // Return information
    private boolean isReturned;
    private String returnReason;
    private Date returnedDate;

    // Constructors
    public LiquidityReport() {
        this.lcrIndicator = new LiquidityIndicator("LCR", null, null);
        this.nsfrIndicator = new LiquidityIndicator("NSFR", null, null);
        this.leverageRatioIndicator = new LiquidityIndicator("LEVERAGE_RATIO", null, null);
        this.status = "DRAFT";
        this.currentStage = "SCREEN_1";
        this.createdDate = new Date();
    }

    public LiquidityReport(Integer year, String quarterRange) {
        this();
        this.selectedYear = year;
        this.selectedQuarterRange = quarterRange;
        this.lcrIndicator.setYear(year);
        this.lcrIndicator.setQuarterRange(quarterRange);
        this.nsfrIndicator.setYear(year);
        this.nsfrIndicator.setQuarterRange(quarterRange);
        this.leverageRatioIndicator.setYear(year);
        this.leverageRatioIndicator.setQuarterRange(quarterRange);
    }

    // Getters and Setters
    public Long getReportId() {
        return reportId;
    }

    public void setReportId(Long reportId) {
        this.reportId = reportId;
    }

    public Integer getSelectedYear() {
        return selectedYear;
    }

    public void setSelectedYear(Integer selectedYear) {
        this.selectedYear = selectedYear;
    }

    public String getSelectedQuarterRange() {
        return selectedQuarterRange;
    }

    public void setSelectedQuarterRange(String selectedQuarterRange) {
        this.selectedQuarterRange = selectedQuarterRange;
    }

    public LiquidityIndicator getLcrIndicator() {
        return lcrIndicator;
    }

    public void setLcrIndicator(LiquidityIndicator lcrIndicator) {
        this.lcrIndicator = lcrIndicator;
    }

    public LiquidityIndicator getNsfrIndicator() {
        return nsfrIndicator;
    }

    public void setNsfrIndicator(LiquidityIndicator nsfrIndicator) {
        this.nsfrIndicator = nsfrIndicator;
    }

    public LiquidityIndicator getLeverageRatioIndicator() {
        return leverageRatioIndicator;
    }

    public void setLeverageRatioIndicator(LiquidityIndicator leverageRatioIndicator) {
        this.leverageRatioIndicator = leverageRatioIndicator;
    }

    public String getEmployeeComment() {
        return employeeComment;
    }

    public void setEmployeeComment(String employeeComment) {
        this.employeeComment = employeeComment;
    }

    public String getManagerComment() {
        return managerComment;
    }

    public void setManagerComment(String managerComment) {
        this.managerComment = managerComment;
    }

    public String getDirectorComment() {
        return directorComment;
    }

    public void setDirectorComment(String directorComment) {
        this.directorComment = directorComment;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getCurrentStage() {
        return currentStage;
    }

    public void setCurrentStage(String currentStage) {
        this.currentStage = currentStage;
    }

    public String getEmployeeId() {
        return employeeId;
    }

    public void setEmployeeId(String employeeId) {
        this.employeeId = employeeId;
    }

    public String getEmployeeName() {
        return employeeName;
    }

    public void setEmployeeName(String employeeName) {
        this.employeeName = employeeName;
    }

    public String getManagerId() {
        return managerId;
    }

    public void setManagerId(String managerId) {
        this.managerId = managerId;
    }

    public String getManagerName() {
        return managerName;
    }

    public void setManagerName(String managerName) {
        this.managerName = managerName;
    }

    public String getDirectorId() {
        return directorId;
    }

    public void setDirectorId(String directorId) {
        this.directorId = directorId;
    }

    public String getDirectorName() {
        return directorName;
    }

    public void setDirectorName(String directorName) {
        this.directorName = directorName;
    }

    public Date getCreatedDate() {
        return createdDate;
    }

    public void setCreatedDate(Date createdDate) {
        this.createdDate = createdDate;
    }

    public Date getSubmittedToManagerDate() {
        return submittedToManagerDate;
    }

    public void setSubmittedToManagerDate(Date submittedToManagerDate) {
        this.submittedToManagerDate = submittedToManagerDate;
    }

    public Date getSubmittedToDirectorDate() {
        return submittedToDirectorDate;
    }

    public void setSubmittedToDirectorDate(Date submittedToDirectorDate) {
        this.submittedToDirectorDate = submittedToDirectorDate;
    }

    public Date getApprovedDate() {
        return approvedDate;
    }

    public void setApprovedDate(Date approvedDate) {
        this.approvedDate = approvedDate;
    }

    public Date getArchivedDate() {
        return archivedDate;
    }

    public void setArchivedDate(Date archivedDate) {
        this.archivedDate = archivedDate;
    }

    public Date getLastModifiedDate() {
        return lastModifiedDate;
    }

    public void setLastModifiedDate(Date lastModifiedDate) {
        this.lastModifiedDate = lastModifiedDate;
    }

    public boolean isReturned() {
        return isReturned;
    }

    public void setReturned(boolean returned) {
        isReturned = returned;
    }

    public String getReturnReason() {
        return returnReason;
    }

    public void setReturnReason(String returnReason) {
        this.returnReason = returnReason;
    }

    public Date getReturnedDate() {
        return returnedDate;
    }

    public void setReturnedDate(Date returnedDate) {
        this.returnedDate = returnedDate;
    }

    /**
     * Get all indicators as a list
     */
    public List<LiquidityIndicator> getAllIndicators() {
        List<LiquidityIndicator> indicators = new ArrayList<>();
        indicators.add(lcrIndicator);
        indicators.add(nsfrIndicator);
        indicators.add(leverageRatioIndicator);
        return indicators;
    }

    @Override
    public String toString() {
        return "LiquidityReport{" +
                "reportId=" + reportId +
                ", selectedYear=" + selectedYear +
                ", selectedQuarterRange='" + selectedQuarterRange + '\'' +
                ", status='" + status + '\'' +
                ", currentStage='" + currentStage + '\'' +
                ", employeeName='" + employeeName + '\'' +
                ", managerName='" + managerName + '\'' +
                ", directorName='" + directorName + '\'' +
                '}';
    }
}
