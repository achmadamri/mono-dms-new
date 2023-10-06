import { DatePipe } from '@angular/common';
import { Component, isDevMode, OnInit } from '@angular/core';
import { FormControl, FormGroup } from '@angular/forms';
import { PageEvent } from '@angular/material/paginator';
import { Title } from '@angular/platform-browser';
import { Router } from '@angular/router';
import { GetOrderConfirmListRequest } from 'app/services/order/getorderconfirmlistrequest';
import { GetOrderConfirmListResponse } from 'app/services/order/getorderconfirmlistresponse';
import { GetOrderConfirmSumRequest } from 'app/services/order/getorderconfirmsumrequest';
import { GetOrderConfirmSumResponse } from 'app/services/order/getorderconfirmsumresponse';
import { OrderService } from 'app/services/order/order.service';
import { PostConfirmRequest } from 'app/services/order/postconfirmrequest';
import { PostConfirmResponse } from 'app/services/order/postconfirmresponse';
import { GetBrandRequest } from 'app/services/product/getbrandrequest';
import { GetBrandResponse } from 'app/services/product/getbrandresponse';
import { ProductService } from 'app/services/product/product.service';
import { Util } from 'app/util';

@Component({
  selector: 'app-confirm',
  templateUrl: './confirm.component.html',
  providers: [ DatePipe ]
})
export class ConfirmComponent implements OnInit {
  url: string;
  download: boolean;
  clicked = false;
  util: Util = new Util();
  getBrandRequest: GetBrandRequest = new GetBrandRequest();
  getBrandResponse: GetBrandResponse = new GetBrandResponse();
  length = 100;
  pageSize = 10;
  pageIndex = 0;
  pageSizeOptions: number[] = [5, 10, 25, 100];
  pageEvent: PageEvent;
  pageDisabled: boolean = false;
  getOrderConfirmListRequest: GetOrderConfirmListRequest = new GetOrderConfirmListRequest();
  getOrderConfirmListResponse: GetOrderConfirmListResponse = new GetOrderConfirmListResponse();
  getOrderConfirmSumRequest: GetOrderConfirmSumRequest = new GetOrderConfirmSumRequest();
  getOrderConfirmSumResponse: GetOrderConfirmSumResponse = new GetOrderConfirmSumResponse();
  postConfirmRequest: PostConfirmRequest = new PostConfirmRequest();
  postConfirmResponse: PostConfirmResponse = new PostConfirmResponse();
  orderNo = "";
  sku = "";
  brand = "";
  type = "";
  status = "";
  sumAll = 0;
  sumPacked = 0;
  sumAdditionalPacked = 0;
  sumNotPacked = 0;
  sumDelivered = 0;
  sumNotConfirmed = 0;

  range = new FormGroup({
    start: new FormControl(new Date()),
    end: new FormControl(new Date())
  });

  constructor(
    private router: Router,
    private titleService: Title,
    private orderService: OrderService,
    private productService: ProductService,
    public datepipe: DatePipe
  ) { }

  ngOnInit() {
    const thirtyDaysAgo = new Date();
    thirtyDaysAgo.setDate(thirtyDaysAgo.getDate() - 30);

    this.range = new FormGroup({
      start: new FormControl(thirtyDaysAgo), // 30 days ago from the current date
      end: new FormControl(new Date()) // Current date
    });
    
    this.titleService.setTitle('DMS - Confirm');

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

    this.getOrderConfirmList(null);

    this.getOrderConfirmSum(null);
    
    this.url = (isDevMode() ? 'http://localhost:2083' : 'https://dms.id-trec.com/2083') + '/order/getorderconfirmlistreportexcel?' +
      'requestId=' + this.util.randomString(10) +
      '&requestDate=' + ((new Date(Date.now() - ((new Date()).getTimezoneOffset() * 60000))).toISOString().slice(0, -1)) + '000' +
      '&email=' + localStorage.getItem('email') +
      '&token=' + localStorage.getItem('token') +
      '&length=' + this.length +
      '&pageSize=' + this.pageSize +
      '&pageIndex=' + this.pageIndex +
      '&orderNo=' + this.orderNo +
      '&sku=' + this.sku +
      '&brand=' + this.brand +
      '&type=' + this.type +
      '&status=' + this.status +
      '&start=' + this.datepipe.transform(this.range.controls.start.value, 'yyyy-MM-dd') +
      '&end=' + this.datepipe.transform(this.range.controls.end.value, 'yyyy-MM-dd');
    
    this.download = false;
  }

  downloadFile() {
    if (this.download) window.location.href = this.url;
  }

  getOrderConfirmList(pageEvent: PageEvent) {
    this.clicked = !this.clicked;
    
    this.orderService.getOrderConfirmList(this.orderNo, this.sku, this.status, this.type, this.brand, this.datepipe.transform(this.range.controls.start.value, 'yyyy-MM-dd'), this.datepipe.transform(this.range.controls.end.value, 'yyyy-MM-dd'), pageEvent != null ? pageEvent.length : this.length, pageEvent != null ? pageEvent.pageSize : this.pageSize, pageEvent != null ? pageEvent.pageIndex : this.pageIndex, this.getOrderConfirmListRequest)
      .subscribe(
        successResponse => {
          this.clicked = !this.clicked;

          this.getOrderConfirmListResponse = successResponse;

          this.download = true;
    
          this.url = (isDevMode() ? 'http://localhost:2083' : 'https://dms.id-trec.com/2083') + '/order/getorderconfirmlistreportexcel?' +
            'requestId=' + this.util.randomString(10) +
            '&requestDate=' + ((new Date(Date.now() - ((new Date()).getTimezoneOffset() * 60000))).toISOString().slice(0, -1)) + '000' +
            '&email=' + localStorage.getItem('email') +
            '&token=' + localStorage.getItem('token') +
            '&length=' + this.length +
            '&pageSize=' + this.pageSize +
            '&pageIndex=' + this.pageIndex +
            '&orderNo=' + this.orderNo +
            '&sku=' + this.sku +
            '&brand=' + this.brand +
            '&type=' + this.type +
            '&status=' + this.status +
            '&start=' + this.datepipe.transform(this.range.controls.start.value, 'yyyy-MM-dd') +
            '&end=' + this.datepipe.transform(this.range.controls.end.value, 'yyyy-MM-dd');

          this.getOrderConfirmListResponse.lstViewOrderConfirm.forEach((element) => {
            if (element.item != null) element.itemShort = element.item.length > 30 ? element.item.substr(0, 30) + "..." : element.item;
          });

          this.getOrderConfirmListResponse.lstViewOrderConfirm.forEach((element) => {
            element.check = false;
          });

          this.length = this.getOrderConfirmListResponse.length;

          if (pageEvent != null) {
            this.length = pageEvent.length;
            this.pageSize = pageEvent.pageSize;
            this.pageIndex = pageEvent.pageIndex;
          }
        },
        errorResponse => {
          this.length = 0;

          this.clicked = !this.clicked;
          
          this.getOrderConfirmListResponse = new GetOrderConfirmListResponse();

          this.download = false;
        }
      );
  }

  getOrderConfirmSum(pageEvent: PageEvent) {
    this.clicked = !this.clicked;
    
    this.orderService.getOrderConfirmSum(this.orderNo, this.sku, this.status, this.type, this.brand, this.datepipe.transform(this.range.controls.start.value, 'yyyy-MM-dd'), this.datepipe.transform(this.range.controls.end.value, 'yyyy-MM-dd'), pageEvent != null ? pageEvent.length : this.length, pageEvent != null ? pageEvent.pageSize : this.pageSize, pageEvent != null ? pageEvent.pageIndex : this.pageIndex, this.getOrderConfirmSumRequest)
      .subscribe(
        successResponse => {
          this.clicked = !this.clicked;

          this.getOrderConfirmSumResponse = successResponse;

          this.download = true;

          this.sumAll = this.getOrderConfirmSumResponse.sumAll;
          this.sumPacked = this.getOrderConfirmSumResponse.sumPacked;
          this.sumAdditionalPacked = this.getOrderConfirmSumResponse.sumAdditionalPacked;
          this.sumNotPacked = this.getOrderConfirmSumResponse.sumNotPacked;
          this.sumDelivered = this.getOrderConfirmSumResponse.sumDelivered;
          this.sumNotConfirmed = this.getOrderConfirmSumResponse.sumNotConfirmed;
        },
        errorResponse => {
          this.clicked = !this.clicked;
          
          this.getOrderConfirmSumResponse = new GetOrderConfirmSumResponse();

          this.download = false;
        }
      );
  }

  getPage(pageEvent: PageEvent) {
    this.getOrderConfirmList(pageEvent);
  }

  confirm() {
    this.clicked = !this.clicked;

    this.postConfirmRequest = new PostConfirmRequest();

    this.getOrderConfirmListResponse.lstViewOrderConfirm.forEach((element) => {
      if (element.check) {
        this.postConfirmRequest.orderNo.push(element.orderNo);
        this.postConfirmRequest.sku.push(element.sku);
      }
    });

    this.orderService.postConfirm(this.postConfirmRequest)
      .subscribe(
        successResponse => {
          this.clicked = !this.clicked;

          this.postConfirmResponse = successResponse;

          this.util.showNotification('info', 'top', 'center', this.postConfirmResponse.message);

          this.getOrderConfirmList(null);

          this.getOrderConfirmSum(null);
        },
        errorResponse => {
          this.clicked = !this.clicked;

          if (errorResponse.error.status === 403) {
            this.util.showNotification('danger', 'top', 'center', errorResponse.error.error + '<br>' + errorResponse.error.message);

            this.router.navigate(['/user-login']);
          } else {
            this.util.showNotification('danger', 'top', 'center', errorResponse.error.message);

            this.getOrderConfirmList(null);

            this.getOrderConfirmSum(null);
          }
        }
      );
  }

  checkAllToggle = false;

  checkAll() {
    this.checkAllToggle = !this.checkAllToggle;

    this.getOrderConfirmListResponse.lstViewOrderConfirm.forEach((element) => {
      element.check = this.checkAllToggle;
    });
  }

}
