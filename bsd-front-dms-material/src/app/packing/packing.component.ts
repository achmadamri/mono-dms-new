import { Component, OnInit } from '@angular/core';
import { MatDialog } from '@angular/material/dialog';
import { Title } from '@angular/platform-browser';
import { ActivatedRoute, Router } from '@angular/router';
import { ConfirmDialogComponent } from 'app/confirm-dialog/confirm-dialog.component';
import { GetOrderPackRequest } from 'app/services/order/getorderpackrequest';
import { GetOrderPackResponse } from 'app/services/order/getorderpackresponse';
import { GetScanBarcodeCheckRequest } from 'app/services/order/getscanbarcodecheckrequest';
import { GetScanBarcodeCheckResponse } from 'app/services/order/getscanbarcodecheckresponse';
import { OrderService } from 'app/services/order/order.service';
import { PostScanBarcodeRequest } from 'app/services/order/postscanbarcoderequest';
import { PostScanBarcodeResponse } from 'app/services/order/postscanbarcoderesponse';
import { TbOrder } from 'app/services/order/tborder';
import { TbOrderPack } from 'app/services/order/tborderpack';
import { TbOrderPackDetail } from 'app/services/order/tborderpackdetail';
import { GetProductRequest } from 'app/services/product/getproductrequest';
import { GetProductResponse } from 'app/services/product/getproductresponse';
import { ProductService } from 'app/services/product/product.service';
import { Util } from 'app/util';

@Component({
  selector: 'app-packing',
  templateUrl: './packing.component.html',
  styleUrls: ['./packing.component.css']
})
export class PackingComponent implements OnInit {
  clicked = false;
  util: Util = new Util();
  dateNow: Date = new Date();
  tbopAwb: string;
  tbopOrderNo: string;
  tbopQcId: string;
  getProductRequest: GetProductRequest = new GetProductRequest();
  getProductResponse: GetProductResponse = new GetProductResponse();
  getOrderPackRequest: GetOrderPackRequest = new GetOrderPackRequest();
  getOrderPackResponse: GetOrderPackResponse = new GetOrderPackResponse();
  getScanBarcodeCheckRequest: GetScanBarcodeCheckRequest = new GetScanBarcodeCheckRequest();
  getScanBarcodeCheckResponse: GetScanBarcodeCheckResponse = new GetScanBarcodeCheckResponse();
  postScanBarcodeRequest: PostScanBarcodeRequest = new PostScanBarcodeRequest();
  postScanBarcodeResponse: PostScanBarcodeResponse = new PostScanBarcodeResponse();
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
    this.titleService.setTitle('DMS - Packing');

    this.getOrderPackResponse.tbOrderPack = new TbOrderPack();
  }

  ngAfterViewInit() {
    setTimeout(() => {
      document.getElementById('orderNo').focus();
    }, 200);
  }

  postScanBarcode() {
    this.orderService.postScanBarcode(this.postScanBarcodeRequest)
      .subscribe(
        successResponse => {
          this.clicked = !this.clicked;

          this.postScanBarcodeResponse = successResponse;

          this.skucode = '';
          this.postScanBarcodeRequest.tbpSku = '';
          this.postScanBarcodeRequest.addNew = '';

          if (this.postScanBarcodeResponse.tbOrderPack.tbopStatus == 'Packed') {
            this.util.showNotification('info', 'top', 'center', 'All Packed');

            this.showPackAgain();
          } else {
            document.getElementById('skucode').focus();

            this.getOrderPack();
          }
        },
        errorResponse => {
          this.clicked = !this.clicked;

          this.postScanBarcodeRequest.addNew = '';

          if (errorResponse.error.status === 403) {
            this.util.showNotification('danger', 'top', 'center', errorResponse.error.error + '<br>' + errorResponse.error.message);

            this.router.navigate(['/user-login']);
          } else {
            this.util.showNotification('danger', 'top', 'center', errorResponse.error.message);
          }
        }
      );
  }

  scanCheck() {
    this.clicked = !this.clicked;

    this.productService.getProduct(this.skucode, this.getProductRequest)
    .subscribe(
      successResponse => {
        this.getProductResponse = successResponse;

        this.postScanBarcodeRequest.tbpSku = this.getProductResponse.tbProduct.tbpSku;

        this.orderService.getScanBarcodeCheck(this.postScanBarcodeRequest.tboOrderNo, this.postScanBarcodeRequest.tbpSku, this.getScanBarcodeCheckRequest)
        .subscribe(
          successResponse => {
            this.getScanBarcodeCheckResponse = successResponse;

            if (this.getScanBarcodeCheckResponse.orderStatus == '') {
              this.postScanBarcodeRequest.addNew = 'false';
              this.postScanBarcode();
            } else if (this.getScanBarcodeCheckResponse.orderStatus == 'Not Ordered') {
              this.showDialogNotOrdered(this.getProductResponse.tbProduct.tbpSku, this.getProductResponse.tbProduct.tbpItem, this.getScanBarcodeCheckResponse.qtyTbo);
            } else if (this.getScanBarcodeCheckResponse.orderStatus == 'Scan More') {
              this.showDialogScanMore(this.getProductResponse.tbProduct.tbpSku, this.getProductResponse.tbProduct.tbpItem, this.getScanBarcodeCheckResponse.qtyTbo);
            } else {
              this.util.showNotification('danger', 'top', 'center', 'Error');
            }
          },
          errorResponse => {
            this.clicked = !this.clicked;
  
            this.postScanBarcodeRequest.addNew = '';
  
            if (errorResponse.error.status === 403) {
              this.util.showNotification('danger', 'top', 'center', errorResponse.error.error + '<br>' + errorResponse.error.message);
  
              this.router.navigate(['/user-login']);
            } else {
              this.util.showNotification('danger', 'top', 'center', errorResponse.error.message);
            }
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

          this.skucode = '';
        }
      }
    );
  }

  showDialogScanMore(sku: string, item: string, qty: number) {
    const confirmDialog = this.dialog.open(ConfirmDialogComponent, {
      data: {
        title: sku + ' ' + item,
        message: 'Over quantity. Please check again.'
      }
    });
    confirmDialog.afterClosed().subscribe(result => {
      this.clicked = !this.clicked;
      this.skucode = '';
    });
  }

  clear() {
    this.skucode = '';
    this.tbopAwb = '';
    this.tbopQcId = null;
    
    setTimeout(() => {
      document.getElementById('orderNo').focus();
    }, 200);

    this.getOrderPackResponse.tbOrderPack = new TbOrderPack();
    this.getOrderPackResponse.lstTbOrderPackDetail = Array(new TbOrderPackDetail());
    this.getOrderPackResponse.lstTbOrder = Array(new TbOrder());
  }

  showDialogNotOrdered(sku: string, item: string, qty: number) {
    const confirmDialog = this.dialog.open(ConfirmDialogComponent, {
      data: {
        title: sku + ' ' + item,
        message: 'Item not found in order. Do you want to pack anyway?'
      }
    });
    confirmDialog.afterClosed().subscribe(result => {
      if (result === true) {
        this.postScanBarcodeRequest.addNew = 'true';
        this.postScanBarcode();
      } else {
        this.clicked = !this.clicked;
        this.skucode = '';
      }
    });
  }

  showPackAgain() {
    const confirmDialog = this.dialog.open(ConfirmDialogComponent, {
      data: {
        title: 'Pack Again',
        message: 'Do you want to pack again?'
      }
    });
    confirmDialog.afterClosed().subscribe(result => {
      if (result === true) {
        this.clear();
      } else {
        setTimeout(() => {
          document.getElementById('skucode').focus();
        }, 200);       

        this.getOrderPack();
      }
    });
  }

  getOrderPack() {
    this.clicked = !this.clicked;

    this.orderService.getOrderPack(this.tbopOrderNo, this.tbopAwb, this.tbopQcId, this.getOrderPackRequest)
      .subscribe(
        successResponse => {
          this.clicked = !this.clicked;

          this.getOrderPackResponse = successResponse;

          this.getOrderPackResponse.lstTbOrder.forEach((element) => {
            element.tboItemShort = element.tboItem.length > 30 ? element.tboItem.substr(0, 30) + "..." : element.tboItem;
          });

          if (this.getOrderPackResponse.lstTbOrderPackDetail != null)
          this.getOrderPackResponse.lstTbOrderPackDetail.forEach((element) => {
            element.tbopdItemShort = element.tbopdItem.length > 30 ? element.tbopdItem.substr(0, 30) + "..." : element.tbopdItem;
          });

          this.tbopAwb = this.getOrderPackResponse.tbOrderPack.tbopAwb;
          this.tbopOrderNo = this.getOrderPackResponse.tbOrderPack.tbopOrderNo;
          this.tbopQcId = this.getOrderPackResponse.tbOrderPack.tbopQcId.toString();
          
          this.postScanBarcodeRequest.tboOrderNo = this.getOrderPackResponse.tbOrderPack.tbopOrderNo;

          document.getElementById('skucode').focus();
        },
        errorResponse => {
          this.clicked = !this.clicked;

          this.clear();

          if (errorResponse.error.status === 403) {
            this.util.showNotification('danger', 'top', 'center', errorResponse.error.error + '<br>' + errorResponse.error.message);

            this.router.navigate(['/user-login']);
          } else {
            this.util.showNotification('danger', 'top', 'center', errorResponse.error.message);
          }
        }
      );
  }
}
