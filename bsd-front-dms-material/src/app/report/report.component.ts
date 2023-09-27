import { DatePipe } from '@angular/common';
import { Component, isDevMode, OnInit } from '@angular/core';
import { FormControl, FormGroup } from '@angular/forms';
import { PageEvent } from '@angular/material/paginator';
import { Title } from '@angular/platform-browser';
import { Router } from '@angular/router';
import { GetOrderListRequest } from 'app/services/report/getorderlistrequest';
import { GetOrderListResponse } from 'app/services/report/getorderlistresponse';
import { Util } from 'app/util';
import { ReportService } from 'app/services/report/report.service';
import { ProductService } from 'app/services/product/product.service';
import { GetBrandRequest } from 'app/services/product/getbrandrequest';
import { GetBrandResponse } from 'app/services/product/getbrandresponse';
import { GetStockListRequest } from 'app/services/report/getstocklistrequest';
import { GetStockListResponse } from 'app/services/report/getstocklistresponse';
import { GetSalesListRequest } from 'app/services/report/getsaleslistrequest';
import { GetSalesListResponse } from 'app/services/report/getsaleslistresponse';

@Component({
  selector: 'app-report',
  templateUrl: './report.component.html',
  styleUrls: ['./report.component.css'],
  providers: [ DatePipe ]
})
export class ReportComponent implements OnInit {
  urlOrder: string;
  downloadOrder: boolean;
  lengthOrder = 100;
  pageSizeOrder = 25;
  pageIndexOrder = 0;
  pageSizeOptionsOrder: number[] = [5, 10, 25, 100];
  pageEventOrder: PageEvent;
  pageDisabledOrder: boolean = false;
  brandOrder = "";
  orderNoOrder = "";
  rangeOrder = new FormGroup({
    start: new FormControl(new Date()),
    end: new FormControl(new Date())
  });

  urlStock: string;
  downloadStock: boolean;
  lengthStock = 100;
  pageSizeStock = 25;
  pageIndexStock = 0;
  pageSizeOptionsStock: number[] = [5, 10, 25, 100];
  pageEventStock: PageEvent;
  pageDisabledStock: boolean = false;
  skuStock = "";
  itemStock = "";
  brandStock = "";
  rangeStock = new FormGroup({
    start: new FormControl(new Date()),
    end: new FormControl(new Date())
  });

  urlSales: string;
  downloadSales: boolean;
  lengthSales = 100;
  pageSizeSales = 25;
  pageIndexSales = 0;
  pageSizeOptionsSales: number[] = [5, 10, 25, 100];
  pageEventSales: PageEvent;
  pageDisabledSales: boolean = false;
  brandSales = "";
  orderNoSales = "";
  skuSales = "";
  rangeSales = new FormGroup({
    start: new FormControl(new Date(new Date().getFullYear(), new Date().getMonth(), 1)), // Start of the current month
    end: new FormControl(new Date(new Date().getFullYear(), new Date().getMonth() + 1, 0)) // End of the current month
  });

  clicked = false;
  util: Util = new Util();
  getBrandRequest: GetBrandRequest = new GetBrandRequest();
  getBrandResponse: GetBrandResponse = new GetBrandResponse();
    
  getOrderListRequest: GetOrderListRequest = new GetOrderListRequest();
  getOrderListResponse: GetOrderListResponse = new GetOrderListResponse();
  getStockListRequest: GetStockListRequest = new GetStockListRequest();
  getStockListResponse: GetStockListResponse = new GetStockListResponse();
  getSalesListRequest: GetSalesListRequest = new GetSalesListRequest();
  getSalesListResponse: GetSalesListResponse = new GetSalesListResponse();  

  constructor(
    private router: Router,
    private titleService: Title,
    private reportService: ReportService,
    private productService: ProductService,
    public datepipe: DatePipe
  ) { }

  ngOnInit() {
    this.titleService.setTitle('DMS - Report');
    this.productService.getBrand(this.getBrandRequest)
    .subscribe(
      successResponse => {
        this.getBrandResponse = successResponse;
      },
      errorResponse => {
        this.util.showNotification('danger', 'top', 'center', errorResponse.error.error + '<br>' + errorResponse.error.message);
        this.router.navigate(['/user-login']);
      }
    );
    this.getOrderList(null);
    this.urlOrder = (isDevMode() ? 'http://localhost:2085' : 'https://dms.id-trec.com/2085') + '/report/getorderlistreportexcel?' +
      'requestId=' + this.util.randomString(10) +
      '&requestDate=' + ((new Date(Date.now() - ((new Date()).getTimezoneOffset() * 60000))).toISOString().slice(0, -1)) + '000' +
      '&email=' + localStorage.getItem('email') +
      '&token=' + localStorage.getItem('token') +
      '&length=' + this.lengthOrder +
      '&pageSize=' + this.pageSizeOrder +
      '&pageIndex=' + this.pageIndexOrder +
      '&orderNo=' + this.orderNoOrder +
      '&start=' + this.datepipe.transform(this.rangeOrder.controls.start.value, 'yyyy-MM-dd') +
      '&end=' + this.datepipe.transform(this.rangeOrder.controls.end.value, 'yyyy-MM-dd') +
      '&brand=' + this.brandOrder;

    this.urlOrder = (isDevMode() ? 'http://localhost:2085' : 'https://dms.id-trec.com/2085') + '/report/getstocklistreportexcel?' +
      'requestId=' + this.util.randomString(10) +
      '&requestDate=' + ((new Date(Date.now() - ((new Date()).getTimezoneOffset() * 60000))).toISOString().slice(0, -1)) + '000' +
      '&email=' + localStorage.getItem('email') +
      '&token=' + localStorage.getItem('token') +
      '&length=' + this.lengthOrder +
      '&pageSize=' + this.pageSizeOrder +
      '&pageIndex=' + this.pageIndexOrder +
      '&sku=' + this.skuStock +
      '&item=' + this.itemStock +
      '&start=' + this.datepipe.transform(this.rangeOrder.controls.start.value, 'yyyy-MM-dd') +
      '&end=' + this.datepipe.transform(this.rangeOrder.controls.end.value, 'yyyy-MM-dd') +
      '&brand=' + this.brandOrder;

    this.urlSales = (isDevMode() ? 'http://localhost:2085' : 'https://dms.id-trec.com/2085') + '/report/getsaleslistreportexcel?' +
      'requestId=' + this.util.randomString(10) +
      '&requestDate=' + ((new Date(Date.now() - ((new Date()).getTimezoneOffset() * 60000))).toISOString().slice(0, -1)) + '000' +
      '&email=' + localStorage.getItem('email') +
      '&token=' + localStorage.getItem('token') +
      '&length=' + this.lengthSales +
      '&pageSize=' + this.pageSizeSales +
      '&pageIndex=' + this.pageIndexSales +
      '&sku=' + this.skuStock +
      '&orderNo=' + this.orderNoSales +
      '&start=' + this.datepipe.transform(this.rangeSales.controls.start.value, 'yyyy-MM-dd') +
      '&end=' + this.datepipe.transform(this.rangeSales.controls.end.value, 'yyyy-MM-dd') +
      '&brand=' + this.brandSales;
    
    this.downloadOrder = false;
  }

  downloadFileOrder() {
    if (this.downloadOrder) window.location.href = this.urlOrder;
  }

  downloadFileStock() {
    if (this.downloadStock) window.location.href = this.urlStock;
  }

  downloadFileSales() {
    if (this.downloadSales) window.location.href = this.urlSales;
  }

  getOrderList(pageEvent: PageEvent) {
    this.clicked = !this.clicked;
    
    this.reportService.getOrderList(this.brandOrder, this.orderNoOrder, this.datepipe.transform(this.rangeOrder.controls.start.value, 'yyyy-MM-dd'), this.datepipe.transform(this.rangeOrder.controls.end.value, 'yyyy-MM-dd'), pageEvent != null ? pageEvent.length : this.lengthOrder, pageEvent != null ? pageEvent.pageSize : this.pageSizeOrder, pageEvent != null ? pageEvent.pageIndex : this.pageIndexOrder, this.getOrderListRequest)
      .subscribe(
        successResponse => {
          this.clicked = !this.clicked;

          this.getOrderListResponse = successResponse;

          this.downloadOrder = true;
          
          this.urlOrder = (isDevMode() ? 'http://localhost:2085' : 'https://dms.id-trec.com/2085') + '/report/getorderlistreportexcel?' +
            'requestId=' + this.util.randomString(10) +
            '&requestDate=' + ((new Date(Date.now() - ((new Date()).getTimezoneOffset() * 60000))).toISOString().slice(0, -1)) + '000' +
            '&email=' + localStorage.getItem('email') +
            '&token=' + localStorage.getItem('token') +
            '&length=' + this.lengthOrder +
            '&pageSize=' + this.pageSizeOrder +
            '&pageIndex=' + this.pageIndexOrder +
            '&orderNo=' + this.orderNoOrder +
            '&start=' + this.datepipe.transform(this.rangeOrder.controls.start.value, 'yyyy-MM-dd') +
            '&end=' + this.datepipe.transform(this.rangeOrder.controls.end.value, 'yyyy-MM-dd') +
            '&brand=' + this.brandOrder;

          this.lengthOrder = this.getOrderListResponse.length;

          if (pageEvent != null) {
            this.lengthOrder = pageEvent.length;
            this.pageSizeOrder = pageEvent.pageSize;
            this.pageIndexOrder = pageEvent.pageIndex;
          }          
        },
        errorResponse => {
          this.clicked = !this.clicked;
          
          this.getOrderListResponse = new GetOrderListResponse();

          this.downloadOrder = false;
        }
      );
  }

  getStockList(pageEvent: PageEvent) {
    this.clicked = !this.clicked;
    
    this.reportService.getStockList(this.brandStock, this.skuStock, this.itemStock, pageEvent != null ? pageEvent.length : this.lengthStock, pageEvent != null ? pageEvent.pageSize : this.pageSizeStock, pageEvent != null ? pageEvent.pageIndex : this.pageIndexStock, this.getStockListRequest)
      .subscribe(
        successResponse => {
          this.clicked = !this.clicked;

          this.getStockListResponse = successResponse;

          this.downloadStock = true;
          
          this.urlStock = (isDevMode() ? 'http://localhost:2085' : 'https://dms.id-trec.com/2085') + '/report/getstocklistreportexcel?' +
            'requestId=' + this.util.randomString(10) +
            '&requestDate=' + ((new Date(Date.now() - ((new Date()).getTimezoneOffset() * 60000))).toISOString().slice(0, -1)) + '000' +
            '&email=' + localStorage.getItem('email') +
            '&token=' + localStorage.getItem('token') +
            '&length=' + this.lengthStock +
            '&pageSize=' + this.pageSizeStock +
            '&pageIndex=' + this.pageIndexStock +
            '&sku=' + this.skuStock +
            '&item=' + this.itemStock +
            '&start=' + this.datepipe.transform(this.rangeStock.controls.start.value, 'yyyy-MM-dd') +
            '&end=' + this.datepipe.transform(this.rangeStock.controls.end.value, 'yyyy-MM-dd') +
            '&brand=' + this.brandStock;

          this.lengthStock = this.getStockListResponse.length;

          if (pageEvent != null) {
            this.lengthStock = pageEvent.length;
            this.pageSizeStock = pageEvent.pageSize;
            this.pageIndexStock = pageEvent.pageIndex;
          }          
        },
        errorResponse => {
          this.clicked = !this.clicked;
          
          this.getStockListResponse = new GetStockListResponse();

          this.downloadStock = false;
        }
      );
  }

  getSalesList(pageEvent: PageEvent) {
    this.clicked = !this.clicked;
    
    this.reportService.getSalesList(this.brandSales, this.orderNoSales, this.skuSales, this.datepipe.transform(this.rangeSales.controls.start.value, 'yyyy-MM-dd'), this.datepipe.transform(this.rangeSales.controls.end.value, 'yyyy-MM-dd'), pageEvent != null ? pageEvent.length : this.lengthSales, pageEvent != null ? pageEvent.pageSize : this.pageSizeSales, pageEvent != null ? pageEvent.pageIndex : this.pageIndexSales, this.getSalesListRequest)
      .subscribe(
        successResponse => {
          this.clicked = !this.clicked;

          this.getSalesListResponse = successResponse;

          this.downloadSales = true;
          
          this.urlSales = (isDevMode() ? 'http://localhost:2085' : 'https://dms.id-trec.com/2085') + '/report/getsaleslistreportexcel?' +
            'requestId=' + this.util.randomString(10) +
            '&requestDate=' + ((new Date(Date.now() - ((new Date()).getTimezoneOffset() * 60000))).toISOString().slice(0, -1)) + '000' +
            '&email=' + localStorage.getItem('email') +
            '&token=' + localStorage.getItem('token') +
            '&length=' + this.lengthSales +
            '&pageSize=' + this.pageSizeSales +
            '&pageIndex=' + this.pageIndexSales +
            '&orderNo=' + this.orderNoSales +
            '&sku=' + this.skuSales +
            '&start=' + this.datepipe.transform(this.rangeSales.controls.start.value, 'yyyy-MM-dd') +
            '&end=' + this.datepipe.transform(this.rangeSales.controls.end.value, 'yyyy-MM-dd') +
            '&brand=' + this.brandSales;

          this.lengthSales = this.getSalesListResponse.length;

          if (pageEvent != null) {
            this.lengthSales = pageEvent.length;
            this.pageSizeSales = pageEvent.pageSize;
            this.pageIndexSales = pageEvent.pageIndex;
          }          
        },
        errorResponse => {
          this.clicked = !this.clicked;
          
          this.getSalesListResponse = new GetSalesListResponse();

          this.downloadSales = false;
        }
      );
  }

  getPageOrder(pageEvent: PageEvent) {
    this.getOrderList(pageEvent);
  }

  getPageStock(pageEvent: PageEvent) {
    this.getStockList(pageEvent);
  }

  getPageSales(pageEvent: PageEvent) {
    this.getSalesList(pageEvent);
  }

}
