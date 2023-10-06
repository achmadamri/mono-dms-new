import { DatePipe } from '@angular/common';
import { Component, isDevMode, OnInit } from '@angular/core';
import { FormControl, FormGroup } from '@angular/forms';
import { PageEvent } from '@angular/material/paginator';
import { Title } from '@angular/platform-browser';
import { Router } from '@angular/router';
import { GetOrderListRequest } from 'app/services/order/getorderlistrequest';
import { GetOrderListResponse } from 'app/services/order/getorderlistresponse';
import { OrderService } from 'app/services/order/order.service';
import { PostConfirmOrderRequest } from 'app/services/order/postconfirmorderrequest';
import { PostConfirmOrderResponse } from 'app/services/order/postconfirmorderresponse';
import { Util } from 'app/util';

@Component({
  selector: 'app-order',
  templateUrl: './order.component.html',
  providers: [ DatePipe ]
})
export class OrderComponent implements OnInit {
  urlOrder: string;
  urlPacking: string;
  download: boolean;
  clicked = false;
  util: Util = new Util();
  length = 100;
  pageSize = 10;
  pageIndex = 0;
  pageSizeOptions: number[] = [5, 10, 25, 100];
  pageEvent: PageEvent;
  pageDisabled: boolean = false;
  getOrderListRequest: GetOrderListRequest = new GetOrderListRequest();
  getOrderListResponse: GetOrderListResponse = new GetOrderListResponse();
  postConfirmOrderRequest: PostConfirmOrderRequest = new PostConfirmOrderRequest();
  postConfirmOrderResponse: PostConfirmOrderResponse = new PostConfirmOrderResponse();
  orderNo = "";
  status = "";
  
  range = new FormGroup({
    start: new FormControl(new Date()),
    end: new FormControl(new Date())
  });

  constructor(
    private router: Router,
    private titleService: Title,
    private orderService: OrderService,
    public datepipe: DatePipe
  ) { }

  ngOnInit() {
    const thirtyDaysAgo = new Date();
    thirtyDaysAgo.setDate(thirtyDaysAgo.getDate() - 30);

    this.range = new FormGroup({
      start: new FormControl(thirtyDaysAgo), // 30 days ago from the current date
      end: new FormControl(new Date()) // Current date
    });

    this.titleService.setTitle('DMS - Order');
    this.getOrderList(null);
    this.urlOrder = (isDevMode() ? 'http://localhost:2083' : 'https://dms.id-trec.com/2083') + '/order/getorderlistreportexcel?' +
      'requestId=' + this.util.randomString(10) +
      '&requestDate=' + ((new Date(Date.now() - ((new Date()).getTimezoneOffset() * 60000))).toISOString().slice(0, -1)) + '000' +
      '&email=' + localStorage.getItem('email') +
      '&token=' + localStorage.getItem('token') +
      '&length=' + this.length +
      '&pageSize=' + this.pageSize +
      '&pageIndex=' + this.pageIndex +
      '&orderNo=' + this.orderNo +
      '&start=' + this.datepipe.transform(this.range.controls.start.value, 'yyyy-MM-dd') +
      '&end=' + this.datepipe.transform(this.range.controls.end.value, 'yyyy-MM-dd') +
      '&status=' + this.status;

    this.urlPacking = (isDevMode() ? 'http://localhost:2083' : 'https://dms.id-trec.com/2083') + '/order/getpackinglistreportexcel?' +
      'requestId=' + this.util.randomString(10) +
      '&requestDate=' + ((new Date(Date.now() - ((new Date()).getTimezoneOffset() * 60000))).toISOString().slice(0, -1)) + '000' +
      '&email=' + localStorage.getItem('email') +
      '&token=' + localStorage.getItem('token') +
      '&length=' + this.length +
      '&pageSize=' + this.pageSize +
      '&pageIndex=' + this.pageIndex +
      '&orderNo=' + this.orderNo +
      '&start=' + this.datepipe.transform(this.range.controls.start.value, 'yyyy-MM-dd') +
      '&end=' + this.datepipe.transform(this.range.controls.end.value, 'yyyy-MM-dd') +
      '&status=' + this.status;
    
    this.download = false;
  }

  downloadFilePacking() {
    if (this.download) window.location.href = this.urlPacking;
  }

  downloadFileOrder() {
    if (this.download) window.location.href = this.urlOrder;
  }

  getOrderList(pageEvent: PageEvent) {
    this.clicked = !this.clicked;
    
    this.orderService.getOrderList(this.orderNo, this.datepipe.transform(this.range.controls.start.value, 'yyyy-MM-dd'), this.datepipe.transform(this.range.controls.end.value, 'yyyy-MM-dd'), this.status, pageEvent != null ? pageEvent.length : this.length, pageEvent != null ? pageEvent.pageSize : this.pageSize, pageEvent != null ? pageEvent.pageIndex : this.pageIndex, this.getOrderListRequest)
      .subscribe(
        successResponse => {
          this.clicked = !this.clicked;

          this.getOrderListResponse = successResponse;

          this.download = true;
          
          this.urlOrder = (isDevMode() ? 'http://localhost:2083' : 'https://dms.id-trec.com/2083') + '/order/getorderlistreportexcel?' +
            'requestId=' + this.util.randomString(10) +
            '&requestDate=' + ((new Date(Date.now() - ((new Date()).getTimezoneOffset() * 60000))).toISOString().slice(0, -1)) + '000' +
            '&email=' + localStorage.getItem('email') +
            '&token=' + localStorage.getItem('token') +
            '&length=' + this.length +
            '&pageSize=' + this.pageSize +
            '&pageIndex=' + this.pageIndex +
            '&orderNo=' + this.orderNo +
            '&start=' + this.datepipe.transform(this.range.controls.start.value, 'yyyy-MM-dd') +
            '&end=' + this.datepipe.transform(this.range.controls.end.value, 'yyyy-MM-dd') +
            '&status=' + this.status;

          this.urlPacking = (isDevMode() ? 'http://localhost:2083' : 'https://dms.id-trec.com/2083') + '/order/getpackinglistreportexcel?' +
            'requestId=' + this.util.randomString(10) +
            '&requestDate=' + ((new Date(Date.now() - ((new Date()).getTimezoneOffset() * 60000))).toISOString().slice(0, -1)) + '000' +
            '&email=' + localStorage.getItem('email') +
            '&token=' + localStorage.getItem('token') +
            '&length=' + this.length +
            '&pageSize=' + this.pageSize +
            '&pageIndex=' + this.pageIndex +
            '&orderNo=' + this.orderNo +
            '&start=' + this.datepipe.transform(this.range.controls.start.value, 'yyyy-MM-dd') +
            '&end=' + this.datepipe.transform(this.range.controls.end.value, 'yyyy-MM-dd') +
            '&status=' + this.status;
          
          this.getOrderListResponse.lstTbOrder.forEach((element) => {
            if (element.tboItem != null) element.tboItemShort = element.tboItem.length > 30 ? element.tboItem.substr(0, 30) + "..." : element.tboItem;
            if (element.tboName != null) element.tboNameShort = element.tboName.length > 30 ? element.tboName.substr(0, 30) + "..." : element.tboName;
          });

          this.length = this.getOrderListResponse.length;

          if (pageEvent != null) {
            this.length = pageEvent.length;
            this.pageSize = pageEvent.pageSize;
            this.pageIndex = pageEvent.pageIndex;
          }          
        },
        errorResponse => {
          this.length = 0;

          this.clicked = !this.clicked;
          
          this.getOrderListResponse = new GetOrderListResponse();

          this.download = false;
        }
      );
  }

  getPage(pageEvent: PageEvent) {
    this.getOrderList(pageEvent);
  }

  uploadFile() {
    this.router.navigate(['/order-upload-file']);
  }

  orderManual() {
    this.router.navigate(['/order-manual']);
  }

  checkAllToggle = false;

  checkAll() {
    this.checkAllToggle = !this.checkAllToggle;

    this.getOrderListResponse.lstTbOrder.forEach((element) => {
      element.check = this.checkAllToggle;
    });
  }
  
  confirm() {
    this.clicked = !this.clicked;

    this.postConfirmOrderRequest = new PostConfirmOrderRequest();

    this.getOrderListResponse.lstTbOrder.forEach((element) => {
      if (element.check) {
        this.postConfirmOrderRequest.orderNo.push(element.tboOrderNo);
        this.postConfirmOrderRequest.sku.push(element.tboSku);
      }
    });

    this.orderService.postConfirmOrder(this.postConfirmOrderRequest)
      .subscribe(
        successResponse => {
          this.clicked = !this.clicked;

          this.postConfirmOrderResponse = successResponse;

          this.util.showNotification('info', 'top', 'center', this.postConfirmOrderResponse.message);

          this.getOrderList(null);
        },
        errorResponse => {
          this.clicked = !this.clicked;

          if (errorResponse.error.status === 403) {
            this.util.showNotification('danger', 'top', 'center', errorResponse.error.error + '<br>' + errorResponse.error.message);

            this.router.navigate(['/user-login']);
          } else {
            this.util.showNotification('danger', 'top', 'center', errorResponse.error.message);

            this.getOrderList(null);
          }
        }
      );
  }

}
