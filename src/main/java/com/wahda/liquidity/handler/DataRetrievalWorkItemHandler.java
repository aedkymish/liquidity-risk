package com.wahda.liquidity.handler;

import com.wahda.liquidity.model.LiquidityReport;
import com.wahda.liquidity.service.SRSDataRetrievalService;
import org.kie.api.runtime.process.WorkItem;
import org.kie.api.runtime.process.WorkItemHandler;
import org.kie.api.runtime.process.WorkItemManager;

import java.util.HashMap;
import java.util.Map;

/**
 * Work Item Handler for retrieving data from SRS Phase 1
 * and calculating quarterly indicators
 */
public class DataRetrievalWorkItemHandler implements WorkItemHandler {

    private SRSDataRetrievalService dataService;

    public DataRetrievalWorkItemHandler() {
        this.dataService = new SRSDataRetrievalService();
    }

    @Override
    public void executeWorkItem(WorkItem workItem, WorkItemManager manager) {
        try {
            // Get the report from process variables
            LiquidityReport report = (LiquidityReport) workItem.getParameter("report");

            if (report == null) {
                throw new IllegalArgumentException("Report parameter is required");
            }

            // Validate year and quarter range are selected
            if (report.getSelectedYear() == null || report.getSelectedQuarterRange() == null) {
                Map<String, Object> results = new HashMap<>();
                results.put("success", false);
                results.put("errorMessage", "Please select a valid year and quarter range before proceeding.");
                results.put("errorMessageAr", "يرجى اختيار سنة ونطاق ربع سنوي صحيح قبل المتابعة");
                manager.completeWorkItem(workItem.getId(), results);
                return;
            }

            // Retrieve and populate data from SRS Phase 1
            try {
                dataService.populateReportData(report);

                // Update report stage
                report.setCurrentStage("SCREEN_2");
                report.setLastModifiedDate(new java.util.Date());

                // Return success
                Map<String, Object> results = new HashMap<>();
                results.put("success", true);
                results.put("report", report);
                manager.completeWorkItem(workItem.getId(), results);

            } catch (SRSDataRetrievalService.DataNotFoundException e) {
                // Data not found in SRS database
                Map<String, Object> results = new HashMap<>();
                results.put("success", false);
                results.put("errorMessage", "Required monthly data is not available for the selected period.");
                results.put("errorMessageAr", "البيانات الشهرية المطلوبة غير متوفرة للفترة المحددة");
                results.put("detailedError", e.getMessage());
                manager.completeWorkItem(workItem.getId(), results);
            }

        } catch (Exception e) {
            // Handle unexpected errors
            Map<String, Object> results = new HashMap<>();
            results.put("success", false);
            results.put("errorMessage", "An error occurred while retrieving data: " + e.getMessage());
            results.put("errorMessageAr", "حدث خطأ أثناء جلب البيانات: " + e.getMessage());
            manager.completeWorkItem(workItem.getId(), results);
        }
    }

    @Override
    public void abortWorkItem(WorkItem workItem, WorkItemManager manager) {
        // Cleanup if needed
        manager.abortWorkItem(workItem.getId());
    }
}
