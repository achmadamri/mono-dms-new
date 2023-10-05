import { Component, OnInit } from '@angular/core';
import { MatDialog } from '@angular/material/dialog';
import { Title } from '@angular/platform-browser';
import { ActivatedRoute, Router } from '@angular/router';
import { ConfirmDialogComponent } from 'app/confirm-dialog/confirm-dialog.component';
import { GetOrderPackRequest } from 'app/services/order/getorderpackrequest';
import { GetOrderPackResponse } from 'app/services/order/getorderpackresponse';
import { OrderService } from 'app/services/order/order.service';
import { PostChangePackedRequest } from 'app/services/order/postchangepackedrequest';
import { PostChangePackedResponse } from 'app/services/order/postchangepackedresponse';
import { PostDeletePackedRequest } from 'app/services/order/postdeletepackedrequest';
import { PostDeletePackedResponse } from 'app/services/order/postdeletepackedresponse';
import { TbOrderPack } from 'app/services/order/tborderpack';
import { GetProductRequest } from 'app/services/product/getproductrequest';
import { GetProductResponse } from 'app/services/product/getproductresponse';
import { ProductService } from 'app/services/product/product.service';
import { Util } from 'app/util';

@Component({
  selector: 'app-confirm-details',
  templateUrl: './confirm-details.component.html',
})
export class ConfirmDetailsComponent implements OnInit {
  clicked = false;
  util: Util = new Util();
  dateNow: Date = new Date();
  tboOrderNo: string;
  tbopAwb: string;
  tbopQcId: number;
  getProductRequest: GetProductRequest = new GetProductRequest();
  getProductResponse: GetProductResponse = new GetProductResponse();
  getOrderPackRequest: GetOrderPackRequest = new GetOrderPackRequest();
  getOrderPackResponse: GetOrderPackResponse = new GetOrderPackResponse();
  postChangePackedRequest: PostChangePackedRequest = new PostChangePackedRequest();
  postChangePackedResponse: PostChangePackedResponse = new PostChangePackedResponse();
  postDeletePackedRequest: PostDeletePackedRequest = new PostDeletePackedRequest();
  postDeletePackedResponse: PostDeletePackedResponse = new PostDeletePackedResponse();
  skucode: string;

  constructor(
    private router: Router,    
    private titleService: Title,
    private route: ActivatedRoute,
    private orderService: OrderService,
    private productService: ProductService,
    private dialog: MatDialog
  ) { }

  ngOnInit() {
    this.titleService.setTitle('Confirm - Details');

    this.route.paramMap.subscribe(params => {
      this.tboOrderNo = params.get('tboOrderNo') == null ? '0' : params.get('tboOrderNo');

      this.getOrderPack();
    });

    this.getOrderPackResponse.tbOrderPack = new TbOrderPack();
  }

  back() {
    this.router.navigate(['/confirm']);
  }

  getOrderPack() {
    this.clicked = !this.clicked;

    this.orderService.getOrderPack(this.tboOrderNo, '', null, this.getOrderPackRequest)
      .subscribe(
        successResponse => {
          this.clicked = !this.clicked;

          this.getOrderPackResponse = successResponse;

          this.getOrderPackResponse.lstTbOrder.forEach((element) => {
            if (element.tboItem != null) element.tboItemShort = element.tboItem.length > 30 ? element.tboItem.substr(0, 30) + "..." : element.tboItem;
          });

          this.getOrderPackResponse.lstTbOrderPackDetail.forEach((element) => {
            if (element.tbopdItem != null) element.tbopdItemShort = element.tbopdItem.length > 30 ? element.tbopdItem.substr(0, 30) + "..." : element.tbopdItem;
          });

          this.tbopAwb = this.getOrderPackResponse.tbOrderPack.tbopAwb;
          this.tbopQcId = this.getOrderPackResponse.tbOrderPack.tbopQcId;
          
          this.postChangePackedRequest.tboOrderNo = this.getOrderPackResponse.tbOrderPack.tbopOrderNo;
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

  notOk(sku: string, item: string) {
    this.clicked = !this.clicked;

    const confirmDialog = this.dialog.open(ConfirmDialogComponent, {
      data: {
        title: sku + ' ' + item,
        message: 'Do you want to change status Packed?'
      }
    });
    confirmDialog.afterClosed().subscribe(result => {
      if (result === true) {
        this.postChangePackedRequest.tbpSku = sku;

        this.orderService.postChangePacked(this.postChangePackedRequest)
        .subscribe(
          successResponse => {
            this.clicked = !this.clicked;
  
            this.getOrderPack();
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
      } else {
        this.clicked = !this.clicked;
        this.skucode = '';
      }
    });
  }

  delete(id: string, sku: string, item: string) {
    this.clicked = !this.clicked;

    const confirmDialog = this.dialog.open(ConfirmDialogComponent, {
      data: {
        title: sku + ' ' + item,
        message: 'Do you want to delete?'
      }
    });
    confirmDialog.afterClosed().subscribe(result => {
      if (result === true) {
        this.postDeletePackedRequest.tbopdId = id;

        this.orderService.postDeletePacked(this.postDeletePackedRequest)
        .subscribe(
          successResponse => {
            this.clicked = !this.clicked;
  
            this.getOrderPack();
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
      } else {
        this.clicked = !this.clicked;
        this.skucode = '';
      }
    });
  }
}
