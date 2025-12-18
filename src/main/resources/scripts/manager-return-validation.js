/**
 * Validation script for Manager Return action
 * Ensures manager provides a comment when returning report to employee
 * This script is called from Screen 3 (Manager Review)
 */

function validateManagerReturn(managerDecision, managerComment) {
    var errors = [];
    var errorsAr = [];

    if (managerDecision === 'RETURN') {
        // Comment is mandatory when returning
        if (!managerComment || managerComment.trim() === '') {
            errors.push('Please enter a comment before returning the report.');
            errorsAr.push('يرجى إدخال تعليق قبل إرجاع التقرير');
            return {
                valid: false,
                errors: errors,
                errorsAr: errorsAr
            };
        }

        // Check comment length
        if (managerComment.length > 2000) {
            errors.push('This field holds up to 2000 characters');
            errorsAr.push('لا يزيد هذا الحقل عن 2000 حرف');
            return {
                valid: false,
                errors: errors,
                errorsAr: errorsAr
            };
        }
    }

    return {
        valid: true,
        errors: [],
        errorsAr: []
    };
}

// Export for use in jBPM
if (typeof module !== 'undefined' && module.exports) {
    module.exports = validateManagerReturn;
}
