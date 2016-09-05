package net.anotheria.moskito.webui.dashboards.action;

import net.anotheria.maf.action.ActionCommand;
import net.anotheria.maf.action.ActionMapping;
import net.anotheria.maf.bean.FormBean;
import net.anotheria.moskito.core.config.dashboards.DashboardConfig;
import net.anotheria.moskito.webui.dashboards.api.DashboardAO;
import net.anotheria.moskito.webui.dashboards.api.DashboardChartAO;
import net.anotheria.moskito.webui.gauges.api.GaugeAO;
import net.anotheria.moskito.webui.threshold.api.ThresholdStatusAO;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;

/**
 * This action renders a dashboard. If no dashboard is selected explicitly the first dashboard is taken.
 *
 * @author lrosenberg
 * @since 12.02.15 14:02
 */
public class ShowDashboardAction extends BaseDashboardAction {

	@Override
	public ActionCommand execute(ActionMapping actionMapping, FormBean formBean, HttpServletRequest request, HttpServletResponse response) throws Exception {

		String dashboardName = getSelectedDashboard(request);
		Boolean gaugesPresent = false;
		Boolean chartsPresent = false;
		Boolean thresholdsPresent = false;



		//set default values, allow to exit previously.
		request.setAttribute("gaugesPresent", gaugesPresent);
		request.setAttribute("chartsPresent", chartsPresent);
		request.setAttribute("thresholdsPresent", thresholdsPresent);
		request.setAttribute("showHelp", !(gaugesPresent || chartsPresent || thresholdsPresent));


		DashboardConfig selectedDashboard = getDashboardAPI().getDashboardConfig(dashboardName);

		if (dashboardName != null && selectedDashboard == null){
			return actionMapping.success();
		}

		List<ThresholdStatusAO> thresholdStatusAOList;
		List<GaugeAO> gaugeAOList;
		List<DashboardChartAO> dashboardChartAOList;

		if (dashboardName == null) {
			thresholdStatusAOList = getThresholdAPI().getThresholdStatuses();
			gaugeAOList = getGaugeAPI().getGauges();
		} else {
			DashboardAO dashboard = getDashboardAPI().getDashboard(dashboardName);
			thresholdStatusAOList = dashboard.getThresholds();
			gaugeAOList = dashboard.getGauges();
		}

		//now we definitely have a selected dashboard.
		//prepare thresholds
		if (thresholdStatusAOList!=null && thresholdStatusAOList.size()>0){
			request.setAttribute("thresholds", thresholdStatusAOList);
			thresholdsPresent = true;
		}

		//prepare gauges
		if (gaugeAOList!=null && gaugeAOList.size()>0){
			request.setAttribute("gauges", gaugeAOList);
			gaugesPresent = true;
		}

		//prepare charts
		DashboardAO dashboard = getDashboardAPI().getDashboard(getDashboardAPI().getDefaultDashboardName());
		if (dashboard.getCharts()!=null && dashboard.getCharts().size()>0){
			request.setAttribute("charts", dashboard.getCharts());
			chartsPresent = true;
		}


		//maybe the value has changed.
		request.setAttribute("gaugesPresent", gaugesPresent);
		request.setAttribute("chartsPresent", chartsPresent);
		request.setAttribute("thresholdsPresent", thresholdsPresent);
		request.setAttribute("showHelp", !(gaugesPresent || chartsPresent || thresholdsPresent));


		return actionMapping.success();
	}

	@Override
	protected String getPageName() {
		return "dashboard";
	}

}
