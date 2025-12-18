package com.wahda.liquidity.service;

import com.wahda.liquidity.model.LiquidityIndicator;
import java.math.BigDecimal;
import java.math.RoundingMode;

/**
 * Service for calculating quarterly liquidity indicators
 * Implements the calculation logic from SRS Section 9
 */
public class IndicatorCalculationService {

    private static final int DECIMAL_SCALE = 4;
    private static final RoundingMode ROUNDING_MODE = RoundingMode.HALF_UP;

    /**
     * Calculate quarterly value based on monthly delta averages
     * Formula:
     * Delta1 = (Month2 - Month1) / Month2
     * Delta2 = (Month3 - Month2) / Month3
     * Quarter_Value = Average(Delta1, Delta2)
     *
     * @param month1 First month value
     * @param month2 Second month value
     * @param month3 Third month value
     * @return Calculated quarterly percentage
     */
    public BigDecimal calculateQuarterlyValue(BigDecimal month1, BigDecimal month2, BigDecimal month3) {
        if (month1 == null || month2 == null || month3 == null) {
            throw new IllegalArgumentException("All monthly values must be provided");
        }

        if (month2.compareTo(BigDecimal.ZERO) == 0 || month3.compareTo(BigDecimal.ZERO) == 0) {
            throw new IllegalArgumentException("Month 2 and Month 3 cannot be zero (division by zero)");
        }

        // Calculate Delta1 = (Month2 - Month1) / Month2
        BigDecimal delta1 = month2.subtract(month1)
                .divide(month2, DECIMAL_SCALE, ROUNDING_MODE);

        // Calculate Delta2 = (Month3 - Month2) / Month3
        BigDecimal delta2 = month3.subtract(month2)
                .divide(month3, DECIMAL_SCALE, ROUNDING_MODE);

        // Calculate Average = (Delta1 + Delta2) / 2
        BigDecimal average = delta1.add(delta2)
                .divide(new BigDecimal("2"), DECIMAL_SCALE, ROUNDING_MODE);

        return average;
    }

    /**
     * Calculate absolute coverage between two quarters
     * Formula: Q2 - Q1
     *
     * @param q1Result Quarter 1 result
     * @param q2Result Quarter 2 result
     * @return Absolute coverage
     */
    public BigDecimal calculateAbsoluteCoverage(BigDecimal q1Result, BigDecimal q2Result) {
        if (q1Result == null || q2Result == null) {
            throw new IllegalArgumentException("Both quarterly results must be provided");
        }

        return q2Result.subtract(q1Result).setScale(DECIMAL_SCALE, ROUNDING_MODE);
    }

    /**
     * Calculate all quarterly values for an indicator
     * This populates Q1 result, Q2 result, and absolute coverage
     *
     * @param indicator The indicator to calculate
     */
    public void calculateIndicatorValues(LiquidityIndicator indicator) {
        // Calculate Q1 Result
        BigDecimal q1Result = calculateQuarterlyValue(
            indicator.getQ1Month1Value(),
            indicator.getQ1Month2Value(),
            indicator.getQ1Month3Value()
        );
        indicator.setQ1Result(q1Result);

        // Calculate Q2 Result
        BigDecimal q2Result = calculateQuarterlyValue(
            indicator.getQ2Month1Value(),
            indicator.getQ2Month2Value(),
            indicator.getQ2Month3Value()
        );
        indicator.setQ2Result(q2Result);

        // Calculate Absolute Coverage
        BigDecimal absoluteCoverage = calculateAbsoluteCoverage(q1Result, q2Result);
        indicator.setAbsoluteCoverage(absoluteCoverage);
    }

    /**
     * Validate that all required monthly data is present
     *
     * @param indicator The indicator to validate
     * @return true if all data is present, false otherwise
     */
    public boolean validateMonthlyData(LiquidityIndicator indicator) {
        return indicator.getQ1Month1Value() != null &&
               indicator.getQ1Month2Value() != null &&
               indicator.getQ1Month3Value() != null &&
               indicator.getQ2Month1Value() != null &&
               indicator.getQ2Month2Value() != null &&
               indicator.getQ2Month3Value() != null;
    }

    /**
     * Get months range for a quarter
     *
     * @param quarterRange The quarter range (Q1_Q2, Q2_Q3, Q3_Q4)
     * @return Array of month numbers [q1Month1, q1Month2, q1Month3, q2Month1, q2Month2, q2Month3]
     */
    public int[] getMonthsForQuarterRange(String quarterRange) {
        switch (quarterRange) {
            case "Q1_Q2":
                return new int[]{1, 2, 3, 4, 5, 6};
            case "Q2_Q3":
                return new int[]{4, 5, 6, 7, 8, 9};
            case "Q3_Q4":
                return new int[]{7, 8, 9, 10, 11, 12};
            default:
                throw new IllegalArgumentException("Invalid quarter range: " + quarterRange);
        }
    }

    /**
     * Format percentage for display
     *
     * @param value The BigDecimal value
     * @return Formatted string with percentage
     */
    public String formatPercentage(BigDecimal value) {
        if (value == null) {
            return "N/A";
        }
        return value.multiply(new BigDecimal("100"))
                .setScale(2, ROUNDING_MODE)
                .toString() + "%";
    }
}
