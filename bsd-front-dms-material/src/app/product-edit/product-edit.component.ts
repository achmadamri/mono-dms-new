import { Component, OnInit } from '@angular/core';
import { MatDialog } from '@angular/material/dialog';
import { ActivatedRoute, Router } from '@angular/router';
import { ConfirmDialogComponent } from 'app/confirm-dialog/confirm-dialog.component';
import { GetProductRequest } from 'app/services/product/getproductrequest';
import { GetProductResponse } from 'app/services/product/getproductresponse';
import { ProductService } from 'app/services/product/product.service';
import { PostProductDeleteRequest } from 'app/services/product/postproductdeleterequest';
import { PostProductDeleteResponse } from 'app/services/product/postproductdeleteresponse';
import { PostProductEditRequest } from 'app/services/product/postproducteditrequest';
import { PostProductEditResponse } from 'app/services/product/postproducteditresponse';
import { Util } from 'app/util';
import { GetBrandRequest } from 'app/services/product/getbrandrequest';
import { GetBrandResponse } from 'app/services/product/getbrandresponse';
import { Title } from '@angular/platform-browser';
import { GetProductMarketListRequest } from 'app/services/product/getproductmarketlistrequest';
import { GetProductMarketListResponse } from 'app/services/product/getproductmarketlistresponse';
import { PageEvent } from '@angular/material/paginator';
import { Location } from '@angular/common';

@Component({
  selector: 'app-product-edit',
  templateUrl: './product-edit.component.html',
})
export class ProductEditComponent implements OnInit {
  clicked = false;
  util: Util = new Util();
  postProductEditRequest: PostProductEditRequest = new PostProductEditRequest();
  postProductEditResponse: PostProductEditResponse = new PostProductEditResponse();
  postProductDeleteRequest: PostProductDeleteRequest = new PostProductDeleteRequest();
  postProductDeleteResponse: PostProductDeleteResponse = new PostProductDeleteResponse();
  getProductRequest: GetProductRequest = new GetProductRequest();
  getProductResponse: GetProductResponse = new GetProductResponse();
  getProductMarketListRequest: GetProductMarketListRequest = new GetProductMarketListRequest();
  getProductMarketListResponse: GetProductMarketListResponse = new GetProductMarketListResponse();
  getBrandRequest: GetBrandRequest = new GetBrandRequest();
  getBrandResponse: GetBrandResponse = new GetBrandResponse();
  length = 100;
  pageSize = 100;
  pageIndex = 0;
  pageSizeOptions: number[] = [5, 10, 25, 100];
  pageEvent: PageEvent;

  constructor(
    private location: Location,
    private router: Router,
    private titleService: Title,
    private route: ActivatedRoute,
    private productService: ProductService,
    private dialog: MatDialog
  ) { }

  ngOnInit() {
    this.titleService.setTitle('DMS - Product Edit');

    this.route.paramMap.subscribe(params => {
      this.postProductEditRequest.tbpId = params.get('tbpId') == null ? '0' : params.get('tbpId');

      this.getProduct(this.postProductEditRequest.tbpId);
    });
  }

  save() {
    this.clicked = !this.clicked;

    this.productService.postProductEdit(this.postProductEditRequest)
      .subscribe(
        successResponse => {
          this.clicked = !this.clicked;

          this.postProductEditResponse = successResponse;

          this.util.showNotification('info', 'top', 'center', this.postProductEditResponse.message);
        },
        errorResponse => {
          this.clicked = !this.clicked;

          if (errorResponse.error.status === 400) {
            let message = "";

            for (let i = 0; i < errorResponse.error.errors.length; i++) {
              message = message + errorResponse.error.errors[i].defaultMessage + "<br>";
            }

            this.util.showNotification('danger', 'top', 'center', message);
          } else if (errorResponse.error.status === 403) {
            this.util.showNotification('danger', 'top', 'center', errorResponse.error.error + '<br>' + errorResponse.error.message);

            this.router.navigate(['/user-login']);
          } else {
            this.util.showNotification('danger', 'top', 'center', errorResponse.error.message);
          }
        }
      );
  }

  getProduct(tbpId: string) {
    this.clicked = !this.clicked;

    this.productService.getProduct(tbpId, this.getProductRequest)
      .subscribe(
        successResponse => {
          this.clicked = !this.clicked;

          this.getProductResponse = successResponse;

          this.postProductEditRequest.tbpId = this.getProductResponse.tbProduct.tbpId;
          this.postProductEditRequest.tbbBrandId = this.getProductResponse.tbProduct.tbbBrandId;
          this.postProductEditRequest.tbpSku = this.getProductResponse.tbProduct.tbpSku;
          this.postProductEditRequest.tbpItem = this.getProductResponse.tbProduct.tbpItem;
          this.postProductEditRequest.tbpCode = this.getProductResponse.tbProduct.tbpCode;
          this.postProductEditRequest.tbpLoc = this.getProductResponse.tbProduct.tbpLoc;
          this.postProductEditRequest.tbpQty = this.getProductResponse.tbProduct.tbpQty;
          this.postProductEditRequest.tbpUnitPrice = this.getProductResponse.tbProduct.tbpUnitPrice;
          this.postProductEditRequest.tbpType = this.getProductResponse.tbProduct.tbpType;

          this.postProductDeleteRequest.tbpId = this.getProductResponse.tbProduct.tbpId;

          this.getProductMarketList(this.postProductEditRequest.tbpId, null);

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
        },
        errorResponse => {
          this.clicked = !this.clicked;

          if (errorResponse.error.status === 403) {
            this.util.showNotification('danger', 'top', 'center', errorResponse.error.error + '<br>' + errorResponse.error.message);

            this.router.navigate(['/user-login']);
          } else {
            this.util.showNotification('danger', 'top', 'center', errorResponse.error.message);
          }
        }
      );
  }

  getProductMarketList(tbpId: string, pageEvent: PageEvent) {
    this.clicked = !this.clicked;

    this.productService.getProductMarketList(tbpId, pageEvent != null ? pageEvent.length : this.length, pageEvent != null ? pageEvent.pageSize : this.pageSize, pageEvent != null ? pageEvent.pageIndex : this.pageIndex, this.getProductMarketListRequest)
      .subscribe(
        successResponse => {
          this.clicked = !this.clicked;

          this.getProductMarketListResponse = successResponse;

          this.postProductEditRequest.lstViewProductMarket = this.getProductMarketListResponse.lstViewProductMarket;

          this.length = this.getProductMarketListResponse.length;

          if (pageEvent != null) {
            this.length = pageEvent.length;
            this.pageSize = pageEvent.pageSize;
            this.pageIndex = pageEvent.pageIndex;
          }          
        },
        errorResponse => {
          this.length = 0;

          this.clicked = !this.clicked;
          
          this.getProductMarketListResponse = new GetProductMarketListResponse();
        }
      );
  }

  back() {
    this.location.back();
  }
}
