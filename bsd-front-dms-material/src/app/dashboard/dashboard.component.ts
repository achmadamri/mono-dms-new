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

        /* ----------==========     Top 10 Sales By Quantity    ==========---------- */
        var labelQuantity = this.getDashboardResponse.lstTop10SalesByQuantity.map(function (e) { return e.tboItem.length > 20 ? e.tboItem.substring(0, 20) + '...' : e.tboItem; });
        var seriesQuantity = this.getDashboardResponse.lstTop10SalesByQuantity.map(function (e) { return e.tboQty; });
        var datawebsiteViewsChart1 = {
          labels: labelQuantity,
          series: [
            seriesQuantity
          ]
        };
        var optionswebsiteViewsChart1 = {
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
        var responsiveOptions: any[] = [
          ['screen and (max-width: 640px)', {
            seriesBarDistance: 5,
            axisX: {
              labelInterpolationFnc: function (value) {
                return value[0];
              }
            }
          }]
        ];
        var top10SalesByQuantity = new Chartist.Bar('#top10SalesByQuantity', datawebsiteViewsChart1, optionswebsiteViewsChart1, responsiveOptions);

        //start animation
        this.startAnimationForBarChart(top10SalesByQuantity);

        /* ----------==========     Top 10 Sales By Sales    ==========---------- */        
        var labelValues = this.getDashboardResponse.lstTop10SalesByQuantity.map(function (e) { return e.tboItem.length > 20 ? e.tboItem.substring(0, 20) + '...' : e.tboItem; });
        var seriesValues = this.getDashboardResponse.lstTop10SalesByValues.map(function (e) { return e.tboOrderSum; });
        var datawebsiteViewsChart2 = {
          labels: labelValues,
          series: [
            seriesValues
          ]
        };
        var optionswebsiteViewsChart2 = {
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
        var responsiveOptions: any[] = [
          ['screen and (max-width: 640px)', {
            seriesBarDistance: 5,
            axisX: {
              labelInterpolationFnc: function (value) {
                return value[0];
              }
            }
          }]
        ];
        var top10SalesByValues = new Chartist.Bar('#top10SalesByValues', datawebsiteViewsChart2, optionswebsiteViewsChart2, responsiveOptions);

        //start animation
        this.startAnimationForBarChart(top10SalesByValues);
      },
      errorResponse => {
        this.util.showNotification('danger', 'top', 'center', errorResponse.error.error + '<br>' + errorResponse.error.message);
        this.router.navigate(['/user-login']);
      }
    );    
  }

}
