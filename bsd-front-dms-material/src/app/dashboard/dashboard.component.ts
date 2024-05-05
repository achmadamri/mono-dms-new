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

        var labelValues1 = this.getDashboardResponse.lstMarketPerformance.map(function (e) {
          const date = new Date(e[0]);
          return `${date.getMonth() + 1}/${date.getDate()}/${date.getFullYear()}`;
        });
        var seriesValues1 = this.getDashboardResponse.lstMarketPerformance.map(function (e) {
          return e[1];
        });

        console.log(labelValues1);
        console.log(seriesValues1);

        var data1 = {
          labels: labelValues1,
          series: [
            seriesValues1
          ]
        };
        var options1 = {
          lineSmooth: Chartist.Interpolation.cardinal({
            tension: 0
          }),
          chartPadding: {
            top: 15,
            right: 15,
            bottom: 5,
            left: 10
          },
          width: '100%',
          height: '300px'
        };

        var dailySalesChart = new Chartist.Line('#dailySalesChart', data1, options1);

        this.startAnimationForLineChart(dailySalesChart);

        // ------------------------------------------------------------------------------------------------------
        /* ----------==========    Top 10 Sales By Values Chart initialization    ==========---------- */

        var labelValues2 = this.getDashboardResponse.lstTop10SalesByQuantity.map(function (e) { return e.tboItem.length > 20 ? e.tboItem.substring(0, 20) + '...' : e.tboItem; });
        var seriesValues2 = this.getDashboardResponse.lstTop10SalesByValues.map(function (e) { return e.tboOrderSum / 1000; });
        var data2 = {
          labels: labelValues2,
          series: [
            seriesValues2
          ]
        };
        var options2 = {
          horizontalBars: true,
          reverseData: true,
          axisY: {            
            onlyInteger: true,
            offset: 200
          },
          chartPadding: {
            top: 15,
            right: 15,
            bottom: 5,
            left: 10
          },
          width: '100%',
          height: '300px'
        };
        var responsiveOptions2: any[] = [
          ['screen and (max-width: 640px)', {
            seriesBarDistance: 5,
            axisX: {
              labelInterpolationFnc: function (value) {
                return value[0];
              }
            }
          }]
        ];
        var marketPerformanceChart = new Chartist.Bar('#marketPerformanceChart', data2, options2, responsiveOptions2);
  
        //start animation for the Emails Subscription Chart
        this.startAnimationForBarChart(marketPerformanceChart);
      },
      errorResponse => {
        this.util.showNotification('danger', 'top', 'center', errorResponse.error.error + '<br>' + errorResponse.error.message);
        this.router.navigate(['/user-login']);
      }
    );    
  }

}