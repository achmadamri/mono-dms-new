import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { GwpService } from 'app/services/gwp/gwp.service';
import { Util } from 'app/util';
import { TbGwpSku } from 'app/services/gwp/tbgwpsku';
import { Title } from '@angular/platform-browser';
import { GetBrandRequest } from 'app/services/product/getbrandrequest';
import { GetBrandResponse } from 'app/services/product/getbrandresponse';
import { ProductService } from 'app/services/product/product.service';
import { GetSkuProductRequest } from 'app/services/gwp/getskuproductrequest';
import { GetSkuProductResponse } from 'app/services/gwp/getskuproductresponse';
import { TbOrder } from 'app/services/order/tborder';
import { OrderService } from 'app/services/order/order.service';
import { PostOrderManualRequest } from 'app/services/order/postordermanualrequest';
import { PostOrderManualResponse } from 'app/services/order/postordermanualresponse';
import { Location } from '@angular/common';

@Component({
  selector: 'app-order-manual',
  templateUrl: './order-manual.component.html',
})
export class OrderManualComponent implements OnInit {
  clicked = false;
  util: Util = new Util();
  getBrandRequest: GetBrandRequest = new GetBrandRequest();
  getBrandResponse: GetBrandResponse = new GetBrandResponse();
  getSkuProductRequest: GetSkuProductRequest = new GetSkuProductRequest();
  getSkuProductResponse: GetSkuProductResponse = new GetSkuProductResponse();
  postOrderManualRequest: PostOrderManualRequest = new PostOrderManualRequest();
  postOrderManualResponse: PostOrderManualResponse = new PostOrderManualResponse();

  constructor(
    private location: Location,
    private router: Router,
    private titleService: Title,
    private productService: ProductService,
    private gwpService: GwpService,
    private orderService: OrderService
  ) { }

  addFieldValue() {
    this.postOrderManualRequest.tbOrder.push(new TbOrder())
  }

  deleteFieldValue(index) {
    this.postOrderManualRequest.tbOrder.splice(index, 1);
  }

  ngOnInit() {
    this.titleService.setTitle('DMS - Order Manual');

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
      
    this.gwpService.getSkuProduct(this.getSkuProductRequest)
      .subscribe(
        successResponse => {
          this.getSkuProductResponse = successResponse;
        },
        errorResponse => {
          this.util.showNotification('danger', 'top', 'center', errorResponse.error.error + '<br>' + errorResponse.error.message);
          this.router.navigate(['/user-login']);
        }
      );
  }

  save() {
    this.clicked = !this.clicked;

    this.orderService.postOrderManual(this.postOrderManualRequest)
      .subscribe(
        successResponse => {
          this.clicked = !this.clicked;

          this.postOrderManualResponse = successResponse;

          this.util.showNotification('info', 'top', 'center', this.postOrderManualResponse.message);

          this.postOrderManualRequest = new PostOrderManualRequest();
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

  back() {
    this.location.back();
  }
}
