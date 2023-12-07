import { Component, OnInit } from '@angular/core';
import { Title } from '@angular/platform-browser';
import { Router } from '@angular/router';
import { GetDashboardRequest } from 'app/services/report/getdashboardrequest';
import { GetDashboardResponse } from 'app/services/report/getdashboardresponse';
import { ReportService } from 'app/services/report/report.service';
import { Util } from 'app/util';
import * as Chartist from 'chartist';

@Component({
  selector: 'app-dashboard',
  templateUrl: './dashboard.component.html',
})
export class DashboardComponent implements OnInit {
  util: Util = new Util();
  getDashboardRequest: GetDashboardRequest = new GetDashboardRequest();
  getDashboardResponse: GetDashboardResponse = new GetDashboardResponse();
  percentageTodaySales: number;
  percentageTodayMarket: number;

  constructor(    
    private router: Router,
    private titleService: Title,
    private reportService: ReportService,
  ) { }
  startAnimationForLineChart(chart) {
    let seq: any, delays: any, durations: any;
    seq = 0;
    delays = 80;
    durations = 500;

    chart.on('draw', function (data) {
      if (data.type === 'line' || data.type === 'area') {
        data.element.animate({
          d: {
            begin: 600,
            dur: 700,
            from: data.path.clone().scale(1, 0).translate(0, data.chartRect.height()).stringify(),
            to: data.path.clone().stringify(),
            easing: Chartist.Svg.Easing.easeOutQuint
          }
        });
      } else if (data.type === 'point') {
        seq++;
        data.element.animate({
          opacity: {
            begin: seq * delays,
            dur: durations,
            from: 0,
            to: 1,
            easing: 'ease'
          }
        });
      }
    });

    seq = 0;
  };
  startAnimationForBarChart(chart) {
    let seq2: any, delays2: any, durations2: any;

    seq2 = 0;
    delays2 = 80;
    durations2 = 500;
    chart.on('draw', function (data) {
      if (data.type === 'bar') {
        seq2++;
        data.element.animate({
          opacity: {
            begin: seq2 * delays2,
            dur: durations2,
            from: 0,
            to: 1,
            easing: 'ease'
          }
        });
      }
    });

    seq2 = 0;
  };
  
  ngOnInit() {
    this.titleService.setTitle('DMS - Dashboard');

    this.reportService.getDashboard(this.getDashboardRequest)
    .subscribe(
      successResponse => {
        this.getDashboardResponse = successResponse;

        /* ----------==========     Daily Sales Chart initialization For Documentation    ==========---------- */

        const lstDailySales = this.getDashboardResponse.lstDailySales; // Assuming lstDailySales is an array in the response

        const labels = lstDailySales.map(item => {
          const date = new Date(item[0]); // Assuming the timestamp is the first item in each array
          return `${date.getMonth() + 1}/${date.getDate()}/${date.getFullYear()}`;
        });

        const series = [lstDailySales.map(item => item[1])];

        const dataDailySalesChart = {
          labels: labels,
          series: series
        };

        // Assuming the timestamp is the first item in each array and today's date is the last item in the array
        const todaySales = lstDailySales[lstDailySales.length - 1][1];

        // Assuming you want to calculate the increase based on the previous day's sales
        const yesterdaySales = lstDailySales[lstDailySales.length - 2][1];

        // Calculate the increase
        const increaseSales = todaySales - yesterdaySales;

        // Format the label
        this.percentageTodaySales = ((increaseSales / yesterdaySales) * 100);     

        // Assuming you have already calculated your 'series' data as shown in your previous code

        // Calculate the maximum value in 'series'
        const maxDataValue = Math.max(...series[0]);

        // Set the 'high' option based on the maximum value with some extra padding (e.g., 10%)
        const extraPadding = 0.1; // You can adjust this as needed
        const highValue = maxDataValue * (1 + extraPadding);

        // Define your options with the dynamically calculated 'high' value
        const optionsDailySalesChart = {
          lineSmooth: Chartist.Interpolation.cardinal({
            tension: 0
          }),
          low: 0,
          high: highValue,
          chartPadding: { top: 0, right: 0, bottom: 0, left: 0 },
        };   

        var dailySalesChart = new Chartist.Line('#dailySalesChart', dataDailySalesChart, optionsDailySalesChart);

        this.startAnimationForLineChart(dailySalesChart);

        // ------------------------------------------------------------------------------------------------------
        /* ----------==========     Market Performance Chart initialization    ==========---------- */

        const lstMarketPerformance = this.getDashboardResponse.lstMarketPerformance; // Assuming lstMarketPerformance is an array in the response

        const labelsMarketPerformance = lstMarketPerformance.map(item => {
          const date = new Date(item[0]); // Assuming the timestamp is the first item in each array
          return `${date.getMonth() + 1}/${date.getDate()}/${date.getFullYear()}`;
        });

        const seriesMarketPerformance = [lstMarketPerformance.map(item => item[1])];

        const dataMarketPerformanceChart = {
          labels: labelsMarketPerformance,
          series: seriesMarketPerformance
        };

        // Assuming you have already calculated your 'series' data as shown in your previous code

        // Calculate the maximum value in 'series'
        const maxDataValueMarketPerformance = Math.max(...seriesMarketPerformance[0]);

        // Set the 'high' option based on the maximum value with some extra padding (e.g., 10%)
        const extraPaddingMarketPerformance = 0.1; // You can adjust this as needed
        const highValueMarketPerformance = maxDataValueMarketPerformance * (1 + extraPaddingMarketPerformance);

        // Define your options with the dynamically calculated 'high' value
        const optionsMarketPerformanceChart = {
          lineSmooth: Chartist.Interpolation.cardinal({
          tension: 0
          }),
          low: 0,
          high: highValueMarketPerformance,
          chartPadding: { top: 0, right: 0, bottom: 0, left: 0 },
        };

        // Assuming the timestamp is the first item in each array and today's date is the last item in the array
        const todayMarket = lstMarketPerformance[lstMarketPerformance.length - 1][1];

        // Assuming you want to calculate the increase based on the previous day's sales
        const yesterdayMarket = lstMarketPerformance[lstMarketPerformance.length - 2][1];

        // Calculate the increase
        const increaseMarket = todayMarket - yesterdayMarket;

        // Format the label
        this.percentageTodayMarket = ((increaseMarket / yesterdayMarket) * 100);  

        var marketPerformanceChart = new Chartist.Line('#marketPerformanceChart', dataMarketPerformanceChart, optionsMarketPerformanceChart);

        this.startAnimationForLineChart(marketPerformanceChart);
      },
      errorResponse => {
        this.util.showNotification('danger', 'top', 'center', errorResponse.error.error + '<br>' + errorResponse.error.message);
        this.router.navigate(['/user-login']);
      }
    );    
  }

}
