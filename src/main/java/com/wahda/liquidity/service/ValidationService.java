package com.wahda.liquidity.service;

import com.wahda.liquidity.model.LiquidityReport;
import java.util.ArrayList;
import java.util.List;

/**
 * Service for validating liquidity reports and workflow actions
 * Implements validation logic from SRS Section 8
 */
public class ValidationService {

    /**
     * Validation result class
     */
    public static class ValidationResult {
        private boolean valid;
        private List<String> errors;
        private List<String> errorsAr;

        public ValidationResult() {
            this.valid = true;
            this.errors = new ArrayList<>();
            this.errorsAr = new ArrayList<>();
        }

        public void addError(String error, String errorAr) {
            this.valid = false;
            this.errors.add(error);
            this.errorsAr.add(errorAr);
        }

        public boolean isValid() {
            return valid;
        }

        public List<String> getErrors() {
            return errors;
        }

        public List<String> getErrorsAr() {
            return errorsAr;
        }

        public String getErrorMessage() {
            return String.join("; ", errors);
        }

        public String getErrorMessageAr() {
            return String.join("؛ ", errorsAr);
        }
    }

    /**
     * Validate period selection (Screen 1)
     */
    public ValidationResult validatePeriodSelection(Integer year, String quarterRange) {
        ValidationResult result = new ValidationResult();

        if (year == null) {
            result.addError(
                "Please select a valid year",
                "يرجى اختيار سنة صحيحة"
            );
        }

        if (quarterRange == null || quarterRange.trim().isEmpty()) {
            result.addError(
                "Please select a valid quarter range",
                "يرجى اختيار نطاق ربع سنوي صحيح"
            );
        } else if (!quarterRange.matches("Q[1-3]_Q[2-4]")) {
            result.addError(
                "Invalid quarter range format",
                "تنسيق نطاق الربع غير صحيح"
            );
        }

        if (year != null && quarterRange != null && !quarterRange.trim().isEmpty()) {
            if (!isValidQuarterRange(quarterRange)) {
                result.addError(
                    "Invalid quarter range: " + quarterRange,
                    "نطاق ربع سنوي غير صحيح: " + quarterRange
                );
            }
        }

        return result;
    }

    /**
     * Validate employee comment length (Screen 2)
     */
    public ValidationResult validateEmployeeComment(String comment) {
        ValidationResult result = new ValidationResult();

        if (comment != null && comment.length() > 2000) {
            result.addError(
                "This field holds up to 2000 characters",
                "لا يزيد هذا الحقل عن 2000 حرف"
            );
        }

        return result;
    }

    /**
     * Validate manager review (Screen 3)
     */
    public ValidationResult validateManagerReview(String managerDecision, String managerComment) {
        ValidationResult result = new ValidationResult();

        if (managerDecision == null || managerDecision.trim().isEmpty()) {
            result.addError(
                "Please select a decision (Submit or Return)",
                "يرجى اختيار قرار (إرسال أو إرجاع)"
            );
            return result;
        }

        // If decision is RETURN, comment is mandatory
        if ("RETURN".equals(managerDecision)) {
            if (managerComment == null || managerComment.trim().isEmpty()) {
                result.addError(
                    "Please enter a comment before returning the report",
                    "يرجى إدخال تعليق قبل إرجاع التقرير"
                );
            }
        }

        // Check comment length
        if (managerComment != null && managerComment.length() > 2000) {
            result.addError(
                "This field holds up to 2000 characters",
                "لا يزيد هذا الحقل عن 2000 حرف"
            );
        }

        return result;
    }

    /**
     * Validate director approval (Screen 4)
     */
    public ValidationResult validateDirectorApproval(String directorComment) {
        ValidationResult result = new ValidationResult();

        // Comment is optional for director
        if (directorComment != null && directorComment.length() > 2000) {
            result.addError(
                "This field holds up to 2000 characters",
                "لا يزيد هذا الحقل عن 2000 حرف"
            );
        }

        return result;
    }

    /**
     * Validate complete report before final approval
     */
    public ValidationResult validateCompleteReport(LiquidityReport report) {
        ValidationResult result = new ValidationResult();

        if (report == null) {
            result.addError("Report cannot be null", "لا يمكن أن يكون التقرير فارغاً");
            return result;
        }

        // Check period selection
        ValidationResult periodResult = validatePeriodSelection(
            report.getSelectedYear(),
            report.getSelectedQuarterRange()
        );
        if (!periodResult.isValid()) {
            result.errors.addAll(periodResult.getErrors());
            result.errorsAr.addAll(periodResult.getErrorsAr());
            result.valid = false;
        }

        // Check that all indicators have data
        if (report.getLcrIndicator() == null ||
            report.getNsfrIndicator() == null ||
            report.getLeverageRatioIndicator() == null) {
            result.addError(
                "All liquidity indicators must be present",
                "يجب أن تكون جميع مؤشرات السيولة موجودة"
            );
        }

        // Check that calculations are complete
        if (report.getLcrIndicator() != null &&
            (report.getLcrIndicator().getQ1Result() == null ||
             report.getLcrIndicator().getQ2Result() == null ||
             report.getLcrIndicator().getAbsoluteCoverage() == null)) {
            result.addError(
                "LCR indicator calculations are incomplete",
                "حسابات مؤشر نسبة تغطية السيولة غير مكتملة"
            );
        }

        if (report.getNsfrIndicator() != null &&
            (report.getNsfrIndicator().getQ1Result() == null ||
             report.getNsfrIndicator().getQ2Result() == null ||
             report.getNsfrIndicator().getAbsoluteCoverage() == null)) {
            result.addError(
                "NSFR indicator calculations are incomplete",
                "حسابات مؤشر نسبة التمويل المستقر الصافي غير مكتملة"
            );
        }

        if (report.getLeverageRatioIndicator() != null &&
            (report.getLeverageRatioIndicator().getQ1Result() == null ||
             report.getLeverageRatioIndicator().getQ2Result() == null ||
             report.getLeverageRatioIndicator().getAbsoluteCoverage() == null)) {
            result.addError(
                "Leverage Ratio indicator calculations are incomplete",
                "حسابات مؤشر نسبة الرافعة المالية غير مكتملة"
            );
        }

        return result;
    }

    /**
     * Check if quarter range is valid
     */
    private boolean isValidQuarterRange(String quarterRange) {
        return "Q1_Q2".equals(quarterRange) ||
               "Q2_Q3".equals(quarterRange) ||
               "Q3_Q4".equals(quarterRange);
    }

    /**
     * Validate email format
     */
    public boolean isValidEmail(String email) {
        if (email == null || email.trim().isEmpty()) {
            return false;
        }
        String emailRegex = "^[A-Za-z0-9+_.-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}$";
        return email.matches(emailRegex);
    }

    /**
     * Sanitize input to prevent XSS and injection attacks
     */
    public String sanitizeInput(String input) {
        if (input == null) {
            return null;
        }
        // Remove potential HTML/Script tags
        return input.replaceAll("<[^>]*>", "")
                   .replaceAll("javascript:", "")
                   .replaceAll("on\\w+\\s*=", "")
                   .trim();
    }
}
