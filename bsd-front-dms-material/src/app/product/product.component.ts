import { Component, OnInit } from '@angular/core';
import { PageEvent } from '@angular/material/paginator';
import { Title } from '@angular/platform-browser';
import { Router } from '@angular/router';
import { GetBrandRequest } from 'app/services/product/getbrandrequest';
import { GetBrandResponse } from 'app/services/product/getbrandresponse';
import { GetProductListRequest } from 'app/services/product/getproductlistrequest';
import { GetProductListResponse } from 'app/services/product/getproductlistresponse';
import { ProductService } from 'app/services/product/product.service';
import { Util } from 'app/util';

@Component({
  selector: 'app-product',
  templateUrl: './product.component.html',
  styleUrls: ['./product.component.css']
})
export class ProductComponent implements OnInit {
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
  getProductListRequest: GetProductListRequest = new GetProductListRequest();
  getProductListResponse: GetProductListResponse = new GetProductListResponse();
  brand = "";
  sku = "";
  item = "";
  code = "";
  type = "";

  constructor(
    private router: Router,
    private titleService: Title,
    private productService: ProductService
  ) { }

  ngOnInit() {
    this.titleService.setTitle('DMS - Product');

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

    this.getProductList(null);
  }

  uploadFile() {
    this.router.navigate(['/product-upload-file']);
  }

  uploadFileBundle() {
    this.router.navigate(['/product-bundle-upload-file']);
  }

  getProductList(pageEvent: PageEvent) {
    this.clicked = !this.clicked;

    this.productService.getProductList(this.brand, this.sku, this.item, this.code, this.type, pageEvent != null ? pageEvent.length : this.length, pageEvent != null ? pageEvent.pageSize : this.pageSize, pageEvent != null ? pageEvent.pageIndex : this.pageIndex, this.getProductListRequest)
      .subscribe(
        successResponse => {
          this.clicked = !this.clicked;

          this.getProductListResponse = successResponse;

          this.length = this.getProductListResponse.length;

          if (pageEvent != null) {
            this.length = pageEvent.length;
            this.pageSize = pageEvent.pageSize;
            this.pageIndex = pageEvent.pageIndex;
          }          
        },
        errorResponse => {
          this.length = 0;

          this.clicked = !this.clicked;
          
          this.getProductListResponse = new GetProductListResponse();
        }
      );
  }

  getPage(pageEvent: PageEvent) {
    this.getProductList(pageEvent);
  }

  productAdd() {
    this.router.navigate(['/product-add']);
  }

}
