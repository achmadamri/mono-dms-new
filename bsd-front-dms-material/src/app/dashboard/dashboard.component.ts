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

        /* ----------==========     Year Sales Chart initialization For Documentation    ==========---------- */

        var data1 = {
          labels: ['Jan', 'Feb', 'Mar', 'Apr', 'Mei', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'],
          series: [
            [2000000, 1800000, 1500000, 2100000, 1950000, 1750000, 1800000, 1700000, 1800000, 1850000, 1900000, 2000000], // Data for 2023
            [1500000, 2000000, 1950000, 1600000, 1500000, 1600000, 1700000, 1750000, 1650000, 1700000, 1750000, 1900000]  // Data for 2024
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

        var yearlySalesChart = new Chartist.Line('#yearlySalesChart', data1, options1);

        this.startAnimationForLineChart(yearlySalesChart);

        // ------------------------------------------------------------------------------------------------------

        /* ----------==========     Daily Sales Chart initialization For Documentation    ==========---------- */

        var data2 = {
          labels: Array.from({ length: 31 }, (_, i) => i + 1), // Generate labels for days 1 to 31
          series: [
            // Assuming these are example data for March (Maret)
            [80000000, 75000000, 62000000, 85000000, 88000000, 60000000, 80000000, 72000000, 85000000, 90000000, 85000000, 70000000, 75000000, 88000000, 82000000, 87000000, 85000000, 75000000, 65000000, 80000000, 75000000, 85000000, 90000000, 95000000, 80000000, 85000000, 90000000, 88000000, 82000000, 87000000, 92000000],
            // Assuming these are example data for April
            [60000000, 65000000, 70000000, 75000000, 72000000, 68000000, 70000000, 65000000, 60000000, 75000000, 72000000, 68000000, 65000000, 70000000, 72000000, 75000000, 72000000, 68000000, 65000000, 60000000, 70000000, 72000000, 75000000, 78000000, 75000000, 72000000, 78000000, 75000000, 70000000, 72000000, 75000000]
          ]
        };
        var options2 = {
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

        var dailySalesChart = new Chartist.Line('#dailySalesChart', data2, options2);

        this.startAnimationForLineChart(dailySalesChart);

        // ------------------------------------------------------------------------------------------------------

        /* ----------==========   Deadstock Chart initialization    ==========---------- */
        
        var data3 = {
          labels: ['ALKOHOL 70% 100 ML HAKO', 'ALLOPURINOL 300 MG', 'ALMINA MADU JINTEN', 'AMLODIPIN TAB 10 MG SOHO', 'AMOXSAN SYR 60ML', 'ASPIRIN TAB 500 MG'],
          series: [
            [3589, 2368, 1896, 1368, 987, 543]  // Data values for dead stock items
          ]
        };
        var options3 = {
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
        var responsiveOptions3: any[] = [
          ['screen and (max-width: 640px)', {
            seriesBarDistance: 5,
            axisX: {
              labelInterpolationFnc: function (value) {
                return value[0];
              }
            }
          }]
        ];
        var deadstockChart = new Chartist.Bar('#deadstockChart', data3, options3, responsiveOptions3);
  
        //start animation for the Emails Subscription Chart
        this.startAnimationForBarChart(deadstockChart);

        // ------------------------------------------------------------------------------------------------------

        /* ----------==========   Expired Chart initialization    ==========---------- */
        
        var data3 = {
          labels: ['APIALYS SYR 60ML', 'ANTASIDA TAB AFI', 'ANLENE GOLD CHO 250GR', 'ANDALAN PIL KB', 'AMPICILLIN TAB 500 MG KF'],
          series: [
            [2009, 1863, 1596, 1364, 1043]  // Data values for items expiring in less than two weeks
          ]
        };
        var options3 = {
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
        var responsiveOptions3: any[] = [
          ['screen and (max-width: 640px)', {
            seriesBarDistance: 5,
            axisX: {
              labelInterpolationFnc: function (value) {
                return value[0];
              }
            }
          }]
        ];
        var expiredChart = new Chartist.Bar('#expiredChart', data3, options3, responsiveOptions3);
  
        //start animation for the Emails Subscription Chart
        this.startAnimationForBarChart(expiredChart);

        // ------------------------------------------------------------------------------------------------------

        /* ----------==========    Top 10 Sales By Values Chart initialization    ==========---------- */

        var labelValues3 = this.getDashboardResponse.lstTop10SalesByQuantity.map(function (e) { return e.tboItem.length > 20 ? e.tboItem.substring(0, 20) + '...' : e.tboItem; });
        var seriesValues3 = this.getDashboardResponse.lstTop10SalesByValues.map(function (e) { return e.tboOrderSum / 1000; });
        var data3 = {
          labels: labelValues3,
          series: [
            seriesValues3
          ]
        };
        var options3 = {
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
        var responsiveOptions3: any[] = [
          ['screen and (max-width: 640px)', {
            seriesBarDistance: 5,
            axisX: {
              labelInterpolationFnc: function (value) {
                return value[0];
              }
            }
          }]
        ];
        var marketPerformanceChart = new Chartist.Bar('#marketPerformanceChart', data3, options3, responsiveOptions3);
  
        //start animation for the Emails Subscription Chart
        this.startAnimationForBarChart(marketPerformanceChart);

        // ------------------------------------------------------------------------------------------------------

        /* ----------==========   Stock Chart initialization    ==========---------- */
        
        var data4 = {
          labels: ['AZOVIR CR 5', 'ASPIRIN TAB 500 MG', 'ASMASOLON TAB @4', 'ASAM MEFENAMAT TAB 500 MG INDO', 'ACTIFED M 60ML'],
          series: [
            [79, 55, 41, 23, 16], // Stock
            [31, 20, 23, 15, 5]  // RunRate
          ]
        };
        var options4 = {
          horizontalBars: true,
          stackBars: true,
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
        var responsiveOptions4: any[] = [
          ['screen and (max-width: 640px)', {
            seriesBarDistance: 5,
            axisX: {
              labelInterpolationFnc: function (value) {
                return value[0];
              }
            }
          }]
        ];
        var stockChart = new Chartist.Bar('#stockChart', data4, options4, responsiveOptions4);
  
        //start animation for the Emails Subscription Chart
        this.startAnimationForBarChart(stockChart);

        // ------------------------------------------------------------------------------------------------------

        /* ----------==========   Outlet Chart initialization    ==========---------- */
        
        var data5 = {
          labels: ['Cideng', 'Biak', 'Bekasi', 'Pitara'],
          series: [
            [400, 300, 200, 150], // Sales for March
            [420, 320, 210, 160]  // Sales for April
          ]
        };
        var options5 = {
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
        var responsiveOptions5: any[] = [
          ['screen and (max-width: 640px)', {
            seriesBarDistance: 5,
            axisX: {
              labelInterpolationFnc: function (value) {
                return value[0];
              }
            }
          }]
        ];
        var outletChart = new Chartist.Bar('#outletChart', data5, options5, responsiveOptions5);
  
        //start animation for the Emails Subscription Chart
        this.startAnimationForBarChart(outletChart);

        // ------------------------------------------------------------------------------------------------------
      },
      errorResponse => {
        this.util.showNotification('danger', 'top', 'center', errorResponse.error.error + '<br>' + errorResponse.error.message);
        this.router.navigate(['/user-login']);
      }
    );    
  }

}